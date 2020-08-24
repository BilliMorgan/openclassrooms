class Authentication < Rack::Auth::Basic
  def call(env)
    if (env['REQUEST_METHOD'] == 'POST') || (env['PATH_INFO'] =~ /new_article/)
      super
    else
      @app.call(env)
    end
  end
end