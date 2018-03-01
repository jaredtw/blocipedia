class WikiPolicy < ApplicationPolicy

  def index?
  end

  def destroy?
    user.admin? || user.id == record.user_id
  end
end
