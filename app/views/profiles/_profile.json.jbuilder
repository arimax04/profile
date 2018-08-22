json.extract! profile, :id, :firstname, :lastname, :age, :station, :phone, :highschool, :created_at, :updated_at
json.url profile_url(profile, format: :json)
