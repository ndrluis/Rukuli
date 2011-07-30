# A Region represents a rectangle on screen. Regions are the main point of
# interaction for Sikuli actions. Regions can receive actions from the mouse,
# keyboard, and image search.
#
require "sikuli/clickable"
require "sikuli/typeable"
require "sikuli/searchable"

module Sikuli
  class Region
    include Clickable
    include Typeable
    include Searchable

    # Public: creates a new Region object
    #
    # args - Array representing x (left bound), y (top), width, height
    #        4 Fixnums left, top, width, height
    #        An instance of an org.sikuli.script::Region
    #
    #   Examples
    #
    #     Region.new([10, 10, 200, 300])
    #     Region.new(10, 10, 200, 300)
    #     Region.new(another_region)
    #
    # Returns the newly initialized object
    def initialize(*args)
      @java_obj = org.sikuli.script::Region.new(*args)
    end

    # Public: highlight the region with a ~ 5 pixel red border
    #
    # seconds - Fixnum length of time to show border
    #
    # Returns nothing
    def highlight(seconds = 1)
      @java_obj.highlight(seconds)
    end

    # Public: the x component of the top, left corner of the Region
    def x
      @java_obj.x()
    end

    # Public: the y component of the top, left corner of the Region
    def y
      @java_obj.y()
    end

    # Public: the width in pixels of the Region
    def width
      @java_obj.w()
    end

    # Public: the height in pixels of the Region
    def height
      @java_obj.h()
    end
  end
end
