class ImportTeamsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    # import records from CSV

    puts 'job started'
    sleep 2
    raise 'some error'
    puts 'job ended'
  end
end
