module Clickable
  # (int, int) -> Click location x, y relative to top left corner of region
  # (string) -> Click on matching image
  def click(x, y)
    @java_obj.click(org.sikuli.script::Location.new(x, y).offset(x(), y()), 0)
  end
  
  def doubleClick(x, y)
    @java_obj.doubleClick(org.sikuli.script::Location.new(x, y).offset(x(), y()), 0)
  end
  
  def dragDrop(start_x, start_y, end_x, end_y)
    raise "NOT YET IMPLEMENTED"
  end
end