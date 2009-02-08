module Pattern
  class Matcher
    def initialize
      @options = []
    end
    
    def match(*args, &block)
      @options << Entry.new(args, block)
    end
    
    def [](*args)
      selected = @options.detect{|o|o.match?(args)}
      selected.block[*args] if selected
    end
    
    def available
      @options.map{|o|o.args}
    end
  end
end