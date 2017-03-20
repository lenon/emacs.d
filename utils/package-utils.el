(require 'package)

(defun add-repo (name url)
  (add-to-list 'package-archives
               (cons name url) t))

(defun refresh-repos (packages)
  (let* ((package-states (mapcar 'package-installed-p packages))
         (not-installed-packages (delq t package-states)))
    (when not-installed-packages
      (package-refresh-contents))))

(defun install-package (name)
  (when (not (package-installed-p name))
    (package-install name)))

(defun install-packages (packages)
  (mapc 'install-package packages))

(provide 'package-utils)
