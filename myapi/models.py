from django.db import models
import spotipy
import spotipy.util as util
from json.decoder import JSONDecodeError

# Create your models here.
class Hero(models.Model):
	name = models.CharField(max_length=60)
	alias = models.CharField(max_length=60)

	def __str__(self):
		return self.name

class Playlist(models.Model):
	userID = 'nabbott335'
	id = '6b7934de7fd546bf88271e746e9565dc'
	secret = 'd89083c2ef7847c1aa801270f0bb85f8'
	url = 'http://google.com/'
	scope = 'playlist-modify-public user-top-read'
	token = util.prompt_for_user_token(userID, scope, id, secret, url)
	ATW = spotipy.Spotify(auth = token)
	playlists = ATW.user_playlists("nabbott335")
	#for i in playlists['items']:
	currentplaylist = playlists['items'][0]
	playlistName = currentplaylist['name']
	playlistOwner = currentplaylist['owner']['display_name']
	playlistMosaic = currentplaylist['images'][0]['url']
	playlistURL = currentplaylist['external_urls']['spotify']
	playlistTracks = currentplaylist['tracks']['href'][0]
	playlistID = currentplaylist['id']
	#playlistName = playlists['items'][0]['name']
	#playlistOwner = playlists['items'][0]['owner']['display_name']
