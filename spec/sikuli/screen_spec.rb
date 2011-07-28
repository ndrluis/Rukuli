require 'spec_helper'

describe Sikuli::Screen, 'when initialized' do
  subject { Sikuli::Screen.new }

  its(:x) { should == 0 }
  its(:y) { should == 0 }
  its(:width) { should == 1680 } # screen's resolution
  its(:height) { should == 1050 } # screen's resolution
end
