(defun emacsd/system-is-a-mac? ()
  (eq system-type 'darwin))

(defun emacsd/set-face-size (face size)
  (set-face-attribute face nil :height (* 10 size)))

(provide 'emacsd)
