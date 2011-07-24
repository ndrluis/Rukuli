require "sikuli/sikuli-script.jar"
require "sikuli/version"

require "sikuli/app"
require "sikuli/region"
require "sikuli/screen"

module Sikuli
  def self.getImagePath
    paths = java.lang.System.getProperty("SIKULI_IMAGE_PATH") || ""
    paths.split(":")
  end
  
  def self.addImagePath(path)
    paths = self.getImagePath
    paths << path
    
    java.lang.System.setProperty("SIKULI_IMAGE_PATH", paths.join(':'))
  end
  
  def self.logging=(boolean)
    return unless [TrueClass, FalseClass].include? boolean.class
    org.sikuli.script::Settings.InfoLogs = boolean
    org.sikuli.script::Settings.ActionLogs = boolean
    org.sikuli.script::Settings.DebugLogs = boolean
  end
end