module ApplicationHelper
  def auth_token
      html_str = '<input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>"/>'

      html_str.html_safe
  end
end
