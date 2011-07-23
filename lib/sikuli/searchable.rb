module Sikuli
  module Searchable  
    def find(filename, within = 0.7)
      begin
        pattern = org.sikuli.script::Pattern.new(filename).similar(within)
        Region.new(@java_obj.find(pattern))
      rescue
        raise "File Not Found: #{filename}"
      end
    end
    
    def exists?(filename, time = 0.5)
      @java_obj.exists(filename, time)
    end
  end
end