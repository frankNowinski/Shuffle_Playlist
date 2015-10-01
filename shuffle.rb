# This program creates a randomly generated
# playlist, ensuring that two songs from the 
# same album do not succeed themselves.
# 
# The songs to be shuffled are stored in a 
# folder in the same directory as the program
#
def shuffle(array)
  playlist = []
  count = 0
  album = []
  previous_album = ' '
  upcoming_album = ' '
  track_number = 0
  playlist_length = array.length

  while count < playlist_length
    track_number = rand(playlist_length)

    # Determine current album
    album = array[track_number].split('/')
    upcoming_album = album[6]

    # Ensure two songs from the same album are not appended back-to-back
    if previous_album != upcoming_album

      # Add song to playlist and update previous album 
      if array[track_number] != ''
	playlist.push(array[track_number])
	previous_album = upcoming_album
	array[track_number] = ''
	count += 1
      end
    end
  end

  if count == playlist_length
    puts "Your randomly shuffled playlist was created!"
  else
    puts "Unable to create your playlist" 
  end

  playlist

  # Write the playlist to file
  filename = 'Playlist.m3u'

  File.open filename, 'w' do |f|
    f.puts playlist
  end
end

# File storing songs to be shuffled
songs = Dir['/Users/Frank/ruby/random_playlist/songs/**/*.mp3']

shuffle(songs)

