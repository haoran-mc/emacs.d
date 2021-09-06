;;使终端中的emacs -nw剪切板与系统共用，需要下载xsel, xclip
(unless window-system
  (when (getenv "DISPLAY")
    (defun xsel-cut-function (text &optional push)
      (with-temp-buffer
        (insert text)
        (call-process-region (point-min) (point-max) "xsel" nil 0 nil "--clipboard" "--input")))
    (defun xsel-paste-function()
      (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
        (unless (string= (car kill-ring) xsel-output)
          xsel-output )))
    (setq interprogram-cut-function 'xsel-cut-function)
    (setq interprogram-paste-function 'xsel-paste-function)))


;; 先插入defaults-elisp.el中的snippet，然后调用autoinsert-yas-expand函数
;; autoinsert-yas-expand函数会先清空文件内容，然后再插入buffer-string
;; (yas-expand-snippet ";; Bah-da $1 Bing")  ;; buffer-string可由此句生成，是根据情况自定义的
;; 如果不(yas-expand-snippet ";; Bah-da $1 Bing")，那么就只是插入default中的内容
(defun autoinsert-yas-expand()
  "Replace text in yasnippet template."
  (yas-expand-snippet (buffer-string) (point-min) (point-max)))


;;自动抓取光标停留的单词
(defun occur-dwim()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))
