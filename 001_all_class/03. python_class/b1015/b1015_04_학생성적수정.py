# students 리스트 타입
students = [
  {"no":1,"name":"홍길동","kor":100,"eng":100,"math":99,"total":299,"avg":99.67,"rank":0},
  {"no":2,"name":"유관순","kor":80,"eng":80,"math":85,"total":245,"avg":81.67,"rank":0},
  {"no":3,"name":"이순신","kor":90,"eng":90,"math":91,"total":271,"avg":90.33,"rank":0},
  {"no":4,"name":"강감찬","kor":60,"eng":65,"math":67,"total":192,"avg":64.00,"rank":0},
  {"no":5,"name":"김구","kor":100,"eng":100,"math":84,"total":284,"avg":94.67,"rank":0},
]
s_title = ['번호','이름','국어','영어','수학','합계','평균','등수'] #전역변수
choice = 0 # 전역변수
flag = 0
# ------- 함수선언 -------------
# 학생성적출력 함수 선언
def stu_output(s_title, students):
  print("[ 학생성적 출력 ]")
  print()
  # 상단출력
  for st in s_title:
    print(st,end="\t")
  print(); print("-"*60)
  # 학생성적출력
  for s in students:
    print(f"{s['no']}\t{s['name']}\t{s['kor']}\t{s['eng']}\t{s['math']}\t{s['total']}\t{s['avg']:.2f}\t{s['rank']}")
  print()
# -------------------------------
# 학생성적수정 함수선언
def stu_update(s_title, students):
  flag = 0 
  print("[ 학생성적수정 ]")
  name = input("찾고자 하는 학생의 이름을 입력하세요.")
  
  # 전체 학생과 비교
  for s in students:
    if name == s['name']:
      print(f'{name}학생을 찾았습니다.')
      print()
      print("[ 수정 과목 선택 ]")
      print("1. 국어점수")
      print("2. 영어점수")
      print("3. 수학점수")
      choice = input("원하는 번호를 입력하세요.>> ")
      if choice == '1':
        print(f'현재 국어 점수 : {s['kor']}')
        s['kor'] = int(input('변경 국어 점수 입력 >> '))
      elif choice == '2':
        print(f'현재 영어 점수 : {s['eng']}')
        s['eng'] = int(input('변경 영어 점수 입력 >> '))
      elif choice == '3':
        print(f'현재 수학 점수 : {s['math']}')
        s['math'] = int(input('변경 수학 점수 입력 >> '))
      s['total'] = s['kor']+s['eng']+s['math']
      s['avg'] = s['total']/3

      print(f'{name}학생 성적이 수정되었습니다.')

      # 수정된 학생 성적 출력
      stu_output(s_title, [s])
      flag = 1
    # 찾는 학생이 없을 때
  if flag == 0:
    print(f'{name}학생이 없습니다. 다시 입력하세요. >> ')

choice = input('원하는 번호를 선택하세요. >> ')

if choice == '3':
  stu_update(s_title, students)