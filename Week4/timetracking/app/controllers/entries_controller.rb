class EntriesController < ApplicationController
  def index
    @project = Project.find_by(id: params[:project_id]) || render_404(params)

    date = Date.current

    @entries = @project.month_entries(date.year, date.month)
    @total_hours = @project.total_hours_in_month(date.year, date.month)
  end
end
