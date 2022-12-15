class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def remote_ip
        if request.remote_ip == '127.0.0.1'
          # Hard coded remote address
          "91.232.101.17"
        else
          request.remote_ip
        end
    end
end
