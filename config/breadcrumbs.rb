crumb :root do
  link "Home", root_path
end

crumb :admin_users do
  link "Admin Users", admin_admin_users_path
end

crumb :admin_user do |admin_user|
  link admin_user.name, admin_admin_user_path(admin_user)
  parent :admin_users
end

crumb :new_admin_user do
  link "New Admin User", new_admin_admin_user_path
  parent :admin_users
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).