class CreateTeamsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts 'job started'
    added_records = 0
    #csv = CSV.new(args[0]).to_a
    args[0].each do |team_set|

      # extract info from csv
      name = team_set[0]
      manager_first_name = team_set[1]
      manager_last_name = team_set[2]
      manager_age = team_set[3]

      # create team and its manager
      team = Team.create(name: name)
      manager = Manager.create(first_name: manager_first_name, last_name: manager_last_name, age: manager_age, team_id: team.id)
      added_records += 1
    end

    puts 'job ended'
    TeamMailer.send_report(added_records).deliver_later
  end
end
