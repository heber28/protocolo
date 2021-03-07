# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end

  helper_method :current_user

  def current_setor
    @current_setor ||= Setor.find(session[:setor_id]) if session[:setor_id]
  end

  helper_method :current_setor

  def authorize
    redirect_to login_url, alert: "Não autorizado" if current_user.nil?
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Acesso negado"
    redirect_to login_url
  end

end
