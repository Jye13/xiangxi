class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_worker!

  def current_ability
    @current_ability ||= ::Ability.new(current_worker)
  end

  def after_sign_in_path_for(resource)
    if current_worker.has_role?(:admin)
      workers_path
    elsif current_worker.has_role?(:yunying)
      cities_path
    elsif current_worker.has_role?(:fenchengshi)
      price_rules_path
    end
  end

  def after_sign_out_path_for(resource)
    new_worker_session_path
  end

  def current_city
    unless session[:current_city_id]
      session[:current_city_id] = current_worker.cities.first.id if current_worker.cities.first
    end
    if session[:current_city_id]
      @current_city ||= City.find(session[:current_city_id])
    else
      @current_city = nil
    end
  end
end
