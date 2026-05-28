# week13 - FilterExam

- 학습일: 2026-05-27
- 1차시 학습 제목: 서블릿 필터(Filter)와 요청/응답 문자 인코딩 처리

1. 서블릿 필터는 요청과 응답을 가로채 전처리/후처리를 수행하는 컴포넌트이다.
2. 필터는 `Filter` 인터페이스를 구현하고 `@WebFilter` 또는 `web.xml`에 매핑해 등록한다.
3. 요청의 문자 인코딩은 필터에서 `request.setCharacterEncoding("UTF-8")`로 일괄 처리하는 것이 권장된다.
4. `response.setCharacterEncoding` 및 `response.setContentType("text/html; charset=UTF-8")`도 필터에서 설정하면 일관된 출력 보장이 가능하다.
5. URL 매핑 패턴은 서블릿 규칙(`/path/*`, `*.ext`, 정확 매핑 등)을 따르며, 임의의 와일드카드(`/*f`)는 의도대로 동작하지 않을 수 있다.
6. 특정 서블릿에만 적용하려면 `@WebFilter(urlPatterns = {"/myf", "/newf"})`처럼 명시적으로 나열한다.
7. 필터의 `doFilter`에서 `chain.doFilter(request, response)`를 호출해야 서블릿으로 요청이 전달된다.
8. 테스트 방법: 필터가 인코딩을 설정한 경로와 설정하지 않은 경로를 브라우저로 비교해 한글 깨짐 여부를 확인한다.
9. 실무 팁: 인코딩 필터는 가장 먼저 동작하도록 설정하고, 예외 처리 및 로그를 추가해 문제 원인을 빠르게 파악한다.
10. 학습 목표: 필터의 역할과 생명주기 이해, URL 매핑 규칙 숙지, 인코딩 처리의 올바른 위치 판단을 통해 한글 출력 문제를 해결한다.
