class PostPolicy < ApplicationPolicy
    attr_reader :user, :post

    def initialize(user, post)
     @user = user
      @post = post
    end

    def create?
      if user.present?
        user.author? || user.editor?
      end
    end
    alias_method :update?, :create?

    def destroy?
      if user.present?
        user.editor?
      end
    end

    def publish?
      if user.present?
        user.editor?
      end
    end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      elsif user.present? && user.author?
        scope.where(:author_id => user.id) || scope.published
      else
        scope.where(:published => true)
      end
    end
  end
end
