# Week12 학습 정리

## 2026년 5월 21일 (목요일)

---

## 1차시 학습 내용

### ServletContextListener / ServletContextAttributeListener 실습

- `@WebServlet("/scl")` annotation 방식으로 서블릿 요청 패턴을 지정했다.
- `@WebListener` annotation 방식으로 `ServletContextListener` 와 `ServletContextAttributeListener` 를 등록했다.
- `ServletContext` 의 `log()` 메소드와 `System.out.println()` 을 함께 사용해 호출 흐름을 확인했다.
- `/scl` 요청에서 `setAttribute("scName", "홍길동")` 를 호출해 context attribute 이벤트가 발생하도록 구성했다.
- `contextInitialized`, `contextDestroyed`, `attributeAdded`, `attributeReplaced`, `attributeRemoved` 메소드에서 동일한 방식으로 로그를 출력하도록 구현했다.

### 확인 포인트

- 애플리케이션 시작 시 `contextInitialized()` 호출 여부 확인
- `/scl` 요청 시 `setAttribute()` 에 의해 `attributeAdded()` 호출 여부 확인
- 동일 키 재설정 시 `attributeReplaced()` 동작 확인
- 애플리케이션 종료 시 `contextDestroyed()` 호출 여부 확인

### 결과 화면

![ServletContextListener 결과 화면](scl_log.jpg)
