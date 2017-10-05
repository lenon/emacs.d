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

;;; Theme

(setq monokai-highlight "#463D53")
(setq monokai-comments "#9E9B8E")
(load-theme 'monokai 'trust)

;;; General settings

;; Start Emacs maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Prevent emacs from resizing frames when changing face sizes
(setq frame-inhibit-implied-resize t)

;; Hide the welcome screen, show a *scratch* buffer instead
(setq inhibit-startup-screen t)

;; Disable scroll bars, the tool bar and the menu bar when they are available
;; (usually on GUI Emacs)
(dolist (mode '(scroll-bar-mode
                tool-bar-mode
                menu-bar-mode))
  (when (fboundp mode)
    (funcall mode -1)))

;; Turn off the annoying audible and visible bell on errors...
(setq visible-bell nil)
;; ...and blink the mode-line instead
(setq ring-bell-function 'emacsd/blink-mode-line)

;; Change the default font family and size for all frames
(set-face-attribute 'default nil
                    :family emacsd/default-font
                    :height (emacsd/calc-font-height emacsd/default-font-size))

;; Disable dialog boxes in GUI
(setq use-dialog-box nil)

;; Show keystrokes in the echo area
(setq echo-keystrokes 0.1)

;; Answer with just y or n
(fset 'yes-or-no-p 'y-or-n-p)

;;; Linum settings (line numbers)

;; Show line numbers in the left margin
(global-linum-mode)

;; Change linum font size
(set-face-attribute 'linum nil
                    :height (emacsd/calc-font-height emacsd/linum-font-size))

;; Add a space between vertical window separator and linum
(setq linum-format " %d")

;;; Window settings

;; Show a margin on the left and right edges of a window
(fringe-mode 3)

;; Change window divider color
(set-face-background 'vertical-border emacsd/vertical-border-color)
(set-face-foreground 'vertical-border emacsd/vertical-border-color)

;; Show cursor only in selected windows
(setq-default cursor-in-non-selected-windows nil)

;; No progressive speed plz
(setq mouse-wheel-progressive-speed nil)

(provide 'init-ui)
