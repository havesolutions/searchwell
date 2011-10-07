ActiveAdmin.register Query, :as => "Question" do
  index do
    column :id
    column :email
    column :question
    column :created_at
    column "Solved/Answered", :sortable => :is_solved do |query|
      query.resolved
    end
    column :solved_by
    column :solved_at
    column :solution
    column "Actions" do |q|
      links = link_to "View", admin_question_path(q), :class => "member_link view_link"
      links += link_to "Edit", edit_admin_question_path(q), :class => "member_link edit_link" if q.is_editable?
      links += link_to "Delete", admin_question_path(q), :method => :delete, :confirm => "Are you sure?", :class => "member_link delete_link" if current_admin_user.is_super_user
      links
    end
  end

#  show do |q|
#    attributes_table do
#      row :id
#      row :email
#      row :question
#      row :created_at
#      row :is_solved do
#        q.resolved
#      end
#      row :solved_by
#      row :solved_at
#      row :solution
#    end
#    active_admin_comments
#  end

  filter :email
  filter :question
  filter :is_solved, :as => :check_boxes, :label => "Solved/Answered"
  filter :created_at, :label => "Question received at"
  filter :solved_by
  filter :solved_at
end

