(setq inhibit-startup-screen t) ; hide the welcome screen

;; Disable the startup message in the echo area
(put 'inhibit-startup-echo-area-message 'saved-value
     (setq inhibit-startup-echo-area-message (user-login-name)))

(provide 'startup-settings)
