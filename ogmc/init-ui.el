(menu-bar-mode -1);;取消菜单栏
(tool-bar-mode -1);;取消工具栏
(scroll-bar-mode -1);;取消滚动栏
(global-linum-mode t);;显示行号
(setq linum-format "   ");;自定义行号格式
(setq-default frame-title-format "Forming into my Dreamtale!");;设置标题
(setq initial-frame-alist (quote ((fullscreen . maximized))));;开启全屏
(global-hl-line-mode t);;高亮当前行
(setq ring-bell-function 'ignore);;关闭警报
(if (eq system-type 'windows-nt)
  (set-face-attribute 'default nil :font "Consolas")
  (set-face-attribute 'default nil :font "DejaVu Sans Mono 10"))
(setq-default inhibit-startup-screen t);;不显示欢迎页面
(setq-default cursor-type 'bar);;设置光标形状为竖线（默认为方块）


;; (set-frame-parameter (selected-frame) 'alpha (list 85 60))
;; (add-to-list 'default-frame-alist (cons 'alpha (list 85 60)))


;;配色方案
(setq default-frame-alist
      '((vertical-scroll-bars)
        (background-color . "grey15")
        (foreground-color . "grey")
        (cursor-color . "gold1")
        (mouse-color . "gold1")
        (right-fringe)
        (left-fringe)))

(set-face-background 'highlight "gray5")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")
(set-cursor-color "wheat")
(set-mouse-color "wheat")


(provide 'init-ui)
