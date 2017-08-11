(require 'emacsd)

(defconst emacsd/default-font
  "dejavu sans mono"
  "The default font for all frames.")

(defconst emacsd/default-font-size
  (emacsd/proportional-font-size 15)
  "The default font size for all frames.")

(defconst emacsd/linum-font-size
  (emacsd/proportional-font-size 12)
  "Font size used for line numbers.")

(defconst emacsd/vertical-border-color
  "DarkOrchid4"
  "Color used for window divider.")

(defun emacsd/blink-mode-line ()
  "Blinks the modeline."
  (invert-face 'mode-line)
  (run-with-timer 0.05 nil 'invert-face 'mode-line))

;; Start Emacs maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Disable scroll bars, the tool bar and the menu bar when they are available
;; (usually on GUI Emacs)
(dolist (mode '(scroll-bar-mode
                tool-bar-mode
                menu-bar-mode))
  (when (fboundp mode)
    (funcall mode -1)))

;; Prevent emacs from resizing frames when changing face sizes
(setq frame-inhibit-implied-resize t)
;; Turn off the annoying audible and visible bell on errors...
(setq visible-bell nil)
;; ...and blink the mode-line instead
(setq ring-bell-function 'emacsd/blink-mode-line)

;; Change the default font family and size for all frames
(set-face-attribute 'default nil
                    :family emacsd/default-font
                    :height (emacsd/calc-font-height emacsd/default-font-size))

;; Hide the welcome screen. Show a *scratch* buffer instead
(setq inhibit-startup-screen t)

;; TODO: Disable the startup message in the echo area
;; (put 'inhibit-startup-echo-area-message 'saved-value t)
;; (setq inhibit-startup-echo-area-message (user-login-name))

;; Load the theme (srsly)
(load-theme 'badwolf t)

;; Show line numbers in the left margin
(global-linum-mode)

;; Change linum font size
(set-face-attribute 'linum nil
                    :height (emacsd/calc-font-height emacsd/linum-font-size))

;; Add a space between vertical window separator and linum
(setq linum-format " %d")

;; Show a margin on the left and right edges of a window
(fringe-mode 3)

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

;; Change window divider color
(set-face-background 'vertical-border emacsd/vertical-border-color)
(set-face-foreground 'vertical-border emacsd/vertical-border-color)

(require 'uniquify)
;; Add parts of each file's directory to the buffer name if not unique
(setq uniquify-buffer-name-style 'forward)

(provide 'init-ui)
