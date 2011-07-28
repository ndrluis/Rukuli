require 'spec_helper'

describe Sikuli::App do
  subject { Sikuli::App.new('Finder') }

  its(:window) { should be_an_instance_of Sikuli::Region }
end
