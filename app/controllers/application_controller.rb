class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include UsersHelper
  include Pagy::Backend
  before_action :set_locale

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale =
      I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  private

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t ".logged_in_alert"
    redirect_to login_url
  end
end
