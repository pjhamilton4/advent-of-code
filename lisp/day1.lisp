(defun calculate-value(input) 
  (- (floor (/ (parse-integer input) 3)) 2)
)

(write (let ((in (open "../day-1a-input.txt" :if-does-not-exist nil)))
  (when in
    (let ((sum 0))
    (loop for line = (read-line in nil)
      while line do (setf sum (+ sum (calculate-value line)))
    )sum))))

(terpri)
