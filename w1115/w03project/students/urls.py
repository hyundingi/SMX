from django.contrib import admin
from django.urls import path, include
from . import views

app_name='students'
urlpatterns = [
    path('write/', views.write, name='write' ),
    path('list/', views.list, name='list' ),
    path('save/', views.save, name='save' ),
]
