module ApplicationHelper

  # return the full title
  def full_title(page_title = '')
    base_title = 'Rails 5.0.0'

    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

end
