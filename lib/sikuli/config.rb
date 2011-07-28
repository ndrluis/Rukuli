module Sikuli
  class Config
    class << self
      attr_accessor :highlight_on_find

      def image_path
        java.lang.System.getProperty("SIKULI_IMAGE_PATH")
      end

      def image_path=(path)
        java.lang.System.setProperty("SIKULI_IMAGE_PATH", path)
      end

      def logging=(boolean)
        return unless [TrueClass, FalseClass].include? boolean.class
        org.sikuli.script::Settings.InfoLogs = boolean
        org.sikuli.script::Settings.ActionLogs = boolean
        org.sikuli.script::Settings.DebugLogs = boolean
      end

      def run(*args)
        if block_given?
          yield self
        end
      end

    end
  end
end
