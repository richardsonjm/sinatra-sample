class Artist

  extend Existable

  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(params = {})
    @@all << self
    @songs = []
    @genres = []
    populate_from_params if !params.empty?
  end

  def slug
    name.downcase.gsub(" ", "-")
  end

  def populate_from_params(params)
    self.name = params[:name]
    song = Song.new
    song.name= params[:song_name]
    self.add_song(song)
  end

  def self.find_by_slug(slug)
    @@all.detect{|a| a.slug == slug}
    # "SELECT * FROM artists WHERE slug = ?", slug
  end

  def genre_has_artist?(genre)
    genre && !genre.artists.include?(self)
  end

  def add_song(song)
    self.songs << song
    self.genres << song.genre if !self.genres.include?(song.genre)
    song.artist = self
    if genre_has_artist?(song.genre)
      song.genre.artists << self
    end
  end

  def self.reset_artists
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.count
    all.count
  end

end