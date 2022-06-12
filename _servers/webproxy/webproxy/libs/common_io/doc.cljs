(ns webproxy.libs.common-io.doc)

(defn desc
  "Returns a interceptor that describes the current route"
  [description-string]
  (fn [] {:description description-string}))