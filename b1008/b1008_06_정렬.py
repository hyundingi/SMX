# students == 리스트 타입
students = [
  {'no':1,'name': "홍길동",'kor':100,'eng':100,'math':99,'total':299,'avg':99.67,'rank':0},
  {'no':2,'name': "유관순",'kor':80,'eng':80,'math':85,'total':245,'avg':81.67,'rank':0},
  {'no':3,'name': "이순신",'kor':90,'eng':90,'math':91,'total':271,'avg':90.33,'rank':0},
  {'no':4,'name': "강감찬",'kor':60,'eng':65,'math':67,'total':192,'avg':64.00,'rank':0},
  {'no':5,'name': "김구",'kor':100,'eng':100,'math':84,'total':284,'avg':94.67,'rank':0},
]

print(students)
print('-'*50)
#sort() 리스트에만 사용할 수 있는 함수 
#lambda x : x[1] 
students.sort(key=lambda x:x['name']) # 딕셔너리이기 때문에 키값을 넣어줘야함
students.sort(key=lambda x:x['name'], reverse=True) # 역순으로 정렬
print(students) # 이름순으로 정렬된 출력값

### 리스트에 대한 정렬
# students = [
#   [1,"홍길동",100,100,99,299,99.67,0],
#   [2,"유관순",80,80,85,245,81.67,0],
#   [3,"이순신",90,90,91,271,90.33,0],
#   [4,"강감찬",60,65,67,192,64.00,0],
#   [5,"김구",100,100,84,284,94.67,0]
# ]

# 함수를 사용해서 정렬 (이름기준 순차정렬)
# def stu_sort(x):
#   return x[1]
# sort() >> list에서만 지원되는 정렬함수
# students.sort(key=stu_sort)
### lambda
# students.sort(key=lambda x:x[1]) # 이름기준 순차정렬 (위 함수의 한줄버전)
# students.sort(key=lambda x:x[1], reverse=True) # 이름기준 역순정렬
# students.sort(key=lambda x:x[5]) # 합계기준 순차정렬
# students.sort(key=lambda x:-x[5]) # 합계기준 역순정렬 (숫자는 -만 붙여도 됨)
# x = sorted(students, key=lambda x:x[1]) # sorted함수를 사용해서 정렬
# print(students)
# print(x)



### 정렬 정리
# aArr = [4,5,6,1,2]
# print(aArr)
# aArr.sort()  # 낮은순으로 정렬 (순차정렬)
# aArr.sort(reverse=True) # 큰순으로 정렬 (역순정렬)
# aArr.reverse # 리스트를 역순으로 출력 (거꾸로)
# print(aArr)