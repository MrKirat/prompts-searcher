class PromptsController < ApplicationController
  def search
    @pagy, @search_items = pagy_elasticsearch_rails(search_attributes)
  end

  private

  def search_attributes
    ::Prompt.pagy_search(params[:query].to_s)
  end
end
