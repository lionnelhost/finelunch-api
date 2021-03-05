require 'faker'

puts " Menus creation ......"


10.times do 
    Menu.create!({
        date: Faker::Date.between(from: '2021-01-01', to: '2021-02-28')
    }); 
    p '.'
end

p 'OK.'
p "menus creation complete ..."