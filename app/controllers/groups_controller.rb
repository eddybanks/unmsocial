class GroupsController < ApplicationController

  def index
    @groups = Group.sorted
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(group_params)
      redirect_to(:action => 'show', :id => @group.id)
    else
      render('edit')
    end
  end

  def delete
    @group = Group.find(params[:id])
  end

  def destroy
    group = Group.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  private

    def group_params
      params.require(:group).permit(:group_name, :category, :phone_number, :details)
    end

end
