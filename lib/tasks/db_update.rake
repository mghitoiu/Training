require 'csv'

namespace :db_update do
  desc "TODO"
  task update_teams_csv: :environment do
    CSV.foreach('storage/test.csv', headers: true) do |row|
      name = row[0]
      manager_first_name = row[1]
      manager_last_name = row[2]
      manager_age = row[3]

      # create team and its manager
      team = Team.create(name: name)
      manager = Manager.create(first_name: manager_first_name, last_name: manager_last_name, age: manager_age)
    end
  end

end
