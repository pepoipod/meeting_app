class UsersController < ApplicationController
  def index
  end

  def show
    @topics = Topic.where(user_id: current_user.id).order('created_at desc');
  end
end


=begin

push submit button

@users.users_meeting insert {user_id: current_user.id, meeting_id: @smeeting.id}

=end