from django.urls import path

from . import views

urlpatterns = [
    path('users/', views.users, name='users'),
    path('devices/', views.devices, name='devices'),
    # path('generatetestingdata/', views.generatetestingdata, name='generatetestingdata'),
    path('', views.index, name='index'),
]