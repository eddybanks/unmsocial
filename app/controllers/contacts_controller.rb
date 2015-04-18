class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:notice] = "Message successfully sent!"
      redirect_to('/')
    else
      render('new')
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end

end
