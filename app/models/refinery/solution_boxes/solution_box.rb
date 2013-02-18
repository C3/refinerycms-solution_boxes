module Refinery
  module SolutionBoxes
    class SolutionBox < Refinery::Core::BaseModel
      self.table_name = 'refinery_solution_boxes'

      attr_accessible :screenshot_id, :title, :description, :link, :position

      acts_as_indexed :fields => [:title, :description, :link]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :screenshot, :class_name => '::Refinery::Image'
    end
  end
end
