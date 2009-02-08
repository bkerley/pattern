module Pattern
  class Matcher
    def initialize
      @options = []
    end
    
    def match(*args, &block)
      @options << Entry.new(args, block)
    end
    
    def [](*args)
      @options.detect{|o|o.match?(*args)}
    end
  end
end