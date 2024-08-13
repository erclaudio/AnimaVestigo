# app/controllers/graph_controller.rb
class GraphController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @scores = Current.user.entries.order(:created_at).pluck(:created_at, :score)
  end
end
