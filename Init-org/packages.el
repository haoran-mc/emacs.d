(setq ogmc-org-packages
      '(
        org-bullets
        )
      )

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook #'(lambda () (org-bullets-mode 1)))
  :config
  (if (equal window-system 'x)
      (add-hook 'org-mode-hook #'(lambda () (org-bullets-mode 1))))
  (setq org-bullets-bullet-list '("◉" "☯" "○" "✿" "❀" "◇"))
  )
