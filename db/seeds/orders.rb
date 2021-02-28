puts " orders creation ......"

users = User.all

users.each do |user| 
    5.times do 
        Order.create!(
            status: "completed",
            user_id: user[:id],
            menu_item_id: MenuItem.order(Arel.sql('RANDOM()')).first.id,
        )
    end
    p "order create for the user of #{ user[:email] }"
end



p 'OK.'
p "orders creation complete ..."