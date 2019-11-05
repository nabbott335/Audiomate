from django.shortcuts import render
from django.http import HttpResponse
# Create your views here.

def welcome(request):
	return(HttpResponse("Welcome to the playlists app"))
	
def listPlaylists(request):
	return(HttpResponse("List Playlists"))
	
def addToPlaylist(request):
	return(HttpResponse("Add to playlist"))
	
def createPlaylist(request):
	return(HttpResponse("Page to create new playlists"))