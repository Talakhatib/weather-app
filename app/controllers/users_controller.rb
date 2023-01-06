class UsersController < ApplicationController
    
     def create
      ip = remote_ip()
      city = Geocoder.search(ip).first.city
      uri = URI('http://host.docker.internal:3001/users')
      res = Net::HTTP.post_form(uri,{"email"=>params[:email],"city"=>city})
      result = JSON.parse(res.body)
      if result["error"].present?
         flash[:danger]= result["error"]
         redirect_to root_path
      else
        flash[:success] = "Your subscription is successfully done !! Check your email . "
        redirect_to root_path
      end
     end

end
