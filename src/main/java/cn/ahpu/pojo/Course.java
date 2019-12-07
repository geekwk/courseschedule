package cn.ahpu.pojo;

import java.util.List;

public class Course {
    private Integer id;

    private String name;

    private Integer credit;

    private Integer period;

    private Academy academy;

    private String info;

    private List<Teacher> teacherList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public Integer getPeriod() {
        return period;
    }

    public void setPeriod(Integer period) {
        this.period = period;
    }

    public Academy getAcademy() {
        return academy;
    }

    public void setAcademy(Academy academy) {
        this.academy = academy;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public List<Teacher> getTeacherList() {
        return teacherList;
    }

    public void setTeacherList(List<Teacher> teacherList) {
        this.teacherList = teacherList;
    }

    @Override
    public String toString() {

        String str = (teacherList==null)?"":teacherList.toString();

        return "Course{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", credit=" + credit +
                ", period=" + period +
                ", academy=" + academy +
                ", info='" + info + '\'' +
                ", teacherList=" + str +
                '}';
    }
}