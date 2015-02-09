class Admin::AdminsController < Admin::AdminController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  # GET /admin/admins
  def index
    @admins = Admin.all
  end

  # GET /admin/admins/1
  def show
  end

  # GET /admin/admins/new
  def new
    @admin = Admin.new
  end

  # GET /admin/admins/1/edit
  def edit
  end

  # POST /admin/admins
  def create
    @admin = Admin.new(admin_params)
    @admin.password = SecureRandom.urlsafe_base64
    if @admin.save
      redirect_to [:admin, @admin], notice: 'Admin was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/admins/1
  def update
    updated = admin_params[:password] ? @admin.update_with_password(admin_params) : @admin.update(admin_params)
    if updated
      sign_in @admin, :bypass => true if admin_params[:password]
      redirect_to [:admin, @admin], notice: 'Admin was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/admins/1
  def destroy
    @admin.destroy
    redirect_to admin_admins_url, notice: 'Admin was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      if current_admin == @admin
        params.require(:admin).permit(:name, :email,:current_password, :password, :password_confirmation).delete_if {|k,v| v.blank?}
      else
        params.require(:admin).permit(:name, :email).delete_if {|k,v| v.blank?}
      end
    end
end