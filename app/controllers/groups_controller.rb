class GroupsController < ApplicationController
	
  def index
		@groups = Group.all
	end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
  end

  def new

    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to group_path(@group), alert: '创建成功'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])    
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
        redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to groups_path
    end
  end

  private
    
    def group_params
      params.require(:group).permit(:title, :description)
    end
end
