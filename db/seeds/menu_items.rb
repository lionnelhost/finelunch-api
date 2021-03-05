puts " Menu Items creation ......"


menus = Menu.all

menus.each do |menu| 
    2.times do 
        MenuItem.create!(
            dish_id: Dish.order(Arel.sql('RANDOM()')).first.id,
            menu_id: menu[:id]
        )
    end
    p "menu items create for the menu of #{ menu[:date] }"
end

p 'OK.'
p "menu_items creation complete ..."