(setq ogmc-better-defaults-packages
      '(
        (autoinsert :location built-in)
        smooth-scrolling
        dired
        )
      )


(use-package autoinsert
  :config
  (progn
    (setq auto-insert-query nil)
    (setq auto-insert-directory (locate-user-emacs-file "templates"))
    (add-hook 'find-file-hook 'auto-insert)
    (auto-insert-mode 1)
    (define-auto-insert "\\.el$" [ "~/.emacs.d/snippets/defaults-elisp.el" autoinsert-yas-expand ])
    (define-auto-insert "\\.org$" ["~/.emacs.d/snippets/default-org.el" autoinsert-yas-expand])
    )
  )

(use-package smooth-scrolling
  :config
  (setq scroll-margin 5
        scroll-conservatively 9999
        scroll-step 1)
  )

(use-package dired
  :config
  (setq dired-recursive-deletes 'always);;对目录删除操作时始终递归
  (setq dired-recursive-copies 'always);;对目录复制操作时始终递归
  (put 'dired-find-alternate-file 'disabled nil);;buffer共用
  (with-eval-after-load 'dired;;所以使用这一句
    ;;配合上上一条使用，不共用buffer
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
  (with-eval-after-load 'dired
    (define-key dired-mode-map "n" 'evil-search-next)
    (define-key dired-mode-map "N" 'evil-search-previous))
  )
