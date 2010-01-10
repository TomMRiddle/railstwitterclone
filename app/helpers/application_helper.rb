module ApplicationHelper

  def img_header
  	img_header = image_tag("header.gif", :alt => "Catr - Eats tweets for breakfast", :class => "box")
  end
  # Return a title on a per-page basis.
  def title
    base_title = "Railstwitterclone"
    if @title.nil?
      base_title
    else
      "#{base_title} - #{@title}"
    end
  end
end