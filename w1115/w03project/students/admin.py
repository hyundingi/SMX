from django.contrib import admin
from students.models import Student


class StudentAdmin(admin.ModelAdmin):
  list_display = ['s_name', 's_major', 's_age']
# Register your models here.
admin.site.register(Student, StudentAdmin)