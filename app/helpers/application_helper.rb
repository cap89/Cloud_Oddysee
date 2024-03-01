module ApplicationHelper
  def time_based_greeting
    current_hour = Time.now.hour
    if current_hour < 12
      "Good Morning, '"
    elsif current_hour < 18
      "Good Afternoon, "
    else
      "Good Evening, "
    end
  end
end
