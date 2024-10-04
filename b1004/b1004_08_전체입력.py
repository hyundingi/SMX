students = []

no = 1
while True:
  print("[학생성적프로그램]")
  print("-"*60)
  print("1. 학생성적입력")
  print("2. 학생성적출력")
  print("3. 학생성적수정")
  print("0. 프로그램 종료")
  print("-"*60)
  choice = input("원하는 번호를 입력하세요. >> ")

  if choice == '1':
    print("[학생성적입력]")

    while True:
      name = input(" 이름 입력(뒤로가기 : 0) : ")
      if name == '0':
       print("메뉴 화면으로 이동합니다.")
       break
      kor = int(input(" 국어 점수 입력 : "))
      eng = int(input(" 영어 점수 입력 : "))
      math = int(input(" 수학 점수 입력 : "))
      total = kor+eng+math
      avg = (kor+eng+math)/3
      rank = 0
      print(f"번호 : {no}, 이름 : {name}, 국어 : {kor}, 영어 : {eng}, 수학 : {math}, 합계 : {total}, 평균 : {avg:.2f} ")
      s = [no, name, kor, eng, math, total, avg, rank]  # s : list타입으로 저장
      students.append(s)
      no += 1

  elif choice == '2':
    print("[학생성적출력]")
    print()
    # 출력
    s_title = ['번호','이름', '국어', '영어', '수학', '합계', '평균', '등수']

    # 상단 출력
    for s in s_title:
      print(s, end="\t")
    print()
    print("-"*60)

    # 학생성적출력
    for s in students:
      print(f"{s[0]}\t{s[1]}\t{s[2]}\t{s[3]}\t{s[4]}\t{s[5]}\t{s[6]:.2f}\t{s[7]}\t")
      print()

  elif choice == '3':
    print("[학생성적수정]")
    print()

  elif choice == '0':
    print("- 프로그램 종료 - ")
    break
  


