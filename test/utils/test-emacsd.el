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

(describe "emacsd/set-face-size"
  (it "changes face height"
    (make-face 'face-for-test)
    (emacsd/set-face-size 'face-for-test 12)
    (expect (face-attribute 'face-for-test :height) :to-equal 120)))
