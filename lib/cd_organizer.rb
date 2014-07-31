class CD
  @@all_cds = {} #{CD => [Artist, Artist]}
  @@all_artists = {} #{Artist => [CD, CD]}

  attr_reader :cd, :artist

  def initialize(album, artist)
    @cd = album
    @artist = artist
  end

  def CD.get_cds
    @@all_cds
  end

  def CD.get_artists
    @@all_artists
  end

  def CD.add_cd(new_cd)
    if CD.get_cds.has_key?(new_cd.cd)
      CD.get_cds[new_cd.cd] << new_cd.artist
    else
      CD.get_cds.store(new_cd.cd, [new_cd.artist])
    end
  end

  def CD.add_artist(new_artist)
    if CD.get_artists.has_key?(new_artist.artist)
      CD.get_artists[new_artist.artist] << new_artist.cd
    else
      CD.get_artists.store(new_artist.artist, [new_artist.cd])
    end
  end

  def CD.clear
    @@all_cds.clear
    @@all_artists.clear
  end

end









# class Album
#   @@all_albums = [] # [{album object}, {album object}]

#   attr_reader(:album_name, :album_artist)

#   def initialize(attributes)
#     @album_name = attributes[:album_name]
#     @album_artist = attributes[:album_artist]
#     @@all_albums << self
#   end

#   def Album.get_albums
#     @@all_albums
#   end


# end

# class Artist
#   @@all_artists = [] # [{artist object}, {artist object}]

#   attr_reader(:album_name, :album_artist)

#   def initialize(attributes)
#     @album_name = attributes[:album_name]
#     @album_artist = attributes[:album_artist]
#     @@all_artists << self
#     #check if the artist exists in @@all_artists then push it if yes
#   end

#   def Artist.get_artists
#     @@all_artists
#   end
# end

  # def Artist.search(artist_to_find)
  #   if Artist.get_artists.select {|artist| artist.album_artist = artist_to_find} != nil
  #     Artist.get_artists <<
  #   else
  #     Artist.get_artists[artist.album_artist] = [artist.album_name]
  #   end
  # end
# class Artist
#   @@all_artists = {} #[{@album_artist => [@album_name, @album_name]}]

#   attr_reader(:artist)

#   def initialize(album)
#     @albums = []
#     @@all_artists[album.album_artist] = album.album_name
#   end

#   def Artist.search
#     #search function on @album_artists
#   end
# end

