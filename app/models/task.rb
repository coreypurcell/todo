class Task < ActiveRecord::Base
  belongs_to :list
  acts_as_taggable_on :tags
  scope :completed, where(:completed => true)
  scope :incomplete, where(:completed => false)
  default_scope order(:position)
end
