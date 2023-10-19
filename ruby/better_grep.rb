#!/usr/bin/ruby
require 'filemagic'
def text?(filename)
  FileMagic.open(:mime) { |fm|
    a = fm.file(filename)
    a =~ /^text\//
  }
end
regex = Regexp.new(ARGV[0].chomp)
files = Dir.entries(".").select {|e| File.file?(e) && text?(e)}
files.each do |f|
  File.foreach(f).with_index do |line, num|
    begin
      if line =~ regex
        puts "#{f} #{num + 1}: #{line}"
      end
    rescue ArgumentError => e
    end
  end
end
