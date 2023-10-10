p File.dirname(__dir__) #абсолютный путь

def machine(direct, tab) # рекурсивный обход в глубь
  dir = direct
  dir.each do |el|
    t = tab
    puts "#{t} #{el.match(/[^\/]+$/)}"
    if File.directory?(el) && !Dir.empty?(el)
      t += "\t"
      machine(Dir[el + "/*"], t)
    end
  end
end

machine(Dir.glob("recursion/upload/*"), "\t")