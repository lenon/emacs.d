(package-initialize)

(require 'el-mock)
(eval-when-compile
  (require 'cl)) ;; for el-mock

(add-to-list 'load-path (expand-file-name "utils" user-emacs-directory))
(require 'package-utils)
