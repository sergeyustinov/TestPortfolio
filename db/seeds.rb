USERS_COUNT = 5
PROJECTS_COUNT = 5
PHOTOS_COUNT = 5

USERS_COUNT.times do |i|
  p "adding user ##{i+1}"
  
  user = User.create first_name: Faker::Name.first_name

  PROJECTS_COUNT.times do |y|
    p "adding project ##{y+1} for user #{user.first_name}"
    project = user.projects.create title: Faker::Company.name

    PHOTOS_COUNT.times do |z|
      p "adding photo ##{z+1} for user #{user.first_name} in project #{project.title}"
      project.photos.create remote_data_url: [Faker::Avatar.image, Faker::Company.logo][rand(2)]
    end
  end
end