(setq ogmc-ui-packages
      '(
        doom-modeline
        dashboard
        )
      )

(use-package doom-modeline
  :hook
  (add-hook 'after-init-hook #'doom-modeline-mode)
  :config
  (setq doom-modeline-minor-modes nil
        doom-modeline-buffer-encoding nil
        doom-modeline-unicode-fallback nil
        doom-modeline-mu4e nil
        doom-modeline-icon nil
        )
  (unless after-init-time
    (setq doom-modeline--default-format mode-line-format)
    (setq-default mode-line-format nil))
  )


(use-package dashboard
  :init
  (defcustom centaur-logo (expand-file-name
                           (if (display-graphic-p) "~/.emacs.d/dashboard/logo6.png" "~/.emacs.d/dashboard/logo6.txt")
                           user-emacs-directory)
    "Set Centaur logo. nil means official logo."
    :group 'centaur
    :type 'string)
  :config
  (progn
    (dashboard-setup-startup-hook)

    (if (equal window-system 'x)
        (setq dashboard-center-content nil
              dashboard-footer (format "Powered by Haoran Lorangez, %s" (format-time-string "%Y")))
      (setq dashboard-center-content nil
            dashboard-footer-messages '("")
            dashboard-items '((recents  . 20)(bookmarks . 8))))

    (setq dashboard-center-content nil ;;不放在中间
          dashboard-set-init-info nil  ;;开启的信息
          dashboard-set-navigator nil  ;;导航
          dashboard-set-footer nil     ;;不设置底部
          dashboard-banner-logo-title "A sailing ship to a Distant horizon."
          dashboard-startup-banner (or centaur-logo 'official)
          dashboard-show-shortcuts nil
          dashboard-set-file-icons nil
          dashboard-set-heading-icons nil)
    )
  )
