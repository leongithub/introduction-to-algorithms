;;;; 基数排序。O(d * (n + k))，当 d 为常数，k=O(n) 时，基数排序有线性的运行时间
;;;; 输入为 n 个 d 位数，以下是以计数排序作为子程序的基数排序实现

(defun radix-sort (a d)
  (let ((b (make-array (length a))))
    (loop for i below d do
       ;; 稳定的排序
	 (counting-sort a b 9 i)
	 (loop for j below (length a)
	    do (setf (aref a j) (aref b j))))))

;; 由于每次计数排序完成后，需要更新下数组 a，以便下次继续排序
;; 下面用每次新创建一个数组 b 的方式总体比上边遍历赋值快点，
;; 但其中 GC 运行时间会高于上面的 GC 运行时间
(defun radix-sort (a d)
  (loop
     for i below d
     for b = (make-array (length a)) do
       ;; 稳定的排序
       (counting-sort a b 9 i)
       (setf a b)))

;; 与之前 counting-sort.lisp 中的计数排序略有不同，但原理都一样
(defun counting-sort (a b k i)
  (let ((c (make-array (1+ k) :initial-element 0))
	(divisor (expt 10 i)))
    (loop
       for key across a
       for j = (mod (floor key divisor) 10)
       do (incf (aref c j)))
    (loop for j from 1 to k
       do (incf (aref c j) (aref c (1- j))))
    (loop
       for ai from (1- (length a)) downto 0
       for j = (mod (floor (aref a ai) divisor) 10)
       do (setf (aref b (decf (aref c j)))
		(aref a ai)))))

