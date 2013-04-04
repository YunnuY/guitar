module EpisodesHelper
  def title(episode)
    t "episode.intro.title", :id => episode.id, :published_at => episode.published_at.to_s(:db), :count => episode.comments_count
  end
  def desc(episode)
    t "episode.intro.notes" , :desc => episode.notes, :duration => (episode.seconds/60).round
  end
end
