(defun add-to-load-path (dir)
  (let ((abs-path (expand-file-name dir user-emacs-directory)))
    (add-to-list 'load-path abs-path)))

(add-to-load-path "utils")
(add-to-load-path "settings")

;; Save customizations in ~/.emacs.d/custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-readable-p custom-file)
  (load custom-file))

;; Package initialization and automatic setup
(require 'package)
(require 'package-utils)

(package-initialize)

(add-repo "melpa-stable"
          "https://stable.melpa.org/packages/")

(use-package 'auto-complete)
(use-package 'badwolf-theme)
(use-package 'cider)
(use-package 'clojure-mode)
(use-package 'neotree)

;; Theme settings
(load-theme 'badwolf t)

(require 'startup-settings)
(require 'gui-settings)
(require 'neotree-settings)
(require 'whitespace-settings)
(require 'font-settings)

;; Editor settings
(setq show-paren-delay 0) ; show matching pairs of perentheses with 0 delay
(show-paren-mode 1) ; show parentheses
(setq-default truncate-lines t) ; truncate lines (no-wrap)
(electric-pair-mode 1) ; auto insert matching delimiters
(global-auto-revert-mode 1) ; auto revert files if they change on disk
(setq require-final-newline t) ; add a newline at the end of file

;; Encoding settings
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8) ; use utf-8 for new buffers, copy/paste, etc

;; Indentation settings
(setq-default indent-tabs-mode nil) ; indent with spaces, no tabs

(ac-config-default)
(setq ac-auto-show-menu t)
