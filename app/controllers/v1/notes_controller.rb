class V1::NotesController < ApplicationController
  skip_before_action :ensure_authenticated_user

  def index
    count = Comment.count
    data = {
      count: count,
      time: Time.zone.now
    }
    render json: data
  end
end
