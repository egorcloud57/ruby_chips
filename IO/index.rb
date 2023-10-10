# Thread - потоки в рамках одного процесса (псевдомногопоточность)
# Process - потоки в рамках неск процессов. (сложный модуль ибо тяжело работать с данными передаваемыми в рамках
# одного скрипта между процессами)

# 8.times do
#   fork { sleep(rand(0..5)); p Process.pid; exit 3 }
# end

read, write = IO.pipe # открыть канал на чтение и запись, в доч процессах можно писать в канал но нельзя из него читать

p "Я родитель #{Process.pid}"

fork do
  sleep(rand(0..5))
  p Process.pid
  str = <<-EOF
    lambda { return 'bbbb' }
  EOF
  write.write str.lstrip!
  exit 3
end

fork do
  sleep(rand(0..5))
  p Process.pid
  str = <<-EOF
    lambda { return 'aaa' }
  EOF
  write.write str.lstrip!
  exit 3
end

p "Я родитель #{Process.pid} продолжаю выполнение не смотря на парралелизм"

write.close # Если не закрыть будем читать бесконечно
arr = read.read.split("\n") # Интерпритатор остановится на чтении канала и не спустится вниз пока не считает данные
arr.each { |lamb| p eval(lamb).() }
read.close

r, w = IO.pipe

fork do
  sleep(rand(0..5))
  r.close
  w.write(Marshal.dump(['one', 'two']))
  exit! 0
end

fork do
  sleep(rand(0..5))
  w.close
  # иногда будет ошибка ибо мы закрыли канал ниже(код может выполнится ниже быстрее чем выше в другом потоке)
  p Marshal.load r.read
  exit! 0
end

w.close
p r.read
r.close

p 'имитация общения процессов между собой чз канал'