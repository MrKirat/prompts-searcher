require 'parquet'

# Seed the DB with prompts data set
data_set_path = Rails.root.join('db', 'train.parquet')
data_set = Arrow::Table.load(data_set_path)
attributes = data_set['Prompt'].to_a.map { |prompt| { content: prompt } }
ActiveRecord::Base.connection.truncate(Prompt.table_name)
Prompt.insert_all(attributes)
puts 'Prompts successfully seeded!'
