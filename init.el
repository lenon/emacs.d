(require 'package)

(defun add-repo (name url)
  (add-to-list 'package-archives
               (cons name url) t))

(defun package-refresh-if-required (packages)
  (let* ((package-states (mapcar 'package-installed-p packages))
         (not-installed-packages (delq t package-states)))
    (when not-installed-packages
      (package-refresh-contents))))

(defun package-ensure-installed (package-name)
  (when (not (package-installed-p package-name))
    (package-install package-name)))

;; Package initialization and automatic setup
(package-initialize)

(add-repo "melpa-stable" "https://stable.melpa.org/packages/")

(let ((packages '(magit badwolf-theme)))
  (package-refresh-if-required packages)
  (mapc 'package-ensure-installed packages))

;; Theme settings
(load-theme 'badwolf t)

;; GUI settings
(scroll-bar-mode -1) ; disable scroll bars
(tool-bar-mode -1) ; disable tool-bar on GUI

;; Editor settings
(setq inhibit-startup-screen 1) ; inhibits the startup screen
(setq show-paren-delay 0) ; show matching pairs of perentheses with 0 delay
(show-paren-mode 1) ; show parentheses
(setq-default truncate-lines 1) ; truncate lines (no-wrap)
(electric-pair-mode 1) ; auto insert matching delimiters

;; Indentation settings
(setq indent-tabs-mode 0) ; indent with spaces, no tabs

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
