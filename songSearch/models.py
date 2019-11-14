from django.db import models
import json
import spotipy
import spotipy.util as util
import webbrowser
# Create your models here.
class ArtistSearch(models.Model):
	userID = 'nabbott335'
	id = '6b7934de7fd546bf88271e746e9565dc'
	secret = 'd89083c2ef7847c1aa801270f0bb85f8'
	uri = 'http://google.com/'
	scope = 'playlist-modify-public user-top-read'
	token = util.prompt_for_user_token(userID, scope, id, secret, uri)
	ATW = spotipy.Spotify(auth = token)
	def search(artist):
		searcher = input("What is your favorite artist?")
		results = ATW.search(searcher,1 , 0, 'artist')
		artist = results['artists']['items'][0]
		webbrowser.open(artist['images'][0]['url'])
		print("This artist's genres styles include: ")
		for i in artist['genres']:
			print(i)
		