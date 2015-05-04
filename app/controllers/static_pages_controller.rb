class StaticPagesController < ApplicationController

  def home      # root page or hompage
  end

  def about     # the about page
  end

  def calendar    # calendar page (not exactly a static page though)
  end

  def contact     # contact page for receiving feedback from users
    @contact = Contact.all
  end

end
