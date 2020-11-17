module ApplicationHelper


 def can_edit?(user)
  logged_in? && current_user == user
 end

end
