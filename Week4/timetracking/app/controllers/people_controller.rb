class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def show
    @person = Person.find(params[:id])
    @projects = Project.all
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
    person.projects << project

    redirect_to(action: 'index', controller: 'people', person_id: person.id)
  end

  private

  def entry_params
    params.require(:person).permit(:name)
  end
end
