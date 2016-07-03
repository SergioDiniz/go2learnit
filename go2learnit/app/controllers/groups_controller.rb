class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :authorized_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.select(:id, :title, :description, :created_at).joins(:user).select(:first_name, :avatar).all #.includes(:user).references(:user)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @groups}
    end

  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.select(:id, :title, :description, :created_at).joins(:user).select(:first_name, :avatar).find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @group}
    end
  end

  # GET /groups/new
  def new
    @group = current_user.groups.build
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = current_user.groups.build(group_params_create)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params_update)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
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
    def group_params_create
      params.require(:group).permit(:title, :description)
    end

    def group_params_update
      params.require(:group).permit(:title, :description, :title,
                                    :description, :custon_address, :group_type)
    end

    def authorized_user
      @group_ax = current_user.groups.find_by(id: params[:id])
      redirect_to @group, notice: "You aren't authorized to edit this Group!" if @group_ax.nil?
    end
end
