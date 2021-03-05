require "faker"

puts " orders creation ......"

users = User.all

users.each do |user| 
    Profile.create!(
        firstname: Faker::Name.first_name,
        lastname: Faker::Name.last_name,
        phone_number: Faker::PhoneNumber.cell_phone_in_e164,
        address: Faker::Address.full_address,
        fonction: Faker::Company.profession,
        avatar_url: "https://i.pravatar.cc/300",
        user_id: user[:id],
    )
    p "profile created for the user of #{ user[:email] }"
end



p 'OK.'
p "profiles creation complete ..."