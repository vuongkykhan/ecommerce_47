module StaticPagesHelper
  def full_title page_title
    base_title = t ".base_title"
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def add_cus_css status
    case status
    when Settings.statuses.cancelled
      Settings.warning
    when Settings.statuses.rejected
      Settings.danger
    when Settings.statuses.approved
      Settings.success
    else
      Settings.light
    end
  end
end
