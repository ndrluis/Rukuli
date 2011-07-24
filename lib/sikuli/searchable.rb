module Sikuli
  module Searchable  
    def find(filename, similarity = 0.9)
      begin
        pattern = org.sikuli.script::Pattern.new(filename).similar(similarity)
        Region.new(@java_obj.find(pattern))
      rescue
        raise "File Not Found: #{filename}"
      end
    end
    
    def exists?(filename, similarity = 0.9, time = 0.5)
      pattern = org.sikuli.script::Pattern.new(filename).similar(similarity)
      @java_obj.exists(pattern, time)
    end
  end
end