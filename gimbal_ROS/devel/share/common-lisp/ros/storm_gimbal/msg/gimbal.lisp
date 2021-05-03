; Auto-generated. Do not edit!


(cl:in-package storm_gimbal-msg)


;//! \htmlinclude gimbal.msg.html

(cl:defclass <gimbal> (roslisp-msg-protocol:ros-message)
  ((roll
    :reader roll
    :initarg :roll
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0))
)

(cl:defclass gimbal (<gimbal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <gimbal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'gimbal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name storm_gimbal-msg:<gimbal> is deprecated: use storm_gimbal-msg:gimbal instead.")))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <gimbal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader storm_gimbal-msg:roll-val is deprecated.  Use storm_gimbal-msg:roll instead.")
  (roll m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <gimbal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader storm_gimbal-msg:pitch-val is deprecated.  Use storm_gimbal-msg:pitch instead.")
  (pitch m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <gimbal>) ostream)
  "Serializes a message object of type '<gimbal>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <gimbal>) istream)
  "Deserializes a message object of type '<gimbal>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<gimbal>)))
  "Returns string type for a message object of type '<gimbal>"
  "storm_gimbal/gimbal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'gimbal)))
  "Returns string type for a message object of type 'gimbal"
  "storm_gimbal/gimbal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<gimbal>)))
  "Returns md5sum for a message object of type '<gimbal>"
  "0f5aa311af37faead3f9e90f420c9603")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'gimbal)))
  "Returns md5sum for a message object of type 'gimbal"
  "0f5aa311af37faead3f9e90f420c9603")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<gimbal>)))
  "Returns full string definition for message of type '<gimbal>"
  (cl:format cl:nil "float64 roll~%float64 pitch~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'gimbal)))
  "Returns full string definition for message of type 'gimbal"
  (cl:format cl:nil "float64 roll~%float64 pitch~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <gimbal>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <gimbal>))
  "Converts a ROS message object to a list"
  (cl:list 'gimbal
    (cl:cons ':roll (roll msg))
    (cl:cons ':pitch (pitch msg))
))
