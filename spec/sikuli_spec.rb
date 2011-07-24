require 'spec_helper'

describe Sikuli, "image path" do
  it "should retain a list of directories to search in for images" do
    Sikuli.getImagePath().should == []
  end
  
  it "should allow a path to be added" do
    Sikuli.addImagePath('/Users/images/')
    Sikuli.getImagePath().should == ['/Users/images/']
  end
end