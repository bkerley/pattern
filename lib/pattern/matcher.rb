module Pattern
  class Matcher
    def match(*args, &block)
      @options << Entry.new(args, block)
    end
  end
end