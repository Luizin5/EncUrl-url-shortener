Dir["src/*.rb"].each { |mod| require_relative mod.gsub(".rb","") }

#module EncUrl
#  teste
#end

include EncUrl

#puts EncUrl::Encurtador.encurtar("youtube.com")

puts EncUrl::Encurtador.desencurtar("vghpyr")
