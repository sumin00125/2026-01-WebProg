# Week9 학습 정리

## 2026년 4월 29일

### 학습 내용
- JSP form에서 `POST` 방식으로 `calc.jsp`에 값을 전송하는 계산기 예제를 작성했다.
- `bean_exam.Calculator` 클래스를 만들고, `calc()` 메소드에서 사칙연산과 예외 처리를 구현했다.
- JSP 액션태그 `jsp:useBean`을 사용해 Java Bean을 호출하는 방법을 학습했다.
- UTF-8 인코딩 설정과 실수 입력 처리 방법을 적용했다.
- JSTL의 `c:if`, `c:choose`, `c:when`, `c:otherwise`, `c:forEach`, `c:forTokens`를 사용한 예제를 작성했다.
- EL로 동일한 내용을 출력하는 방법을 함께 비교했다.
- 문자열 배열과 숫자 배열을 만들어 `forEach`로 출력하는 방법을 확인했다.

## 2026년 5월 1일

### 학습 내용
- `CalcController` 서블릿을 만들어 `calcControl` 요청을 처리하고, `BeanUtils.populate()`로 `Calculator` 객체를 채우는 MVC 흐름을 구현했다.
- 계산 결과는 `calcResult.jsp`에서 EL로 출력하도록 분리했다.
- `Product` POJO를 만들고, `ProductService`에서 `HashMap` 기반으로 5개의 휴대폰 제품 정보를 관리하는 방법을 학습했다.
- `findAll()`과 `find(String id)` 메소드를 통해 전체 조회와 단건 조회 패턴을 정리했다.
