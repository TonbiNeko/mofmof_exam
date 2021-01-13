module PropertiesHelper
  def button_text
    if action_name == "new"
      "登録する"
    elsif action_name == "edit"
      "更新する"
    end
  end

  def converting_to_jpy(price)
    "#{price.to_s(:delimited, delimiter: ',')}円"
  end
end
