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

;; Font face
(if (eq system-type 'darwin)
    (set-frame-font "DejaVu Sans Mono-15" t t) ; bigger font for retina displays
  (set-frame-font "DejaVu Sans Mono-12" t t))

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

(require 'whitespace)
(setq whitespace-style '(face
                         trailing ; highlight trailing spaces
                         tabs ; highlight tabs
                         spaces ; highlight spaces
                         lines-tail ; highlight long lines
                         space-mark ; show spaces as characters
                         tab-mark ; show tabs as characters
                         ))
(global-whitespace-mode 1) ; enable whitespaces plugin

(ac-config-default)
