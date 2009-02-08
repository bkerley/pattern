require 'shoulda'
require 'mocha'
require File.join(File.dirname(__FILE__), '../lib/pattern')

class PatternTest < Test::Unit::TestCase
  include Pattern
  
  should 'not blindly match' do
    assert_not_run_with [0], [1]
  end
  
  should 'run some pattern' do
    assert_runs_with [0], [0]
  end
  
  should 'support wildcards' do
    assert_runs_with [wc], [0]
  end
  
  should 'match multiple arguments' do
    assert_runs_with [0, wc], [0, 1]
    assert_runs_with [1, 2], [1, 2]
  end
  
  should 'work with a regex' do
    assert_runs_with [/face plant$/], ["just did a face plant"]
    assert_not_run_with [/face plant$/], ["worm food"]
  end
  
  should 'order matches' do
    p = Matcher.new
    slug = mock()
    slug.expects(:get_executed).once
    p.match(:alpha, wc) do
      slug.get_executed
    end
    p.match(wc, :bravo) do
      assert false
    end
    p[:alpha, :bravo]
  end
  
  def assert_not_run_with(template, execute)
    p = Matcher.new
    p.match(*template) do
      assert false
    end
    p[*execute]
  end
  
  def assert_runs_with(template, execute)
    slug = mock()
    slug.expects(:get_executed).once
    p = Matcher.new
    p.match(*template) do
      slug.get_executed
    end
    p[*execute]
  end
end