class Region
  include Clickable
  include Typeable
  
  def initialize(args)
    @java_obj = org.sikuli.script::Region.new(*args)
  end
  
  def highlight(seconds = 1)
    @java_obj.highlight(seconds)
  end
  
  def x
    @java_obj.x()
  end
  
  def y
    @java_obj.y()
  end
  
  def width
    @java_obj.w()
  end
  
  def height
    @java_obj.h()
  end
end