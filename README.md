Yoda Triples
============

Object Subject Predicate, hmmmmmmmm? This way Yoda speaks: <http://en.wikipedia.org/wiki/Object%E2%80%93subject%E2%80%93verb#Fictitious_languages>.

Usage
-----

```ruby
graph = RDF::Graph.new
graph << RDF::Statement(RDF::URI('http://example.org/yoda'), RDF.type, RDF::URI('http://example.org/jedi'))
graph.dump :yodatriples
# => "<http://example.org/jedi> <http://example.org/yoda> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> .\n"
```

Yoda is a taciturn creature so extraneous description is stripped from the yodatriples output, notably rdfs:label and rdfs:comment

```ruby
graph = RDF::Graph.new
require 'rdf'
require 'rdf/yoda_triples'

graph = RDF::Graph.new
graph << RDF::Statement(RDF::URI('http://example.org/yoda'), RDF::RDFS.label, RDF::Literal('Yoda'))
graph << RDF::Statement(RDF::URI('http://example.org/yoda'), RDF::RDFS.comment, RDF::Literal('Yoda is a small and taciturn creature who speaks with object-subject-verb word order'))
graph << RDF::Statement(RDF::URI('http://example.org/yoda'), RDF::RDFS.member, RDF::URI('http://en.wikipedia.org/wiki/Galactic_Republic'))
graph.dump :yodatriples
# => "\n\n<http://en.wikipedia.org/wiki/Galactic_Republic> <http://example.org/yoda> <http://www.w3.org/2000/01/rdf-schema#member> .\n" 
```
