(setq custom-file (expand-file-name "~/.emacs.d/custom.el" user-emacs-directory))
(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
(load-file custom-file)
;
(load-file "~/.emacs.d/Init/config.el")
(load-file "~/.emacs.d/Init/packages.el")

(load-file "~/.emacs.d/Init-org/funcs.el")
(load-file "~/.emacs.d/Init-org/packages.el")
(load-file "~/.emacs.d/Init-org/config.el")

(load-file "~/.emacs.d/Init-misc/init-evil.el")
(load-file "~/.emacs.d/Init-misc/funcs.el")
(load-file "~/.emacs.d/Init-misc/packages.el")
(load-file "~/.emacs.d/Init-misc/config.el")

(load-file "~/.emacs.d/Init-ui/funcs.el")
(load-file "~/.emacs.d/Init-ui/packages.el")
(load-file "~/.emacs.d/Init-ui/config.el")

(load-file "~/.emacs.d/Init-better-defaults/funcs.el")
(load-file "~/.emacs.d/Init-better-defaults/packages.el")
(load-file "~/.emacs.d/Init-better-defaults/config.el")

(load-file "~/.emacs.d/Init-programming/funcs.el")
(load-file "~/.emacs.d/Init-programming/packages.el")
(load-file "~/.emacs.d/Init-programming/config.el")


(load-file "~/.emacs.d/Init/keybindings.el")
(load-file "~/.emacs.d/ogmc/init-link.el")

(provide 'initiate)
