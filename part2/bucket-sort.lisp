;;;; 桶排序。O(n)
;;;; 假设输入的元素可以均匀而独立地分布在区间 [0,1)
;;;; 整个桶排序算法以线性时间运行

;;; 下面桶排序假设一组输入元素均匀而独立地分布在区间[0,1)上
(defun bucket-sort (a)
  (let* ((n (length a))
	 (b (make-array n :initial-element nil)))
    (loop for key across a
       do (let ((i (floor (* n key))))
	    (unless (aref b i)
	      (setf (aref b i) (make-array 2 :fill-pointer 0 :adjustable t)))
	    (vector-push-extend key (aref b i))))
    (loop for v across b
       when (and v (> (length v) 1))
       do (insertion-sort v))
    (loop
       for v across b
       with i = -1
       when v
       do (loop for key across v
	     do (setf (aref a (incf i)) key)))))
