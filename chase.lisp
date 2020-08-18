(defun init-playfield ()

(setf *playfield* (make-array '(10 10)
		    :initial-contents '(("#" "#" "#" "#" "#" "#" "#" "#" "#" "#")
					("#" " " " " " " " " " " " " " " " " "#")
					("#" " " " " " " " " " " " " " " " " "#")
					("#" " " " " " " " " " " " " " " " " "#")
					("#" " " " " " " " " " " " " " " " " "#")
					("#" " " " " " " " " " " " " " " " " "#")
					("#" " " " " " " " " " " " " " " " " "#")
					("#" " " " " " " " " " " " " " " " " "#")
					("#" " " " " " " " " " " " " " " " " "#")
					("#" "#" "#" "#" "#" "#" "#" "#" "#" "#")))))

(defun init-internal-fences ()
  (dotimes (n 10)
    (setf
     (aref *playfield*
	   (+ 1 (random 8)) (+ 1 (random 8))) "#")))


(defun init-player-position ()
  (loop while
       (equal
	(aref *playfield*
	      (nth 0 *player-coords*) (nth 1 *player-coords*)) "#")
     do
       (setf *player-coords* (list (+ 1 (random 8)) (+ 1 (random 8)))))

  (setf
   (aref *playfield*
	 (nth 0 *player-coords*) (nth 1 *player-coords*)) "@"))

(defparameter *user-input* nil)
(defparameter *old-coords* nil)

(defun print-2d-array-as-table (array)
  (loop for i from 0 below (array-dimension array 0)
    do (loop for j from 0 below (array-dimension array 1)
             do (princ (aref array i j))
                (if (= j (1- (array-dimension array 1)))
                    (terpri)
                    (princ #\Space)))))

(defun main-loop ()

  (loop
     (print-2d-array-as-table *playfield*)   
     (setq *user-input* (read))
     (parse-input)
     (game-state)
     (when (equal *user-input* 'quit) (return))))


(defun parse-input ()


  
  (cond
    ((equal *user-input* 8)     
     (setf move-vector '(-1 0))
     (print "move up"))
    
    ((equal *user-input* 2)
     (setf move-vector '(1 0))
     (print "move down"))
    
    ((equal *user-input* 4)
     (setf move-vector '(0 -1))
     (print "move left"))
    
    ((equal *user-input* 6)
     (setf move-vector '(0 1))
     (print "move right"))))

(defun game-state ()

  (setf check-move *player-coords*)

  (setf check-move (map 'list #'+ check-move move-vector))
 
  (when (equal "#"
	       (aref *playfield*
		     (nth 0 check-move)
		     (nth 1 check-move)))

    (print "bump!"))

  (if (equal " "
	       (aref *playfield*
		     (nth 0 check-move)
		     (nth 1 check-move)))

      (progn
	(setf *player-coords* check-move)
	
	(setf
	 (aref *playfield*
	       (nth 0 *old-coords*) (nth 1 *old-coords*)) " ")

	(setf
	 (aref *playfield*
	       (nth 0 *player-coords*) (nth 1 *player-coords*)) "@"))))
  

 

