def caffeineBuzz(n)
  str = "mocha_missing!"
  return str if n <= 2
  if n%3 == 0
    str = "Java"
  end
  if n%4 == 0
    str = "Coffee"
  end
  if n.even?
    str += "Script"
  end
  str
end

require 'ruby-prof'

RubyProf.start
10.times do |x|
   puts caffeineBuzz(x)
end
result = RubyProf.stop

printer = RubyProf::GraphPrinter.new(result)
printer.print(STDOUT, {})

printer = RubyProf::GraphHtmlPrinter.new(result)
File.open("profile_data.html", 'w') { |file| printer.print(file) }