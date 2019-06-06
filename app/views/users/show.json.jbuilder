json.username @user.username
json.age @user.age
json.name @user.first_name.concat(" ",@user.last_name)
json.email @user.email
json.zip_code @user.zip_code
json.image @user.image
json.genders @user.genders.each do |gender|
    json.name gender.name
end
json.orientations @user.orientations.each do |orientation|
    json.name orientation.name 
end
json.pronouns @user.pronouns.each do |pronouns|
    json.name pronouns.name
end
json.partners @user.partners.each do |partner|
    json.name partner.first_name.concat(" ",partner.last_name)
end
json.interests @user.interests.each do |interest|
    json.interest interest.name
end
