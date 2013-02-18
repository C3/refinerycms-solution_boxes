module Refinery
  module SolutionBoxes
    module Admin
      class SolutionBoxesController < ::Refinery::AdminController

        crudify :'refinery/solution_boxes/solution_box', :xhr_paging => true

      end
    end
  end
end
