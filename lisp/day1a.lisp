(defun calculate-value(input sum)
;  (format t "Input ~D " input)
;  (format t "Sum ~D | " sum)
  (let ((total 0))
  (cond ((<= input 5) sum)
	((> input 5) (progn 
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


;(write (calculate-value 53247 0))
;(terpri)
;(write (calculate-value 140268 0))
;(terpri)
;(write (calculate-value 139961 0))
(terpri)
