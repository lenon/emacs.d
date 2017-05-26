(require 'emacsd)

(describe "emacsd/system-is-a-mac?"
  (describe "current system is darwin"
    (before-each
      (redef 'system-type 'darwin))

    (it "returns true"
      (expect (emacsd/system-is-a-mac?) :to-be t)))

  (describe "current system is gnu/linux"
    (before-each
      (redef 'system-type 'gnu/linux))

    (it "returns false"
      (expect (emacsd/system-is-a-mac?) :to-be nil))))
