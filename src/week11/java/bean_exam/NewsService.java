package bean_exam;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

public class NewsService {
    private final HashMap<Integer, News> newsMap;
    private int nextId = 4;

    public NewsService() {
        newsMap = new HashMap<>();

        newsMap.put(1, new News(1, "Spring Boot 3 정리", "Spring Boot 3의 핵심 변경 사항을 정리한 기사입니다.", "관리자", "2026-05-10"));
        newsMap.put(2, new News(2, "JSP MVC 실습", "Servlet과 JSP를 분리한 MVC 구조를 실습했습니다.", "편집부", "2026-05-11"));
        newsMap.put(3, new News(3, "MySQL 연동 팁", "JDBC 연결과 PreparedStatement 사용법을 정리했습니다.", "기자", "2026-05-12"));
    }

    public List<News> findAll() {
        List<News> newsList = new ArrayList<>(newsMap.values());
        newsList.sort(Comparator.comparingInt(News::getId));
        return newsList;
    }

    public News find(int id) {
        return newsMap.get(id);
    }

    public int add(News news) {
        int id = nextId;
        news.setId(id);
        newsMap.put(id, news);
        nextId++;
        return id;
    }

    public boolean update(News news) {
        if (newsMap.containsKey(news.getId())) {
            newsMap.put(news.getId(), news);
            return true;
        }
        return false;
    }

    public boolean delete(int id) {
        if (newsMap.containsKey(id)) {
            newsMap.remove(id);
            return true;
        }
        return false;
    }
}