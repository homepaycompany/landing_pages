class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]
  before_action :set_form, only: [:home, :landing_liquidity, :how_it_works]
  before_action :authenticate_user!, only: [:set_admin_cookie]
  before_action :authenticate_admin!, only: [:set_admin_cookie]

  def home
    @landing = params["landing"] || 'home'
    @faqs = []
    # @faqs << Faq.find_by(question: "Est-ce que je peux demander une demande d'offre d’achat gratuitement sur Homepay ?")
    # @faqs << Faq.find_by(question: "Je ne suis pas sûr de vouloir m’engager. Est-ce que je peux quand même demander une offre d’achat ?")
    # @faqs << Faq.find_by(question: "Qui me rachète ma maison ?")
    # @faqs << Faq.find_by(question: "Dans quels cas, est-il intéressant d’utiliser les services d'Homepay ?")
  end

  def landing_liquidity
  end

  def thank_you
    @landing = params["landing"] || 'home'
  end

  def how_it_works
    @landing = params["landing"] || 'home'
  end

  def about_us
    @landing = params["landing"] || 'home'
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
