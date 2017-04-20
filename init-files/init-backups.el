(defvar tmp-dir (expand-file-name "tmp" user-emacs-directory))
(defvar auto-save-file (expand-file-name ".auto-save-file-" tmp-dir))
(defvar backups-dir (expand-file-name "backups" tmp-dir))
(defvar auto-save-dir (expand-file-name "auto-save" tmp-dir))

;; Ensure backups dir and auto-save dir exist
(dolist (dir `(,backups-dir
               ,auto-save-dir))
  (when (not (file-exists-p dir))
    (mkdir dir t)))

;; Save all backups into the same dir (do not create ~ files everywhere)
(setq backup-directory-alist `(("." . ,backups-dir)))

;; Auto-save files into the same dir (do not create #.*# files everywhere)
(setq auto-save-file-name-transforms
      `((".*" ,(concat auto-save-dir "/") t)))
(setq auto-save-list-file-prefix auto-save-file)

(provide 'init-backups)
