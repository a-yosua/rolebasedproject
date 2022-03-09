from pyexpat import model
from django.db import models
from django.utils import timezone


class User(models.Model):
    userid = models.IntegerField(primary_key=True)
    username = models.CharField(max_length=30)


class Role(models.Model):
    roleid = models.IntegerField(primary_key=True)
    rolename = models.CharField(max_length=30)


class User_Role(models.Model):
    user = models.ForeignKey('User', on_delete=models.CASCADE)
    role = models.ForeignKey('Role', on_delete=models.CASCADE)
    lastupdate = models.DateTimeField(default=timezone.now)


class Device(models.Model):
    deviceid = models.IntegerField(primary_key=True)
    devicename = models.CharField(max_length=30)


class Permission(models.Model):
    permissionid = models.IntegerField(primary_key=True)
    permissionname = models.CharField(max_length=30)


class Device_Permission(models.Model):
    device = models.ForeignKey('Device', on_delete=models.CASCADE)
    permission = models.ForeignKey('Permission', on_delete=models.CASCADE)
    role = models.ForeignKey('Role', on_delete=models.CASCADE)
    lastupdate = models.DateTimeField(default=timezone.now)