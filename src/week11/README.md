# Week11 학습 정리

## 2026년 5월 13일 (수요일)

### 오늘 학습 내용
- MySQL 데이터베이스와 연동한 학생 관리 CRUD 예제를 구현했다.
- `StudentController` 서블릿으로 요청을 분기하고, `StudentDAO`에서 JDBC 기반 데이터 처리를 담당하도록 구조를 분리했다.
- `BeanUtils.populate()`를 사용해 요청 파라미터를 `Student` 객체에 자동 바인딩하는 방식을 학습했다.
- 학생 목록, 등록, 수정, 삭제, 상세 조회 화면을 JSP로 나누어 역할을 분리했다.
- 오류 발생 시 `error.jsp`로 전달해 메시지를 보여주는 기본 예외 처리 흐름을 정리했다.
<<<<<<< HEAD
- 같은 구조를 활용해 메모리 기반 `NewsMVC` 예제도 추가했다.

### 학습 항목 정리

**1. MVC 구조 이해**
- Model: `Student` / `StudentDAO`
- View: `studentList.jsp`, `studentForm.jsp`, `studentInfo.jsp`, `error.jsp`
- Controller: `StudentController`

**2. JDBC DAO 구현**
- `DriverManager`를 통해 MySQL 연결을 생성했다.
- `PreparedStatement`로 insert, select, update, delete를 처리했다.
- `ResultSet`을 `Student` 객체로 변환하는 `mapRow()` 메소드를 작성했다.

**3. 학생 CRUD 기능**
- 목록 조회: 전체 학생을 테이블로 출력
- 등록: 폼 입력값을 받아 새 학생 추가
- 수정: 기존 학생 정보를 불러와 편집 후 저장
- 삭제: 선택한 학생 레코드 삭제
- 상세 조회: 특정 학생 정보를 확인하고 수정 화면으로 연결

**4. JSP 화면 분리**
- 목록 화면에서는 수정과 삭제 버튼을 함께 제공했다.
- 등록/수정 화면은 하나의 폼으로 재사용하도록 구성했다.
- 오류 페이지는 공통 메시지를 보여주는 단순한 구조로 만들었다.

**5. 데이터베이스 연동 실습**
- `mywebdb2` 데이터베이스의 `student1` 테이블을 기반으로 실습했다.
- 이름, 학교, 생년월일, 이메일 데이터를 저장하고 조회하는 흐름을 확인했다.

**6. NewsMVC 실습**
- `NewsController`를 통해 뉴스 목록, 등록, 수정, 삭제, 상세 조회를 처리했다.
- `NewsService`에서 `HashMap` 기반 메모리 저장소로 뉴스 데이터를 관리했다.
- 학생 CRUD와 동일한 MVC 흐름을 뉴스 예제에도 적용했다.

### 핵심 정리
- Servlet, DAO, JSP의 역할을 분리하는 흐름을 직접 구현했다.
- BeanUtils를 사용하면 요청 파라미터를 객체에 빠르게 주입할 수 있다.
- JDBC에서는 연결과 Statement 종료를 꼼꼼히 관리해야 한다.
- 목록, 폼, 상세, 오류 페이지를 분리하면 유지보수가 쉬워진다.
- 같은 패턴을 다른 도메인에도 그대로 확장할 수 있다.

### 다음에 이어서 볼 내용
- 검색 기능 추가
- 입력값 검증 강화
- DB 예외 처리 세분화
- EL/JSTL로 JSP 화면 개선
=======
>>>>>>> 69c1f122ccb318a2eecc791d700a38e042769f39
