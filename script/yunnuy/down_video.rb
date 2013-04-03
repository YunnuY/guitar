# encoding: utf-8

require 'rubygems'
require 'active_record'
#require 'mysql'
require 'nokogiri'
require 'open-uri'
require 'logger'
require 'yaml'

rails_root = File.dirname( File.absolute_path( __FILE__ ) ) + "/../.."
require_relative "#{rails_root}/app/models/episode"

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database  => "#{rails_root}/db/development.sqlite3"
)

#For mysql
#ActiveRecord::Base.establish_connection(
#  :adapter => "mysql",
#  :host    => "localhost",
#  :username=> "root",
#  :password=> "root_123",
#  :database=> "guitar",
#  :encoding=> "utf8"
#)


module Flvcd
  # get the download link from play link using the service provided by Flvcd
  def self.convert( url )
    convert_service = "http://www.flvcd.com/parse.php?format=&kw=#{url}"
    open(URI::encode(convert_service)) do |result|
      doc = Nokogiri::HTML(result, nil, 'gb2312')
      return doc.css('a')[6]['href']
    end
  end
end

module Soku
  def self.search( keyword )
    search_url = "http://www.soku.com/search_video/q_#{keyword}"
    open(URI::encode(search_url)) do |result|
      doc = Nokogiri::HTML(result, 'utf-8')
  # a "ul" with class "v" contains a search result
      doc.css('ul[class=v]').each_with_index do |ul, index|
        video = Episode.new
        video.title       = ul.css('li.v_title').css('a')[0]['title'].strip  #css always returns a array so need [0]
        vid_id  = ul.css('li.v_title').css('a')[0]['_log_vid'].strip  
        video.play_url = "http://player.youku.com/player.php/sid/" + vid_id + "/v.swf"  
        video.thumb_pic_url = ul.css('li.v_thumb').css('img')[0]['src'].strip
#        video.Uploader    = ul.css('li.v_user').css('a').text.stripdd
#        video.Duration    = ul.css('li.v_time').css('span.num').text.strip
#        video.upload_time = ul.css('li.v_pub').css('span').text.strip
#        video.PlayCount    = ul.css('li.v_stat').css('span.num').text.strip
#        puts "%4s : [ %s ]" % [index, video.Title]
        video.save
      end
    end
   # File.open( VIDEOS, "w") do |io| 
    #    YAML.dump( videos, io) 
   # end 
   # puts "see result at #{VIDEOS}"
  end
end

Soku::search("吉他")

# TODO: download video using flvcd_url in VIDEO 

#exec "wget -U Mozilla #{final_url} -O #{search_word}'_video'"}
