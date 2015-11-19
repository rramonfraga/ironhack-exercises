class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def show
    @person = Person.find(params[:id])
    @no_associated_projects = @person.select_no_associated_projects
  end

  def create
    @person = Person.new(entry_params)

    if(@person.save)
      flash[:notice] = "Person created successfully"
      redirect_to(action: 'index', controller: 'people', person_id: @person.id)
    else
      flash[:alert] = "Something went wrong"
      render('new')
    end
  end

  def update
    person = Person.find(params[:id])
    project = Project.find(params[:person][:projects])
    
    if(!person.projects.find_by(id: params[:person][:projects]))
      person.projects << project
    end

    redirect_to(action: 'show', controller: 'people', person_id: person.id)
  end

  private

  def entry_params
    params.require(:person).permit(:name)
  end
end
