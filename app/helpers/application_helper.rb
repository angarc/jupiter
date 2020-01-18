module ApplicationHelper

  def active?(path)
    "active" if current_page?(path)
  end

  def flash_toast(message, type)
    toast_type = "error" if type == "danger"
    toast_type = "success" if type == "success"
    "<script type='text/javascript'>toastr.#{toast_type}(\"#{message}\")</script>".html_safe
  end

end
