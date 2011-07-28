require 'spec_helper'

describe Sikuli::Region, "#Typeable" do
  before(:all) do
    app = Sikuli::App.new("TextEdit")
    app.focus
    @region = app.window
  end

  context "modifying text input with" do
    it "apple key" do
      @region.type("n", Sikuli::KEY_CMD)
    end

    it "shift key" do
      @region.type("this should be lower case")
      @region.type("this should be upper case", Sikuli::KEY_SHIFT)
    end
  end

  context "unicode characters" do
    it("backspace")   { @region.type(Sikuli::KEY_BACKSPACE * 50) }
    it("return")      { @region.type(Sikuli::KEY_RETURN) }
    it("left arrow")  { @region.type(Sikuli::LEFT_ARROW) }
    it("down arrow")  { @region.type(Sikuli::DOWN_ARROW) }
    it("right arrow") { @region.type(Sikuli::RIGHT_ARROW) }
  end
end
