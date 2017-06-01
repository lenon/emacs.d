;; Start Emacs maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

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

(provide 'init-ui)
