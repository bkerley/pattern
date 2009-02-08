require 'shoulda'
require 'mocha'
require File.join(File.dirname(__FILE__), '../lib/pattern')

class PatternTest < Test::Unit::TestCase
  include Pattern
  should 'create a pattern' do
    p = Matcher.new
    p.match(wc) do
    end
    assert p.available.first.first.is_a? Wildcard
  end
  
  should 'not blindly match' do
    p = Matcher.new
    p.match(0) do
      assert false
    end
    p[1]
  end
  
  should 'run some pattern' do
    magazine = mock()
    magazine.expects(:ripoutallthepages).once
    p = Matcher.new
    p.match(0) do
      magazine.ripoutallthepages
    end
    p[0]
  end
  
  should 'support wildcards' do
    magazine = mock()
    magazine.expects(:ripoutallthepages).once
    p = Matcher.new
    p.match(wc) do
      magazine.ripoutallthepages
    end
    p[0]
  end
end