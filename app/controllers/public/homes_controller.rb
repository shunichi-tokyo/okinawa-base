class Public::HomesController < ApplicationController

  def top
    @new_posts = Post.order(created_at: :desc).limit(4)
  end
end
