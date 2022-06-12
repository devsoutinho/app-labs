(ns webproxy.libs.common-io.components.service
  (:require ["@tinyhttp/app" :as app]
            ["milliparsec" :as milliparsec]
            ["@tinyhttp/logger" :as logger]))

(def port (if js/process.env.PORT 
            js/process.env.PORT
            3000))
(prn (str "Setup port is: " port))

(def ^:private app (app/App.))

(defn ^:private parse-route
  [route]
  (let [path   (get route 0)
        method (get route 1)
        handler (fn [_req res]
                  (let [route-middlewares (mapv (fn [middleware] (middleware)) (get route 2))
                        route-response (reduce conj route-middlewares)]
                    (prn route-response)
                    (-> res
                        (.set "X-Powered-By" "DevSoutinho")
                        (.status (:status route-response))
                        (.send (clj->js (:body route-response)))))
                  res)]
    {:path path
     :method method
     :handler handler}))

(defn new-service
  [routes]
  (let [routes-arr (into [] (map parse-route routes))]
    (-> app
        (.use (logger/logger))
        (.use (milliparsec/json))
        ((fn [app] 
           (let [methods {:get (aget app "get")
                          :post (aget app "post")
                          :delete (aget app "delete")
                          :put (aget app "put")}]
             (mapv (fn [route] (let [{:keys [path
                                             method 
                                             handler]} route]
                                 ((method methods) path handler))) routes-arr)
             app)))
        (.listen port (fn [] (js/console.log (str "Listening on http://localhost:" port)))))))