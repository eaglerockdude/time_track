module ApplicationHelper
  def active_tab(path)
    'active' if current_page?(path)
  end
end
