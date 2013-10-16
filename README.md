Rukuli
======

This project is a fork of [sikuli_ruby](https://github.com/chaslemley/sikuli_ruby)!

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
    app.window.click('ui_element.png') if app.window.find('ui_element.png')
    
Running the test suite
----------------------

1. You need to open `test_area.jpg` in **Preview** from `spec/support/images/` directory
before running tests.
2. You also need to open the **TextEdit** app

Examples
--------

* [Cucumber Suite](https://github.com/chaslemley/cucumber_sikuli)

License
-------

Copyright (c) 2013 Chas Lemley

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
