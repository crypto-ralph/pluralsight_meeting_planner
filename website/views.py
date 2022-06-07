from datetime import datetime

from django.http import HttpResponse
from django.shortcuts import render

from meetings.models import Meeting


def welcome(request):
    return render(
        request, "website/welcome.html",
        {"meetings": Meeting.objects.all()}
    )


def date(request):
    return HttpResponse(f'This page was served at: {str(datetime.now())}')


def about(request):
    text = '''I\'m a not so young developer who tries to learn Python django.\n
           'I have about 4 years of experience in python development\n'''
    return HttpResponse(text)

