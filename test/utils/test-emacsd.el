(require 'emacsd)

(describe "emacsd-is-a-mac?"
  (describe "current system is darwin"
    (before-each
      (redef 'system-type 'darwin))

    (it "returns true"
      (expect (emacsd-is-a-mac?) :to-be t)))

  (describe "current system is gnu/linux"
    (before-each
      (redef 'system-type 'gnu/linux))

    (it "returns false"
      (expect (emacsd-is-a-mac?) :to-be nil))))
