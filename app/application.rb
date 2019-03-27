class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last #turn path into item name
      item = @@items.find{|item| item.name == item}


      search_term = req.params["item"]

      if @@items.include?(search_term)
        resp.write "#{search_term.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
