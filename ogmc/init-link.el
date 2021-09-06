;; 使用 sp-push-position-to-ring     来保存或者删除一个位置
;; 使用 sp-get-position-from-ring    来跳转不同的位置
;; 使用 sp-show-all-position-in-ring 来查看所有的位置
;; 你可以将他们绑定到你喜欢的按键上

(defvar sp-position-ring nil "这是用来保存位置信息的，理论上无限制.")

(defun sp--goto-position (marker)
  "去正确的 buffer 中正确的 MARKER 位置."
  (let ((buffer (marker-buffer marker)))
    (switch-to-buffer buffer)
    (goto-char marker)))

(defsubst sp--position-info ()
  "当前位置相关信息.
展示信息：字符串，供显示使用
位置信息：(buffer-name . name)"
  (let ((line-number (number-to-string (line-number-at-pos)))
        (string (buffer-substring (point-at-bol) (point-at-eol))))
    (put-text-property 0 (length line-number) 'face 'font-lock-keyword-face line-number)
    (cons
     (format "%s:%s:%s" (buffer-name) line-number string)
     (point-marker))))

;;;###autoload
(defun sp-push-position-to-ring ()
  "将当前位置的 MARKER 存储入 ring"
  (interactive)
  (push (sp--position-info) sp-position-ring)
  (message "添加当前位置的 MARKER"))

;;;###autoload
(defun sp-get-position-from-ring (&optional num)
  (interactive "P")
  (if (null sp-position-ring)
      (error "POSITION-RING 为空，请先 MARK"))
  (setq num
        (if (null num) 
          (prefix-numeric-value num)))
  (setq num (mod num (length sp-position-ring)))
  (let ((top nil))
    (while (> num 0)
      (push (pop sp-position-ring) top)
      (setq num (1- num)))
    (setq sp-position-ring (append sp-position-ring (nreverse top)))
    (if (marker-position (cdar sp-position-ring))
        (sp--goto-position (cdar sp-position-ring))
      (setq sp-position-ring (cdr sp-position-ring))
      (sp-get-position-from-ring 1))))

;;;###autoload
(defun +org/dwim-at-point ()
  (interactive)
  (let* ((context (org-element-context))
         (type (org-element-type context)))
    ;; skip over unimportant contexts
    (while (and context (memq type '(verbatim code bold italic underline strike-through subscript superscript)))
      (setq context (org-element-property :parent context)
            type (org-element-type context)))
    (pcase type
      (`link
       (let* ((lineage (org-element-lineage context '(link) t))
              (path (org-element-property :path lineage)))
         (if (or (equal (org-element-property :type lineage) "img")
                 (and path (image-type-from-file-name path)))
             (+org--refresh-inline-images-in-subtree)
           (org-open-at-point))))))
  (sp-push-position-to-ring));;最后一句，记录位置

(define-key evil-normal-state-map (kbd "RET") '+org/dwim-at-point)
(define-key org-mode-map (kbd "C-c ^") 'sp-get-position-from-ring) ;; 来跳转不同的位置

;;----------------------------------------------------------------
(provide 'init-link)
