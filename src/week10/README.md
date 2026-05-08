## 학습 기록

### 2026년 5월 6일 (수요일) 학습 내용

#### 주요 학습 주제
Product 관리 시스템의 MVC 패턴 구현 및 JSP 웹 애플리케이션 개발

#### 학습 항목

**1. MVC 패턴 이해**
- Model: Product POJO + ProductService (비즈니스 로직)
- View: JSP 페이지들 (list.jsp, detail.jsp, form.jsp 등)
- Controller: ProductController 서블릿

**2. Product 클래스 구조**
- 속성: id, name, maker, price, date
- 역할: POJO를 이용한 데이터 모델링
- 위치: bean_exam/Product.java

**3. ProductService 주요 메서드**
- findAll() - 모든 상품 조회
- find(id) - 특정 상품 조회
- add(product) - 상품 등록
- update(product) - 상품 수정
- delete(id) - 상품 삭제

**4. ProductController 구현**
- HTTP 요청 처리 (GET/POST)
- URL 패턴별 요청 매핑
- 요청 흐름: 사용자 요청 → Controller → Service → Model → JSP View

**5. CRUD 기능 구현**
- Create: form.jsp → Controller → Service.add()
- Read: list.jsp (목록) / detail.jsp (상세)
- Update: 기존 데이터 수정 처리
- Delete: 상품 삭제 처리

#### 핵심 성과
✓ MVC 패턴 기본 개념 이해  
✓ CRUD 기능 구현 방식 학습  
✓ Controller와 Service 역할 분리 이해  
✓ JSP 페이지 구조 및 역할 파악  

#### 다음 학습 예정
- Database 연동 실습
- EL/JSTL 활용
- 예외 처리 및 입력값 검증
- 로깅 구현
- **라이브러리**: Apache Commons BeanUtils
- **JSTL**: Core, Formatting
- **데이터 저장**: HashMap (메모리)

---

### 2026년 5월 7일 (목요일) 학습 내용

#### 오늘 학습 요약
- 로컬 MySQL 환경에서 `mywebdb2` 데이터베이스를 기준으로 테이블 구조를 설계하고 데이터 조작을 실습했다.
- `student1` 테이블 생성 및 컬럼 추가/순서 조정 과정을 통해 DDL(ALTER TABLE) 사용법을 정리했다.
- 샘플 데이터 입력, NULL 값 일괄 업데이트, 문자열 길이 제약 처리 등 DML 실습을 진행했다.

#### 학습 항목 정리

**1. 테이블 생성 및 스키마 정의**
- `id INT AUTO_INCREMENT PRIMARY KEY`
- `surname VARCHAR(10)`
- `name VARCHAR(10)`
- `univ VARCHAR(40)`
- `birthdate DATE`
- `email VARCHAR(20)`

**2. 샘플 데이터 입력 실습**
- 한국에서 자주 쓰는 이름/대학/가상 대학 이메일 기준으로 데이터 입력
- 이메일 길이 제한(`VARCHAR(20)`)으로 인한 입력 오류를 확인하고 값 길이를 조정해 재입력

**3. 컬럼 변경 및 순서 관리**
- `birthdate` 컬럼을 `email` 앞 위치로 배치
- DBMS별 구문 차이(`BEFORE` 미지원, `AFTER` 사용)를 확인

**4. 데이터 일괄 수정**
- `birthdate IS NULL` 조건으로 2000~2010년 범위 임의 날짜를 일괄 업데이트
- 전체 레코드 조회로 반영 결과 검증

**5. 성(姓) 컬럼 확장**
- `surname` 컬럼 추가 후 한국 성씨 빈도 상위 10개를 레코드 순서대로 적용
- 기존 이름과 조합해 실제 학생 데이터 형태에 가깝게 확장

#### 핵심 정리
✓ 테이블 생성부터 구조 변경까지 SQL DDL 흐름 이해  
✓ 대량 데이터 입력/수정 시 제약조건 확인의 중요성 체감  
✓ 문자셋(UTF-8) 및 길이 제한 등 실무형 이슈 대응 경험  
✓ 조회로 결과를 검증하는 습관 정리  




