class ArchivesController < ApplicationController
  def index
    #@entries = Entry.where("user_id == ?", current_user)

    @entries = Entry.where("user_id == ?", current_user)
    @entries.group_by(&:day)
  end
  def weeks
    #day = Date.new(params[:created_at])
    if (params[:beg] != nil)
      @entries = Entry.where("created_at >= ? AND created_at < ?", (params[:beg]),( params[:end])) - Entry.where("user_id != ?", current_user)
      @view_date = (params[:beg])
    else
      @entries = Entry.where("created_at >= ? AND created_at < ?  ", Date.today.midnight, Date.today.midnight + 1.day) - Entry.where("user_id != ?", current_user)
      @view_date = Date.today.midnight
    end

    #@entries = Entry.find(params[:created_at])
  end

end
