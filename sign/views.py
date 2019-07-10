from django.shortcuts import render
from django.http import HttpResponse,HttpResponseRedirect
from django.contrib import  auth
from django.contrib.auth.decorators import login_required
from sign.models import *
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger
from sign.tasks import add
from guest.celery import app
# Create your views here.
import time
import pymysql
connection = pymysql.connect(host='127.0.0.1',
user='root',
password='123',
db='guest',
charset='utf8mb4',
cursorclass=pymysql.cursors.DictCursor)
cursor=connection.cursor()

def index(request):
    s=add.delay(10,6)
    return render(request,'index.html',{'s':s.get()})

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
    
    cursor.execute('''
    select * from sign_event where name like "%'''
    +search_name+
    '''%" 
    ''')
    event_list=cursor.fetchall()

    return render(request,'event_manage.html',{
        'username':username,
        'event_list':event_list
    })

@login_required
def guest_manage(request):
    username=request.session.get('user','')
    guest_list = Guest.objects.all()
    paginator=Paginator(guest_list,2)
    page=request.GET.get('page')
    try:
        contacts=paginator.page(page)
    except PageNotAnInteger:
        contacts=paginator.page(1)
    except EmptyPage:
        contacts=paginator.page(paginator.num_pages)
    return render(request,'guest_manage.html',
    {'username':username,
     'guests':contacts
    })