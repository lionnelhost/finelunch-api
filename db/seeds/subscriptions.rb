puts " subscriptions creation ......"

users = User.all

users.each do |user|  
    Subscription.create!(
        status: "completed",
        period_start: "2021-01-01",
        period_end: "2020-01-31",
        user_id: user[:id]
    )

    Subscription.create!(
        status: "completed",
        period_start: "2021-02-01",
        period_end: "2020-02-28",
        user_id: user[:id]
    )
    p "subscription created for the user of #{ user[:email] }"
end



p 'OK.'
p "subscriptions creation complete ..."