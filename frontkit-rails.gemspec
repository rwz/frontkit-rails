# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'frontkit-rails/version'

Gem::Specification.new do |s|
  s.name        = 'frontkit-rails'
  s.version     = FrontKit::VERSION
  s.authors     = ['Pavel Pravosud']
  s.email       = ['rwz@duckroll.ru']
  s.homepage    = ''
  s.summary     = %q{Bunch of rails/js helpers.}
  s.description = %q{Bunch of rails/js helpers packed in asset pipeline friendly engine.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  # specify any dependencies here; for example:
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'execjs'
  s.add_runtime_dependency 'railties', '>= 3.1.0'
  s.add_runtime_dependency 'sprockets'
  s.add_runtime_dependency 'multi_json'
end
