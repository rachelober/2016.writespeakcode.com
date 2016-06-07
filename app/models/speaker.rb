class Speaker < ActiveYaml::Base
  use_multiple_files
  set_root_path Rails.root.join("app","models", "speakers")

  def self.all_filenames
    ext = ".yml"
    Dir.glob(self.root_path.join("*.yml")).map do |f|
      File.basename(f, ext)
    end
  end
  set_filenames *(all_filenames)

  def twitter_url
    "http://twitter.com/#{twitter}" unless twitter.nil? || twitter.empty?
  end

  def github_url
    "http://github.com/#{github}" unless github.nil? || github.empty?
  end

  def social_info
    {
      twitter: twitter_url,
      github: github_url,
      linkedin: linkedin,
      link: website
    }.compact
  end

  def display_title
    dt = title.to_s
    dt += ", " unless dt.empty?
    dt += company
  end
end
