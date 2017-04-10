;; Add utils directory into load-path
(let ((settings-dir (expand-file-name "utils" user-emacs-directory)))
  (add-to-list 'load-path settings-dir))

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

;; Theme settings
(load-theme 'badwolf t)

;; GUI settings
(scroll-bar-mode -1) ; disable scroll bars
(tool-bar-mode -1) ; disable tool-bar
(menu-bar-mode -1) ; disable menu bar
(setq inhibit-startup-screen t) ; inhibits the startup screen
(setq ring-bell-function 'ignore) ; turn off audible bell and visual bell

;; Font face
(if (eq system-type 'darwin)
    (set-frame-font "DejaVu Sans Mono-14" t t) ; bigger font for retina displays
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
