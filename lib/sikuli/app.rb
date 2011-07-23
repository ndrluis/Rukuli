module Sikuli
  class App
    def initialize(app_name)
      @java_obj = org.sikuli.script::App.new(app_name)
    end
  
    def focus
      @java_obj.focus()
    end
  
    def window
      Region.new(@java_obj.window())
    end
  end
end