class Day < ActiveRecord::Base
  belongs_to :task

  def save_time(time)
    if self.actual_time.nil?
      self.actual_time = time.to_formatted_s(:only_time)
    else
      h = time.to_formatted_s(:only_hours).to_i
      m = time.to_formatted_s(:only_minutes).to_i
      s = time.to_formatted_s(:only_seconds).to_i
      self.actual_time = (self.actual_time.to_time(:utc) + h.hours + m.minutes + s.seconds).to_formatted_s(:only_time)
    end

    if self.save
      true
    end

  end
end
