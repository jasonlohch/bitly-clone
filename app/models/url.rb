require 'uri'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
  validates :long_url, uniqueness: true, format: { :with => URI::regexp(['http','https']), :message => "is an invalid URL"}
end
