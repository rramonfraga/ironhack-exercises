class EntriesController < ApplicationController
  def index
    @project = Project.find_by(id: params[:project_id]) || render_404(params)

    date = Date.current
    @entries = @project.month_entries(date.year, date.month)
  end

  def new
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new
  end

  def edit
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
  end

  def delete
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new(entry_params)

    if(@entry.save)
      flash[:notice] = "Entry created successfully"
      redirect_to(action: 'index', controller: 'entries', project_id: @project.id)
    else
      flash[:alert] = "Something went wrong"
      render('new')
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])

    if(@entry.update_attributes(entry_params))
      flash[:notice] = "Entry updated successfully"
      redirect_to(action: 'index', controller: 'entries', project_id: @project.id)
    else
      flash[:alert] = "Something went wrong"
      render('edit')
    end
  end

  def destroy
    project = Project.find(params[:project_id])
    entry = project.entries.find(params[:id])

    entry.destroy
    redirect_to(action: 'index', controller: 'entries', project_id: project.id)
  end

  private

  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
  end
end
