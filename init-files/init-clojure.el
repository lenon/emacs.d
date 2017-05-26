(require 'clojure-mode)

;; Indent midje functions like this:
;; (fact "xpto"
;;   (something) => true)
(dolist (midje-statement '(facts
                           fact
                           provided
                           tabular))
  (put-clojure-indent midje-statement 'defun))

;; Display doc about symbols at point in the echo area
(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)

;; Disable the error buffer because it is presented on a new frame
;; when neotree is open
;; TODO: investigate this behavior
(setq cider-show-error-buffer nil)

;; Display results on the echo area
(setq cider-use-overlays nil)

;; Do not truncate lines on repl
(with-eval-after-load 'cider-repl-mode-hook
  (setq truncate-lines nil))

(provide 'init-clojure)
