(defun emacsd/system-is-a-mac? ()
  (eq system-type 'darwin))

(defun emacsd/set-face-size (face size)
  (set-face-attribute face nil :height (* 10 size)))

(defun emacsd/calc-font-height (size)
  (* 10 size))

(defun emacsd/proportional-font-size (base-size)
  (if (emacsd/system-is-a-mac?)
      base-size
    (round (* 0.8 base-size))))

(provide 'emacsd)
