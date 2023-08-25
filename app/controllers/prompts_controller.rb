class PromptsController < ApplicationController
  def index
    @prompts = Prompt.all
  end

  private

  def prompt_params
    params.require(:prompt).permit(:content)
  end
end
