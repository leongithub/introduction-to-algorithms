;;;; 堆排序 O(n * lgn)

(defparameter *heap-size* 0)

(defun heap-sort (a)
  (build-max-heap a)
  (loop for i from (1- (length a)) downto 1 do
       (rotatef (aref a i) (aref a 0))
       (decf *heap-size*)
       (max-heapify a 0)))

(defun build-max-heap (a)
  (let ((len (length a)))
    (setf *heap-size* len)
    (loop for i from (1- (floor (/ len 2))) downto 0
       do (max-heapify a i))))

;; a is an array
(defun max-heapify (a i)
  (let ((l (left i))
	(r (right i))
	(largest 0))
    (if (and (< l *heap-size*)
	     (> (aref a l) (aref a i)))
	(setf largest l)
	(setf largest i))
    (if (and (< r *heap-size*)
	     (> (aref a r) (aref a largest)))
	(setf largest r))
    (when (/= largest i)
      (rotatef (aref a i) (aref a largest))
      (max-heapify a largest))))

(declaim (inline left))
(defun left (i) (1+ (* 2 i)))

(declaim (inline right))
(defun right (i) (+ (* 2 i) 2))

(declaim (inline parent))
(defun parent (i) (1- (floor (/ (1+ i) 2))))

;;; 最大优先级队列（最大堆实现）

;; 返回 a 中具有最大关键字的元素。O(1)
(defun heap-maximum (a) (aref a 0))

;; 去掉并返回 a 中具有最大关键字的元素。O(lgn)
(defun heap-extract-max (a)
  (if (< *heap-size* 1)
      (error "heap underflow"))
  (let ((max (aref a 0)))
    (setf (aref a 0) (aref a (decf *heap-size*)))
    (max-heapify a 0)
    max))

;; 将位置 i 的关键字的值增加到 key。O(lgn)
(defun heap-increase-key (a i key)
  (if (< key (aref a i))
      (error "new key is smaller than current key"))
  (setf (aref a i) key)
  (while (and (> i 0)
	      (> (aref a i)
		 (aref a (parent i))))
    (rotatef (aref a i) (aref a (parent i)))
    (setf i (parent i))))

(defmacro while (test &body body)
  `(do ()
       ((not ,test))
     ,@body))

;; 把元素 key 插入集合 a。O(lgn)
(defun max-heap-insert (a key)
  (incf *heap-size*)
  (setf (aref a (1- *heap-size*)) most-negative-fixnum)
  (heap-increase-key a (1- *heap-size*) key))
