# The Sikuli::Searchable module is the heart of Sikuli. It defines the
# wrapper around Sikuli's on screen image searching and matching capability
# It is implemented by the Region class.
#
module Sikuli
  module Searchable

    # Public: search for an image within a Region
    #
    # filename   - A String representation of the filename to match against
    # similarity - A Float between 0 and 1 representing the threshold for
    # matching an image. Passing 1 corresponds to a 100% pixel for pixel
    # match. Defaults to 0.9 (90% match)
    #
    # Examples
    #
    #   region.find('needle.png')
    #   region.find('needle.png', 0.5)
    #
    # Returns an instance of Region representing the best match
    #
    # Throws Sikuli::FileNotFound if the file could not be found on the system
    # Throws Sikuli::ImageNotMatched if no matches are found within the region
    def find(filename, similarity = 0.9)
      begin
        pattern = build_pattern(filename, similarity)
        region = Region.new(@java_obj.find(pattern))
        region.highlight if Sikuli::Config.highlight_on_find
        return region
      rescue NativeException => e
        raise_exception e, filename
      end
    end

    # Public: search for an image within a Region and return all matches
    #
    # TODO: Sort return results so they are always returned in the same order
    # (top left to bottom right)
    #
    # filename   - A String representation of the filename to match against
    # similarity - A Float between 0 and 1 representing the threshold for
    # matching an image. Passing 1 corresponds to a 100% pixel for pixel
    # match. Defaults to 0.9 (90% match)
    #
    # Examples
    #
    #   region.find_all('needle.png')
    #   region.find_all('needle.png', 0.5)
    #
    # Returns an array of Region objects that match the given file and
    # threshold
    #
    # Throws Sikuli::FileNotFound if the file could not be found on the system
    # Throws Sikuli::ImageNotMatched if no matches are found within the region
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
      rescue NativeException => e
        raise_exception e, filename
      end
    end

    # Public: check if an image is matched within a Region
    #
    # filename   - A String representation of the filename to match against
    # similarity - A Float between 0 and 1 representing the threshold for
    # matching an image. Passing 1 corresponds to a 100% pixel for pixel
    # match. Defaults to 0.9 (90% match)
    # time       - time in seconds to search before returning false
    #
    # Examples
    #
    #   region.exists?('needle.png')
    #   region.exists?('needle.png', 0.5)
    #   region.exists?('needle.png', 0.5, 3)
    #
    # Returns a Boolean (true if match found, false if not)
    def exists?(filename, similarity = 0.9, time = 0.5)
      pattern = build_pattern(filename, similarity)
      @java_obj.exists(pattern, time)
    end

    # Public: alias for exists?
    #
    # Returns a Boolean (true if match found, false if not)
    alias_method :contains?, :exists?

    private

    # Private: builds a java Pattern to check
    #
    # filename   - A String representation of the filename to match against
    # similarity - A Float between 0 and 1 representing the threshold for
    # matching an image. Passing 1 corresponds to a 100% pixel for pixel
    # match. Defaults to 0.9 (90% match)
    #
    # Returns a org.sikuli.script::Pattern object to match against
    def build_pattern(filename, similarity)
      org.sikuli.script::Pattern.new(filename).similar(similarity)
    end

    # Private: interpret a java NativeException and raises a more descriptive
    # exception
    #
    # exception - The original java exception thrown by the sikuli java_obj
    # filename  - A string representing the filename to include in the
    # exception message
    #
    # Returns nothing
    def raise_exception(exception, filename)
      if exception.message == "org.sikuli.script.FindFailed: File null not exists"
        raise Sikuli::FileDoesNotExist, "The file '#{filename}' does not exist."
      else
        raise Sikuli::ImageNotFound, "The image '#{filename}' did not match in this region."
      end
    end
  end
end