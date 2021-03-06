require 'cinch'
require 'cinch/plugins/lmgtfy'
require 'cinch/plugins/identify'
require 'cinch/plugins/joker'
require 'cinch_hangman'

Dir["./plugins/*.rb"].each {|file| require file }

bot = Cinch::Bot.new do
  configure do |c|
    #ort zum joinen
    c.nick = "dogeb0t"
    c.server = "irc.freenode.net"
    c.channels = ["#botwar", "#dogecoin-bots", "#dogecoindark"]
    c.realname = "I am a Bot using the cool cinch framework!!!"
    #plugins zum laden
    c.plugins.plugins = [
    	Cinch::Plugins::PluginManagement,
    	Cinch::Plugins::LMGTFY,
    	Cinch::Plugins::Identify,
    	Cinch::Plugins::Joker,
    	Cinch::Plugins::Hangman,
    	Cinch::Plugins::Help
    	]
    c.plugins.options = {
      Cinch::Plugins::LMGTFY => {
        "username" => "*************",
        "api_key" => "****************"
      },
      
      Cinch::Plugins::Identify => {
      	:username => "dogeb0t",
      	:password => "***********",
      	:type     => :nickserv,
      }
    }
  end
end

bot.start
