Sikuli Ruby
===========

[Sikuli](http://sikuli.org/) allows you to interact with your application's user interface using image based search to automate user actions.

Requirements
------------

* JRuby (rvm install jruby)
* [Sikuli X 1.0rc2](http://sikuli.org/)
* OSX

Installation
------------

    gem install sikuli
    
Usage
-----
    
    require 'java'
    require 'sikuli'
    
    Sikuli.addImagePath("#{Dir.pwd}/images/")
    
    screen = Sikuli::Screen.new
    screen.click(10, 10) # should open your apple menu
    
    app = Sikuli::App.new("iPhone Simulator")
    app.window.click('ui_element.png') if app.window.exists?('ui_element.png')
    
Examples
--------

*[Cucumber Suite](https://github.com/chaslemley/cucumber_sikuli)
