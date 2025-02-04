-- 
-- drop table emp02;
-- drop table mem2;
select * from mem;

create table emp02(
empno number(4) unique,
ename varchar2(30) not null,
job varchar2(9),
deptno number(2)
);

insert into emp02 values(
1, '홍길동','clerk',2
);
-- null  
insert into emp02 values(
2, '유관순',null,null
);
insert into emp02 values(
3, '강감찬',null,null
);
-- unique : 중복은 안 됨
insert into emp02 values(
2, '김구',null,null
);

drop table emp02;
select * from emp02;

-- 널 값 삭제
delete emp02 where empno is null;
commit;

-- 제약조건 변경 alter table (테이블명) modify (칼럼명)
alter table emp02 modify empno number(4) not null;
alter table emp02 modify empno;


-- not null,  pk_emp02_empno 별칭
alter table emp02 add constraint pk_emp02_empno primary key(empno);

alter table emp02 drop constraint SYS_C007463;

create table emp02(
empno number(4) primary key,
ename varchar2(30) not null,
job varchar2(9),
deptno number(2)
);

drop table mem;

create table mem (
id varchar2(30) primary key,
pw varchar2(30) not null,
name varchar2(100) default '무명',
gender varchar2(6) check(gender in ('Male', 'Female')) -- 소문자 male, female 등록 안 됨 MALE FEMALE 이런것도 안됨 / 입력시 에러
);

insert into mem values (
'aaa', '1111','홍길동','Male'
);

insert into mem values (
'bbb', '1111','유관순','Female'
);

commit;

create table board2 (
bno number(4) primary key,
btitle varchar2(1000) not null,
id varchar2 (30),
constraint fk_board2_id foreign key(id) references mem(id)
);

select * from mem;
delete mem where id ='aaa';

-- 부모키에 있는 아이디값만 넣을 수 잇음
insert into board2 values (
2, '제목1', 'abc'
);

select * from board2;
-- 부모키가 삭제되면 외래키로 등록된 값 모두 삭제
alter table board2 drop constraint fk_board2_id;
alter table board2 add constraint fk_board2_id  foreign key (id) references mem(id) on delete cascade;
-- default : on delete restricted : 부모키 삭제시 , 외래키에 등록된 값이 있으면 삭제가 되지 않음
-- on delete set null : 부모키 삭제시, 외래키로 등록된 값을 삭제하진 않고 해당되는 값만 null 처리

-- 부모테이블의 aaa 삭제시 자식테이블의 aaa글이 모두 삭제
delete mem where id = 'aaa';
select * from mem;
select * from board2;

drop table mem;
drop table board2;

create table mem (
id varchar2(30) primary key,
pw varchar2(100) not null,
name varchar2 (100),
deptno number (4)
);

insert into mem values(
'aaa', '1111', '홍길동', 10
);

insert into mem values(
'bbb', '1111', '유관순', 20
);

insert into mem values(
'ccc', '1111', '이순신', 30
);

commit;

select * from mem;

-- 10 총무부 20 인사부 30 마케팅

select id, pw, name, deptno decode (deptno, 10, '총무부', 20, '인사부', 30, '마케팅') from mem;

select * from employees;

select job_id from employees;

-- clerk : 5% 인상 / rep : 10% / man : 15% 
-- 1. clerk,rep,man 사람 검색 
select * from employees where job_id like '%CLERK' or  job_id like '%REP' or job_id like '%MAN';
select substr (job_id, 4) as j_id from employees where substr (job_id, 4)  in ('CLERK','REP', 'MAN');

select substr (job_id, 4) as j_id, decode (substr (job_id, 4), 'CLERK', salary * 1.05, 'REP', salary *1.1, 'MAN', salary * 1.15) from employees;


BH LEE (JUNGHO PD)
  오전 10:53
select substr(job_id,4) j_id , salary,
decode (substr(job_id,4),
'CLERK',salary*1.05,
'REP', salary*1.1,
'MAN',salary*1.15
) sal
from employees
where substr(job_id,4) in ('CLERK','REP','MAN')
;


create table lavel_data (
	id VARCHAR2(50) primary key,
	lavel number(1) not null
);
insert into lavel_data (id, lavel) values ('Arlen', 4);
insert into lavel_data (id, lavel) values ('Catie', 4);
insert into lavel_data (id, lavel) values ('Adoree', 5);
insert into lavel_data (id, lavel) values ('Cher', 4);
insert into lavel_data (id, lavel) values ('Dorita', 5);
insert into lavel_data (id, lavel) values ('Zulema', 1);
insert into lavel_data (id, lavel) values ('Richy', 4);
insert into lavel_data (id, lavel) values ('James', 5);
insert into lavel_data (id, lavel) values ('Aeriel', 5);
insert into lavel_data (id, lavel) values ('Reinald', 3);
insert into lavel_data (id, lavel) values ('Bernardina', 1);
insert into lavel_data (id, lavel) values ('Tiertza', 2);
insert into lavel_data (id, lavel) values ('Carolyne', 5);
insert into lavel_data (id, lavel) values ('Jonis', 1);
insert into lavel_data (id, lavel) values ('Abigael', 5);
insert into lavel_data (id, lavel) values ('Pauli', 4);
insert into lavel_data (id, lavel) values ('Sheffie', 2);
insert into lavel_data (id, lavel) values ('Tully', 2);
insert into lavel_data (id, lavel) values ('Ricard', 5);
insert into lavel_data (id, lavel) values ('Jameson', 3);
insert into lavel_data (id, lavel) values ('Thorstein', 1);
insert into lavel_data (id, lavel) values ('Arlyne', 5);
insert into lavel_data (id, lavel) values ('Mela', 5);
insert into lavel_data (id, lavel) values ('Yetta', 3);
insert into lavel_data (id, lavel) values ('Corilla', 4);
insert into lavel_data (id, lavel) values ('Adoree', 1);
insert into lavel_data (id, lavel) values ('Sabine', 3);
insert into lavel_data (id, lavel) values ('Nelson', 3);
insert into lavel_data (id, lavel) values ('Isahella', 5);
insert into lavel_data (id, lavel) values ('Mandel', 5);
insert into lavel_data (id, lavel) values ('Sasha', 4);
insert into lavel_data (id, lavel) values ('Deanne', 1);
insert into lavel_data (id, lavel) values ('Thorny', 1);
insert into lavel_data (id, lavel) values ('Jacki', 3);
insert into lavel_data (id, lavel) values ('Sibby', 2);
insert into lavel_data (id, lavel) values ('Jack', 2);
insert into lavel_data (id, lavel) values ('Chandra', 2);
insert into lavel_data (id, lavel) values ('Cecilla', 5);
insert into lavel_data (id, lavel) values ('Saunder', 1);
insert into lavel_data (id, lavel) values ('Way', 4);
insert into lavel_data (id, lavel) values ('Velma', 3);
insert into lavel_data (id, lavel) values ('Keelia', 1);
insert into lavel_data (id, lavel) values ('Clay', 4);
insert into lavel_data (id, lavel) values ('Grace', 2);
insert into lavel_data (id, lavel) values ('Maura', 5);
insert into lavel_data (id, lavel) values ('Karolina', 4);
insert into lavel_data (id, lavel) values ('Mal', 5);
insert into lavel_data (id, lavel) values ('Annette', 4);
insert into lavel_data (id, lavel) values ('Issy', 2);
insert into lavel_data (id, lavel) values ('Reid', 2);
insert into lavel_data (id, lavel) values ('Dall', 4);
insert into lavel_data (id, lavel) values ('Sukey', 2);
insert into lavel_data (id, lavel) values ('Etty', 5);
insert into lavel_data (id, lavel) values ('Kendall', 5);
insert into lavel_data (id, lavel) values ('Gibby', 4);
insert into lavel_data (id, lavel) values ('Kylila', 2);
insert into lavel_data (id, lavel) values ('Orelia', 2);
insert into lavel_data (id, lavel) values ('Alexei', 4);
insert into lavel_data (id, lavel) values ('Iorgo', 1);
insert into lavel_data (id, lavel) values ('Clive', 1);
insert into lavel_data (id, lavel) values ('Roger', 1);
insert into lavel_data (id, lavel) values ('Halette', 3);
insert into lavel_data (id, lavel) values ('Clyve', 3);
insert into lavel_data (id, lavel) values ('Peadar', 1);
insert into lavel_data (id, lavel) values ('Mose', 4);
insert into lavel_data (id, lavel) values ('Raimundo', 3);
insert into lavel_data (id, lavel) values ('Glori', 1);
insert into lavel_data (id, lavel) values ('Merrel', 2);
insert into lavel_data (id, lavel) values ('Ulberto', 2);
insert into lavel_data (id, lavel) values ('Bren', 4);
insert into lavel_data (id, lavel) values ('Ker', 2);
insert into lavel_data (id, lavel) values ('Rosalinda', 1);
insert into lavel_data (id, lavel) values ('Delphinia', 5);
insert into lavel_data (id, lavel) values ('Johnette', 3);
insert into lavel_data (id, lavel) values ('Marilyn', 3);
insert into lavel_data (id, lavel) values ('Paddy', 2);
insert into lavel_data (id, lavel) values ('Antony', 3);
insert into lavel_data (id, lavel) values ('Kinna', 5);
insert into lavel_data (id, lavel) values ('Rogers', 5);
insert into lavel_data (id, lavel) values ('Zolly', 5);
insert into lavel_data (id, lavel) values ('Lance', 1);
insert into lavel_data (id, lavel) values ('Carroll', 2);
insert into lavel_data (id, lavel) values ('Geralda', 2);
insert into lavel_data (id, lavel) values ('Riobard', 2);
insert into lavel_data (id, lavel) values ('Sunshine', 4);
insert into lavel_data (id, lavel) values ('Betteanne', 2);
insert into lavel_data (id, lavel) values ('Andrea', 1);
insert into lavel_data (id, lavel) values ('Theresina', 3);
insert into lavel_data (id, lavel) values ('Koenraad', 4);
insert into lavel_data (id, lavel) values ('Eydie', 1);
insert into lavel_data (id, lavel) values ('Karolina', 2);
insert into lavel_data (id, lavel) values ('Sutton', 5);
insert into lavel_data (id, lavel) values ('Ikey', 5);
insert into lavel_data (id, lavel) values ('Ugo', 1);
insert into lavel_data (id, lavel) values ('Mallory', 4);
insert into lavel_data (id, lavel) values ('Mariska', 2);
insert into lavel_data (id, lavel) values ('Edmund', 3);
insert into lavel_data (id, lavel) values ('Twyla', 5);
insert into lavel_data (id, lavel) values ('Laney', 5);
insert into lavel_data (id, lavel) values ('Onida', 4);

commit;

select * from lavel_data;
-- 1 : 100 / 2 : 1000 / 3: 5000/ 4: 10000/ 5 : 20000
-- point 컬럼

select id, lavel, decode (lavel,
1, 100,
2, 1000,
3, 5000,
4, 10000,
5, 20000) point from lavel_data;

-- decode는 일치하는 경우에만 사용
-- case : decode와 같은 기능이지만 비교 연산자를 사용할 수 있음
select id, pw, name, deptno, case 
when deptno = 10 then '총무부'
when deptno = 20 then '인사부'
when deptno = 30 then '마케팅'
end 
from mem;

-- 1,2,3,: 5000 4,5 : 20000
select id, lavel, decode(lavel
1, 100,
2, 1000,
3, 5000,
4, 10000,
5, 20000)||' point' as point from lavel_data;

select id, lavel,
case
when lavel >= 1 and lavel < = 3 then 5000
when lavel > = 4 then 20000
end point
from lavel_data;

select * from students;
-- avg : 90 a 80 b 70 c 60 d

select avg, case
when avg >= 90 then 'A'
when avg >= 80 then 'B'
when avg >= 70 then 'C'
when avg >= 60 then 'D'
end rank
from students;

-- 테이블 전체 복사
create table stu as select * from students;

-- 컬럼 추가
select * from stu;
alter table stu add result varchar2(2);

-- result 컬럼에 추가
update stu set result = (case
when avg >= 90 then 'A'
when avg >= 80 then 'B'
when avg >= 70 then 'C'
when avg >= 60 then 'D'
end );

-- 파이썬에서 if문 구현을 해서 처리
-- rank () over (): 순위를 구현하는 함수 
-- dense_rank() : 중복순위가 존재해도 순차적으로 다음 순위 표시
select name, total, rank() over (order by total desc) from stu;
select name, total, dense_rank (order by total desc) from stu order by no;

-- 순위를 rank 칼럼에 추가
select * from stu;
update stu a set rank = (select ranks from (select no, rank() over (order by total desc) ranks from stu order by no) b where b.no = a.no);

-- case
-- salary 5000 이하는 월급 15 인상 8000 10 인상 8000이상 5인상
select salary, case
when salary < = 5000 then salary * 1.15
when salary > 5000 and salary < = 8000 then salary * 1.1
when salary > 8000 then salary * 1.05
end up
from employees ;

-- emp_name 첫글자 D 가 포함되어 잇으면 10퍼 인상 / M 포함 5 / 없으면 0
select emp_name, salary, case
when emp_name like '%D%' then salary * 1.1
when emp_name like '%M%' then salary * 1.05
else salary
end up
from employees;

select * from employees;
select department_id, commission_pct from employees where commission_pct is not null;

-- 커미션이 있는 부서별 사원 수 출력 
select department_id,count(*) from employees  where commission_pct is not null group by department_id;

-- 부서별 사원 수
select department_id, count(*) from employees group by department_id order by department_id;

-- 부서별 평균 월급을 출력
select department_id, avg(salary) from employees group by department_id;

-- 그룹함수 비교 연산  : having 절 사용해야함
-- 부서별 평균 월급이 7000 보다 높은 사람의 인원수
select department_id, count(*) from employees having avg(salary) > 7000 group by department_id;

-- 전체 평균 월급보다 적게 받는 사원수 (전체평균 6461)
select department_id, count(*) from employees where salary < (select avg(salary) from employees ) group by department_id;


-- 평균 월급이 5000 이상인 부서별 인원수
select department_id, avg(salary), count (salary) from employees group by department_id having avg(salary) > 6000;

-- 부서별 평균 월급보다 적게 받는 사원수 
-- 부서번호, 부서별 평균 월급
select department_id, count(salary) from employees a
where salary < (select salarys from (select department_id , avg(salary) salarys from employees group by department_id) b
where a.department_id = b.department_id)
group by department_id;


--- 부서의 최대값 , 최소값 출력 / 최대값은 5000이상인 것만 부서 출력
select department_id, max(salary), min(salary) from employees group by department_id
having max(salary) > 5000
order by department_id;


-- 학번 이름 전화번호 주소 성별 학년 학기 국어 영어 수학 합계 등수
-- 1001 홍길동 010 서울 남자 1 1 100 100 100 300 1
-- 1001 홍길동 010 서울 남자 1 2 90 90 90 270 8
-- 1001 홍길동 010 서울 남자 1 3 95 95 95 285 15
-- 1001 홍길동 010 서울 남자 1 4 100 100 99 299 2


-- 부서명
select * from departments;
select * from employees ;

select emp_name,  department_name from employees as a , departments as b 
where a.department_id = b.department_id and emp_name = 'Donald OConnell';

 -- join 을 사용해야 두개의 쿠ㅓ리를 1개의 쿼리로 구성이 가능해짐
 -- join 
 -- 1. cross join : 특별한 키워드 없이 두개의 테이블을 검색하는 것
 -- 2. inner join : 두 테이블간 공통되는 존재
 -- 3. outer join
 -- 4. self join
 
 -- 1. cross join
 select * from employees ; -- 107
 select * from departments; -- 27
 
 select count (*) from employees, departments; -- 2889
 select * from employees, departments;
 
 -- 2. inner join : equi join
 select emp_name, a.department_id, department_name from employees a , departments b
 where a.department_id = b.department_id;
 -- where employees.department_id = departments.department_id(+);  -- null 값도 +해서 출력하는 것 : outer join
 
  -- 2-1 inner join : equi join 2 
 select * from member; -- 101
 select * from board; -- 4
 select bno, btitle, bcontent, a.id, email, phone, bgroup, bstep, bindent, bhit, bdate, bfile  from member a , board b
 where a.id = b.id;
 
 -- inner join
 select * from jobs;
 select employee_id, emp_name, a.job_id, job_title from jobs a, employees b where a.job_id = b.job_id and a.job_id = 'SH_CLERK';
 select * from jobs a, employees b where a.job_id = b.job_id;
 
 -- 사원번호, 사원명, 부서번호, 부서명, job_id, job_title 출력
 select a.employee_id, emp_name, b.department_id, department_name, a.job_id, job_title from employees a , departments b, jobs c
 where a.job_id = c.job_id and a.department_id = b.department_id;
 

-- member
-- board 게시물
select bno, btitle, bcontent, a.name, bgroup, bstep, bindent, bhit, bdate, bfile from member a, board b
where a.id = b.id ;
 
 -- 사원번호, 사원명, 월급 ,부서번호 부서명
 -- 월급 평균 월급보다 적은 사원 출력
 select employee_id, emp_name, salary, a.department_id, department_name from employees a, departments b
 where (select avg(salary) from employees) > salary and a.department_id = b.department_id
 order by department_id;
 
 -- 부서별 평균 월급보다 작은 사원 출력
 select employee_id, emp_name, salary, a.department_id, department_name from employees a, departments b 
 where a.department_id = b.department_id
 and salary <  (select salarys from (select department_id, avg(salary) salarys from employees group by department_id) c
 where a.department_id = c.department_id);
 
 -- 부서별 평균 월급
 select department_id, avg(salary)  from employees  group by department_id ;

 ---- job id clerk 인 사원의 사원명 사원번호 부서명 부서번호 직급번호 직급명 출력
 select emp_name, employee_id, department_name, a.department_id, a.job_id, job_title from employees a, departments b, jobs c
 where a.department_id = b.department_id and a.job_id = c.job_id and a.job_id like '%CLERK%';
 
 
 select cust_city from customers order by cust_city;
 
 -- 2000 -4000 e / 4000-6000 d / 6000-8000 c/ 8000-10000 b/ 10000 - 100000 a
 
 create table salgrade(
 grade varchar2 (10),
 losal number (6),
 hisal number (6)
 );
 
 insert into salgrade values (
 'A등급', 10001, 100000
 );
  insert into salgrade values (
 'B등급', 8001, 10000
 ); 
 insert into salgrade values (
 'C등급', 6001, 8000
 ); 
 insert into salgrade values (
 'D등급', 4001, 6000
 );
 insert into salgrade values (
 'E등급', 2000, 4000
 ); 
 
 commit;
 
 select * from salgrade;
 
 -- salary 등급을 넣으려고 함
 -- 등급 : salgrade
 -- salgrade, employees 같은 칼럼이 없음
 -- non-equi join 을 사용해 테이블 join
 select salary from employees;
 select * from salgrade;
 
 -- non-equi join : 두 테이블간 같은 칼럼이 없으면서, 두 테이블의 값을 비교해서 출력
 select emp_name, salary, grade from employees, salgrade
 where salary between losal and hisal;
 
 -- non-equi join 활용해서 students total abcdf 등급 출력
 -- 100-90 / 89-80 / 79-70 / 69-60 / 60
 -- 테이블 명 : stu_grade grade lototal hitotal
 
 create table stu_grade(
 grade varchar2 (6),
 lototal number(3),
 hitotal number(3)
 );
 
 insert into stu_grade values (
 'A',90,100
 );
  insert into stu_grade values (
 'B',80,89
 );
  insert into stu_grade values (
 'C',70,79
 );
  insert into stu_grade values (
 'D',60,69
 );
  insert into stu_grade values (
 'F',0,59
 );
 
 select name, round(avg,2), grade from students, stu_grade where avg between lototal and hitotal
 order by avg desc;
 
 select * from students;
 
 update stu set result = '';
 
 -- stu 테이블의 result 결과값을 non equi join 을 사용해서 입ㅈ력
update stu a set result = (select results from(
select no, grade as results from stu, stu_grade where avg between lototal and hitotal) b where a.no = b.no );

select * from stu;

-- self join 
select employee_id, emp_name, manager_id from employees;

select employee_id, emp_name from employees where employee_id = 124;

-- self join : 자신의 테이블 2개를 join 해서 결과값을 출력
select a.employee_id, a.emp_name, a.manager_id, b.emp_name from employees a, employees b
where a.manager_id = b.employee_id and a.manager_id = 124;