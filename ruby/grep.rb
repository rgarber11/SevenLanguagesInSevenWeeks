#!/usr/bin/ruby
regex = Regexp.new(ARGV[0].chomp)
files = Dir.entries(".").select {|e| File.file?(e)}
files.each do |f|
  File.foreach(f).with_index do |line, num|
    if line =~ regex
      puts "#{f} #{num + 1}: #{line}"
    end
  end
end
