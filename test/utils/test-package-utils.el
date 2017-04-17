(ert-deftest test-add-repo ()
  (add-repo "repo-a" "http://repo-a.com")
  (add-repo "repo-b" "http://repo-b.com")

  (should (equal package-archives
                 '(("gnu" . "http://elpa.gnu.org/packages/")
                   ("repo-a" . "http://repo-a.com")
                   ("repo-b" . "http://repo-b.com")))))

(ert-deftest test-refresh-repos-once ()
  (with-mock
    (mock (package-refresh-contents))
    (refresh-repos-once))

  (with-mock
    ;; should not try to refresh packages again
    ;; when called more than once in the same session
    (not-called package-refresh-contents)
    (refresh-repos-once)))

(ert-deftest test-use-package-not-installed ()
  (with-mock
    (mock (package-installed-p 'some-package) => nil)
    (mock (refresh-repos-once))
    (mock (package-install 'some-package))
    (use-package 'some-package)))

(ert-deftest test-use-package-already-installed ()
  (with-mock
    (mock (package-installed-p 'some-package) => t)
    (not-called refresh-repos-once)
    (not-called package-install)
    (use-package 'some-package)))
