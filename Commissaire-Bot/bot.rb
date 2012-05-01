require 'rubygems'
require 'chatterbot/dsl'

to_find = /ta+p+e+t+e+/i
search("#{to_find}") do |reply_to|
  reply "@#{tweet_user(reply_to)} Monsieur n’est pas une tapette. Monsieur est commissaire de police.", reply_to
end
