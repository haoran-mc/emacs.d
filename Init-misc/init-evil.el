;;----------------------------------------------------------------evil-leader
(global-evil-leader-mode)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  ":"  'counsel-M-x
  "SPC" 'counsel-M-x
  "TAB" 'spacemacs/alternate-buffer
  ;;------------------------------
  "wV" (lambda() (interactive) (split-window-right) (windmove-right))
  "wS" (lambda() (interactive) (split-window-below) (windmove-down))
  "wm" 'spacemacs/toggle-maxmize-buffer
  "ff" 'find-file
  "fr" 'counsel-recentf
  "fj" 'dired-jump
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "bq" 'save-buffer-kill-terminal
  "bs" 'create-scratch-buffer
  "pf" 'counsel-git
  "sp" 'helm-do-ag-project-root
  ;;------------------------------
  "ad" 'dired
  "tw" (lambda() (interactive) (find-file "~/haoran/Notes/Org/Programming/+wiki-list.org") (sp-push-position-to-ring))
  "rc" (lambda() (interactive) (dired "~/.emacs.d/"))
  "oT" (lambda() (interactive) (dired "~/haoran/Notes/Markdown/"))
  "oy" 'youdao-dictionary-search-at-point+
  "go" 'evil-tabs-mode
  "xx" 'exchange-point-and-mark
  "rb" 'bookmark-jump-other-window
  "rm" 'bookmark-set
  "rl" 'bookmark-bmenu-list
  "rr" (lambda() (interactive) (find-file "~/.emacs.d/bookmarks"))
  "xns" 'org-narrow-to-subtree
  "xnw" 'widen
  "cf" 'yafolding-toggle-element
  "z" 'evil-emacs-state)

;;----------------------------------------------------------------evil
(evil-mode t);;需要先global-evil-leader-mode
(setcdr evil-insert-state-map nil);;这句与下面一句的作用是使insert下是emacs-state，否则有些emacs的快捷键不能用
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(setq-default evil-want-C-u-scroll t);;这里的设置无效，放在这只是提醒这个功能需要自己改
;; '(evil-want-C-u-scroll t);;在custom中加入这句才可以

;;----------------------------------------------------------------evil-nerd-commenter
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(evilnc-default-hotkeys)

;;evil-tabs
(global-evil-tabs-mode -1)
(setq elscreen-display-screen-number nil)
(setq elscreen-display-tab nil)
(setq elscreen-tab-display-control nil)
(setq elscreen-tab-display-kill-screen nil)

;;evil-search-highlight-parsist
(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)
(evil-leader/set-key "RET" 'evil-search-highlight-persist-remove-all)


;;----------------------------------------------------------------
(provide 'init-evil)
