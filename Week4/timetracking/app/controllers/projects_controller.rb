class ProjectsController < ApplicationController
  def index
    @projects = Project.last_created_projects(25)

    if(@projects.empty?)
      render(template: 'projects/no_projects')
    end
  end

  def show
    @project = Project.find_by(id: params[:id]) || render_404(params)
  end
end
