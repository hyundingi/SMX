stu_key = ['no', 'name', 'kor', 'eng','math', 'total', 'avg', 'rank']
students = []

# 파일 읽기 r
f = open('C:/workspace/SMClasss/b1016/a.txt','r',encoding='utf-8')
while True:
  line = f.readline()
  if not line: break
  s = line.strip().split(',')
  for i in range(len(s)):
    if i == 1:
      continue
    elif i == 6:
      s[6] = float(s[6])
    else:
      s[i] = int(s[i])

  # s[0] = int(s[0])
  # s[2] = int(s[2])
  # s[3] = int(s[3])
  # s[4] = int(s[4])
  # s[5] = int(s[5])
  # s[6] = float(s[6])
  # s[7] = int(s[7])
  students.append(dict(zip(stu_key,s)))
  print(line)

print(students)
f.close()