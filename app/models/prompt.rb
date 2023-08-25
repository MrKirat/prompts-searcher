class Prompt < ApplicationRecord
  include ::Elasticsearch::Model
  include ::Elasticsearch::Model::Callbacks
  extend ::Pagy::ElasticsearchRails

  settings do
    mapping do
      indexes :content, type: :text, analyzer: :english
    end
  end

  validates :content, presence: true 

  def self.pagy_search(query)
    super(
      {
        query: {
          bool: {
            should: [
              {
                match_phrase: {
                  content: { query: query, boost: 8 }
                }
              },
              {
                match: {
                  content: { query: query, operator: "and", boost: 5 }
                }
              },
              {
                match: {
                  content: { query: query, operator: "or", boost: 3, zero_terms_query: 'all' }
                }
              }
            ]
          },
        },
        highlight: {
          fields: {
            content: { pre_tags: ['<mark>'], post_tags: ['</mark>'] }
          }
        }
      }
    )
  end
end
