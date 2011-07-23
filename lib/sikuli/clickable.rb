module Sikuli
  module Clickable
    def click(*args)
      case args.length
        when 1 then click_image(args[0])
        when 2 then click_point(args[0], args[1])
        else raise ArgumentError
      end
    end

    def doubleClick(x, y)
      @java_obj.doubleClick(org.sikuli.script::Location.new(x, y).offset(x(), y()), 0)
    end
  
    def dragDrop(start_x, start_y, end_x, end_y)
      @java_obj.dragDrop(
        org.sikuli.script::Location.new(start_x, start_y).offset(x(), y()),
        org.sikuli.script::Location.new(end_x, end_y).offset(x(), y()),
        0
      )
    end
    
    private
    
    def click_image(filename)      
      begin
        @java_obj.click(filename, 0)
      rescue
        raise RuntimeError, "File Not Found: #{filename}"
      end
    end
    
    def click_point(x, y)
      @java_obj.click(org.sikuli.script::Location.new(x, y).offset(x(), y()), 0)
    end
  end
end