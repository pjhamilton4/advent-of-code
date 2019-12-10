(load "~/quicklisp/setup.lisp")
(ql:quickload :cl-ppcre)


(setq coords ())

(defun map-wires(x y)
;  (format t "MAP-WIRES:: X: ~d  Y: ~d" x y)
  (setq coords (cons (list x y) coords))
  (write coords)
  )


(defun read-wires(input)
  (setq x 0)
  (setq y 0)
  (loop for *element* in input
	do
	(terpri)
	(let ((direction (subseq *element* 0 1)) (distance (parse-integer (subseq *element* 1))))
	  (cond ((string= direction "U") (progn (setq y (+ y distance))
						(map-wires x y)))
						;(format t "X: ~d  Y: ~d" x y)))
		((string= direction "D") (progn (setq y (- y distance))
						(map-wires x y)))
						;(format t "X: ~d  Y: ~d" x y)))
		((string= direction "R") (progn (setq x (+ x distance))
						(map-wires x y)))
						;(format t "X: ~d  Y: ~d" x y)))
		((string= direction "L") (progn (setq x (- x distance))
						;(format t "X: ~d  Y: ~d" x y)
						(map-wires x y))))))
)

(setq test1 '("R75" "D30" "R83" "U83" "L12" "D49" "R71" "U7" "L72"))
(setq test2 '("U62" "R66" "U55" "R34" "D71" "R55" "D58" "R83"))

(read-wires test1)
(terpri)
(read-wires test2)


;(write (let ((in (open "../day-3-input.txt" :if-does-not-exist nil)))
;	 (when in
;	   (loop for line = (read-line in nil)
;		 while line do (if (not nil)(read-wires (cl-ppcre:split "(,)" line)))
;		 ))))

(terpri)
