;;; ecukes-output.el --- Helpers for printing feature stuff

;; TODO: Include message in output functions.

(defvar ecukes-output-offset 0
  "Current offset (number of spaces).")

(defconst ecukes-output-color-white 37
  "White color code.")

(defconst ecukes-output-color-red 31
  "Red color code.")

(defconst ecukes-output-color-green 32
  "Green color code.")

;; TODO: End with newline
(defun ecukes-output-intro (intro)
  "Outputs the feature intro"
  (setq ecukes-output-offset 0)
  (let ((header (ecukes-intro-header intro)))
    (message (ecukes-output-white (concat "Feature: " header))))
  (setq ecukes-output-offset 2)
  (dolist (description (ecukes-intro-description intro))
    (message (ecukes-output-white description))))

(defun ecukes-output-scenario (scenario)
  ""

  )

(defun ecukes-output-background (background)
  ""

  )

(defun ecukes-output-step (step success)
  ""

  )

(defun ecukes-output-white (text)
  "Outputs TEXT in white."
  (ecukes-output-text text ecukes-output-color-white))

(defun ecukes-output-red (text)
  "Outputs TEXT in red."
  (ecukes-output-text text ecukes-output-color-red))

(defun ecukes-output-green (text)
  "Outputs TEXT in green."
  (ecukes-output-text text ecukes-output-color-green))

(defun ecukes-output-text (text color)
  "Outputs TEXT in COLOR."
  (concat "\e[" (number-to-string color) "m" (make-string ecukes-output-offset 32) text "\e[0m"))

(provide 'ecukes-output)

;;; ecukes-output.el ends here
