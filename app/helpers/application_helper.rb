# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def title(description)
    content_for :title do
      description
    end
  end
end
