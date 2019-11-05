from django.urls import path
from . import views
from django.conf.urls import url

urlpatterns = [
	path('', views.welcome, name = 'welcome'),
	path('artistSearch', views.artistSearch, name = 'artistSearch'),
	path('listen', views.listen, name = 'soundSearch'),
	path('titleSearch', views.titleSearch, name = 'titleSearch'),
	path('lyricSearch', views.lyricSearch, name = 'lyricSearch')
]
