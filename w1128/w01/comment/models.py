from django.db import models
from board.models import Board
from member.models import Member

# Create your models here.
class Comment(models.Model):
  cno = models.AutoField(primary_key=True)
  board = models.ForeignKey(Board, on_delete=models.CASCADE)  # 부모가 삭제되면 자식도 모두 삭제
  member = models.ForeignKey(Member, on_delete=models.DO_NOTHING)
  cpw = models.CharField(max_length=10, null=True, blank=True)
  ccontent = models.TextField(blank=True)
  cdate = models.DateTimeField(auto_now=True)

  def __str__(self):
    return f'{self.cno},{self.ccontent},{self.cdate}'