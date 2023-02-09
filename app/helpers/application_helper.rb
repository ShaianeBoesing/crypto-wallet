module ApplicationHelper
  def date_br(date = nil)
    date ||= Date.today
    date.strftime("%d/%m/%Y")
  end

  def locale(locale) 
    I18n.locale == :en ? "United States of America" : "Brazil"
  end
end
