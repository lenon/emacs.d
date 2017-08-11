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

;; 80 characters limit for lines
(setq-default fill-column 80)

;; Disable bidirectional text
(setq-default bidi-display-reordering nil)

(require 'uniquify)
;; Add parts of each file's directory to the buffer name if not unique
(setq uniquify-buffer-name-style 'forward)

(provide 'init-editor)
