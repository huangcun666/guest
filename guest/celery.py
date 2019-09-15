from celery import Celery
import os
from django.conf import settings
from celery.schedules import crontab
from datetime import timedelta
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'guest.settings')
app=Celery('guest')
app.config_from_object('django.conf:settings')
app.autodiscover_tasks(settings.INSTALLED_APPS)
#  celery -A guest.celery worker -l info --beat 启动方式worker和beat一起启动
app.conf.update( 
CELERYBEAT_SCHEDULE = {
    'add-every-30-seconds': {
        'task': 'sign.tasks.add',
        'schedule': timedelta(seconds=30),
        'args': (16, 16)
    },
}
)
