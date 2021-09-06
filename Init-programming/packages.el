(setq ogmc-programming-packages
      '(
        web-mode
        emmet-mode
        yasnippet
        )
      )

(use-package web-mode
  :config
  (progn
    (setq auto-mode-alist
          (append
           '(("\\.html\\'" . web-mode)
             ("\\.wxml\\'" . web-mode)
             ("\\.wxss\\'" . web-mode))
           auto-mode-alist))
    (setq web-mode-markup-indent-offset 2) ;; web-mode, html tag in html file
    (setq web-mode-css-indent-offset 2)    ;; web-mode, css in html file
    (setq web-mode-code-indent-offset 2)   ;; web-mode, js code in html file
    )
  )

(use-package emmet-mode
  :config
  (progn
    (add-hook 'web-mode-hook 'emmet-mode)
    (add-hook 'css-mode-hook 'emmet-mode)
    (add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil)))
    (setq emmet-self-closing-tag-style " /") ;; default "/" ;; only " /", "/" and "" are valid.
    )
  )

(use-package yasnippet
  :init
  (add-hook 'prog-mode-hook #'yas-minor-mode)
  (add-hook 'org-mode-hook #'yas-minor-mode)
  :config
  (yas-reload-all)
  )

