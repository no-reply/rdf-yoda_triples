# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rdf-yoda_triples"
  s.version     = '0.1.0.pre'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tom Johnson"]
  s.homepage    = 'https://github.com/no-reply/rdf-yoda_triples'
  s.email       = 'tom@dp.la'
  s.summary     = %q{An RDF serialization for Jedi.}
  s.description = %q{Object Subject Predicate, mmgh?}
  s.license     = "Unlicense"
  s.required_ruby_version     = '>= 1.9.3'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")

  s.add_dependency('rdf', '>= 1.1')
  s.add_development_dependency('pry')
end
