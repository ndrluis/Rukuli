module Sikuli
  module Searchable
    def find(filename, similarity = 0.9)
      begin
        pattern = build_pattern(filename, similarity)
        region = Region.new(@java_obj.find(pattern))
        region.highlight if Sikuli::Config.highlight_on_find
        return region
      rescue
        raise "File Not Found: #{filename}"
      end
    end

    def find_all(filename, similarity = 0.9)
      begin
        pattern = build_pattern(filename, similarity)
        matches = @java_obj.findAll(pattern)
        regions = matches.collect do |r|
          match = Region.new(r)
          match.highlight if Sikuli::Config.highlight_on_find
          match
        end
        return regions
      rescue
        raise "File Not Found: #{filename}"
      end
    end

    def exists?(filename, similarity = 0.9, time = 0.5)
      pattern = build_pattern(filename, similarity)
      @java_obj.exists(pattern, time)
    end
    alias_method :contains?, :exists?

    private

    def build_pattern(filename, similarity)
      org.sikuli.script::Pattern.new(filename).similar(similarity)
    end
  end
end