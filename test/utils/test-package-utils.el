(require 'package-utils)

(describe "add-repo"
  (before-each
    (redef 'package-archives '()))

  (it "adds new repos to the package-archives list"
    (add-repo "repo-a" "https://repo-a.com")
    (add-repo "repo-b" "https://repo-b.com")

    (expect package-archives
            :to-equal
            '(("repo-a" . "https://repo-a.com")
              ("repo-b" . "https://repo-b.com")))))

(describe "refresh-repos-once"
  (before-each
    (spy-on 'package-refresh-contents))

  (it "refreshes repositories on first call"
    (refresh-repos-once)
    (expect 'package-refresh-contents :to-have-been-called))

  (it "does not refresh repos on subsequent calls"
    (refresh-repos-once)
    (expect 'package-refresh-contents :to-not-have-been-called)))

(describe "use-package"
  (describe "package is not installed"
    (before-each
      (spy-on 'package-installed-p :and-return-value nil)
      (spy-on 'refresh-repos-once)
      (spy-on 'package-install)
      (spy-on 'require))

    (it "installs new packages"
      (use-package 'some-package)

      (expect 'package-installed-p :to-have-been-called-with 'some-package)
      (expect 'refresh-repos-once :to-have-been-called)
      (expect 'package-install :to-have-been-called-with 'some-package)
      (expect 'require :to-have-been-called-with 'some-package)))

  (describe "package is already installed"
    (before-each
      (spy-on 'package-installed-p :and-return-value t)
      (spy-on 'refresh-repos-once)
      (spy-on 'package-install)
      (spy-on 'require))

    (it "just requires it"
      (use-package 'some-package)

      (expect 'package-installed-p :to-have-been-called-with 'some-package)
      (expect 'refresh-repos-once :to-not-have-been-called)
      (expect 'package-install :to-not-have-been-called)
      (expect 'require :to-have-been-called-with 'some-package))))
