module Pattern
  class Entry
    attr_reader :args, :block
    def initialize(args, block)
      @args = args
      @block = block
    end
    
    def match?(args)
      return false if @args.zip(args).detect do |a|
        !(a[0].is_a?(Wildcard)) && !(a[0] === a[1])
      end
      true
    end
  end
end
