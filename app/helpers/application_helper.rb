module ApplicationHelper
  # VERY IMPORTANT: For use of Devise forms outside of the devise controller!
  def resource_name
    :bit
  end
  
  def resource
    @resource ||= Bit.new
  end
  
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:bit]
  end
  
  def notify(@notif)
    @notification = Notification.new({:content_id => notif.content_id, 
                                      :type => notif.type, :bit_id => notif.bit_id, 
                                      :from_id => notif.from_id})
    if @notification.save()
      1+1
    else
      flash[:alert] = "
    end
  end
end
