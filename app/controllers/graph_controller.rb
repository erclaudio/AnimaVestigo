class GraphController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @scores = Current.user.entries.group("DATE(created_at)").average(:score)
  end
end
