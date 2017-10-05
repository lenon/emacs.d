(require 'package-utils)

(describe "package-utils/add-repo"
  (before-each
    (redef 'package-archives '()))

  (it "adds new repos to the package-archives list"
    (package-utils/add-repo "repo-a" "https://repo-a.com")
    (package-utils/add-repo "repo-b" "https://repo-b.com")

    (expect package-archives
            :to-equal
            '(("repo-a" . "https://repo-a.com")
              ("repo-b" . "https://repo-b.com")))))

(describe "package-utils/refresh-repos-once"
  (before-each
    (spy-on 'package-refresh-contents))

  (it "refreshes repositories on first call"
    (package-utils/refresh-repos-once)
    (expect 'package-refresh-contents :to-have-been-called))

  (it "does not refresh repos on subsequent calls"
    (package-utils/refresh-repos-once)
    (expect 'package-refresh-contents :not :to-have-been-called)))

(describe "package-utils/use-package"
  (describe "package is not installed"
    (before-each
      (spy-on 'package-installed-p :and-return-value nil)
      (spy-on 'package-utils/refresh-repos-once)
      (spy-on 'package-install)
      (spy-on 'package-activate)
      (spy-on 'require))

    (it "installs new packages"
      (package-utils/use-package 'some-package)

      (expect 'package-installed-p :to-have-been-called-with 'some-package)
      (expect 'package-utils/refresh-repos-once :to-have-been-called)
      (expect 'package-install :to-have-been-called-with 'some-package)
      (expect 'package-activate :to-have-been-called-with 'some-package)
      (expect 'require :to-have-been-called-with 'some-package)))

  (describe "package is already installed"
    (before-each
      (spy-on 'package-installed-p :and-return-value t)
      (spy-on 'package-utils/refresh-repos-once)
      (spy-on 'package-install)
      (spy-on 'package-activate)
      (spy-on 'require))

    (it "requires and activates it"
      (package-utils/use-package 'some-package)

      (expect 'package-installed-p :to-have-been-called-with 'some-package)
      (expect 'package-utils/refresh-repos-once :not :to-have-been-called)
      (expect 'package-install :not :to-have-been-called)
      (expect 'package-activate :to-have-been-called-with 'some-package)
      (expect 'require :to-have-been-called-with 'some-package))))
