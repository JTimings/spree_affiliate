Spree::User.class_eval do

  has_many :affiliates,
    class_name: 'Spree::Affiliate',
    foreign_key: 'partner_id'
  has_many :referred_users,
    class_name: 'Spree::User',
    through: :affiliates,
    source: :user
  has_one :affiliate_partner,
    class_name:'Spree::Affiliate',
    foreign_key: 'user_id'

  def referred_by
    affiliate_partner.partner
  end

  def ref_id
    Hashids.new("eat better with polpa", 5, "abcdefghijkmnopqrstuvwxyz1234567890").encode(self.id)
  end

  def self.find_by_ref_id(ref_id)
    id = Hashids.new("eat better with polpa", 5, "abcdefghijkmnopqrstuvwxyz1234567890").decode(ref_id).first
    Spree::User.find(id)
  end

  def is_affiliate
    Spree::Affiliate.exists?(partner:self)
  end 

end