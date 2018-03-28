class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  before_action :set_form, only: [:home, :landing_liquidity, :how_it_works]
  before_action :authenticate_user!, only: [:set_admin_cookie]
  before_action :authenticate_admin!, only: [:set_admin_cookie]

  def home
  end

  def how_it_works
  end

  def features
  end

  def about_us
  end

  def thank_you
  end

  def set_admin_cookie
  end

  private

  def set_form
    @property_form = PropertyForm.new
  end

  def authenticate_admin!
    raise ActionController::RoutingError.new('Not Found') unless current_user && current_user.admin?
  end
end
