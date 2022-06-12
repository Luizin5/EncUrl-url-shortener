require "sqlite3"

module EncUrl
  extend self

  $chars = []
  for i in 97..122 do
    $chars << i.chr
  end
  $chars.join.delete! "^a-zA-Z0-9"

  module Encurtador
    include SQLite3
    extend self

    @db = SQLite3::Database.new("db/db.db")

    def encurtar(link)

      encurtado = $chars.sample(6).join("")

      @db.execute <<-SQL
      INSERT INTO links
      VALUES (
        \'#{"https://"+link if !link.start_with?("https://","http://") }\',\'#{encurtado}\'
      );
      SQL

      return "Seu link foi encurtado: #{encurtado}"
    end
  end
end
