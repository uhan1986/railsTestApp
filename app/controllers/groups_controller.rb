class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/mine
  def mine
    if !current_user.nil?
      @group = Group.find(current_user.id)
      render 'groups/show'
    end
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    p params
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        current_user.group_id = @group.id
        if current_user.save
          format.html { redirect_to @group, notice: 'Group was successfully created.' }
          # format.json { render :show, status: :created, location: @group }
        end
      else
        format.html { render :new }
        # format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        current_user.group_id = @group.id
        if current_user.save(validate: false)
          format.html { redirect_to @group, notice: 'Group was successfully updated.' }
          # format.json { render :show, status: :ok, location: @group }
        end
      else
        format.html { render :edit }
        # format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:group_account, :group_name, :hashed_password, :email, :description, :deleted, :suspended)
    end
end
