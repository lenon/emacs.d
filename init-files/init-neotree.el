(require 'neotree)

;; Key binding to toggle Neotree
(global-set-key (kbd "C-c n") 'neotree-toggle)

;; Change Neotree theme
(setq neo-theme 'nerd)

;; Hide Neotree modeline
(setq neo-mode-line-type 'none)

(provide 'init-neotree)
