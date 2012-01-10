Sikuli Ruby
===========

[Sikuli](http://sikuli.org/) allows you to interact with your application's user interface using image based search to automate user actions.

Requirements
------------

* [JRuby](http://jruby.org/download) or `rvm install jruby`
* [Sikuli X 1.0rc3](http://sikuli.org/)

Compatibility
-------------
It's recommended to use JRuby ~> 1.6.0 and run it in 1.9 mode to get unicode characters working as expected.

```
export JRUBY_OPTS=--1.9
```

On Windows or Linux make sure to set SIKULI_HOME to the Sikuli installation directory and to add the Sikuli installation directory and Sikuli libs directory to the include path.

```
export SIKULI_HOME="~/bin/Sikuli-X-1.0rc3/Sikuli-IDE/"
PATH="${PATH}:~/bin/Sikuli-X-1.0rc3/Sikuli-IDE/:~/bin/Sikuli-X-1.0rc3/Sikuli-IDE/libs/"
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
    
Running the test suite
----------------------

1. You need to open `test_area.jpg` in **Preview** from `spec/support/images/` directory
before running tests.
2. You also need to open the **TextEdit** app

Examples
--------

* [Cucumber Suite](https://github.com/chaslemley/cucumber_sikuli)
