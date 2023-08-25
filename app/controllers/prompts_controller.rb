class PromptsController < ApplicationController
  def index
    @pagy, @prompts = pagy(Prompt.all)
  end

  private

  def prompt_params
    params.require(:prompt).permit(:content)
  end
end
