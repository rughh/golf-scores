module ApplicationHelper
  def hole_score(data)
    if data['incomplete']
      '-'
    else
      data['body'].chars.count
    end
  rescue
    '-'
  end
end
