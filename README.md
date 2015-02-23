Yoda Triples
=============
Subject Object Predicate, hmmmmmmmm?

Usage
------

```ruby
graph = RDF::Graph.new
graph << RDF::Statement(RDF::URI('http://example.org/yoda'), RDF.type, RDF::URI('http://example.org/jedi'))
graph.dump :yodatriples
# => "<http://example.org/yoda> <http://example.org/jedi> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> .\n"
```
