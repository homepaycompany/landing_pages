class FaqsController < ApplicationController
  before_action :set_property_form,
  only: [:show]

  # CRUD actions
  def show
  end

  def index
    @faqs = Faq.all
    @topics = {general: "Général", seller: "Vente", offer: "Offres d'achat"}
  end

  private

  def set_property_form
    @faq = Faq.find_by(id: params[:id])
  end
end
