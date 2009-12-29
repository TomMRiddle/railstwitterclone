class PagesController < ApplicationController
  
  def home
  	#@ = instance variable, exist only in home
  	@title = "Home"
  end

  def contact
  	@title = "Contact"
  end
  
  def about
  	@title = "About"
  end

end
