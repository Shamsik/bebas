module ErrorsHelper
  
  def validation_errors!(attr)

    if attr.errors.empty?

      return ""

    else

      messages = attr.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
      sentence = I18n.t("errors.messages.not_saved")

      html = <<-HTML
        <div data-alert class="alert-box">
          #{sentence}
          #{messages}
          <a href="#" div class="close">&times;</a>
        </div>
      HTML

      html.html_safe

    end
    
  end 
  
end
