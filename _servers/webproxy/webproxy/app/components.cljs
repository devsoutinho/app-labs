; components: Dependency injection and setup
(ns webproxy.app.components
  (:require [webproxy.app.diplomat.http-server :refer [routes]]
            [webproxy.libs.common-io.components.service :as service]))

(defn base []
  {:service (service/new-service routes)})

(defn create-and-start-system!
  []
  (base))