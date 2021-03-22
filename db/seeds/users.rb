require "faker"

puts " User creation started......"

p " create admin user"

User.create!({
    email: "admin@finetechgroup.com",
    role: "ADMIN",
    password: "test123",
    password_confirmation: "test123"
});

p '.'

10.times do 
    User.create!({
        email: Faker::Internet.email(domain: 'finetechgroup'),
        role: "CUSTOMER",
        password: "test123",
        password_confirmation: "test123"
    }); 
    p '.'
end

p 'OK.'
p "Users creation complete ..."