# frozen_string_literal: true

module ApplicationHelper
  def current_year
    DateTime.now.year
  end

  def github_url(author, repo, project_name)
    link_to project_name.to_s, "https://github.com/#{author}/#{repo}", target: '_blank',
                                                                       rel: 'noopener'
  end

  def flash_message
    flash.map do |key, msg|
      content_tag :p, msg, id: key, class: 'flash alert'
    end.join.html_safe
  end
end
