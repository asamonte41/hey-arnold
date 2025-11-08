module ApplicationHelper
  # Returns "active" if the current page matches the given path
  def active_class(path)
    current_page?(path) ? "active" : ""
  end
end
