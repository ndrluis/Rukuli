require 'java'

require 'rspec'
require 'sikuli'

def setup_test_area
  screen = Sikuli::Screen.new
  app = Sikuli::App.new('Preview')
  app.focus()
  center = screen.find("#{Dir.pwd}/spec/support/images/smiley_face.png")
  
  test_area = Sikuli::Region.new(center.x - 212, center.y - 212, 503, 503)
  test_area.highlight
 
  test_area
end