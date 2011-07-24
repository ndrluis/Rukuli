module Sikuli
  module Searchable  
    def find(filename, within = 0.9)
      begin
        pattern = org.sikuli.script::Pattern.new(filename).similar(within)
        Region.new(@java_obj.find(pattern))
      rescue
        raise "File Not Found: #{filename}"
      end
    end
    
    def exists?(filename, within = 0.9, time = 0.5)
      pattern = org.sikuli.script::Pattern.new(filename).similar(within)
      @java_obj.exists(pattern, time)
    end
  end
end