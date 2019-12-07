package cn.ahpu.pojo;

public class Schedule {
    private Integer id;

    private Teachingclass teachingclass;

    private Classroom classroom;

    private Integer day;

    private Integer time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Teachingclass getTeachingclass() {
        return teachingclass;
    }

    public void setTeachingclass(Teachingclass teachingclass) {
        this.teachingclass = teachingclass;
    }

    public Classroom getClassroom() {
        return classroom;
    }

    public void setClassroom(Classroom classroom) {
        this.classroom = classroom;
    }

    public Integer getDay() {
        return day;
    }

    public void setDay(Integer day) {
        this.day = day;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public Schedule() {
    }

    public Schedule(Teachingclass teachingclass, Classroom classroom, Integer day, Integer time) {
        this.teachingclass = teachingclass;
        this.classroom = classroom;
        this.day = day;
        this.time = time;
    }
}