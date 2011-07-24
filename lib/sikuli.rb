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
end