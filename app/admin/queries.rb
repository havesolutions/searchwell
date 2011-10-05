ActiveAdmin.register Query, :as => "Question" do
  index do
    column :id
    column :email
    column :question
    column :created_at
    column :is_solved
    column :solved_by
    column :solved_at
    column :solution
    default_actions
  end

  filter :email
  filter :question
  filter :is_solved, :as => :check_boxes
  filter :created_at, :label => "Question received at"
  filter :solved_by
  filter :solved_at
end

