require 'rspec'
require 'cd_organizer'

describe "CD" do
  before do
    CD.clear
  end

  describe "initialize" do
    it "creates a cd object" do
      new_cd = CD.new("Abbey Road", "The Beatles")
      expect(new_cd).to be_an_instance_of CD
    end
  end

  describe ".add_cd" do
    it "adds a cd to the all cds hash" do
      new_cd = CD.new("Abbey Road", "The Beatles")
      CD.add_cd(new_cd)
      expect(CD.get_cds).to include("Abbey Road" => ["The Beatles"])
    end

    it "adds an artist to an existing album" do
      new_cd = CD.new("Abbey Road", "The Beatles")
      CD.add_cd(new_cd)
      newer_cd = CD.new("Abbey Road", "Some dude")
      CD.add_cd(newer_cd)
      expect(CD.get_cds).to include("Abbey Road" => ["The Beatles", "Some dude"])
    end
  end

  describe ".add_artist" do
    it "adds an artist to @all_artists hash" do
      new_artist = CD.new("Hybrid Theory", "Linkin Park")
      CD.add_artist(new_artist)
      expect(CD.get_artists).to include("Linkin Park" => ["Hybrid Theory"])
    end
    it "adds an album to an existing artist" do
      new_artist = CD.new("Hybrid Theory", "Linkin Park")
      CD.add_artist(new_artist)
      newer_artist = CD.new("Meteora", "Linkin Park")
      CD.add_artist(newer_artist)
      expect(CD.get_artists).to include("Linkin Park" => ["Hybrid Theory","Meteora"])
    end
  end


end


# describe 'Album' do
#   describe 'initialize' do
#     it("creates an album object in @@all_albums") do
#       new_album = Album.new({:album_name => "Abbey Road", :album_artist => "The Beatles"})
#       expect(Album.get_albums).to eq [new_album]
#     end
#   end
# end

# describe 'Artist' do
#   describe 'initialize' do
#     it("creates an artist object in @@all_artists") do
#       new_artist = Artist.new({:album_name => "Abbey Road", :album_artist => "The Beatles"})
#       expect(Artist.get_artists).to eq [new_artist]
#     end
#   end
# end
