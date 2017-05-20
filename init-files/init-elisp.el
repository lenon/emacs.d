(dolist (statement '(describe
                      it
                      before-each))
  (put statement 'lisp-indent-function 'defun))

(provide 'init-elisp)
