# The Clickable module defines interaction with the mouse. It is included in
# the Region class.
#
module Sikuli
  module Clickable

    # Public: Performs a single click on an image match or point (x, y)
    #
    # args - String representing filename of image to find and click
    # args - Fixnum, Fixnum representing x and y coordinates within
    # a Region (0,0) is the top left
    #
    # Examples
    #
    #   region.click('smile.png')
    #   region.click(123, 432)
    #
    # Returns nothing
    def click(*args)
      case args.length
        when 1 then click_image(args[0])
        when 2 then click_point(args[0], args[1])
        else raise ArgumentError
      end
    end

    # Public: Performs a double click on an image match or point (x, y)
    #
    # args - String representing filename of image to find and click
    # args - Fixnum, Fixnum representing x and y coordinates within
    # a Region (0,0) is the top left
    #
    # Examples
    #
    #   region.double_click('smile.png')
    #   region.double_click(123, 432)
    #
    # Returns nothing
    def double_click(*args)
      case args.length
        when 1 then click_image(args[0], true)
        when 2 then click_point(args[0], args[1], true)
        else raise ArgumentError
      end
    end

    # Public: Performs a mouse down, drag, and mouse up
    #
    # start_x - Fixnum representing the x of the mouse down
    # start_y - Fixnum representing the y of the mouse down
    # end_x   - Fixnum representing the x of the mouse up
    # end_y   - Fixnum representing the y of the mouse up
    #
    # Examples
    #
    #   region.drag_drop(20, 12, 23, 44)
    #
    # Returns nothing
    def drag_drop(start_x, start_y, end_x, end_y)
      @java_obj.dragDrop(
        org.sikuli.script::Location.new(start_x, start_y).offset(x(), y()),
        org.sikuli.script::Location.new(end_x, end_y).offset(x(), y()),
        0
      )
    end

    private

    # Private: clicks on a matched Region based on an image based search
    #
    # filename - A String representation of the filename of the region to
    # match against
    # is_double - (optional) Boolean determining if should be a double click
    #
    # Returns nothing
    #
    # Throws Sikuli::FileNotFound if the file could not be found on the system
    # Throws Sikuli::ImageNotMatched if no matches are found within the region
    def click_image(filename, is_double = false)
      begin
        if is_double
          @java_obj.doubleClick(filename, 0)
        else
          @java_obj.click(filename, 0)
        end
      rescue NativeException => e
        raise_exception e, filename
      end
    end

    # Private: clicks on a point relative to a Region's top left corner
    #
    # x         - a Fixnum representing the x component of the point to click
    # y         - a Fixnum representing the y component of the point to click
    # is_double - (optional) Boolean determining if should be a double click
    #
    # Returns nothing
    #
    # Throws Sikuli::FileNotFound if the file could not be found on the system
    # Throws Sikuli::ImageNotMatched if no matches are found within the region
    def click_point(x, y, is_double = false)
      if is_double
        @java_obj.doubleClick(org.sikuli.script::Location.new(x, y).offset(x(), y()), 0)
      else
        @java_obj.click(org.sikuli.script::Location.new(x, y).offset(x(), y()), 0)
      end
    end
  end
end
