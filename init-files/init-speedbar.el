(require 'emacsd)
(require 'sr-speedbar)

;; Font for speedbar
(defconst emacsd/speedbar-font-size
  (if (emacsd/system-is-a-mac?) 13 12))

;; Show speedbar on the left side
(setq sr-speedbar-right-side nil)

;; Change speedbar size
(setq sr-speedbar-default-width 28)
(setq sr-speedbar-width 28)

;; Use only ASCII
(setq speedbar-use-images nil)

;; Key binding to toggle Speedbar
(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)

;; Change speedbar font size
(dolist (face '(speedbar-button-face
                speedbar-file-face
                speedbar-directory-face
                speedbar-tag-face
                speedbar-selected-face))
  (emacsd/set-face-size face emacsd/speedbar-font-size))

(defun emacsd/speedbar-mode-hook ()
  ;; Disable line numbers while in speedbar
  (linum-mode -1)
  ;; Hide the mode-line on speedbar
  (setq mode-line-format nil)
  ;; Do not allow window to be resized
  (setq window-size-fixed 'width))

(add-hook 'speedbar-mode-hook 'emacsd/speedbar-mode-hook)

(provide 'init-speedbar)
