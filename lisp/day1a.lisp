(defun calculate-value(input sum)
;  (format t "Input ~D " input)
;  (format t "Sum ~D | " sum)
  (let ((total 0))
  (cond ((<= input 0) (+ sum 2))
	((= input 1) sum)
	((> input 1) (progn 
		       (setf total (+ sum (- (floor (/ input 3)) 2))) 
		       (calculate-value (- (floor (/ input 3)) 2) total)
		       )))
))

(write (let ((in (open "../day-1a-input.txt" :if-does-not-exist nil)))
  (when in
    (let ((sum 0))
    (loop for line = (read-line in nil nil)
      while line
      do
      (setf sum (+ sum (calculate-value (parse-integer line) 0)))
    )sum))))

;(write (calculate-value 87816 0))
(terpri)
