(if (eq system-type 'darwin)
    (set-frame-font "DejaVu Sans Mono-15" t t) ; bigger font for retina displays
  (set-frame-font "DejaVu Sans Mono-12" t t))

;; Disable bold fonts
(dolist (face (face-list))
  (set-face-attribute face nil :weight 'normal))

(provide 'font-settings)
