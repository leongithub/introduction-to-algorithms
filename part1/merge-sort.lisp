;;;; 合并排序 O(n * lgn)

;; p, r 为数组下标
(defun merge-sort (array p r)
  (when (< p r)
    (let ((q (floor (/ (+ p r) 2))))
      (merge-sort array p q)
      (merge-sort array (1+ q) r)
      (our-merge array p q r))))

(defun our-merge (array p q r)
  (let* ((n1 (1+ (- q p)))
	 (n2 (- r q))
	 (left (make-array (1+ n1)))
	 (right (make-array (1+ n2))))
    (loop for i below n1
       do (setf (aref left i)
		(aref array (+ p i))))
    (loop for j below n2
       do (setf (aref right j)
		(aref array (+ q j 1))))
    (setf (aref left n1) most-positive-fixnum)
    (setf (aref right n2) most-positive-fixnum)
    (let ((i 0)
	  (j 0))
      (loop for k from p to r
	 do (cond ((< (aref left i)
		      (aref right j))
		   (setf (aref array k)
			 (aref left i))
		   (incf i))
		  (t
		   (setf (aref array k)
			 (aref right j))
		   (incf j)))))))

(defun test ()
  (let ((array (vector 2 3 1 6 4 5)))
    (merge-sort array 0 (1- (length array)))
    array))
