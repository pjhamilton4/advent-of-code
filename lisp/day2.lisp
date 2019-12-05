(load "~/quicklisp/setup.lisp")
(ql:quickload :cl-ppcre)

(defun read-program(input)
  (setf input-number-array (make-array (length input) :initial-contents input))

  (setq i 0)
  (loop while (< i (length input))
	do
	(let ((op (aref input-number-array i)))
	      (cond ((eql op 1) (setf (aref input-number-array (aref input-number-array (+ i 3))) 
				      (+ (aref input-number-array (aref input-number-array (+ i 1))) 
					 (aref input-number-array (aref input-number-array (+ i 2))))))
		    ((eql op 2) (setf (aref input-number-array (aref input-number-array (+ i 3))) 
				      (* (aref input-number-array (aref input-number-array (+ i 1)))
					 (aref input-number-array (aref input-number-array (+ i 2))))))
		    ((eql op 99) (return))))
	(setq i (+ i 4)))

;  (print input-number-array)
  (print (aref input-number-array 0))
  )

(write (let ((in (open "../day-2-input.txt" :if-does-not-exist nil)))
	 (when in
	   (loop for line = (read-line in nil)
		 while line do (if (not nil)(read-program (mapcar #'parse-integer (cl-ppcre:split "(,)" line))))
		 ))))

(terpri)
