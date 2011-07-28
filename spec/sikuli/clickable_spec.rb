require 'spec_helper'

describe Sikuli::Region, "#Clickable" do
  before(:all) do
    @region = setup_test_area
  end
  
  it "should perform a click at 10, 10" do
    lambda { @region.click(12, 12) }.should_not raise_error
  end
  
  it "should perform a double click 10, 1040" do 
    lambda { @region.doubleClick(12, 491) }.should_not raise_error
  end
  
  it "should perform a double click on an image" do
    lambda { @region.doubleClick("smiley_face.png") }.should_not raise_error
  end
  
  it "should perform a drag and drop" do
    lambda { @region.dragDrop(12, 12, 491, 491) }.should_not raise_error
  end

  it "should perform a click on an image" do
    lambda { @region.click("smiley_face.png") }.should_not raise_error
  end
  
  it "should not perform a click on an image that is outside of the region" do
    lambda { @region.click("apple.png")}.should raise_error
  end
end
