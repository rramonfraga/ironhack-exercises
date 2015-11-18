class EntriesController < ApplicationController
  def index
    @project = Project.find_by(id: params[:project_id]) || render_404(params)

    date = Date.current

    @entries = @project.month_entries(date.year, date.month)
    @total_hours = @project.total_hours_in_month(date.year, date.month)
  end

  def new
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new
  end

  def edit
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new(entry_params)

    if(@entry.save)
      redirect_to(action: 'index', controller: 'entries', project_id: @project.id)
    else
      render('new')
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])

    if(@entry.update_attributes(entry_params))
      redirect_to(action: 'index', controller: 'entries', project_id: @project.id)
    else
      render('edit')
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
  end
end
