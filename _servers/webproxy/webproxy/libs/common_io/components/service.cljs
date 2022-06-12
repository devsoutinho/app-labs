(ns webproxy.libs.common-io.components.service
  (:require ["@tinyhttp/app" :as app]
            ["milliparsec" :as milliparsec]
            ["@tinyhttp/logger" :as logger]))

(def port js/process.env.PORT)
(prn (str "Setup port is: " port))

(def ^:private app (app/App.))

(defn ^:private parse-route
  [route]
  (let [path   (get route 0)
        method (get route 1)
        route-middlewares (mapv (fn [middleware] (middleware)) (get route 2))
        route-response (reduce conj route-middlewares)
        handler (fn [_req res]
                  (prn route-response)
                  (-> res
                      (.set "X-Powered-By" "DevSoutinho")
                      (.status (:status route-response))
                      (.send (clj->js (:body route-response))))
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
        #_#_#_
        (.post "/api/create" (fn [req res]
                               (js/console.log (aget req "body"))
                               (.send res (js/JSON.stringify (aget req "body")))))
        (.get "/" (fn [_req res]
                    (.send res "Hello World!!!")))
        (.get "/page/:page/" (fn [req res]
                               (-> res
                                   (.status 200)
                                   (.send
                                    (apply str [(str "<h1>" "What a cool page" "</h1>")
                                                (str "<h2>Path</h2>")
                                                (str "<pre>" (.-path req) "</pre>")
                                                (str "<h2>Params</h2>")
                                                (str "<pre>" (js/JSON.stringify (.-params req) nil 2) "</pre>")])))))
        (.listen port (fn [] (js/console.log (str "Listening on http://localhost:" port)))))))