module RoutesHelper
  # given a duration, this method should be hours and min 

  def format_duration_hours_and_minutes(duration)
    # this is called modulo
     "#{duration / 60} hours and #{duration % 60} minutes"
  end 
end 