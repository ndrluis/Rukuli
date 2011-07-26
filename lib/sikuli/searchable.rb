module Sikuli
  module Searchable  
    def find(filename, similarity = 0.9)
      begin
        pattern = org.sikuli.script::Pattern.new(filename).similar(similarity)
        region = Region.new(@java_obj.find(pattern))
        region.highlight if Sikuli::Config.highlight_on_find
        return region
      rescue
        raise "File Not Found: #{filename}"
      end
    end
    
    def exists?(filename, similarity = 0.9, time = 0.5)
      pattern = org.sikuli.script::Pattern.new(filename).similar(similarity)
      @java_obj.exists(pattern, time)
    end
    alias_method :contains?, :exists?
  end
end