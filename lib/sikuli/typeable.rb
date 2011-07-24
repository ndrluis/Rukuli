module Sikuli
  module Typeable
    def type(text)
      @java_obj.type(nil, text, 0)
    end
  end
end