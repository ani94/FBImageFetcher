require 'open-uri'
require 'rubygems'
require 'json'
require 'launchy'

class Stalker	
@@fb_string = "http://graph.facebook.com/"
	def get_profile_id(user_name)
		response = open(@@fb_string + user_name) { |r| r.read}
		response_json = JSON.parse(response)
		return response_json["id"]
	end

	def open_images(profile_id)
		new_url = "https://www.facebook.com/search/"+profile_id+"/photos-of"
		Launchy.open(new_url)
	end

end

puts "Enter the user name"
user_name = gets.chomp
s = Stalker.new()
user_id = s.get_profile_id(user_name)
s.open_images(user_id)