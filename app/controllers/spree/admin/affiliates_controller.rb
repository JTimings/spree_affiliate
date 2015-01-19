module Spree
  module Admin

    class AffiliatesController < ResourceController
      def new
        @affiliate = Spree::Affiliate.new
        #@affiliate.partner = Spree::User.new
        @affiliate.build_partner
      end
      # def create
      #   @user = Spree::User.create(params[:user])

      # end
      def index
        params[:q]     ||= {}
        params[:q][:s] ||= 'created_at desc'
        @search = Spree::Affiliate.ransack(params[:q])
        @affiliates = @search.result.where('partner_id is not null').group(:partner_id).page(params[:page]).per(50)
        respond_with(@affiliates)
      end
      def show
        flash[:notice] = request.flash[:notice]
        redirect_to account_url
      end
    end
  end
end