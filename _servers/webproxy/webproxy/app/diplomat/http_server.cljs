(ns webproxy.app.diplomat.http-server
  (:require [clojure.set :as set]
            [webproxy.app.config :as config]
            [webproxy.libs.common-pedestal.route :refer [expand-routes]]
            #_ [webproxy.libs.common-io.doc :as doc]))


(defn current-version
  []
  {:status 200 :body {:version (config/version)}})

(defn get-users
  []
  {:status 200 :body {:users [{:name "Mario Souto" :age 24}
                              {:name "Gamora" :age 3}]}})

(def default-routes
  #{["/api/version"
     :get (conj #_ (doc/desc "Current Version")
                current-version)
     :route-name :version]
    ["/api/users"
     :get (conj #_(doc/desc "Current Version")
           get-users)
     :route-name :get-users]})

(def routes
  (expand-routes
   (set/union default-routes)))