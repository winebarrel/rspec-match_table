# rspec-match_table

It is array of hashes matcher.

[![Gem Version](https://badge.fury.io/rb/rspec-match_table.svg)](https://badge.fury.io/rb/rspec-match_table)
[![Build Status](https://travis-ci.org/winebarrel/rspec-match_table.svg?branch=master)](https://travis-ci.org/winebarrel/rspec-match_table)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-match_table'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-match_table

## Usage

```ruby
require 'rspec/match_table'

RSpec.describe do
  specify do
  context 'when not match' do
    specify do
      expect(
        [
          {foo: 'bar', 100 => :zoo,  '100' => 100},
          {bar: 'foo', 200 => :baz,  '200' => 200},
          {baz: 'bar', 300 => 'foo', '300' => 300},
        ]
      ).to match_table( # or match_table_without_order
        [
          {foo: 'bar', 100 => :zoo,  '100' => 100},
          {bar: 'foo', 200 => 'baz', '200' => 200},
          {baz: 'bar', 300 => 'foo', '300' => 301},
        ]
      )
      #=> Failure/Error:
      #     expect(
      #       [
      #         {foo: 'bar', 100 => :zoo,  '100' => 100},
      #         {bar: 'foo', 200 => :baz,  '200' => 200},
      #         {baz: 'bar', 300 => 'foo', '300' => 300},
      #       ]
      #     ).to match_table(
      #       [
      #         {foo: 'bar', 100 => :zoo,  '100' => 100},
      #         {bar: 'foo', 200 => 'baz', '200' => 200},
      #
      #     expected: [{:foo=>"bar", 100=>:zoo, "100"=>100}, {:bar=>"foo", 200=>"baz", "200"=>200}, {:baz=>"bar", 300=>"foo", "300"=>301}]
      #          got: [{:foo=>"bar", 100=>:zoo, "100"=>100}, {:bar=>"foo", 200=>:baz, "200"=>200}, {:baz=>"bar", 300=>"foo", "300"=>300}]
      #
      #     Diff:
      #     @@ -1,4 +1,4 @@
      #      [{100=>:zoo, "100"=>100, :foo=>"bar"},
      #     - {200=>"baz", "200"=>200, :bar=>"foo"},
      #     - {300=>"foo", "300"=>301, :baz=>"bar"}]
      #     + {200=>:baz, "200"=>200, :bar=>"foo"},
      #     + {300=>"foo", "300"=>300, :baz=>"bar"}]
    end
  end
end
```
