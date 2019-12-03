
(load "~/quicklisp/setup.lisp")
(ql:quickload :cl-ppcre)

(defun read-program(input)
  (setq input-number-array (mapcar #'parse-integer (cl-ppcre:split "(,)" input)))

  ; Get 4 entries from input .
  (setq op (nth 0 input-number-array))
  (setq first-num (nth 1 input-number-array))
  (setq second-num (nth 2 input-number-array))
  (setq write-position (nth 3 input-number-array))
  (if (= op 1) (write (+ first-num second-num)) (write (* first-num second-num)))
  )

(write (let ((in (open "../day-2-input.txt" :if-does-not-exist nil)))
	 (when in
	   (loop for line = (read-line in nil)
		 while line do (if (not nil)(read-program line))
		 ))))

       (terpri)

