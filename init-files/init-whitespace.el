(require 'whitespace)

(setq whitespace-style '(face
                         trailing ; highlight trailing spaces
                         tabs ; highlight tabs
                         spaces ; highlight spaces
                         ;; lines-tail ; highlight long lines
                         ;; space-mark ; show spaces as characters
                         tab-mark ; show tabs as characters
                         ))

(global-whitespace-mode 1) ; enable whitespace plugin

(provide 'init-whitespace)
