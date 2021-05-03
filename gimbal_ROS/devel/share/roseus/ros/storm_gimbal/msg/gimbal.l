;; Auto-generated. Do not edit!


(when (boundp 'storm_gimbal::gimbal)
  (if (not (find-package "STORM_GIMBAL"))
    (make-package "STORM_GIMBAL"))
  (shadow 'gimbal (find-package "STORM_GIMBAL")))
(unless (find-package "STORM_GIMBAL::GIMBAL")
  (make-package "STORM_GIMBAL::GIMBAL"))

(in-package "ROS")
;;//! \htmlinclude gimbal.msg.html


(defclass storm_gimbal::gimbal
  :super ros::object
  :slots (_roll _pitch ))

(defmethod storm_gimbal::gimbal
  (:init
   (&key
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    )
   (send-super :init)
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   self)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:serialization-length
   ()
   (+
    ;; float64 _roll
    8
    ;; float64 _pitch
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get storm_gimbal::gimbal :md5sum-) "0f5aa311af37faead3f9e90f420c9603")
(setf (get storm_gimbal::gimbal :datatype-) "storm_gimbal/gimbal")
(setf (get storm_gimbal::gimbal :definition-)
      "float64 roll
float64 pitch
")



(provide :storm_gimbal/gimbal "0f5aa311af37faead3f9e90f420c9603")


