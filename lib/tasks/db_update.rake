require 'csv'

namespace :db_update do
  desc "TODO"
  task update_teams_csv: :environment do
    CSV.foreach('//storage/test.csv', headers: true) do |row|
      row_hash = row.to_hash
      team = teams[row_hash['team'].to_i]
    
      item = Item.where(name: row_hash['name'])
      item.update_attributes!(team: team) unless item.nil?
    end
  end

end
