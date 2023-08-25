# Detect if running in heroku
if ENV['HEROKU'].present?
  require 'uri'

  user = ENV.fetch('FOUNDELASTICSEARCH_USER')
  password = ENV.fetch('FOUNDELASTICSEARCH_PASSWORD')
  url = ENV.fetch('FOUNDELASTICSEARCH_URL')

  host = URI(url)
  host.user = user
  host.password = password

  Elasticsearch::Model.client = Elasticsearch::Client.new(host: host.to_s)
end
