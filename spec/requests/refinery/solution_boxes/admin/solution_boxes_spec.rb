# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "SolutionBoxes" do
    describe "Admin" do
      describe "solution_boxes" do
        login_refinery_user

        describe "solution_boxes list" do
          before do
            FactoryGirl.create(:solution_box, :title => "UniqueTitleOne")
            FactoryGirl.create(:solution_box, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.solution_boxes_admin_solution_boxes_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.solution_boxes_admin_solution_boxes_path

            click_link "Add New Solution Box"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::SolutionBoxes::SolutionBox.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::SolutionBoxes::SolutionBox.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:solution_box, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.solution_boxes_admin_solution_boxes_path

              click_link "Add New Solution Box"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::SolutionBoxes::SolutionBox.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:solution_box, :title => "A title") }

          it "should succeed" do
            visit refinery.solution_boxes_admin_solution_boxes_path

            within ".actions" do
              click_link "Edit this solution box"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:solution_box, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.solution_boxes_admin_solution_boxes_path

            click_link "Remove this solution box forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::SolutionBoxes::SolutionBox.count.should == 0
          end
        end

      end
    end
  end
end
