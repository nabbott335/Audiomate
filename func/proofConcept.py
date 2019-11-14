
#Nick Abbott
#10/2/19

import os
import sys
import json
import spotipy
import webbrowser
import spotipy.util as util
from json.decoder import JSONDecodeError
#print(json.dumps(VARIABLE, sort_keys = True, indent = 4))


userID = 'nabbott335'
id = True
secret = True
url = 'http://google.com/'

#Read access to user's private playlist, Read the 
#users top tracks and artists
scope = 'playlist-modify-public user-top-read'

token = util.prompt_for_user_token(userID, scope, id, secret, url)

#create spotify object with user permission
ATW = spotipy.Spotify(auth = token)

user = ATW.current_user()
 
while True:
	choice = input("Would you like to learn and an artists? y/n \n")
	if choice == 'y':
		searcher = input("What is your favorite artist?")
		results = ATW.search(searcher,1 , 0, 'artist')
		#print(json.dumps(results, sort_keys = True, indent = 4))
		artist = results['artists']['items'][0]
		webbrowser.open(artist['images'][0]['url'])
		print("This artist's genres styles include: ")
		for i in artist['genres']:
			print(i)
		playlists = ATW.user_playlists("nabbott335", 4, 0)
		#print(json.dumps(playlists, sort_keys = True, indent = 4))
		
	elif choice == 'n':
		break
	

