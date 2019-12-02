(let ((in (open "../day-1a-input.txt" :if-does-not-exist nil)))
  (when in
    (loop for line = (read-line in nil)
	  while line
	  do (write line)
    )
  )
)
