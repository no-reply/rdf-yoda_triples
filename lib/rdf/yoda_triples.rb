require 'rdf'

module RDF::YodaTriples
  def self.way_of_the_force
    <<EOM
< If you choose the quick and easy path as
Vader did - you will become an agent of evil. >
        \
         \         ____
          \     _.' :  `._
            .-.'`.  ;   .'`.-.
   __      / : ___ ;  /___ ;  \      __
 ,'_ ""--.:__;".-.";: :".-.":__;.--"" _`,
 :' `.t""--.. '<@.`;_  ',@>` ..--""j.' `;
      `:-.._J '-.-'L__ `-- ' L_..-;'
        "-.__ ;  .-"  "-.  : __.-"
            L ' /.------. ' J
             "-.   "--"   .-"
            __.l"-:_JL_;-";.__
         .-j/'.;  ;""""  / .'"-.
EOM
  end

  puts way_of_the_force

  class Writer < RDF::NTriples::Writer
    def format_triple(subject, predicate, object, options = {})
      if ( predicate == RDF::RDFS.label or
           predicate == RDF::RDFS.comment )
        ""
      else
        "%s %s %s mmgh?" % [object, subject, predicate].map { |value| format_term(value, options) }
      end
  end
  end

  class Format < RDF::Format
    content_type     'application/prs.yoda-triples', :extension => :yt, :alias => ['text/plain', 'application/prs.y-triples']
    content_encoding 'utf-8'

    # reader { RDF::YodaTriples::Reader }
    writer { RDF::YodaTriples::Writer }

    def self.detect(sample)
      !!sample.match(%r(
        (?:(?:<[^>]*>) | (?:_:\w+) | (?:"[^"\n]*"(?:^^|@\S+)?)) # Object
        \s*
        (?:(?:<[^>]*>) | (?:_:\w+))                             # Subject
        \s*
        (?:<[^>]*>)                                             # Predicate
        \s*mmgh?
      )x)
    end

    # Human readable name for this format
    def self.name; "Yoda Triples"; end
  end
end
