package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean_exam.Student;

public class StudentDAO {
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/mywebdb2?serverTimezone=Asia/Seoul&characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private Connection conn;
    private PreparedStatement pstat;

    public void connect() {
        try {
            if (conn != null && !conn.isClosed()) {
                return;
            }
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            throw new RuntimeException("학생 DB 연결 실패", e);
        }
    }

    public void close() {
        try {
            if (pstat != null) {
                pstat.close();
                pstat = null;
            }
            if (conn != null && !conn.isClosed()) {
                conn.close();
                conn = null;
            }
        } catch (Exception e) {
            throw new RuntimeException("학생 DB 종료 실패", e);
        }
    }

    public int insert(Student student) {
        String sql = "insert into student1(name, univ, birthdate, email) values(?, ?, ?, ?)";
        try {
            connect();
            pstat = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstat.setString(1, student.getName());
            pstat.setString(2, student.getUniv());
            pstat.setString(3, student.getBirthdate());
            pstat.setString(4, student.getEmail());
            pstat.executeUpdate();

            try (ResultSet rs = pstat.getGeneratedKeys()) {
                if (rs.next()) {
                    int id = rs.getInt(1);
                    student.setId(id);
                    return id;
                }
            }
            return student.getId();
        } catch (Exception e) {
            throw new RuntimeException("학생 등록 실패", e);
        } finally {
            closeStatement();
        }
    }

    public List<Student> getAll() {
        String sql = "select id, name, univ, birthdate, email from student1 order by id";
        List<Student> students = new ArrayList<>();
        try {
            connect();
            pstat = conn.prepareStatement(sql);
            try (ResultSet rs = pstat.executeQuery()) {
                while (rs.next()) {
                    students.add(mapRow(rs));
                }
            }
            return students;
        } catch (Exception e) {
            throw new RuntimeException("학생 목록 조회 실패", e);
        } finally {
            closeStatement();
        }
    }

    public Student findById(int id) {
        String sql = "select id, name, univ, birthdate, email from student1 where id = ?";
        try {
            connect();
            pstat = conn.prepareStatement(sql);
            pstat.setInt(1, id);
            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }
            return null;
        } catch (Exception e) {
            throw new RuntimeException("학생 상세 조회 실패", e);
        } finally {
            closeStatement();
        }
    }

    public boolean update(Student student) {
        String sql = "update student1 set name = ?, univ = ?, birthdate = ?, email = ? where id = ?";
        try {
            connect();
            pstat = conn.prepareStatement(sql);
            pstat.setString(1, student.getName());
            pstat.setString(2, student.getUniv());
            pstat.setString(3, student.getBirthdate());
            pstat.setString(4, student.getEmail());
            pstat.setInt(5, student.getId());
            return pstat.executeUpdate() > 0;
        } catch (Exception e) {
            throw new RuntimeException("학생 수정 실패", e);
        } finally {
            closeStatement();
        }
    }

    public boolean delete(int id) {
        String sql = "delete from student1 where id = ?";
        try {
            connect();
            pstat = conn.prepareStatement(sql);
            pstat.setInt(1, id);
            return pstat.executeUpdate() > 0;
        } catch (Exception e) {
            throw new RuntimeException("학생 삭제 실패", e);
        } finally {
            closeStatement();
        }
    }

    private Student mapRow(ResultSet rs) throws Exception {
        Student student = new Student();
        student.setId(rs.getInt("id"));
        student.setName(rs.getString("name"));
        student.setUniv(rs.getString("univ"));
        student.setBirthdate(rs.getString("birthdate"));
        student.setEmail(rs.getString("email"));
        return student;
    }

    private void closeStatement() {
        try {
            if (pstat != null) {
                pstat.close();
                pstat = null;
            }
        } catch (Exception e) {
            throw new RuntimeException("PreparedStatement 종료 실패", e);
        }
    }
}
