class Spree::Affiliate < ActiveRecord::Base
  belongs_to :partner,
    class_name: 'Spree::User',
    foreign_key: :partner_id
  belongs_to :user,
    class_name: 'Spree::User'
  has_many :events,
    class_name: 'Spree::AffiliateEvent'

  accepts_nested_attributes_for :partner  

  def name
    I18n.t(:affiliate_program)
  end

  def ref_id
    partner.try(:ref_id) || ''
  end

  def active    
    partner.locked_at.nil?
  end

  def active=(value)
    partner.locked_at = value.to_i == 1 ? nil : Time.zone.now if partner
  end
end