;;;; 计数排序。当 k=O(n) 时，运行时间为 O(n)
;;;; 被排序数组每个元素都是介于 0 到 k(某个整数) 之间的整数

;; a 为要排序的数组，b 为排序结果数组
(defun counting-sort (a b k)
  (let ((c (make-array (1+ k) :initial-element 0)))
    (loop for key across a do (incf (aref c key)))
    (loop for i from 1 to k
       do (incf (aref c i) (aref c (1- i))))
    (loop for key across a
       do (setf (aref b (decf (aref c key))) key))
    ))

;;; 上面的最后一步循环，是从数组头到尾，导致原来在数组 a 中相同
;;; 元素排在前边的会在数组 b 中排入后面，使得计数排序失去了稳定
;;; 性（具有相同值的元素在输出数组中的相对次序与它们在输入数组中
;;; 的次序相同）。因为计数排序常用作基数排序算法的一个子过程，计
;;; 数排序的稳定性对于基数排序的正确性，是非常关键的。所以需要把
;;; 最后的循环改成从尾到头。
(loop for i from (1- (length a)) downto 0
   do (setf (aref b (decf (aref c (aref a i))))
	    (aref a i)))
