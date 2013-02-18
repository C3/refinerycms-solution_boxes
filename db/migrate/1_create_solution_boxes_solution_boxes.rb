class CreateSolutionBoxesSolutionBoxes < ActiveRecord::Migration

  def up
    create_table :refinery_solution_boxes do |t|
      t.integer :screenshot_id
      t.string :title
      t.text :description
      t.string :link
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-solution_boxes"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/solution_boxes/solution_boxes"})
    end

    drop_table :refinery_solution_boxes

  end

end
