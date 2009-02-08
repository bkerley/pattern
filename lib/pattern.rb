%w{entry matcher}.each { |f| require File.join(File.dirname(__FILE__), '../lib/pattern/', f) }

module Pattern
  VERSION = '1.0.0'
  
  def self.wc
    Wildcard.new
  end
end