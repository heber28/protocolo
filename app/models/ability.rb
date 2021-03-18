class Ability
  include CanCan::Ability

  def initialize(usuario)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end

    usuario || Usuario.new # usuario nao logado  

    if usuario.nil?
      can :pesquisar, Processo
      can :visualizar, Processo
      can :pesquisar_por_git, Processo
      can :read, Setor
    else
      can :read, Processo
      can :update, Processo
      can :modify, Processo do |processo|
        processo.try(:usuario) == usuario
      end
      can :destroy, Processo do |processo|
        processo.try(:usuario) == usuario
      end
      can :editar_setor, Processo do |processo|
        processo.try(:usuario) == usuario && processo.comentarios.nil? && processo.created_at > 1.day.ago
      end
      can :mudar_setor, Processo do |processo|
        usuario.pode_alterar_setor && processo.try(:usuario) == usuario
      end

      can :create, Comentario

      can :update, Comentario do |comentario|
        c = Comentario.where(:processo_id => comentario.processo_id).order("id DESC").first
        comentario.try(:usuario) == usuario && comentario.id == c.id && comentario.created_at > 3.days.ago
      end

      can :destroy, Comentario do |comentario|
        if comentario.descricao.nil?
          true
        else
          c = Comentario.where(:processo_id => comentario.processo_id).order("id DESC").first
          comentario.try(:usuario) == usuario && comentario.id == c.id && comentario.created_at > 3.days.ago
        end
      end

      can :create, Tramite

      can :update, Tramite do |tramite|
        t = Tramite.where("processo_id = ?", tramite.processo_id).order("id DESC").first
        tramite.try(:usuario) == usuario && tramite.id == t.id && tramite.created_at > 3.days.ago
      end

      can :destroy, Tramite do |tramite|
        if tramite.setor_id.nil?
          true
        else
          t = Tramite.where("processo_id = ?", tramite.processo_id).order("id DESC").first
          tramite.try(:usuario) == usuario && tramite.id == t.id && tramite.created_at > 3.days.ago
        end
      end

      can :read, Setor

      can :pesquisar, Processo

      can :visualizar, Processo

      can :pesquisar_por_git, Processo

      can :remessa, Tramite

      can :update, Usuario, :id => usuario.id

      can :read, Usuario, :id => usuario.id

      if usuario.administrador?
        can :manage, :all
      elsif usuario.autor?
        can :create, Processo
      end
    end
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
