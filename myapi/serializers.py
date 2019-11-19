from rest_framework import serializers

from .models import Hero
from .models import Playlist

class HeroSerializer(serializers.HyperlinkedModelSerializer):
	class Meta:
		model = Hero
		fields = ('name', 'alias')

class PlaylistSerializer(serializers.HyperlinkedModelSerializer):
	class Meta:
		model = Playlist
		fields = ('playlistName', 'playlistOwner', 'playlistURL', 'playlistMosaic',
			'playlistID')
