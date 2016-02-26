Yoda Triples
============

Object Subject Predicate, mmgh?

This way Yoda speaks: <http://en.wikipedia.org/wiki/Object%E2%80%93subject%E2%80%93verb#Fictitious_languages>.

Usage
-----

```ruby
graph = RDF::Graph.new
graph << RDF::Statement(RDF::URI('http://example.org/yoda'), RDF.type, RDF::URI('http://example.org/jedi'))
graph.dump :yodatriples
# => "<http://example.org/jedi> <http://example.org/yoda> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> mmgh?\n"

reader = RDF::Reader.for(:yodatriples)
reader.new(graph.dump(:yodatriples)).each_statement do |statement|
  puts statement.inspect
end
```

Specification
--------------

For more information, see the [RDF 1.1 Y-Triples](http://azaroth42.github.io/rdflib-ytriples/docs/) draft specification.

License
------

This is free and unencumbered public domain software. For more information, see <http://unlicense.org/> or the accompanying [UNLICENSE](UNLICENSE) file.