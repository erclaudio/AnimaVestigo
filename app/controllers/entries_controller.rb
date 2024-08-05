class EntriesController < ApplicationController
  def index
    @entries = Entry.all()
  end

  def new
    @entry = Entry.new()
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save()
      redirect_to all_path
    else 
      render :new
    end
  end

  def entry_params
    params.require(:entry).permit(:name)
  end
end
