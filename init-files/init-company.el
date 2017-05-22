(require 'company)

(global-company-mode)

;; Make company-mode complete the first match when pressing TAB and then cycle
(define-key company-active-map (kbd "TAB")
  'company-complete-common-or-cycle)
(define-key company-active-map (kbd "<tab>")
  'company-complete-common-or-cycle)

;; Select previous matches
(define-key company-active-map (kbd "S-TAB")
  'company-select-previous)
(define-key company-active-map (kbd "<backtab>")
  'company-select-previous)

;; Cancel selections by typing non-matching characters
(setq company-require-match 'never)

;; Minimum prefix length for completion
(setq company-minimum-prefix-length 1)

;; Change selection background color
(set-face-attribute 'company-tooltip-selection nil
                    :background "RoyalBlue3"
                    :foreground "White")

(provide 'init-company)
