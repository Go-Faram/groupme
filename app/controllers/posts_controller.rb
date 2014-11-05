class PostsController < ApplicationController
  before_action :find_group
  def new
    @post = @group.posts.build
  end

  def create
    @post = @group.posts.new(post_params)
    if @post.save
      redirect_to group_path(post_params)
    else
      render :new
    end
  end

  def edit
    @post = @group.posts.find(params[:id])
  end

  def update
    @post = @group.posts.find(params[:id])

    if @post.update(post_params)
    redirect_to group_path(@group)
    else
    render :edit
    end
  end

  def destroy
    @post = @group.posts.find(params[:id])
    @post.destroy
    redirect_to group_path(@group)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def find_group
    @gruop = Group.find(params[:group_id])
  end
end
