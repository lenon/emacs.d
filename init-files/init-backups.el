(defconst emacsd/tmp-dir
  (expand-file-name "tmp" user-emacs-directory)
  "The directory used for temporary files.")

(defconst emacsd/backups-dir
  (expand-file-name "backups" emacsd/tmp-dir)
  "The directory used for backups.")

(defconst emacsd/auto-save-dir
  (expand-file-name "auto-save" emacsd/tmp-dir)
  "The directory used for auto-save files.")

(defconst emacsd/auto-save-prefix
  (expand-file-name ".auto-save-list-" emacsd/auto-save-dir)
  "Prefix used for auto-save lists.")

;; Ensure that backups and auto-save dirs exist
(mkdir emacsd/backups-dir t)
(mkdir emacsd/auto-save-dir t)

;; Save all backups into the same directory and prevent Emacs from
;; creating ~* files everywhere.
(setq backup-directory-alist `(("." . ,emacsd/backups-dir)))

;; Create auto-save files into the same directory and prevent Emacs from
;; creating #.*# files everywhere.
(setq auto-save-file-name-transforms
      `((".*" ,(concat emacsd/auto-save-dir "/") t)))

;; Change where emacs should write the list of all auto-save file names.
(setq auto-save-list-file-prefix emacsd/auto-save-prefix)

;; Disable interlock files used to protect against simultaneous editing.
;; Prevent emacs from creating .#* symlinks everywhere.
(setq create-lockfiles nil)

(provide 'init-backups)
