require "sinatra"
Dir["src/*.rb"].each { |mod| require_relative mod.gsub(".rb","")}

link = ""

get "/encurtar" do
  erb :encurtar, :layout => :layout, :locals => {:encurtado => link}
end

post "/encurtarpost" do
  link = EncUrl::Encurtador.encurtar params["link"]
  redirect "encurtar"
end

get "/:url" do
  redirect "#{EncUrl::Encurtador.desencurtar(params[:url]).join("")}"
end
