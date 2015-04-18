class StaticPagesController < ApplicationController

  def home
  end

  def about
  end

  def calendar
  end

  def contact
    @contact = Contact.all
  end

end
