;; Start Emacs maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Prevent emacs from resizing frames when changing face sizes
(setq frame-inhibit-implied-resize t)

;; Disable scroll bars, the tool bar and the menu bar when on GUI Emacs
(dolist (mode '(scroll-bar-mode
                tool-bar-mode
                menu-bar-mode))
  (when (fboundp mode)
    (funcall mode -1)))

;; Hide the welcome screen
(setq inhibit-startup-screen t)

;; TODO: Disable the startup message in the echo area
;; (put 'inhibit-startup-echo-area-message 'saved-value t)
;; (setq inhibit-startup-echo-area-message (user-login-name))

;; Load the theme (srsly)
(load-theme 'badwolf t)

;; Turn off the annoying audible bell and visual bell
(setq ring-bell-function 'ignore)

;; Show line numbers in the left margin
(global-linum-mode)

;; Show a margin on the left and right edges of a window
(fringe-mode)

;; Disable bidirectional text
(setq-default bidi-display-reordering nil)

;; Show cursor only in selected windows
(setq-default cursor-in-non-selected-windows nil)

;; Disable dialog boxes in GUI
(setq use-dialog-box nil)

;; Show keystrokes in the echo area
(setq echo-keystrokes 0.1)

;; Answer with just y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; 80 characters limit for lines
(setq-default fill-column 80)

(require 'uniquify)
;; Add parts of each file's directory to the buffer name if not unique
(setq uniquify-buffer-name-style 'forward)

(provide 'init-ui)
