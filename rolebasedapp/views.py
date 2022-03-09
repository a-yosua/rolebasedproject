from django.http import HttpResponse
# from django.http import JsonResponse
# from .models import User, Role, User_Role, Device, Permission, Device_Permission
from django.db import connections # to get data using raw SQL queries
import json
# from django.utils import timezone
from django.template import loader

# Index page
def index(request):
    template = loader.get_template('rolebasedapp/index.html')
    context = {}
    return HttpResponse(template.render(context, request))


# View all devices that can be accessed by a particular user.
# The users is filtered by the value from 'userid' key and 
# the level of access is filtered by the value from 'permissionid'.
# For example: http://localhost:8000/rolebasedapp/users/?userid=1&permissionid=1&permissionid=3
def users(request):
    if request.method == 'GET':
        userid = request.GET.get('userid')
        permissionids = request.GET.getlist('permissionid')
        rawQuery = "SELECT \
                    u.userid, \
                    u.username, \
                    d.deviceid, \
                    d.devicename, \
                    p.permissionid, \
                    p.permissionname, \
                    r.roleid, \
                    r.rolename \
                    FROM rolebasedapp_user u \
                    INNER JOIN rolebasedapp_user_role ur \
                    ON ur.user_id = u.userid \
                    INNER JOIN rolebasedapp_role r \
                    ON ur.role_id = r.roleid \
                    INNER JOIN rolebasedapp_device_permission dp \
                    ON ur.role_id = dp.role_id \
                    INNER JOIN rolebasedapp_device d \
                    ON dp.device_id = d.deviceid \
                    INNER JOIN rolebasedapp_permission p \
                    ON dp.permission_id = p.permissionid"
        
        if userid is not None:
            if len(permissionids) > 0:
                with connections['default'].cursor() as cursor:
                    cursor.execute(rawQuery +
                        " WHERE u.userid = %s AND p.permissionid in %s",
                        [userid, tuple(permissionids)]
                    )
                    row_headers = [ header.name for header in cursor.description ]
                    rows = cursor.fetchall()
            else:
                with connections['default'].cursor() as cursor:
                    cursor.execute(rawQuery + " WHERE u.userid = %s",
                        [userid]
                    )
                    row_headers = [ header.name for header in cursor.description ]
                    rows = cursor.fetchall()
        elif userid is None:
            if len(permissionids) > 0:
                with connections['default'].cursor() as cursor:
                    cursor.execute(rawQuery +
                        " WHERE p.permissionid in %s",
                        [tuple(permissionids)]
                    )
                    row_headers = [ header.name for header in cursor.description ]
                    rows = cursor.fetchall()
            else:
                with connections['default'].cursor() as cursor:
                    cursor.execute(rawQuery)
                    row_headers = [ header.name for header in cursor.description ]
                    rows = cursor.fetchall()
        
        json_data = {
            "total": len(rows),
            "data":  [ dict(zip(row_headers, row)) for row in rows ]
        }

    return HttpResponse(json.dumps(json_data), content_type="application/json")


# View all users that can access a particular device.
# The device is filtered by the value from 'deviceid' key and 
# the level of access is filtered by the value from 'permissionid'.
# For example: http://localhost:8000/rolebasedapp/devices/?deviceid=1&permissionid=7
def devices(request):
    if request.method == 'GET':
        deviceid = request.GET.get('deviceid')
        permissionids = request.GET.getlist('permissionid')
        rawQuery = "SELECT \
                    u.userid, \
                    u.username, \
                    d.deviceid, \
                    d.devicename, \
                    p.permissionid, \
                    p.permissionname, \
                    r.roleid, \
                    r.rolename \
                    FROM rolebasedapp_user u \
                    INNER JOIN rolebasedapp_user_role ur \
                    ON ur.user_id = u.userid \
                    INNER JOIN rolebasedapp_role r \
                    ON ur.role_id = r.roleid \
                    INNER JOIN rolebasedapp_device_permission dp \
                    ON ur.role_id = dp.role_id \
                    INNER JOIN rolebasedapp_device d \
                    ON dp.device_id = d.deviceid \
                    INNER JOIN rolebasedapp_permission p \
                    ON dp.permission_id = p.permissionid"
        
        if deviceid is not None:
            if len(permissionids) > 0:
                with connections['default'].cursor() as cursor:
                    cursor.execute(rawQuery +
                        " WHERE d.deviceid = %s AND p.permissionid in %s",
                        [deviceid, tuple(permissionids)]
                    )
                    row_headers = [ header.name for header in cursor.description ]
                    rows = cursor.fetchall()
            else:
                with connections['default'].cursor() as cursor:
                    cursor.execute(rawQuery + " WHERE d.deviceid = %s",
                        [deviceid]
                    )
                    row_headers = [ header.name for header in cursor.description ]
                    rows = cursor.fetchall()
        elif deviceid is None:
            if len(permissionids) > 0:
                with connections['default'].cursor() as cursor:
                    cursor.execute(rawQuery +
                        " WHERE p.permissionid in %s",
                        [tuple(permissionids)]
                    )
                    row_headers = [ header.name for header in cursor.description ]
                    rows = cursor.fetchall()
            else:
                with connections['default'].cursor() as cursor:
                    cursor.execute(rawQuery)
                    row_headers = [ header.name for header in cursor.description ]
                    rows = cursor.fetchall()
        
        json_data = {
            "total": len(rows),
            "data":  [ dict(zip(row_headers, row)) for row in rows ]
        }

    return HttpResponse(json.dumps(json_data), content_type="application/json")

# Generate dummy data. For testing only.
# def generatetestingdata(request):
#     user_data = [
#         { 'userid': 1, 'username': 'Vijay' },
#         { 'userid': 2, 'username': 'Kumar' },
#         { 'userid': 3, 'username': 'Joseph' },
#         { 'userid': 4, 'username': 'Margaret' },
#         { 'userid': 5, 'username': 'Carol' }
#     ]

#     for user in user_data:
#         u = User()
#         u.userid = user['userid']
#         u.username = user['username']
#         u.save()
    
#     role_data = [
#         { 'roleid': 1, 'rolename': 'IT-Admin' },
#         { 'roleid': 2, 'rolename': 'Facility-Team-A' }
#     ]

#     for role in role_data:
#         r = Role()
#         r.roleid = role['roleid']
#         r.rolename = role['rolename']
#         r.save()
    
#     user_role_data = [
#         { 'user': User.objects.get(pk=1), 'role': Role.objects.get(pk=1) },
#         { 'user': User.objects.get(pk=2), 'role': Role.objects.get(pk=2) },
#         { 'user': User.objects.get(pk=3), 'role': Role.objects.get(pk=2) },
#         { 'user': User.objects.get(pk=4), 'role': Role.objects.get(pk=2) },
#         { 'user': User.objects.get(pk=5), 'role': Role.objects.get(pk=2) }
#     ]

#     # # TODO: check if data exist on this table
#     # for user_role in user_role_data:
#     #     ur = User_Role(
#     #         user=user_role['user'], 
#     #         role=user_role['role'],
#     #         lastupdate=timezone.now()
#     #     )
#     #     ur.save()

#     device_data = [
#         { 'deviceid': 1, 'devicename': 'Camera-A' },
#         { 'deviceid': 2, 'devicename': 'Camera-B' },
#         { 'deviceid': 3, 'devicename': 'Camera-C' },
#         { 'deviceid': 4, 'devicename': 'Camera-D' },
#         { 'deviceid': 5, 'devicename': 'Camera-E' }
#     ]

#     for device in device_data:
#         d = Device()
#         d.deviceid = device['deviceid']
#         d.devicename = device['devicename']
#         d.save()

#     permission_data = [
#         { 'permissionid': 1, 'permissionname': 'add-setting' },
#         { 'permissionid': 2, 'permissionname': 'read-setting' },
#         { 'permissionid': 3, 'permissionname': 'update-setting' },
#         { 'permissionid': 4, 'permissionname': 'delete-setting' },
#         { 'permissionid': 5, 'permissionname': 'read-log' },
#         { 'permissionid': 6, 'permissionname': 'delete-log' },
#         { 'permissionid': 7, 'permissionname': 'view-camera' },
#     ]

#     for permission in permission_data:
#         p = Permission()
#         p.permissionid = permission['permissionid']
#         p.permissionname = permission['permissionname']
#         p.save()
    
#     device_permission_data = [
#         { 
#             'device': Device.objects.get(pk=1),
#             'permission': Permission.objects.get(pk=1),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=1),
#             'permission': Permission.objects.get(pk=2),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=1),
#             'permission': Permission.objects.get(pk=3),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=1),
#             'permission': Permission.objects.get(pk=4),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=1),
#             'permission': Permission.objects.get(pk=5),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=1),
#             'permission': Permission.objects.get(pk=6),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=1),
#             'permission': Permission.objects.get(pk=7),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=2),
#             'permission': Permission.objects.get(pk=5),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=2),
#             'permission': Permission.objects.get(pk=6),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=2),
#             'permission': Permission.objects.get(pk=7),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=3),
#             'permission': Permission.objects.get(pk=2),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=3),
#             'permission': Permission.objects.get(pk=3),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=3),
#             'permission': Permission.objects.get(pk=5),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=3),
#             'permission': Permission.objects.get(pk=6),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=3),
#             'permission': Permission.objects.get(pk=7),
#             'role': Role.objects.get(pk=1)
#         },
#         { 
#             'device': Device.objects.get(pk=1),
#             'permission': Permission.objects.get(pk=2),
#             'role': Role.objects.get(pk=2)
#         },
#         { 
#             'device': Device.objects.get(pk=1),
#             'permission': Permission.objects.get(pk=7),
#             'role': Role.objects.get(pk=2)
#         }
#     ]

#     # # TODO: check if data exist on this table
#     # for device_permission in device_permission_data:
#     #     dp = Device_Permission(
#     #         device=device_permission['device'],
#     #         permission=device_permission['permission'],
#     #         role=device_permission['role'],
#     #         lastupdate=timezone.now()
#     #     )
#     #     dp.save()

#     data = {
#         "message": "OK"
#     }

#     return JsonResponse(data)
