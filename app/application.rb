class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      if @@items.include?(search_term)
        resp.write "#{search_term} is one of our items"
      else
        resp.write "Couldn't find #{search_term}"
      end
    resp.finish
  end

end
