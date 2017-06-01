;; Directory used for temporary files
(defconst emacsd/tmp-dir
  (expand-file-name "tmp" user-emacs-directory))

;; Directory used for backups
(defconst emacsd/backups-dir
  (expand-file-name "backups" emacsd/tmp-dir))

;; Directory used for auto-save files
(defconst emacsd/auto-save-dir
  (expand-file-name "auto-save" emacsd/tmp-dir))

;; Prefix used for auto-save lists
(defconst emacsd/auto-save-prefix
  (expand-file-name ".auto-save-list-" emacsd/auto-save-dir))

;; Ensure that backups and auto-save dirs exist
(mkdir emacsd/backups-dir t)
(mkdir emacsd/auto-save-dir t)

;; Save all backups into the same dir
;; Prevent emacs from creating ~* files everywhere
(setq backup-directory-alist `(("." . ,emacsd/backups-dir)))

;; Auto-save files into the same dir
;; Prevent emacs from creating #.*# files everywhere
(setq auto-save-file-name-transforms
      `((".*" ,(concat emacsd/auto-save-dir "/") t)))
(setq auto-save-list-file-prefix emacsd/auto-save-prefix)

;; Disable interlock files used to protect against simultaneous editing
;; Prevent emacs from creating .#* symlinks
(setq create-lockfiles nil)

(provide 'init-backups)
