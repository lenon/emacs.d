(require 'emacsd)

;; Font for mode-line
(defconst emacsd-mode-line-font-size
  (if (emacsd-is-a-mac?) 13 12))

;; Background color
(defconst emacsd-mode-line-background "dark violet")

;; Color for text
(defconst emacsd-mode-line-foreground "white")

;; Change mode-line font size
(dolist (face '(mode-line mode-line-inactive))
  (set-face-attribute face nil :height (* 10 emacsd-mode-line-font-size)))

;; Show the current line and column number in the mode-line
(line-number-mode)
(column-number-mode)

;; Show line and column number like this "123:456" in the mode-line
;; Also removes the "All/Top/Bot" indicator
(setq mode-line-position
      '((line-number-mode ("%l" (column-number-mode ":%c")))))

;; Change mode-line colors
(set-face-attribute 'mode-line nil :background emacsd-mode-line-background)
(set-face-attribute 'mode-line nil :foreground emacsd-mode-line-foreground)

(provide 'init-mode-line)
