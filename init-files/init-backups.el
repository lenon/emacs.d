(defvar tmp-dir (expand-file-name "tmp" user-emacs-directory))
(defvar backups-dir (expand-file-name "backups" tmp-dir))

(when (not (file-exists-p backups-dir))
  (mkdir backups-dir t)) ; creates a dir for backups if it does not exist

;; Save all backups into the same dir
(setq backup-directory-alist `(("." . ,backups-dir)))

(provide 'init-backups)
