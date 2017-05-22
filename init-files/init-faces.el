(require 'emacsd)

;; Default font
(defconst emacsd-default-font
  (if (emacsd-is-a-mac?)
      "DejaVu Sans Mono-15" ; bigger font for retina displays
    "DejaVu Sans Mono-12"))

;; Font for mode-line
(defconst emacsd-mode-line-font
  (if (emacsd-is-a-mac?)
      "DejaVu Sans Mono-13"
    "DejaVu Sans Mono-12"))

;; Set the default font
(set-frame-font emacsd-default-font t t)

;; Disable bold fonts
(dolist (face (face-list))
  (set-face-attribute face nil :weight 'normal))

;; Use a smaller font for mode-line
(dolist (face '(mode-line
                mode-line-inactive))
  (set-face-attribute face nil :font emacsd-mode-line-font))

(provide 'init-faces)
