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

(describe "emacsd/calc-font-height"
  (it "multiplies size by 10"
    (expect (emacsd/calc-font-height 12) :to-equal 120)))

(describe "emacsd/proportional-font-size"
  (it "calculates an appropriate font-size for macOS"
    (redef 'system-type 'darwin)
    (expect (emacsd/proportional-font-size 12) :to-equal 12))

  (it "calculates an appropriate font-size for gnu/linux"
    (redef 'system-type 'gnu/linux)
    (expect (emacsd/proportional-font-size 12) :to-equal 10)))
