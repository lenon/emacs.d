(require 'package)

(defun add-repo (name url)
  (add-to-list 'package-archives
               (cons name url) t))

(defvar refreshed-recently nil)

(defun refresh-repos-once ()
  (when (not refreshed-recently)
    (package-refresh-contents)
    (setq refreshed-recently t)))

(defun use-package (package-name)
  (when (not (package-installed-p package-name))
    (refresh-repos-once)
    (package-install package-name)))

(provide 'package-utils)
