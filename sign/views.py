from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib import  auth
from django.contrib.auth.decorators import login_required
from sign.models import Event
# Create your views here.
import pymysql
connection = pymysql.connect(host='127.0.0.1',
user='root',
password='123',
db='guest',
charset='utf8mb4',
cursorclass=pymysql.cursors.DictCursor)
cursor=connection.cursor()
def index(request):
    return render(request,'index.html')

def login_action(request):
    if request.method=='POST':
        username=request.POST.get('username','')
        password=request.POST.get('password','')
        user=auth.authenticate(username=username,password=password)
        if user is not None:
            auth.login(request,user)
            response=HttpResponseRedirect('/event_manage/')
            # response.set_cookie('user',username,3600)\
            request.session['user']=username

            return response
        else:
            return render(request,'index.html',
            {'error':'username or password error'})

@login_required
def event_manage(request):
    # username=request.COOKIES.get('user','')
    cursor.execute('''
    select * from sign_event
    ''')
    event_list=cursor.fetchall()
    username=request.session.get('user','')
    return render(request,'event_manage.html',
    {'user':username,
     'event_list':event_list})

@login_required
def search_name(request):
    username=request.session.get('user','')
    search_name=request.GET.get('name','')
    
    event_list=Event.objects.filter(address__contains=search_name)
    return render(request,'event_manage.html',{
        'username':username,
        'event_list':event_list
    })