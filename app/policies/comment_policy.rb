class CommentPolicy < ApplicationPolicy

   def index?
     true
   end
 
   def create?
     user.present? && user.admin?
   end
    
    def destroy?
      update?
    end
 
   def update?
     create?
   end
end
