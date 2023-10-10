employee = [
  { name: "Charly", zp: 31000 },
  { name: "Charly", zp: 34000 },
  { name: "Charly", zp: 3000 },
  { name: "Charly", zp: 4000 },
  { name: "Charly", zp: 5000 },
  { name: "Charly", zp: 3000 },
  { name: "Charly", zp: 8000 },
  { name: "Charly", zp: 3000 }
]

# взять сотрудников с самой большой зп

sort1 = employee.sort_by { |emp| -emp[:zp] }.slice(0...employee.length/2)
p sort1

sort2 = employee.sort { |a, b| a[:zp] <=> b[:zp] }.drop(4) # drop сколько я хочу взять элементов
p sort2

def sort3(emp)
  for i in 0..emp.length - 2
    for j in 0..emp.length - 2
      if emp[j][:zp] > emp[j + 1][:zp]
        emp[j], emp[j + 1] = emp[j + 1], emp[j]
      end
    end
  end

  emp.drop(4)
end

p sort3(employee)