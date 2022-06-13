(ns webproxy.app.controllers.app-screenshots
  {:clj-kondo/config '{:lint-as {promesa.core/let clojure.core/let
                                 example/defp clojure.core/def}}}
  (:require    ["puppeteer$default" :as puppeteer]
               [promesa.core :as p]))

(def ^:private base_app_url "https://app.mariosouto.com")
(def ^:private routes [{:path "/" :name "home"}
                       {:path "/apps/magic_counter/" :name "magic_counter"}
                       {:path "/apps/any-not-found-page/" :name "not_found"}])

(def ^:private sizes [{:name "iphone-6_5" :resolution "1242x2688" :width 414 :height 896 :deviceScaleFactor 3}
                      {:name "iphone-5_5" :resolution "1242x2208" :width 414 :height 736 :deviceScaleFactor 3}
                      {:name "ipadpro3-12_9" :resolution "2048x2732" :width 1024 :height 1366 :deviceScaleFactor 2}])

(def counter 0)

(defn get-screenshots
  []
  (mapv (fn [size]
          (mapv (fn [route]
                  (p/let [browser (.launch puppeteer #js {:headless true})
                          page (.newPage browser)
                          _ (.goto page (str base_app_url (:path route)))
                          _ (.setViewport page #js {:width (:width size)
                                                    :height (:height size)
                                                    :deviceScaleFactor (:deviceScaleFactor size)})
                          _ (.waitForTimeout page (* 10 1000))
                          _ (-> (.screenshot page #js {:path (str "../../_assets/screens/" (:resolution size) "_" (:name size) "_" (:name route) "_app.png")})
                                (.catch #(js/console.log %)))]
                    (.close browser))) routes)) sizes)
  {:status 200 :body {:message "I will take a screenshot for you!"}})