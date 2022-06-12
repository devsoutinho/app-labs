(ns webproxy.libs.common-io.components.service
  (:require ["@tinyhttp/app" :as app]
            ["milliparsec" :as milliparsec]
            ["@tinyhttp/logger" :as logger]))

(def ^:private app (app/App.))

(defn new-service
  [routes]
  ; TODO: Give a way to extract stuff from here
  (prn (count routes)) 
  (prn routes)

  (-> app
      (.use (logger/logger))
      (.use (milliparsec/json))
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
      (.listen 3000 (fn [] (js/console.log "Listening on http://localhost:3000")))))