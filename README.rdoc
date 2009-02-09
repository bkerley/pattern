= pattern

* http://github.com/bkerley/matcher/

== DESCRIPTION:

Erlang-style pattern matching for Ruby

== FEATURES/PROBLEMS:

* FEATURE: matches patterns
* PROBLEM: is a proof of concept
* FEATURE: works with any kind of object that does the right thing on #===
* PROBLEM: except for Matcher::Wildcard (conveniently instantiated with Matcher.wc or Matcher#wc)
* FEATURE: will entertain you on the train ride home from acts\_as\_conference 2009
* PROBLEM: you've probably already gone home

== SYNOPSIS:

  require 'lib/pattern'
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

== REQUIREMENTS:

* Testing requires shoulda and mocha.
* That is all.

== INSTALL:

* This should end up as a gem on github, so:

  gem install bkerley-pattern

== LICENSE:

The MIT License

Copyright (c) 2009 Bryce Kerley

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
