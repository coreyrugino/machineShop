class DashboardController < ApplicationController
  def index
    @machines = Machine.all
    @users = User.all
  end
end
