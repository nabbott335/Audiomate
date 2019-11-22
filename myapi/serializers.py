from rest_framework import serializers

from .models import *

class HeroSerializer(serializers.HyperlinkedModelSerializer):
	class Meta:
		model = Hero
		fields = ('name', 'alias')

class PlaylistSerializer(serializers.HyperlinkedModelSerializer):
	class Meta:
		model = Playlist
		fields = ['info']
