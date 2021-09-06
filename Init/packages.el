(when (>= emacs-major-version 24);;emacs版本号大于24时，会将下面源添加到emacs的package源
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

(require 'cl) ;;下面有需要用到common Lisp的函数，所以调用了common Lisp的库，例如loop for等

(defvar haoran/packages '(
                          company
                          hungry-delete
                          evil
                          evil-leader
                          evil-nerd-commenter
                          evil-tabs
                          evil-search-highlight-persist
                          smooth-scrolling
                          auto-yasnippet
                          org-bullets
                          swiper
                          counsel
                          ;;---------------------以上必备
                          smartparens
                          all-the-icons
                          dashboard
                          doom-modeline
                          use-package
                          web-mode
                          emmet-mode
                          css-mode
                          helm-ag
                          youdao-dictionary

                          ;; js2-mode             ;;更好用的js-mode
                          ;; nodejs-repl          ;;运行js文件
                          ;; js2-refactor         ;;提供了很多重构的功能，太花哨了，我不会喜欢的
                          ;; flycheck                ;;实时代码语法检查
                          ;; rainbow-delimiters      ;;彩虹括号
                          ;; color-identifiers-mode  ;;彩虹变量
                          ;; yafolding
                          ;;---------------------theme
                          dracula-theme
                          ) "Default packages")

(setq package-selected-packages haoran/packages)

(defun haoran/packages-installed-p()
  "nil is returned only if all packages are installed"
  (loop for pkg in haoran/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

;; If there is a package not installed, install it
(unless (haoran/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg haoran/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;----------------------------------------------------------------
(provide 'init-plug)
