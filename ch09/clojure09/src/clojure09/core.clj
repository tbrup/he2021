(ns clojure09.core
  (:gen-class))


(use 'clj-message-digest.core)
(use 'pandect.algo.sha256)

(defn ok
  "check if we get an decaf c01a for integer i"
  [i]
  (def s (str (str i) " Cola Decaf"))
  (def h (sha256 s))
  (if (some? (re-find #"c01a" h))
    (if (some? (re-find #"decaf" h))
      (println (str "found match for " s "\n" h))
      )))


(defn -main
  "My first main function"
  []
  (def h (sha-256-hex "11865457 Vanilla Cafe")) 
  (println h)
  (loop [i 10000000]
    (if (= (mod i 1000000) 0)
      (println i))
    (ok i)
     (if (< i 100000000)
       (recur (inc i)))))
