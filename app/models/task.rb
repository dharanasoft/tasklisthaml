class Task < ActiveRecord::Base
  belongs_to :bucket
  belongs_to :user
  scope :pending, where(["done=? or done isnull",false])
  scope :completed, where(:done=>true)

  def complete
    unless(self.done)
      self.done=true
      self.completed_at = Time.now
      self.save
    else
      false
    end
  end
end
