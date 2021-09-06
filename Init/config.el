(setq user-full-name "L.M.haoran")
(setq user-mail-address "haoran.mc@outlook.com")
(set-language-environment "UTF-8");;设置默认语言编码

(global-auto-revert-mode t);;自动加载外部修改
(setq make-backup-files nil);;取消备份
(setq create-lockfiles nil);; 不生成锁文件
(setq auto-save-default nil);;取消自动保存
(fset 'yes-or-no-p 'y-or-n-p);;回答 yes/no 改成回答 y/n
(setq x-select-enable-clipboard t);;使图形化emacs与系统剪切板共用
(save-place-mode t);;在下一次打开文件时恢复上次的光标位置
(setq-default tab-width 4);;制表符长度
(setq-default indent-tabs-mode nil);;使用空格缩进
;; (setq user-emacs-directory "~/.emacs.d/Bin")
(setq save-place-file "~/.emacs.d/saveplace")
(setq desktop-dirname "~/.emacs.d/desktop-save")
(setq recentf-save-file "~/.emacs.d/recentf")
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq default-major-mode 'text-mode)

(setq scroll-margin 5 scroll-consrvatively 10000)
(require 'recentf);;emacs有recentf文件，使用require引入这个文件的功能
(recentf-mode 1);;开启recentf功能
(setq recentf-max-menu-items 1024);;最近使用的最大的文件数
(setq recentf-max-saved-items 1024);;最近使用的最大的文件数
