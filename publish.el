(require 'weblorg)


(setq github 1)

(if (eq github 1)
    (setq weblorg-default-url "https://robin2003.github.io")
  (setq weblorg-default-url "http://localhost:8000"))


;; website index
(weblorg-route
 :name "index"
 :input-pattern "posts/*.org"
 :input-aggregate #'weblorg-input-aggregate-all-desc
 :template "blog.html"
 :output "index.html"
 :url "/")

;; Generate blog posts
(weblorg-route
 :name "posts"
 :input-pattern "posts/*.org"
 :template "post.html"
 :output "blog/{{ slug }}.html"
 :url "/blog/{{ slug }}.html")

(weblorg-route
 :name "rss"
 :input-pattern "posts/*.org"
 :input-aggregate #'weblorg-input-aggregate-all-desc
 :template "rss.xml"
 :output "blog/rss.xml"
 :url "/blog/rss.xml")

(weblorg-export)
