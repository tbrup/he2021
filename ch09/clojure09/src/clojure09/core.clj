(ns clojure09.core
  (:gen-class))

(use 'clj-message-digest.core)


(defn -main
  ((def h (sha-256-hex "11865457 Vanilla Cafe")) 
  (println h)))
