(ns webproxy.app_test.example-test
  (:require
   [cljs.test :as t :refer [async deftest is testing]]
   [promesa.core :as p]))

(deftest awesome-test
  (testing "one equals one"
    (is (= 1 1)))
  (testing "this test will fail"
    (is (= 2 2))))

(deftest awesome-async-test
  (async done
         #_{:clj-kondo/ignore [:unresolved-symbol]}
         (-> (p/let [x (p/delay 1000 :done)]
               (is (= :done x)))
             (p/finally done))))

;; print name of each test
(defmethod t/report [:cljs.test/default :begin-test-var] [m]
  (println "===" (-> m :var meta :name))
  (println))

;; run this function with: nbb -m example/run-tests
(defn run-tests []
  (t/run-tests 'webproxy.app_test.example-test))