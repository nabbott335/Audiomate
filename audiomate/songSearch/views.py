from django.shortcuts import render
from django.http import HttpResponse
from .models import ArtistSearch

# Create your views here.
def welcome(request):
	return HttpResponse("Welcome to the search app!")

def artistSearch(request):
	search = request.POST.get('textfield', None)
	return HttpResponse(ArtistSearch.search("pearl Jam"))
	#return HttpResponse("Search for Songs by artist!")

def titleSearch(request):
	return HttpResponse("Search for songs by name!")

def listen(request):
	return HttpResponse("Search for songs by audio fingerprinting!")
	
def lyricSearch():
	return HttpRespinse("Search for songs through a collection of lyrics!")