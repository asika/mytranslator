namespace :dev do

  task :create_users => :environment do
    10.times do |i|
      username = Faker::Internet.user_name

      newuser = User.create(:password => "12345678", :email => username+"@ac.com")

      np = newuser.build_profile(
          :username => username,
          :first_name => Faker::Name.first_name,
          :last_name => Faker::Name.last_name,
          :phone => Faker::PhoneNumber.cell_phone,
          :short_summary => Faker::Lorem.sentence(3),
          :about => Faker::Lorem.sentence(50),
          :education => Faker::Lorem.sentence(100),
          :professional => Faker::Lorem.sentence(100),
          :certification => Faker::Lorem.sentence(100),
          :payment_info => Faker::Lorem.sentence(20)
        )

      domain_ids = []
      (0..rand(Domain.all.count)).each do
        domain_ids << Domain.offset(rand(Domain.all.count)).first.id
      end
      domain_ids = domain_ids.uniq
      np.domain_ids = domain_ids

      CaseType.all.each do |ct|
        # Pricing.create(:profile_id => np.id, :case_type_id => ct.id, :amount => Random.rand(4.0)+ct.min_price)
        np.pricings.build(:case_type_id => ct.id, :amount => Random.rand(4.0)+ct.min_price)
      end

      np.save!

      puts "Created user #{newuser.id}: #{newuser.profile.username}"
    end
  end

end