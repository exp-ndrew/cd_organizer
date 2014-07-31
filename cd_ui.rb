require './lib/cd_organizer'

def menu
  loop do
    puts "Press 'a' to add a new CD."
    puts "Press 'l' to list your CDs."
    puts "Press 'r' to list all artists."
    puts "Press 's' to search for a CD."
    puts "Press 'x' to exit."

    user_choice = gets.chomp
    if user_choice == "a"
      add_cd
    elsif user_choice == "l"
      list_cds
    elsif user_choice == 'r'
      list_artists
    elsif user_choice == 's'
      search
    elsif user_choice == "x"
      puts "Goodbye!"
      sleep 1
      exit
    else
      puts "That was not a valid input."
    end
  end
end

def add_cd
  puts "\n\nEnter the album name:\n\n"
  album_name = gets.chomp
  puts "\n\nEnter the album artist:\n\n"
  album_artist = gets.chomp
  new_cd = CD.new(album_name, album_artist)
  puts "Added #{album_name} by #{album_artist}!"
  puts "Press any key to continue"
  gets
  system("clear")
  puts CD.get_cds
end

def list_cds
  puts "\n\nHere are the CDs in your collection:\n\n"
  CD.get_cds.each_pair {|cd, artists| puts "#{cd} by #{artists.join(", ")}"}
  puts "\n\n"
end

def list_artists
  puts "\n\nHere are all the artists in your collection:\n\n"
  CD.get_artists.each_key {|artist| puts artist}
  puts "\n\n"
end

def search
  puts "\n\nType the album name you want to search for:\n\n"
  cd_name = gets.chomp
  if CD.search_cds(cd_name).is_a?(String)
    puts CD.search_cds(cd_name)
  else
    puts "#{CD.search_cds(cd_name)}"
  end
end
menu
