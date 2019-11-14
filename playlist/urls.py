from django.urls import path
from . import views
from django.conf.urls import url

urlpatterns = [
	path('', views.welcome, name = 'welcome'),
	path('listPlayists', views.listPlaylists, name = 'List Playlists'),
	path('addToPlaylist', views.addToPlaylist, name = 'Add to Playlist'),
	path('createPlaylist', views.createPlaylist, name = 'Create New Playlist'),
]