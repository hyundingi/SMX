students = []
stu = {'no':1, 'name': '홍길동', 'kor':100, 'eng':100, 'math':100,
       'total': 300, 'avg': 100.0, 'rank': 0}
stu1 = {'no':1, 'name': '홍길동', 'kor':100, 'eng':100, 'math':100,
       'total': 300, 'avg': 100.0, 'rank': 0}

students.append(stu)
students.append(stu1)



students = [] # (리스트 형태)
students = {} # (딕셔너리 형태)

students['no'] = 1
students['name'] = input('이름을 입력하세요. >> ')
students['kor'] = int(input('국어 점수를 입력하세요. >> '))
students['eng'] = int(input('영어 점수를 입력하세요. >> '))
students['math'] = int(input('수학 점수를 입력하세요. >> '))
students['total'] = students['kor']+students['eng']+students['math']
students['avg'] = students['total']/3
students['rank'] = 0

print(students)