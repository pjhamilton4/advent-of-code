(load "~/quicklisp/setup.lisp")
(ql:quickload :cl-ppcre)

(defun read-wires(input)
  (loop for *element* in input
	do
	(terpri)
	(let ((direction (subseq *element* 0 1)) (distance (subseq *element* 1)))
	  (cond ((string= direction "U") (progn (write "UP!") 
						(write distance)))
		((string= direction "D") (progn (write "DOWN!")
						(write distance)))
		((string= direction "R") (progn (write "RIGHT!")
						(write distance)))
		((string= direction "L") (progn (write "LEFT!")
						(write distance))))))
)

(write (let ((in (open "../day-3-input.txt" :if-does-not-exist nil)))
	 (when in
	   (loop for line = (read-line in nil)
		 while line do (if (not nil)(read-wires (cl-ppcre:split "(,)" line)))
		 ))))

(terpri)
