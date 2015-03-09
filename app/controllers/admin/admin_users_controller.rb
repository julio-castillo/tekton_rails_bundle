class Admin::AdminUsersController < AdminController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/admin_users
  def index
    @admin_users = AdminUser.all.paginate(:page => params[:page], per_page: 10)
  end

  # GET /admin/admin_users/1
  def show
  end

  # GET /admin/admin_users/new
  def new
    @admin_user = AdminUser.new
  end

  # GET /admin/admin_users/1/edit
  def edit
  end

  # POST /admin/admin_users
  def create
    @admin_user = AdminUser.new(admin_user_params)
    @admin_user.password = SecureRandom.urlsafe_base64
    if @admin_user.save
      redirect_to [:admin, @admin_user], notice: 'Admin user was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/admin_users/1
  def update
    updated = admin_user_params[:password] ? @admin_user.update_with_password(admin_user_params) : @admin_user.update(admin_user_params)
    if @admin_user.update(admin_user_params)
      sign_in @admin_user, :bypass => true if admin_user_params[:password]
      redirect_to [:admin, @admin_user], notice: 'Admin user was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/admin_users/1
  def destroy
    @admin_user.destroy
    redirect_to admin_admin_users_url, notice: 'Admin user was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = AdminUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      if current_admin_user == @admin_user
        params.require(:admin_user).permit(:name, :email,:current_password, :password, :password_confirmation).delete_if {|k,v| v.blank?}
      else
        params.require(:admin_user).permit(:name, :email).delete_if {|k,v| v.blank?}
      end
    end
end
