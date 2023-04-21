require 'optparse'

class Arguments
  def self.parse
    arguments = {}

    OptionParser.new do |opt|
      opt.banner = 'Usage: hangsman -d [difficulty]'
      opt.on('-d', '--difficulty [difficulty]', Integer, '1 - 7, 0 for random') { |o| arguments[:difficulty] = o.to_i }
      opt.on('-v', '--version', 'Show version') do
        puts 'hangmang version 0.1.0'
        exit
      end
    end.parse!

    arguments
  end
end
