module ApplicationHelper
  def flash_message
    get_message(:notice) || get_message(:alert)
  end

  def project_total_hours(project)
    project.total_hours_in_month
  end

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end

  private

  def get_message(type)
    if flash[type]
      content_tag :div, class: "message #{type.to_s}" do
        flash[type]
      end
    end
  end
end
