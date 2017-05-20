module ApplicationHelper
  def lnil(date)
    date.nil? ? 'не указано' : l(date)
  end
  
  def breadcrumb_tag(&block)
    render 'application/breadcrumb', block: capture(&block)
  end

  def user_admin?()
     return !@current_user.roles.find_by_name("admin").nil?
  end
end
