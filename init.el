(defun add-to-load-path (dir)
  "Receives a dir relative to `user-emacs-directory' and adds it to the load path"
  (let ((abs-path (expand-file-name dir user-emacs-directory)))
    (add-to-list 'load-path abs-path)))

(add-to-load-path "utils")
(add-to-load-path "init-files")

;; Package initialization and automatic setup
(require 'package)
(require 'package-utils)

;; Initialize the package manager. I'm not activating all packages here because
;; they will be activated manually later by use-package calls.
;; This ensures that only explicitly required packages will be used.
(package-initialize 'no-activate)

(package-utils/remove-repo "gnu") ; forcing GNU ELPA to use HTTPS
(package-utils/add-repo "gnu" "https://elpa.gnu.org/packages/")
(package-utils/add-repo "melpa" "https://melpa.org/packages/")

(package-utils/use-package 'monokai-theme)
(package-utils/use-package 'cider)
(package-utils/use-package 'clojure-mode)
(package-utils/use-package 'company)
(package-utils/use-package 'sr-speedbar)

(require 'init-ui)
(require 'init-mode-line)
(require 'init-editor)

(require 'init-backups)
(require 'init-clojure)
(require 'init-company)
(require 'init-elisp)
(require 'init-speedbar)
(require 'init-whitespace)

;; Save customizations in ~/.emacs.d/custom.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-readable-p custom-file)
  (load custom-file))
