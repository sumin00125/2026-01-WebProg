package bean_exam;

public class News {
    private int id;
    private String title;
    private String content;
    private String writer;
    private String date;

    public News() {
    }

    public News(int id, String title, String content, String writer, String date) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.writer = writer;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "News [id=" + id + ", title=" + title + ", content=" + content + ", writer=" + writer + ", date=" + date + "]";
    }
}