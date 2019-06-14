json.id @user.id
json.username @user.username
json.age @user.age
json.name @user.first_name.concat(" ",@user.last_name)
json.email @user.email
json.zip_code @user.zip_code
json.image @user.image
json.genders @user.genders.each do |gender|
    json.id gender.id
    json.name gender.name
end
json.orientations @user.orientations.each do |orientation|
    json.name orientation.name 
end
json.pronouns @user.pronouns.each do |pronouns|
    json.name pronouns.name
end
json.confirmedPartners @user.relationships.each do |relationship|
    if relationship.confirmed === 1
        @Partner = User.find(relationship.partner_id)
        json.id @Partner.id
        json.name @Partner.first_name+" "+@Partner.last_name
    end
end
json.pendingPartners @user.relationships.each do |relationship|
    if relationship.confirmed === 0
        @Partner = User.find(relationship.partner_id)
        json.relationshipID relationship.id
        json.partnerID @Partner.id 
        json.name @Partner.first_name+" "+@Partner.last_name
    end
end
json.interests @user.interests.each do |interest|
    json.id interest.id
    json.name interest.name
end
