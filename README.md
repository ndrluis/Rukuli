Sikuli Ruby
===========

[Sikuli](http://sikuli.org/) allows you to interact with your application's user interface using image based search to automate user actions.

Requirements
------------

* JRuby `rvm install jruby`
* [Sikuli X 1.0rc2](http://sikuli.org/)
* OSX

Compatibility
------------
It's recommended to use JRuby ~> 1.6.0 and run it in 1.9 mode to get unicode characters working
as expected.
```
export JRUBY_OPTS=--1.9
```

Installation
------------

    gem install sikuli
    
Usage
-----
    
    require 'java'
    require 'sikuli'
    
    Sikuli::Config.run do |config| 
      config.image_path = "#{Dir.pwd}/images/"
      config.logging = false
    end
    
    screen = Sikuli::Screen.new
    screen.click(10, 10) # should open your apple menu
    
    app = Sikuli::App.new("iPhone Simulator")
    app.window.click('ui_element.png') if app.window.exists?('ui_element.png')
    
Examples
--------

* [Cucumber Suite](https://github.com/chaslemley/cucumber_sikuli)
