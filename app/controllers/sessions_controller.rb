# encoding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    #if verify_recaptcha
    usuario = Usuario.find_by_login(params[:usuario])
    if usuario && usuario.authenticate(params[:password]) && usuario.desativado == false
      if UsuarioSetor.exists?(:usuario_id => usuario.id, :setor_id => params[:setor].to_i) == false
        flash.delete(:recaptcha_error)
        flash.now.alert = "O usuário não está cadastrado neste setor"
        render "new"
      elsif usuario.desativado?
        flash.delete(:recaptcha_error)
        flash.now.alert = "Usuário desativado"
        render "new"
      else
        session[:usuario_id] = usuario.id
        session[:setor_id] = params[:setor]
        flash.delete(:recaptcha_error)
        redirect_to processos_path(:setor_id => params[:setor]), notice: "Logado!"
      end
      #else
      #  flash.delete(:recaptcha_error)
      #  flash.now.alert = "Usuário ou senha inválida"
      #  render "new"
      #end
    else
      flash.delete(:recaptcha_error)
      flash.now.alert = "Usuário ou senha incorreta"
      render "new"
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to login_url, notice: "Deslogado!"
  end

end
