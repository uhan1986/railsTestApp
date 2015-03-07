class GroupAdmin::TopController < ApplicationController

  def index
    @group = Group.first
    p @group

    @recent_events = Event.where("start_date >= ?", Time.now)
    						.where(group_id: @group.id)
    						.order(start_date: :desc)
    						.limit(15)
    p @recent_events


  end
end
