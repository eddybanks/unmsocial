class EventsController < ApplicationController

  def index
    @events = Event.time_sort
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @time = Time.at(params[:time].to_i/1000) if params[:time]
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "Event created successfully!"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      flash[:notice] = "Event updated successfully!"
      redirect_to(:action => 'show', :id => @event.id)
    else
      render('edit')
    end
  end

  def calendar_events
    @events = Event.all
    cal = []
    @events.each do |event|
      cal << {
        id: event.id,
        title: event.name,
        description: event.details || '',
        start: event.time.iso8601
      }
    end
    render json: cal.to_json
  end

  def delete
    @group = Event.find(params[:id])
  end

  def destroy
    event = Event.find(params[:id]).destroy
    flash[:notice] = "The event '#{event.name}' was deleted successfully!"
    redirect_to(:action => 'index')
  end

  private

    def event_params
      params.require(:event).permit(:name, :venue, :time, :category, :capacity, :phone_number, :details)
    end

end
