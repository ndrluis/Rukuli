require 'spec_helper'

describe Sikuli::Region, 'when initialized with a rectangle' do
  subject { Sikuli::Region.new(10, 15, 250, 400) }
  its(:x) { should == 10 }
  its(:y) { should == 15 }
  its(:width) { should == 250 }
  its(:height) { should == 400 }
end

describe Sikuli::Region, 'when initialzed with a sikuli region' do
  subject { Sikuli::Region.new org.sikuli.script::Region.new(11, 16, 251, 401) }
  its(:x) { should == 11 }
  its(:y) { should == 16 }
  its(:width) { should == 251 }
  its(:height) { should == 401 }
end

describe Sikuli::Region, "#Clickable" do
  before(:all) do
    #open the file 'test_area.jpg' in Preview at zoom level 0
    @region = setup_test_area
  end
  
  it "should perform a click at 10, 10" do
    lambda { @region.click(12, 12) }.should_not raise_error
  end
  
  it "should perform a double click 10, 1040" do 
    lambda { @region.doubleClick(12, 491) }.should_not raise_error
  end
  
  it "should perform a drag and drop" do
    lambda { @region.dragDrop(12, 12, 491, 491) }.should_not raise_error
  end

  it "should perform a click on an image" do
    lambda { @region.click("#{Dir.pwd}/spec/support/images/smiley_face.png") }.should_not raise_error
  end
  
  it "should not perform a click on an image that is outside of the region" do
    lambda { @region.click("#{Dir.pwd}/apple.png")}.should raise_error RuntimeError
  end
  
  it "should not perform a click on an image that does not exist" do
    lambda { @region.click("#{Dir.pwd}/missing.png")}.should raise_error RuntimeError
  end
end