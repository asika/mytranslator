namespace :dev do

  task :create_users => :environment do
    10.times do |i|
      username = Faker::Name.last_name.downcase

      newuser = User.create(:username => username, :password => "12345678", :email => username+"@ac.co")

      newuser.profile.build
    end
  end

  task :create_users_ac => :environment do
    emails = ["ihower@gmail.com", "frozenfung@gmail.com", "vneverz@gmail.com", "tim.du@alphacamp.co"]

    emails.each do |email|
      username = Faker::Name.last_name.downcase

      User.create(:username => username, :password => "12345678", :email => email)
    end
  end

  task :fake_topics => :environment do
    # user = User.first

    100.times do |i|
      category_ids = []

      (0..rand(Category.all.count)).each do
        # category_ids << rand(Category.all.count)+1

        # get random record
        category_ids << Category.offset(rand(Category.all.count)).first.id
      end
      category_ids = category_ids.uniq

      user_id = User.offset(rand(User.all.count)).first.id

      nr = Topic.create(
          :title => Faker::Name.title,
          :content => Faker::Lorem.sentence(144, false, 4),
          :user_id => user_id, #rand(User.all.count)+1,
          :category_ids => category_ids
        )
      nr.save
    end
  end

  task :fake_comments => :environment do
    200.times do |i|
      user_id = User.offset(rand(User.all.count)).first.id
      topic_id = Topic.offset(rand(Topic.all.count)).first.id

      nr = Comment.create(
          :content => Faker::Lorem.sentence(30, false, 4),
          :user_id => user_id,
          :topic_id => topic_id
        )
      nr.save
    end
  end

end