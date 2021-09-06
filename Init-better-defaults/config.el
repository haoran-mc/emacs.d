(setq show-paren-delay 0);;默认情况下高亮匹配括号会有延迟
(show-paren-mode t);;高亮匹配括号

;; normal模式下仍然匹配邻近括号
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
        (t (save-excursion
             (ignore-errors (backward-up-list))
             ad-do-it))))

;;----------------------------------------------------------------occur

;;好像是增强补全，而且还很不错的样子，绑定了一个快捷键s-/
(setq hippie-expand-try-functions-list '(try-expand-dabbrev ;;路径补全
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))
