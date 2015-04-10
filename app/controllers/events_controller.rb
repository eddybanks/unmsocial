class EventsController < ApplicationController

  layout false

  def index
    @events = Event.sorted
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    event = Event.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  private

    def event_params
      params.require(:event).permit(:name, :venue, :time, :type, :capacity, :phone_number, :details)
    end

end
