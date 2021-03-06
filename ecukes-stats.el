;;; ecukes-stats.el --- Statistics about the passed and failed scenarios and steps

(require 'ansi)
(require 's)

(defvar ecukes-stats-steps 0
  "Number of steps that have be runned.")

(defvar ecukes-stats-steps-passed 0
  "Number of steps that have passed.")

(defvar ecukes-stats-steps-failed 0
  "Number of steps that have failed.")

(defvar ecukes-stats-steps-skipped 0
  "Number of steps that were skipped.")

(defvar ecukes-stats-scenarios 0
  "Number of scenarios that have been runned.")

(defvar ecukes-stats-scenarios-passed 0
  "Number of scenarios that have passed.")

(defvar ecukes-stats-scenarios-failed 0
  "Number of scenarios that have failed.")

(defun ecukes-stats-reset ()
  "Reset stats."
  (setq ecukes-stats-steps 0)
  (setq ecukes-stats-steps-passed 0)
  (setq ecukes-stats-steps-failed 0)
  (setq ecukes-stats-steps-skipped 0)
  (setq ecukes-stats-scenarios 0)
  (setq ecukes-stats-scenarios-passed 0)
  (setq ecukes-stats-scenarios-failed 0))

(defmacro ecukes-stats-step (&rest body)
  `(progn
     (setq ecukes-stats-steps (1+ ecukes-stats-steps))
     ,@body))

(defmacro ecukes-stats-scenario (&rest body)
  `(progn
     (setq ecukes-stats-scenarios (1+ ecukes-stats-scenarios))
     ,@body))

(defun ecukes-stats-step-pass ()
  "Step passed."
  (ecukes-stats-step
   (setq ecukes-stats-steps-passed (1+ ecukes-stats-steps-passed))))

(defun ecukes-stats-step-fail ()
  "Step failed."
  (ecukes-stats-step
   (setq ecukes-stats-steps-failed (1+ ecukes-stats-steps-failed))))

(defun ecukes-stats-step-skip ()
  "Step skipped."
  (ecukes-stats-step
   (setq ecukes-stats-steps-skipped (1+ ecukes-stats-steps-skipped))))

(defun ecukes-stats-scenario-pass ()
  "Scenario passed."
  (ecukes-stats-scenario
   (setq ecukes-stats-scenarios-passed (1+ ecukes-stats-scenarios-passed))))

(defun ecukes-stats-scenario-fail ()
  "Scenario failed."
  (ecukes-stats-scenario
   (setq ecukes-stats-scenarios-failed (1+ ecukes-stats-scenarios-failed))))

(provide 'ecukes-stats)

;;; ecukes-stats.el ends here
