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
"""
class SignIn(model.Models):
	id = '6b7934de7fd546bf88271e746e9565dc'
	url = 'http://127.0.0.1:2243/songSearch/'
	"""


class Playlist(models.Model):

	userID = 'nabbott335'
	id = '6b7934de7fd546bf88271e746e9565dc'
	secret = 'd89083c2ef7847c1aa801270f0bb85f8'
	url = 'http://google.com/'
	scope = 'playlist-modify-public user-top-read'
	token = util.prompt_for_user_token(userID, scope, id, secret, url)
	ATW = spotipy.Spotify(auth = token)
	playlists = ATW.user_playlists("nabbott335")
	info = []
	for i in playlists['items']:

		playlist = {
		'playlistName' : i['name'],
		'playlistOwner' : i['owner']['display_name'],
		'playlistMosaic' : i['images'][0]['url'],
		'playlistURL' : i['external_urls']['spotify'],
		'playlistID' : i['id']
		}

		info.append(playlist)
