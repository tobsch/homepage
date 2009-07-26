# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def twitter_timeline_for(user = :me)
    client = Twitter::Client.new(:login => 'tobsch', :password => '803517me')
    client.timeline_for(user)
  end
end
