json.interests  @interests.each do |interest|
    json.id interest.id
    json.name interest.name
end