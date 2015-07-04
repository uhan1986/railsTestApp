class Users::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if user_signed_in?
      @users = User.where(group_id: current_user.group_id)
                  .order(id: :asc)
                  .limit(16)
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  def mine
    @user = current_user
    render 'users/users/show'
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    # if user_signed_in? && current_user.is_member_editable?
    #   @user = User.new(user_params)
    #   @user.group_id = current_user.group_id
    #
    #   respond_to do |format|
    #     if @user.save
    #       format.html { redirect_to @user, notice: 'User was successfully created.' }
    #       format.json { render :show, status: :created, location: @user }
    #     else
    #       format.html { render :new }
    #       format.json { render json: @user.errors, status: :unprocessable_entity }
    #     end
    #   end
    # else
      render 'new', error: "you have no permission to create or edit member"
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user)
              .permit(
                :account,
                :name,
                :email,
                :permission,
                :group_id,)
    end
end