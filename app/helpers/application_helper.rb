module ApplicationHelper
  def date_br(date = nil)
    date ||= Date.today
    date.strftime("%d/%m/%Y")
  end

end
