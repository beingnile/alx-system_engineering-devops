#!/usr/bin/env ruby
regex = /\[from:(?<from>[\+\w\d]+)\] \[to:(?<to>[\+\d]+)\] \[flags:(?<flags>[^\]]+)\]/
matches = ARGV[0].scan(regex)

values = matches.map { |match| "#{match[0]},#{match[1]},#{match[2]}" }
puts values.join(",")
