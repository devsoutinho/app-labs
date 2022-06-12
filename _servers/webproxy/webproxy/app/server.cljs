; server: Start up point of the system
(ns webproxy.app.server
  (:require [webproxy.app.components :as components]))

(def -main (components/create-and-start-system!))