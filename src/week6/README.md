# Week6 학습 정리

- 날짜: 2026-04-08
- 학습 내용 요약:
  - `Shape` 추상 클래스를 통해 공통 속성(`x`, `y`, `rotation`)과 공통 동작 규약(`move`, `translate`, `rotate`, `getArea`, `getInfo`)을 설계했다.
  - `Rectangle`, `Triangle`, `Circle`에서 추상 메서드를 오버라이딩해 도형별 동작과 넓이 계산을 구현했다.
  - `Week6` 실행에서 `Shape[]` 배열을 사용해 다형성으로 여러 도형을 동일한 방식으로 처리하는 방법을 연습했다.
  - `InterShape` 인터페이스와 `InterfaceDemo`를 통해 추상 클래스 기반 설계와 인터페이스 기반 설계를 비교했다.
  - 생성 개수 카운트(`Shape.getTotalShapeCount()`, `InterShapeCounter`)를 통해 정적 카운터와 객체 기반 카운터의 차이를 확인했다.
