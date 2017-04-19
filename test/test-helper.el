(require 'package)
(package-initialize)

(when (not (package-installed-p 'el-mock))
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/"))
  (package-refresh-contents)
  (package-install 'el-mock))

(require 'el-mock)
(eval-when-compile
  (require 'cl)) ;; for el-mock

(add-to-list 'load-path (expand-file-name "utils" user-emacs-directory))
(require 'package-utils)
