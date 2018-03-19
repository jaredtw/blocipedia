class UsersController < ApplicationController

  def show
    @user = current_user
    @wikis = policy_scope(Wiki)
  end

  def downgrade
    @user = current_user
    @wikis = current_user.wikis
    puts "@user: #{@user.inspect} ---- current_user: #{current_user.inspect}"
    if @user == current_user
      @wikis.update_all(private: false)
      current_user.update_attribute(:role, 'standard')

      flash[:notice] = "#{current_user.email} you're account has been downgraded"
      redirect_to edit_user_registration_path
    end
  end

end
