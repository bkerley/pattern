module Pattern
  class Entry
    attr_reader :args
    def initialize(args, block)
      @args = args
      @block = block
    end
    
    def match?(args)
      return false if args.zip(@args).detect do |a|
        !(a[1].is_a?(Wildcard)) && !(a[0] === a[1])
      end
      
      @block[*args]
    end
  end
end
