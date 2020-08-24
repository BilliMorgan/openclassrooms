require 'uri'
require_relative 'post'

class Route
  Routes = {
    "GET" => {
      "/garbatella" => :garbatella,
      "/testaccio" => :testaccio,
      "/eur" => :eur,
      "/new_article" => :new_article
    },
    "POST" => {
      "/new_article" => :user_article
    }
  }

  def initialize(env)
    http_method = env["REQUEST_METHOD"]
    path = env["PATH_INFO"]
    @name = Routes[http_method] && Routes[http_method][path]
     
    unless @name
      @name = :user_article if Post.exists?("#{path}".sub('/', ''))
    end
  end

  def name
    @name || "404"
  end
end