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

(if (eq system-type 'darwin)
    (set-frame-font "DejaVu Sans Mono-15" t t) ; bigger font for retina displays
  (set-frame-font "DejaVu Sans Mono-12" t t))

;; Disable bold fonts
(dolist (face (face-list))
  (set-face-attribute face nil :weight 'normal))

;; Start Emacs maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(provide 'init-ui)
