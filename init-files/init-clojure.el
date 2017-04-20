(require 'clojure-mode)

;; Indent fact and facts like this:
;; (fact "xpto"
;;   (something) => true)
(put-clojure-indent 'facts 1)
(put-clojure-indent 'fact 1)

;; Display doc about symbols at point in the echo area
(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)

(setq cider-use-overlays nil)
(setq cider-overlays-use-font-lock t)
