(require 'clojure-mode)

;; Indent fact and facts like this:
;; (fact "xpto"
;;   (something) => true)
(put-clojure-indent 'facts 1)
(put-clojure-indent 'fact 1)

;; Display doc about symbols at point in the echo area
(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)

;; Disable the error buffer, it annoys me when neotree is open
;; TODO: investigate why the error buffer is presented on a new frame
;; when neotree is open
(setq cider-show-error-buffer nil)

;; Display results on the echo area
(setq cider-overlays-use-font-lock t)

(provide 'init-clojure)
