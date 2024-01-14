package cn.wk.pojo;

public class Plan {
    private Integer id;

    private Depart depart;

    private Course course;

    private Integer level;

    private String info;

    private Integer term;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Depart getDepart() {
        return depart;
    }

    public void setDepart(Depart depart) {
        this.depart = depart;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    @Override
    public String toString() {
        return "Plan{" +
                "id=" + id +
                ", depart=" + depart +
                ", course=" + course +
                ", level=" + level +
                ", info='" + info + '\'' +
                ", term=" + term +
                '}';
    }
}