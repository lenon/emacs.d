;; Check if current system is a Mac
(defconst emacsd-is-a-mac (eq system-type 'darwin))

;; Default font
(defconst emacsd-default-font
  (if emacsd-is-a-mac
      "DejaVu Sans Mono-15" ; bigger font for retina displays
    "DejaVu Sans Mono-12"))

;; Font for mode-line
(defconst emacsd-mode-line-font
  (if emacsd-is-a-mac
      "DejaVu Sans Mono-13"
    "DejaVu Sans Mono-10"))

(setq inhibit-startup-screen t) ; hide the welcome screen

;; TODO: Disable the startup message in the echo area
;; (put 'inhibit-startup-echo-area-message 'saved-value t)
;; (setq inhibit-startup-echo-area-message (user-login-name))

;; Disable scroll bars, the tool bar and the menu bar
(dolist (mode '(scroll-bar-mode
                tool-bar-mode
                menu-bar-mode))
  (when (fboundp mode)
    (funcall mode -1)))

(load-theme 'badwolf t) ; theme, srsly

(setq ring-bell-function 'ignore) ; turn off audible bell and visual bell

;; Start Emacs maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Show the current line and column number in the mode-line
(line-number-mode)
(column-number-mode)

;; Show line and column number like this "123:456" in the mode-line
;; Also removes the "All/Top/Bot" indicator
(setq mode-line-position
      '((line-number-mode ("%l" (column-number-mode ":%c")))))

;; Set the default font
(set-frame-font emacsd-default-font t t)

;; Disable bold fonts
(dolist (face (face-list))
  (set-face-attribute face nil :weight 'normal))

;; Use a smaller font for mode-line
(dolist (face '(mode-line
                mode-line-inactive))
  (set-face-attribute face nil :font emacsd-mode-line-font))

;; Change mode-line colors
(set-face-attribute 'mode-line nil :background "firebrick3")
(set-face-attribute 'mode-line nil :foreground "white")

(provide 'init-ui)
