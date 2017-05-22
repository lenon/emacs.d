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

;; Change mode-line colors
(set-face-attribute 'mode-line nil :background "RoyalBlue3")
(set-face-attribute 'mode-line nil :foreground "white")

(provide 'init-ui)
