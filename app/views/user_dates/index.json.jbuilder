json.user_dates @user_dates.each do |date|
    json.id date.id
    json.time date.time
    json.events date.date_events.each do |event|
        json.id event.id
        json.name event.name
        json.address event.street_address
        json.price event.price
        json.image_url event.image_url
    end
    json.partners date.date_partners.each do |partner|
        user_partner = User.find(partner.user_id)
        json.id user_partner.id
        json.name user_partner.first_name + " " + user_partner.last_name
    end
    json.rating date.rating
end