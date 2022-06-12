;; This script demonstrates use of tinyhttp with a logging middleware
(ns webproxy.core
  (:require ["@tinyhttp/app" :as app]
            ["milliparsec" :as milliparsec]
            ["@tinyhttp/logger" :as logger]))

(def app (app/App.))

(-> app
    (.use (logger/logger))
    (.use (milliparsec/json))
    (.post "/api/create" (fn [req res]
                           (js/console.log (aget req "body"))
                (.send res (js/JSON.stringify (aget req "body")))))
    (.get "/" (fn [_req res]
                (.send res "<h1>Hello world</h1>")))
    (.get "/page/:page/" (fn [req res]
                           (-> res
                               (.status 200)
                               (.send
                                (apply str [(str "<h1>" "What a cool page" "</h1>")
                                            (str "<h2>Path</h2>")
                                            (str "<pre>" (.-path req) "</pre>")
                                            (str "<h2>Params</h2>")
                                            (str "<pre>" (js/JSON.stringify (.-params req) nil 2) "</pre>")])))))
    (.listen 3000 (fn [] (js/console.log "Listening on http://localhost:3000"))))