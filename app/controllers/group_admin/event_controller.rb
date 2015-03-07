class GroupAdmin::EventController < ApplicationController

  def index
    @group = Group.first
    p @group

    @event = Event.where("id = ?", params[:id]).first

  end

  def events
    @group = Group.first
    p @group
    # aaaa
    @events = Event.where(group_id: @group.id)
    						.order(start_date: :desc)
    						.limit(16)
    end

  def edit
    @group = Group.first

    @event = Event.where("id = ?", params[:id]).first
	if @event.group_id != @group.id then
		flash.now.alert = '編集権限がありません'
		redirect_to :group_admin_events_path 
	end

  end
end
