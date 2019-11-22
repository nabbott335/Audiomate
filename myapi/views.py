from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from .serializers import *
from .models import *
import spotipy
import spotipy.util as util
import requests


class HeroViewSet(viewsets.ModelViewSet):
	queryset = Hero.objects.all().order_by('name')
	serializer_class = HeroSerializer

class PlaylistViewSet(viewsets.ModelViewSet):
	queryset = Hero.objects.all().order_by('id')
	serializer_class = PlaylistSerializer
