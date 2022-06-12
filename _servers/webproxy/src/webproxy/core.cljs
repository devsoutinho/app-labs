(ns webproxy.core
  (:require [deps]
            [schema.core :as s :include-macros false]))

(s/validate s/Num 42)

(prn "Helloo")