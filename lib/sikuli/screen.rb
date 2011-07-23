class Screen < Region
  def initialize
    @java_obj = org.sikuli.script::Screen.new()
  end
end