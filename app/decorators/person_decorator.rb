class PersonDecorator < Draper::Decorator
  delegate_all

  def twitter_url
    "http://twitter.com/#{twitter}" if twitter.present?
  end

  def github_url
    "http://github.com/#{github}" if github.present?
  end

  def social_info
    {
      twitter: twitter_url,
      github: github_url,
      linkedin: linkedin,
      link: website
    }.compact
  end

  def title
    [job_title, company].compact.join(', ')
  end

  def photo_path
    "speaker-headshots/#{image_filename}" unless image_filename.nil?
  end
end
