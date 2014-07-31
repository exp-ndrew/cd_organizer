require 'rspec'
require 'cd_organizer'

describe "CD" do
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
