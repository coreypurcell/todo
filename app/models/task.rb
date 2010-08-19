class Task < ActiveRecord::Base
  belongs_to :list
  acts_as_taggable_on :tags
  scope :completed, where(:completed => true)
  scope :incomplete, where(:completed => false)
  scope :archived, lambda { where("completed  = ? AND completed_on <= ?", true, Date.today - 7) }
  scope :active, lambda { where("completed_on > ? OR completed = ?", Date.today - 7, false) }
  default_scope order(:position)

  def toggle_completed
    self.update_attributes(:completed => !self.completed,
                           :completed_on => Time.now)
  end
end
