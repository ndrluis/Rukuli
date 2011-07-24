require 'spec_helper'

describe Sikuli, "image path" do
  it "should retain a list of directories to search in for images" do
    Sikuli.getImagePath().should == []
  end
  
  it "should allow a path to be added" do
    Sikuli.addImagePath('/Users/images/')
    Sikuli.getImagePath().should == ['/Users/images/']
  end
  
  it "should allow logging to be turned off" do
    Sikuli.logging = false
    
    org.sikuli.script::Settings.InfoLogs.should be_false
    org.sikuli.script::Settings.ActionLogs.should be_false
    org.sikuli.script::Settings.DebugLogs.should be_false
  end
  
  it "should allow logging to be turned on" do
    Sikuli.logging = true
    
    org.sikuli.script::Settings.InfoLogs.should be_true
    org.sikuli.script::Settings.ActionLogs.should be_true
    org.sikuli.script::Settings.DebugLogs.should be_true
  end
end