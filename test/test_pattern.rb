require 'shoulda'
require 'mocha'
require File.join(File.dirname(__FILE__), '../lib/pattern')

class PatternTest < Test::Unit::TestCase
  should 'run some pattern' do
    magazine = mock()
    magazine.expects(:ripoutallthepages).once
    p = Pattern::Matcher.new
    p.match(Pattern.wc) do
      magazine.ripoutallthepages
    end
    p[:asdf]
  end
end