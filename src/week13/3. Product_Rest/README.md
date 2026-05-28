# week13 - Product_Rest

week10의 Product MVC 예제를 week13 폴더 구조에 맞게 복사하고 경로를 정리한 예제입니다.

REST API도 추가되어 다음 경로를 사용할 수 있습니다.

- `GET /api/products/list`
- `GET /api/products/list/{pid}`
- `DELETE /api/products/{pid}`

## 구성

- `index.jsp`: 시작 화면
- `list.jsp`: 제품 목록
- `detail.jsp`: 제품 상세
- `form.jsp`: 제품 등록 및 수정
- `error.jsp`: 오류 화면
- `java/controller`: 서블릿 컨트롤러
- `java/bean_exam`: 제품 모델과 서비스

## 동작 방식

1. `ProductController`가 목록, 상세, 등록, 수정, 삭제 요청을 처리합니다.
2. `ProductService`가 메모리 기반 `HashMap`으로 제품 데이터를 관리합니다.
3. JSP 화면은 `week13/3. Product_Rest` 경로를 기준으로 연결됩니다.

## 참고

- 이 폴더는 복사본이므로, 다른 주차의 예제와 함께 사용할 때는 서블릿 매핑 충돌 여부를 확인해야 합니다.
