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
end
