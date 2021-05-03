
(cl:in-package :asdf)

(defsystem "storm_gimbal-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "gimbal" :depends-on ("_package_gimbal"))
    (:file "_package_gimbal" :depends-on ("_package"))
  ))