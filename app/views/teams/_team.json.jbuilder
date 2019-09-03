# frozen_string_literal: true

json.extract! team, :id, :name
json.set! :manager do
  json.set! :first_name, team&.manager&.first_name
  json.set! :last_name, team&.manager&.last_name
  json.set! :age, team&.manager&.age
end

# json.set! :logo_url, rails_blob_url(logo)

json.set! :logos_urls do
  json.array! team.logos do |logo|
    json.set! :logo_url, rails_blob_url(logo)
  end
end
