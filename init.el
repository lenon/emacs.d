(defun add-to-load-path (dir)
  (let ((abs-path (expand-file-name dir user-emacs-directory)))
    (add-to-list 'load-path abs-path)))

(add-to-load-path "utils")
(add-to-load-path "init-files")

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

(use-package 'badwolf-theme)
(use-package 'cider)
(use-package 'clojure-mode)
(use-package 'company)
(use-package 'neotree)

(require 'init-ui)
(require 'init-faces)
(require 'init-mode-line)

(require 'init-backups)
(require 'init-neotree)
(require 'init-whitespace)
(require 'init-company)
(require 'init-clojure)
(require 'init-elisp)

;; Editor settings
(setq show-paren-delay 0) ; show matching pairs of perentheses with 0 delay
(show-paren-mode 1) ; show parentheses
(setq-default truncate-lines t) ; truncate lines (no-wrap)
(electric-pair-mode 1) ; auto insert matching delimiters
(global-auto-revert-mode 1) ; auto revert files if they change on disk
(setq require-final-newline t) ; add a newline at the end of file

;; Disable VC
(setq vc-handled-backends ())

;; Encoding settings
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8) ; use utf-8 for new buffers, copy/paste, etc

;; Indentation settings
(setq-default indent-tabs-mode nil) ; indent with spaces, no tabs
