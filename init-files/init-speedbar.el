(require 'emacsd)
(require 'sr-speedbar)

;; Font for speedbar
(defconst emacsd/speedbar-font-size
  (if (emacsd/system-is-a-mac?) 13 10))

;; Colors for speedbar separator
(defconst emacsd/speedbar-separator-background "purple4")
(defconst emacsd/speedbar-separator-foreground "white")

;; Colors for highlight
(defconst emacsd/speedbar-highlight-background "DarkMagenta")
(defconst emacsd/speedbar-highlight-foreground "white")

;; Show speedbar on the left side
(setq sr-speedbar-right-side nil)

;; Change speedbar size
(setq sr-speedbar-default-width 28)
(setq sr-speedbar-width 28)

;; Do not change current directory of speedbar
(setq sr-speedbar-auto-refresh nil)

;; Use only ASCII
(setq speedbar-use-images nil)

;; Show all files in speedbar
(setq speedbar-show-unknown-files t)

;; Key binding to toggle Speedbar
(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)

;; Change speedbar font size
(dolist (face '(speedbar-button-face
                speedbar-file-face
                speedbar-directory-face
                speedbar-tag-face
                speedbar-selected-face
                speedbar-separator-face))
  (emacsd/set-face-size face emacsd/speedbar-font-size))

;; Change text and background colors for separators
(set-face-background 'speedbar-separator-face emacsd/speedbar-separator-background)
(set-face-foreground 'speedbar-separator-face emacsd/speedbar-separator-foreground)

;; Change text and background colors for highlight
(set-face-background 'speedbar-highlight-face emacsd/speedbar-highlight-background)
(set-face-foreground 'speedbar-highlight-face emacsd/speedbar-highlight-foreground)

(defun emacsd/sr-speedbar-open ()
  (with-current-buffer sr-speedbar-buffer-name
    ;; Disable line numbers while in speedbar
    (linum-mode 0)
    ;; Hide the mode-line on speedbar
    (setq mode-line-format nil)
    ;; Do not allow window to be resized
    (setq window-size-fixed 'width)
    ;; Remove fringes from speedbar
    (set-window-fringes nil 0 0)))

;; sr-speedbar does not provide a mode hook, so I had to adivise this
;; function for some tweaks to work
(advice-add 'sr-speedbar-open :after 'emacsd/sr-speedbar-open)

(provide 'init-speedbar)
