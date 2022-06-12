module EncUrl
  module Encurtador
    
    def desencurtar(codigo)
      link = @db.execute <<-SQL
      SELECT link FROM links
      WHERE encurtado=\'#{codigo}\'
      SQL

      return link
    end
  end
end
