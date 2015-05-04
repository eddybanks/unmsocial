class GroupsController < ApplicationController

  def index
    @groups = Group.sorted                              # display all groups in ascending order
  end

  def show                                              # show information from db table on a selected group based on the group id
    @group = Group.find(params[:id])
  end

  def new                                               # display form for new group
    @group = Group.new
  end

  def create                                            # create new group once form is submitted
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = "Group created successfully!"
      redirect_to(:action => 'index')                   # redirect to group index page after group is created, render the same form otherwise
    else
      render('new')
    end
  end

  def edit                                              # display form to edit selected group
    @group = Group.find(params[:id])
  end

  def update                                            # save changes to the group database and redirect to selected group page
    @group = Group.find(params[:id])

    if @group.update_attributes(group_params)
      flash[:notice] = "Group updated successfully!"
      redirect_to(:action => 'show', :id => @group.id)
    else
      render('edit')
    end
  end

  def delete                                            # page for delete confirmation
    @group = Group.find(params[:id])
  end

  def destroy                                           # delete group
    group = Group.find(params[:id]).destroy
    flash[:notice] = "Group deleted successfully!"
    redirect_to(:action => 'index')
  end

  private

    def group_params                                      # group parameters that can be edited. this is used to prevent dangerous code from having any effects in forms
      params.require(:group).permit(:group_name, :category, :phone_number, :details)
    end

end
