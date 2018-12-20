module ApplicationHelper
  def format_phone_number(pn)
    "(#{pn[0..2]}) #{pn[3..5]}-#{pn[6..9]}" if pn.present?
  end
end
