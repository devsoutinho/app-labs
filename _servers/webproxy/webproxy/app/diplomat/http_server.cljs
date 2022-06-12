(ns webproxy.app.diplomat.http-server
  (:require [clojure.set :as set]
            [webproxy.app.config :as config]
            [webproxy.libs.common-pedestal.route :refer [expand-routes]]
            [webproxy.libs.common-io.doc :as doc]
            #_ [webproxy.libs.schema.core :as s]
            [schema.core :as s :include-macros true]))


(s/set-fn-validation! true)
(s/validate {:a s/Int} {:a 1})

(defn current-version
  []
  {:status 200 :body {:version (config/version)}})

(defn get-users
  []
  {:status 200 :body {:users [{:name "Mario Souto" :age 24}
                              {:name "Gamora" :age 3}]}})

(def common-interceptors
  [])

; =============================================

(def default-routes
  #{["/"
     :get (conj common-interceptors
                (doc/desc "Current Version")
                (fn []
                  {:status 200 :body {:message "This is the entrypoint of my api. Check version in /api/version/"}}))
     :route-name :version]
    ["/api/version"
     :get (conj common-interceptors
                (doc/desc "Current Version")
                current-version)
     :route-name :version]
    ["/api/users"
     :get (conj common-interceptors
                (doc/desc "Current Version")
                get-users)
     :route-name :get-users]})

(def routes
  (expand-routes
   (set/union default-routes)))
