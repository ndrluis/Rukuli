module Sikuli
  module Searchable  
    def find(filename)
      Region.new(@java_obj.find(filename))
    end
  end
end