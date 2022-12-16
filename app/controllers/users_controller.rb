class UsersController < ApplicationController
    
     def create
      ip = remote_ip()
      city = Geocoder.search(ip).first.city
      @user = User.new(email: params[:email], city: city)
      if @user.save 
        WeatherReportMailer.daily_weather_report(@user).deliver_now
        flash[:success] = "Your subscription is successfully done !! Check your email . "
        redirect_to root_path
      else 
         flash[:danger]="Invalid Email! Please try again."
         redirect_to root_path
      end
        
     end

     def unsubscribe
      user = User.find(params[:user])
      user.destroy 
      flash[:success] = "You Unsubscribe !"
      redirect_to root_path
     end

end
