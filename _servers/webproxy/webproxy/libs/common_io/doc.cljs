(ns webproxy.libs.common-io.doc)

(defn doc
  "Returns a interceptor that describes the current route"
  [description-string]
  {:description description-string})