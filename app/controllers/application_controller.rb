class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  
  after_filter  :set_csrf_cookie_for_ng, :allow_cors

  

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  protected

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end 

  def allow_cors
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE OPTIONS}.join(",")
    headers["Access-Control-Allow-Headers"] =
      %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
    headers['Access-Control-Max-Age'] = "1728000"

    head(:ok) if request.request_method == "OPTIONS"
    #  headers['Access-Control-Allow-Origin'] = '*'
    # headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    # headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(',')
    # headers['Access-Control-Max-Age'] = '1728000'
    
  end

  # def set_device_id
  #   puts '=====set device id===='
   
  #   if Device.count > 0
  #     @device_created = Device.order("created_at").last.created_at
  #     @device_updated = Device.order("updated_at").last.updated_at
     
  #     puts @device_created
  #     puts '====updated_at'
  #     puts @device_updated
      
  #     if @device_updated > @device_created
  #       puts '===true====='
  #       session[:device_id] = Device.order("updated_at").last.id
  #     else
  #       puts '===false==='
  #       session[:device_id] = Device.order("created_at").last.id
  #     end
  #     binding.pry
  #  end


  # end
end
