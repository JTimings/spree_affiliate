class Spree::InviteController < Spree::StoreController

  before_filter :current_user

  def index
  
  end

  def current_user
  	unless spree_current_user
      store_location
  		flash[:error] = Spree.t(:login_or_signup)
  		redirect_to login_path
  	end
  end

  private
	  def accurate_title
	    "Invite Your Friends"
	  end

end
