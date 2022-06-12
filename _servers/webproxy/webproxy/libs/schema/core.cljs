(ns webproxy.libs.schema.core
  (:require [schema.core :as s
             :include-macros true ;; cljs only
             ]))

(def set-fn-validation! s/set-fn-validation!)
(def validate s/validate)

; Types
(def Int s/Int)
(def Str s/Str)