require 'securerandom'

get '/' do
	@urls = Url.last(5)
	@urls.reverse!
  erb :"static/index"
end


post '/shorten' do
	@url = Url.new(long_url: params["long_url"], short_url: SecureRandom.hex(4))
	 if @url.save 
		redirect '/'
	else
		@errors = @url.errors.full_messages.join(",")
	end
	@urls = Url.last(5)
	@urls.reverse!
  	erb :"static/index"
end

# get '/:link' do
# 	@link = :link
# 	Url.all.each do |x|
# 		if @link == x.short_url
# 			redirect x.long_url
# 		else
# 			redirect '/'
# 		end
# 	end
# end

post '/:id/vote' do
	#whatever you see on the browser is the value and then the key i set to id by inserting : here

	@url = Url.find(params[:id])
	@url.visit_count += 1
	@url.save
	redirect "#{@url.long_url}"
end

get '/:shortlink' do
	@url = Url.find_by(short_url: params[:shortlink])
  	@url.visit_count += 1
  	@url.save
  	redirect @url.long_url

end




