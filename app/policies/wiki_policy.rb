class WikiPolicy < ApplicationPolicy

  def index?
    authorize Wiki
  end

  def create?
    current_user?
  end

  def edit?
    user.admin || user.id == record.user_id
  end

  def update?
    user.admin? || user.id == record.user_id
  end

  def destroy?
    user.admin? || user.id == record.user_id
  end
end
