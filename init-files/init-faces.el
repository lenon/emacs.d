(require 'emacsd)

;; Default font
(defconst emacsd-default-font
  (if (emacsd-is-a-mac?)
      "DejaVu Sans Mono-15" ; bigger font for retina displays
    "DejaVu Sans Mono-12"))

;; Set the default font
(set-frame-font emacsd-default-font t t)

;; Disable bold fonts
(dolist (face (face-list))
  (set-face-attribute face nil :weight 'normal))

(provide 'init-faces)
