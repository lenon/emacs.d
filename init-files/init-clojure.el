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

;; Show error buffer except when in REPL
(setq cider-show-error-buffer 'except-in-repl)

;; Display results on the echo area
(setq cider-use-overlays nil)

;; Do not truncate lines on repl
(with-eval-after-load 'cider-repl-mode-hook
  (setq truncate-lines nil))

(provide 'init-clojure)
