module Refinery
  module SolutionBoxes
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::SolutionBoxes

      engine_name :refinery_solution_boxes

      initializer "register refinerycms_solution_boxes plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "solution_boxes"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.solution_boxes_admin_solution_boxes_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/solution_boxes/solution_box'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::SolutionBoxes)
      end
    end
  end
end
