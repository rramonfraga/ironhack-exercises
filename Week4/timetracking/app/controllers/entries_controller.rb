class EntriesController < ApplicationController
  def index
    @project = Project.find_by(id: params[:project_id]) || render_404(params)
    @entries = @project.entries
  end
end
