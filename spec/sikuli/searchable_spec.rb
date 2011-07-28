require 'spec_helper'

describe Sikuli::Region, "#Searchable" do
  before(:all) do
    @region = setup_test_area
  end

  it "should find an image within the region" do
    @region.find("smiley_face.png").should_not be_nil
  end

  it "should return a region containing the found image" do
    @region.find("smiley_face.png").should be_an_instance_of Sikuli::Region
  end

  it "should not find an image that is not in the region" do
    lambda { @region.find("apple.png") }.should raise_error
  end

  it "should return true if the image is found" do
    @region.exists?("smiley_face.png").should be_true
  end

  it "should allow you to call contains?" do
    @region.contains?("smiley_face.png").should be_true
  end

  it "should return false if the image is not found" do
    @region.exists?("apple.png").should be_false
  end
end
