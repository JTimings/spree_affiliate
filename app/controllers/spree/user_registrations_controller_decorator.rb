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
	    if params[:ref_id] && cookies[:ref_id] != params[:ref_id]
	      # remember the affiliate referral id
	      cookies.permanent[:ref_id] = params[:ref_id] 
	      # increment number of referrals for stat purpose
	      affiliate = Spree.user_class.find_by_ref_id(params[:ref_id])      
	      affiliate.update_attributes(num_referrals: affiliate.num_referrals + 1)
	    end      
	  end

end  
