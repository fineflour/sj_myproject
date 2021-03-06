class ContactPolicy < ApplicationPolicy
  
    def index?
      true
    end

    def create?
     user.present? && user.admin?
    end

    def new?
      create?
    end

    def update?
      user.present? && (record.user == user || user.admin?)
    end

    def edit?
      update?
    end

    def destroy?
      update?
    end
  end
