{:user {:dependencies [
                       [org.clojars.gjahad/debug-repl "0.3.3"]
                       [jonase/eastwood "0.2.1" :exclusions  [org.clojure/clojure]]
                       ]
        :injections [(use '[clojure.pprint :only [pp pprint]])
                     (use 'alex-and-georges.debug-repl)]
        :plugins [
                  [lein-ancient "0.6.7"]
                  [lein-cljfmt "0.3.0"]
                  [lein-kibit "0.1.2"]
                  ]}}
