package cn.ahpu.pojo;

public class Teachingclass {
    private Integer id;

    private Course course;

    private Teacher teacher;

    private Integer start;

    private Integer end;

    private Integer number;

    private Integer year;

    private Integer term;

    private Integer cnt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getEnd() {
        return end;
    }

    public void setEnd(Integer end) {
        this.end = end;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public Integer getCnt() {
        return cnt;
    }

    public void setCnt(Integer cnt) {
        this.cnt = cnt;
    }

    @Override
    public String toString() {
        return "Teachingclass{" +
                "id=" + id +
                ", course=" + course.toString() +
                ", teacher=" + teacher.toString() +
                ", start=" + start +
                ", end=" + end +
                ", number=" + number +
                ", year=" + year +
                ", term=" + term +
                ", cnt=" + cnt +
                '}';
    }
}