class HomeController < ApplicationController

  def set
    #set the Twitter account name from the user's input
    user_name = params[:user]
    
    #delete the current entries in the database
    @tweetList = Tweet.all
    if @tweetList != nil
      @tweetList.each do |tweet|
          tweet.delete
      end
    end
    
    #create new entries for the five most recent tweets on the user's timeline
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
    
    #collect all the tweets in an array to be iterated over in the view
    @tweets = Tweet.all
  end

  def index
    respond_to do |format|
      format.html #index.html.erb
      format.json { render :json => @tweets }
    end
  end

end
