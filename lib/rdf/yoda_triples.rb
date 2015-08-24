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
      "%s %s %s mmgh?" % [object, subject, predicate].map { |value| format_term(value, options) }
    end
  end

  class Reader < RDF::NTriples::Reader
    def read_triple
      loop do
        readline.strip! # EOFError thrown on end of input
        line = @line    # for backtracking input in case of parse error

        begin
          unless blank? || read_comment
            object    = read_uriref || read_node || read_literal || fail_object
            subject   = read_uriref || read_node || fail_subject
            predicate = read_uriref(:intern => true) || fail_predicate

            if validate? && !read_eos
              raise RDF::ReaderError.new("ERROR [line #{lineno}] Expected end of statement (found: #{current_line.inspect})",
                                         lineno: lineno)
            end
            return [subject, predicate, object]
          end
        rescue RDF::ReaderError => e
          @line = line  # this allows #read_value to work
          raise e
        end
      end
    end
  end

  class Format < RDF::Format
    content_type     'application/y-triples', :extension => :yt, 
                     :alias => ['text/plain', 'application/prs.yoda-triples', 'application/prs.y-triples']
    content_encoding 'utf-8'

    reader { RDF::YodaTriples::Reader }
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
