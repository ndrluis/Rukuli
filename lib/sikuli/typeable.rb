module Sikuli
  module Typeable
    def type(text, modifier = 0)
      @java_obj.type(nil, text, modifier)
    end
  end
end