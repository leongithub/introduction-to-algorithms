;;;; 快速排序。最坏情况运行时间为 O(n * n)
;;;; 快速排序通常是用于排序的最佳实用选择
;;;; 因为其平均性能相当好，期望运行时间为 O(n * lgn)

(defun quick-sort (a p r)
  (when (< p r)
    (let ((q (partition a p r)))
      (quick-sort a p (1- q))
      (quick-sort a (1+ q) r))))

(defun partition (a p r)
  (let ((x (aref a r))
	(i (1- p)))
    (loop for j from p below r
       when (<= (aref a j) x)
       do (incf i)
	 (rotatef (aref a j) (aref a i)))
    (rotatef (aref a r) (aref a (1+ i)))
    (1+ i)))
