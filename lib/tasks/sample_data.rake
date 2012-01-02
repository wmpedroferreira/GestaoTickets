namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
  end
end

def make_users
  admin = User.create!(:name => "Example User",
                       :email => "example@railstutorial.org",
                       :password => "foobar",
                       :password_confirmation => "foobar",
                       :tipo_user_id => "1",
                       :client_admin_gestor_id => "1")
  admin.toggle!(:admin)
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    tipo_user_id = "1"
    client_admin_gestor_id = "1"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password,
                 :tipo_user_id => tipo_user_id,
                 :client_admin_gestor_id => client_admin_gestor_id)
  end
end
