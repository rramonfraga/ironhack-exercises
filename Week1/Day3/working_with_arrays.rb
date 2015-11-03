

arr = [
	[0, 1, 2, 3, 4, { :secret => { :unlock => [0, "Winter is coming"] } }]
]

puts arr[0][5][:secret][:unlock][1]

hash = { :wat => [0, 1, { :wut => [0, [ [0, 1, 2, 3, 4, 5, 6, 7, 8, { :bbq => "Barbacue? Yummyyyyyy!" }] ]] }] }
puts hash[:wat][2][:wut][1][0][9][:bbq]