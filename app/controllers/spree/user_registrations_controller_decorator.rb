Spree::UserRegistrationsController.class_eval do
  include AffiliateCredits

  before_filter :remember_affiliate, only: :new
  after_action :check_affiliate, only: :create

  private
	  def accurate_title
	  	if request.path.include?(invite_path + '/')
	  		"Sign Up and Get Free Food"
	  	else
	    	"Sign Up"
	    end
	  end

	  def remember_affiliate
	    cookies.permanent[:ref_id] = params[:ref_id] if params[:ref_id]
	  end

end  
