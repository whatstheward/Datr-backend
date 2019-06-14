json.users @userResults.each do |user|
    json.id user.id
    json.title user.username
    json.description user.first_name+" "+user.last_name 
    json.image user.image
end
