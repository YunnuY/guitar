module EpisodesHelper
  def title(episode)
    t "episode.intro.title", :id => episode.id, :published_at => episode.published_at.to_s(:db), :count => episode.comments_count
  end
  def desc(episode)
    t "episode.intro.desc" , :desc => episode.description, :duration => (episode.seconds/60).round
  end
  def video_url(ep)
    "http://media.happycasts.net/assets/episodes/videos/#{ep.asset_name}.mov"
  end
end
