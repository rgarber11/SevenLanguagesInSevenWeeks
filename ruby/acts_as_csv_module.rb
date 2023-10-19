module ActsAsCsv
  class CsvRow
    attr_accessor :contents
    def initialize(contents, headers)
      @contents = contents
      @headers = headers
    end
    def method_missing(name, *args)
      index = @headers.index(name.to_s)
      if index.nil? 
        raise 'Invalid header'
      else
        @contents[index]
      end
    end
  end
  def self.included(base)
    base.extend ClassMethods
  end
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
    def each
    @csv_contents.each {|chunk| yield CsvRow.new(chunk, headers)}
    end
  end
end
class RubyCsv
  include ActsAsCsv
  acts_as_csv
end
m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each {|row| puts row.one}
