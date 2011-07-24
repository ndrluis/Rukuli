# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sikuli/version"

Gem::Specification.new do |s|
  s.name        = "sikuli"
  s.version     = Sikuli::VERSION
  s.authors     = ["Chas Lemley"]
  s.email       = ["chas.lemley@gmail.com"]
  s.homepage    = "https://github.com/chaslemley/sikuli_ruby"
  s.summary     = %q{Ruby wrapper for Sikuli GUI automation library}
  s.description = %q{Sikuli allows you to interact with your application's user interface using image based search to automate user actions. Works on OSX only, Linux coming soon.}

  s.rubyforge_project = "sikuli"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
