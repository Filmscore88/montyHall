def game(switch)
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
  stayed   += 1 if game(false)
  switched += 1 if game(true)
end

puts "Win frequencies in Monty Hall when"
puts "    staying: #{100.0 * stayed / trials}%"
puts "  switching: #{100.0 * switched/ trials}%"
