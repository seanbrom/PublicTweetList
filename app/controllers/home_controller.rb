class HomeController < ApplicationController

  def set
    user_name = params[:user]
    
    @tweetList = Tweet.all
    if @tweetList != nil
      @tweetList.each do |tweet|
          tweet.delete
      end
    end
    
    unless Tweet.exists?([])
      Tweet.create!({
        :from_user => user_name,
        :text => Twitter.user_timeline(user_name).first.text
      })

      Tweet.create!({
        :from_user => user_name,
        :text => Twitter.user_timeline(user_name).second.text
      })

      Tweet.create!({
        :from_user => user_name,
        :text => Twitter.user_timeline(user_name).third.text
      })

      Tweet.create!({
        :from_user => user_name,
        :text => Twitter.user_timeline(user_name).fourth.text
      })

      Tweet.create!({
        :from_user => user_name,
        :text => Twitter.user_timeline(user_name).fifth.text
      })
    end
    
    @tweets = Tweet.all
  end

  def index
    respond_to do |format|
      format.html #index.html.erb
      format.json { render :json => @tweets }
    end
  end

end
