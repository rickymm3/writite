module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, { :sort => column, :direction => direction }, { :class => css_class }
  end

  def get_ancestors(cliq=nil)
    unless cliq == nil
      ancestors = cliq.ancestors
      ancestors << cliq
    end

  end

  def cliq_btn(cliq)

  end

end