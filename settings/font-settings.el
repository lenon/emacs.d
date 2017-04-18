(if (eq system-type 'darwin)
    (set-frame-font "DejaVu Sans Mono-15" t t) ; bigger font for retina displays
  (set-frame-font "DejaVu Sans Mono-12" t t))

(set-face-bold 'bold nil) ; disable bold fonts

(provide 'font-settings)
