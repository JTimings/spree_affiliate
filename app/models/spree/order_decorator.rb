Spree::Order.class_eval do
  include AffiliateCredits

  alias :old_finalize! :finalize!

  def finalize!
    old_finalize!
    if user && user.affiliate_partner && user.orders.where(state: 'complete').count == 1
      sender = user.referred_by
      create_affiliate_credits(sender, user, 'purchase')

      reward = Spree::Money.new( Spree::AffiliateEvent.search(affiliate_id_eq: user.affiliate_partner.id, name_eq: "purchase").result.first.reward.amount, {currency:'THB'} )
      deliver_affiliate_sender_credit_email(sender, user, reward)
    end
  end

  def deliver_affiliate_sender_credit_email(sender, user, reward)
	  Spree::OrderMailer.referrer_credit_email(sender, user, reward).deliver
	end

end
