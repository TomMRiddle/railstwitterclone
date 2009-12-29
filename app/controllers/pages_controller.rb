class PagesController < ApplicationController
  #@@ = class variable	exist in whole PagesController, not in erb
  @@sitetitle = "Railstwitterclone - "
  
  def home
  	#@ = instance variable, exist only in home
  	@title = @@sitetitle + "Home"
  end

  def contact
  	@title = @@sitetitle + "Contact"
  end
  
  def about
  	@title = @@sitetitle + "About"
  end

end
