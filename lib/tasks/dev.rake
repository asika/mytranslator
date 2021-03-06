# require 'CSV'

namespace :dev do
  # task :fakeup_users_from_csv => :environment do
  #   User.destroy_all
  #   Profile.destroy_all

  #   User.create(:email => "admin@ac.com", :password => "12345678", :username => "admin", :first_name => "Mister", :last_name => "Admin", :phone => "0987654321")

  #   users = CSV.parse(File.read('/tmp/0517/trans.csv'))

  #   cnt = 0
  #   users.each do |u|
  #     username = "user#{cnt}"
  #     cnt += 1

  #     newuser = User.create(
  #       :password => "12345678",
  #       :email => "#{username}@ac.com",
  #       :username => username,
  #       :first_name => u[1],
  #       :last_name => "#",
  #       :phone => Faker::PhoneNumber.cell_phone
  #       )

  #     np = newuser.build_profile(
  #         :short_summary => u[41],
  #         :about => u[34],
  #         :education => u[33],
  #         :professional => u[32]
  #       )

  #     domain_ids = []
  #     domain_mapping = [
  #       [42, 1], [43, 2], [44, 3], [45, 4], [46, 5]
  #     ]
  #     domain_mapping.each do |k, v|
  #       unless u[k].nil?
  #         domain_ids << v
  #       end
  #     end
  #     np.domain_ids = domain_ids.uniq

  #     language_ids = []
  #     language_mapping = [
  #       [10, 1], [11, 2], [12, 5], [13, 2], [14, 4], [15, 2], [16, 6], [17, 2]
  #     ]
  #     language_mapping.each do |k, v|
  #       unless u[k].nil?
  #         language_ids << v
  #       end
  #     end
  #     np.language_ids = language_ids.uniq

  #     np.quality_level_id = u[40].to_i

  #     price_base = {
  #       1 => 1.0, 2 => 2.5, 3 => 4.0
  #     }
  #     CaseType.all.each do |ct|
  #       np.pricings.build(:case_type_id => ct.id, :amount => Random.rand(1.0)+price_base[np.quality_level_id])
  #     end

  #     np.save!
  #     puts "Created user #{newuser.id}: #{newuser.first_name}"
  #   end
  # end

  task :fakeup_users => :environment do
    User.destroy_all

    User.create(:email => "admin@ac.com", :password => "12345678", :username => "admin", :first_name => "Mister", :last_name => "Admin", :phone => "0987654321", :role => Role.find_by_name('admin'))

    50.times do |i|
      username = "user#{i}"

      newuser = User.create(
        :password => "10101010",
        :email => username+"@gmail.com",
        :username => username,
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :phone => Faker::PhoneNumber.cell_phone,
        :role => (rand(2) == 0)?(Role.find_by_name('client')):(Role.find_by_name('translator'))
        )

      if newuser.role_id == Role.find_by_name('translator').id

        np = newuser.build_profile(
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
        np.domain_ids = domain_ids.uniq

        language_ids = []
        (0..rand(Language.all.count)).each do
          language_ids << Language.offset(rand(Language.all.count)).first.id
        end
        np.language_ids = language_ids.uniq

        np.quality_level_id = Random.rand(3)+1

        price_base = {
          1 => 1.0, 2 => 2.5, 3 => 4.0
        }
        CaseType.all.each do |ct|
          if Random.rand(2) == 1
            np.pricings.build(:case_type_id => ct.id, :amount => Random.rand(1.0)+price_base[np.quality_level_id])
          end
        end

        # fakeup face
        conn = Faraday.new(:url => "http://uifaces.com/api/v1/random")
        response = conn.get
        uifaces = eval(response.body.delete('\\'))

        np.avatar_remote_url = uifaces[:image_urls][:epic]
        np.save!
      end

      puts "Created user #{newuser.id}: #{newuser.username}, is a #{newuser.role.name}"
    end
  end

  task :fakeup_cases => :environment do
    Case.destroy_all

    200.times do
      status = ['new', 'ongoing', 'finish'].sample

      # assure client not equal to translator
      client = User.order("RAND()").first
      unless status == 'new'
        translator = User.order("RAND()").first

        while client.id == translator.id
          translator = User.order("RAND()").first
        end
      end

      newcase = Case.create!(
        :client => client,
        :translator => translator,
        :case_type => CaseType.order("RAND()").first,
        :domain => Domain.order("RAND()").first,
        :word_count => Random.rand(100000),
        :quality_level => QualityLevel.order("RAND()").first,
        :due => Time.now + Random.rand(20).days,
        :status => status
      )
      puts "Created case #{newcase.id}"
    end
  end

  task :fakeup_invitations => :environment do
    Invitation.destroy_all

    Case.where(:status => 'new').each do |c|

      translator = Profile.order("RAND()").first.user
      while translator.id == c.client.id
        translator = Profile.order("RAND()").first.user
      end

      c.invitations.build(
        :client_id => c.client.id,
        :translator_id => translator.id,
        :expire => Time.now + 1.day
        )
      c.save!
      puts "Created invitation: #{c.client.full_name} -> #{translator.full_name}"
    end
  end

  task :fakeup_ratings => :environment do
    Rating.destroy_all

    Case.where(:status => 'finish').each do |c|
      score = Random.rand(2) + 4

      c.ratings.build(
        :from => c.client,
        :to => c.translator,
        :score => score,
        :comment => Faker::Lorem.sentence(50)
      )
      c.save!
      puts "Created Rating: #{c.client.full_name} -> #{c.translator.full_name}, #{score}"
    end
  end

end