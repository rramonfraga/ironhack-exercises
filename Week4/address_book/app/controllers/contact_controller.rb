class ContactController < ApplicationController
  def index
    @contacts = Contact.all.order(name: :asc)
    render 'index'
  end

  def create
    if(params[:contact][:name].empty? || params[:contact][:address].empty?)
      redirect_to("/contacts/new")
    else
      contact = Contact.new(
        :name => params[:contact][:name],
        :address => params[:contact][:address],
        :phoneNumber => params[:contact][:phoneNumber],
        :emailAddress => params[:contact][:emailAddress])
      
      contact.save

      redirect_to("/contacts")
    end
  end

  def favorite
    contact = Contact.find(params[:contact][:id])
    contact.favorite = true
    contact.save

    redirect_to("/contacts/show/#{params[:contact][:id]}")
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def show_favorites
    @contacts = Contact.where("favorite IS NOT NULL")
    render 'favorites'
  end

  def search
    @input_value = params[:search][:letter]
    @contacts = Contact.where("name LIKE '#{@input_value}%'")
  end
end
