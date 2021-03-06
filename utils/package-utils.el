(require 'package)

(defvar package-utils/refreshed-recently nil)

(defun package-utils/add-repo (name url)
  (add-to-list 'package-archives
               (cons name url) t))

(defun package-utils/remove-repo (name)
  (setq package-archives
        (remq (assoc name package-archives) package-archives)))

(defun package-utils/refresh-repos-once ()
  (when (not package-utils/refreshed-recently)
    (package-refresh-contents)
    (setq package-utils/refreshed-recently t)))

(defun package-utils/use-package (package-name)
  (when (not (package-installed-p package-name))
    (package-utils/refresh-repos-once)
    (package-install package-name))
  (package-activate package-name)
  (require package-name))

(provide 'package-utils)
