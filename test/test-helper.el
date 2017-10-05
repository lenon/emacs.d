;; -*- lexical-binding: t -*-
(require 'package)

(add-to-list 'package-archives
             '("melpa-stable" .
               "http://stable.melpa.org/packages/") t)
(package-initialize)

(when (not (package-installed-p 'buttercup))
  (package-refresh-contents)
  (package-install 'buttercup))

(add-to-list 'load-path (expand-file-name "utils" user-emacs-directory))

(require 'buttercup)

(defun redef (var temp-value)
  "Temporarily redefines a variable"
  (let ((orig-var (symbol-value var)))
    (set var temp-value)
    (buttercup--add-cleanup (lambda ()
                              (set var orig-var)))))
