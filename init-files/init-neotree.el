(require 'neotree)

;; Font for Neotree
(defconst emacsd/neo-tree-font-size
  (if (emacsd/system-is-a-mac?) 13 12))

;; Key binding to toggle Neotree
(global-set-key (kbd "C-c n") 'neotree-toggle)

;; Change Neotree theme
(setq neo-theme 'nerd)

;; Hide Neotree modeline
(setq neo-mode-line-type 'none)

;; Change Neotree font size
(dolist (face '(neo-banner-face
                neo-button-face
                neo-dir-link-face
                neo-file-link-face
                neo-header-face
                neo-expand-btn-face
                neo-root-dir-face))
  (set-face-attribute face nil :height (* 10 emacsd/neo-tree-font-size)))

(provide 'init-neotree)
