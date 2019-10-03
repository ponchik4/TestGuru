class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :set_locate

  def default_url_options
    { lang: I18n.locale }
  end

  private

  def set_locate
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
