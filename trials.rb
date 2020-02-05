def montyGame(switch)
  doors = [0,1,2]
  car = rand(3)
  pickedDoor = rand(3)

  availableDoors = doors - [pickedDoor, car]
  openedDoor = availableDoors[rand(availableDoors.size)]
  switchDoor = (doors - [pickedDoor, openedDoor]).pop

  if switch
    pickedDoor = switchDoor
  end

  pickedDoor == car
end

trials = 10000
stayed = 0
switched = 0

trials.times do |trial|
  stayed   += 1 if montyGame(false)
  switched += 1 if montyGame(true)
end

puts "Monty Hall Game Outcome Staying Vs Switching"
puts "    staying: #{100.0 * stayed / trials}%"
puts "  switching: #{100.0 * switched/ trials}%"
