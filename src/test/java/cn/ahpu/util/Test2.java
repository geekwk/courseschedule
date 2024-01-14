package cn.ahpu.util;

import cn.ahpu.mapper.*;
import cn.ahpu.pojo.*;
import com.alibaba.fastjson2.JSONArray;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.*;

public class Test2 {

    ApplicationContext applicationContext = null;
    public CourseMapper getCourseMapper() {
        applicationContext = applicationContext!=null?applicationContext:new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        return (CourseMapper) applicationContext.getBean("courseMapper");
    }

    public TeacherMapper getTeacherMapper() {
        applicationContext = applicationContext!=null?applicationContext:new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        return (TeacherMapper) applicationContext.getBean("teacherMapper");
    }

    public PlanMapper getPlanMapper() {
        applicationContext = applicationContext!=null?applicationContext:new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        return (PlanMapper) applicationContext.getBean("planMapper");
    }

    public StudentMapper getStudentMapper() {
        applicationContext = applicationContext!=null?applicationContext:new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        return (StudentMapper) applicationContext.getBean("studentMapper");
    }

    public AcademyMapper getAcademyMapper() {
        applicationContext = applicationContext!=null?applicationContext:new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        return (AcademyMapper) applicationContext.getBean("academyMapper");
    }

    public TeachingclassMapper getTeachingclassMapper() {
        applicationContext = applicationContext!=null?applicationContext:new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        return (TeachingclassMapper) applicationContext.getBean("teachingclassMapper");
    }
    public ClassroomMapper getClassroomMapper() {
        applicationContext = applicationContext!=null?applicationContext:new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        return (ClassroomMapper) applicationContext.getBean("classroomMapper");
    }


    @Test
    public void f1() {
        CourseMapper courseMapper = getCourseMapper();
        System.out.println(courseMapper.getAllCourseName().toString());
        Assert.assertEquals(1,1);
    }


    @Test
    public void addTeacher() {

        TeacherMapper teacherMapper = getTeacherMapper();
        for (int i = 100;i<115;i++){
            Academy academy = new Academy();
            academy.setId(7);
            Teacher teacher = new Teacher();
            teacher.setName("教师"+(i+2));
            teacher.setUsername(""+(100002+i));
            teacher.setPassword("wang.kang");
            teacher.setAddress(".......");
            teacher.setPhone("188953765516");
            teacher.setAcademy(academy);
            //teacherMapper.addTeacher(teacher);
        }
        Assert.assertEquals(1,1);
    }

    /**
     * 添加授课教师
     * 如果某课程的授课教师数量不足两个,就随机在改开课学院的老师添加三个教师
     */
    @Test
    public void addTeacherOfCourse() {
        TeacherMapper teacherMapper = getTeacherMapper();
        CourseMapper courseMapper = getCourseMapper();
        List<Course> allCoursesCascade = courseMapper.getAllCoursesCascade();
        for (Course c : allCoursesCascade) {
            System.out.println(c.getTeacherList().toString());
            if (c.getTeacherList().size() < 2) {
                List<Teacher> teacherListOfAcademy = teacherMapper.getTeacherListOfAcademy(c.getAcademy().getName());
                List<Teacher> allTeacherOfCourse = teacherMapper.getAllTeacherOfCourseById(c.getId());
                for (int i = 0; i < 3; i++) {
                    Random random = new Random();
                    int id = random.nextInt(teacherListOfAcademy.size());
                    Teacher teacher = teacherListOfAcademy.get(id);
                    if (!allTeacherOfCourse.contains(teacher)) {
                        teacherMapper.addTeacherOfCourse(teacher.getId(), c.getId());
                        allTeacherOfCourse.add(teacher);
                    }
                }
            }
        }
        Assert.assertEquals(1,1);
    }

    /**
     * 继承培养计划
     * 例:软件工程 2017届继承2016届的培养方案
     */
    @Test
    public void extendsPlan() {

        PlanMapper planMapper = getPlanMapper();
        for (int k = 1;k<4;k++) {
            for (int j = 1; j < 8; j++) {
                List<Plan> plans = planMapper.getPlanByTerm(4, 2015, j);
                for (int i = 0; i < plans.size(); i++) {
                    Plan plan = plans.get(i);
                    System.out.println("odd===="+plan.toString());
                    plan.setLevel(plan.getLevel()+k);
                    System.out.println("new===="+plan.toString());
                    //planMapper.addPlan(plans.get(i));
                }
            }
        }
        Assert.assertEquals(1,1);
    }

    /**
     * 添加学生
     */
    @Test
    public void addStduent() {
        StudentMapper studentMapper = getStudentMapper();
        int username = 88;
        for(int clazzNumber = 5;clazzNumber<=19;clazzNumber++){
            Clazz clazz = new Clazz();
            clazz.setId(clazzNumber);
            for(int i  = 0;i<43;i++){
                Student student = new Student();
                student.setUsername(""+username);
                student.setPassword(""+username);
                student.setName("student"+username);
                student.setSex(username%2==1?"男":"女");
                student.setAge(22);
                student.setClazz(clazz);
                //studentMapper.addStudent(student);
                username++;
            }
        }
        Assert.assertEquals(1,1);
    }


    /**
     * 添加教学班
     */
    @Test
    public void addTeachingClass() {
        int year = 2018;
        int term = 2;
        String[] departId = {"1", "2", "3", "4"};
        Integer number = 0;

        int[] studentNumberOfCours = new int[100];//每个课程有多少人要上课
        final int[] t_counts = new int[450];//每个教室代课的数量

        HashMap<String, Integer> numberOfCourseHashMap = new HashMap<>();

        List<Course> allCoursesCascade = getCourseMapper().getAllCoursesCascade();

        PlanMapper planMapper = getPlanMapper();

        ArrayList<Plan> plans = new ArrayList<>();

        ArrayList<Teachingclass> teachingclasses = new ArrayList<>();
        StudentMapper studentMapper = getStudentMapper();
        CourseMapper courseMapper = getCourseMapper();
        TeacherMapper teacherMapper = getTeacherMapper();

        for (String id : departId) {
            for (int i = 0; i <= 3; i++) {
                List<Plan> planByTerm = planMapper.getPlanByTerm(Integer.parseInt(id), year - i, term + 2 * i);

                for (Plan p : planByTerm) {
                    //System.out.println(p.getDepart().getId()+"---"+p.getLevel());
                    if (numberOfCourseHashMap.containsKey("" + p.getDepart().getId() + p.getLevel())) {
                        number = numberOfCourseHashMap.get("" + p.getDepart().getId() + p.getLevel());
                    } else {
                        number = studentMapper.getStudentNumberOfDepartAndLevel(p.getDepart().getId(), p.getLevel());
                        numberOfCourseHashMap.put("" + p.getDepart().getId() + p.getLevel(), number);
                    }
                    //System.out.println(p.getCourse().getName()+"  "+number);
                    studentNumberOfCours[p.getCourse().getId()] += number;
                }
                plans.addAll(planByTerm);
            }
        }
        boolean[] flag = new boolean[100];
        for (int j = 0; j < 100; j++) {
            int i = 1;
            int maxindex = 0;
            int maxcount = 0;
            for(;i<100;i++){
                if(!flag[i] && studentNumberOfCours[i]>maxcount){
                    maxindex = i;
                    maxcount = studentNumberOfCours[i];
                }
            }
            i = maxindex;
            flag[i] = true;
            if (studentNumberOfCours[i] > 0) {
                int ceil = (int) Math.ceil(1.0 * studentNumberOfCours[i] / 90);

                Course course =courseMapper.getCourseById(i);
                System.out.println(course.getName());
                System.out.println(ceil);

                while (ceil-- > 0) {
                    int b = 100;
                    Teacher a = null;
                    //找到已安排课程量最少的老师
                    for (Teacher t : course.getTeacherList()) {
                        int id = t.getId();
                        if (t_counts[id] <= b) {
                            a = t;
                            b = t_counts[id];
                            //System.out.println(a.toString());
                        }
                    }
                    //System.out.println(a.toString());
                    t_counts[a.getId()]++;

                    Teachingclass teachingclass = new Teachingclass();
                    teachingclass.setCourse(course);
                    teachingclass.setNumber(studentNumberOfCours[i] / 90 + 1);
                    teachingclass.setTeacher(a);
                    teachingclass.setYear(year);
                    teachingclass.setTerm(term);
                    teachingclass.setStart(1);
                    teachingclass.setEnd(16);
                    teachingclasses.add(teachingclass);
                }
            }
        }

        for (Teachingclass t:teachingclasses)
            System.out.println(t.getCourse().getName()+ "    "+t.getTeacher().getName());
        for (int i = 1;i<t_counts.length;i++){
            if(t_counts[i]>0)
                System.out.println(teacherMapper.getTeacherById(i).getName()+"=="+t_counts[i]);
        }
        Assert.assertEquals(1,1);
    }


    @Test
    public void m1(){
        for(int i = 0;i<=100;i++) {
            AcademyMapper academyMapper = getAcademyMapper();
            Academy academyById = academyMapper.getAcademyById(3);
            System.out.println(i);
        }
        Assert.assertEquals(1,1);
    }


    @Test
    public void m2(){
        String departId = "[\"1\",\"2\",\"3\",\"4\"]";
        List<Integer> departid = JSONArray.parseArray(departId,Integer.TYPE);
        System.out.println(departId.toString());
        Assert.assertEquals(1,1);
    }


    @Test
    public void m3(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
        TeachingclassMapper teachingclassMapper = (TeachingclassMapper) applicationContext.getBean("teachingclassMapper");
        ClassroomMapper classroomMapper = (ClassroomMapper) applicationContext.getBean("classroomMapper");
        TeacherMapper teacherMapper = (TeacherMapper) applicationContext.getBean("teacherMapper");
        PlanMapper planMapper = (PlanMapper) applicationContext.getBean("planMapper");

        String departIdOfJson = "[\"1\",\"2\",\"3\",\"4\"]";
        String classroomsOfJson = "[\"2#101\",\"2#102\",\"2#103\",\"2#104\",\"2#105\",\"2#106\",\"2#107\",\"2#108\",\"2#109\",\"2#110\"]";

        int year = 2018;
        int term = 2;
        List<Integer> departid = JSONArray.parseArray(departIdOfJson,Integer.class);
        List<String> classroomName = JSONArray.parseArray(classroomsOfJson, String.class);
        //List<Teachingclass> teachingclasses = (ArrayList<Teachingclass>)session.getAttribute("teachingclasses");
        List<Teachingclass> teachingclasses = teachingclassMapper.getTeachingclasses();

        for (Teachingclass t:teachingclasses){
            System.out.println(t.toString());
        }



        List<Classroom> classrooms = new ArrayList<>();
        for (String s:classroomName){
            classrooms.add(classroomMapper.getClassroomByClassroom(s));
        }

        List<DepartWithLevel> departWithLevelList = planMapper.getDepartWithLevelList();
        HashMap<String, Integer> indexOfDepartWithLevel = new HashMap<>();
        for (int i = 0;i<departWithLevelList.size();i++){
            DepartWithLevel departWithLevel = departWithLevelList.get(i);
            System.out.println(departWithLevel.getName()+departWithLevel.getLevel());
            indexOfDepartWithLevel.put(departWithLevel.getName()+departWithLevel.getLevel(),i);
        }

        /**
         * 排课
         * 只排第一周的课,其他周复制
         * 贪心的思想,同一门课的不同教学部,安排同一个上课时间的不同教室,不同的课程,按先后顺序,一个教室一个教室的往后排.
         */

        boolean []success = new boolean[teachingclasses.size()+1];//标记某一教学部是否排课成功

        Teachingclass [][][]schedule = new Teachingclass[classrooms.size()+1][6][4];            //用于保存排课信息,并且保证同一个教室同一时间只能安排一个课程
        boolean[][][] departWithLevelBusy = new boolean[departWithLevelList.size()+1][6][4];    //用于判断是否与各个专业的教学计划冲突,即同个专业的两个课程在同一个时间上课
        boolean[][][] teacherBusy = new boolean[teacherMapper.getCountOfTeacher()+2][6][4];     //用户判断教师是否冲突,即同一时间一位老师只能在一个教室上课
        /*
        for (int i = 0;i<departWithLevelList.size();i++){
            for(int j = 0;j<6;j++){
                for (int k = 0;k<4;k++){
                    System.out.println(departWithLevelBusy[i][j][k]);
                }
            }
        }
        */

        int room1= 0,day1=0,time1=0,room2=0,day2=0,time2=0;

        for (int i = 0;i<teachingclasses.size();i++){
            Teachingclass teachingclass = teachingclasses.get(i);
            List<DepartWithLevel> departWithLevelListOfCourse = planMapper.getDepartWithLevelListOfCourse(teachingclass.getCourse().getId(),year,term);

            if(i>=1 && teachingclass.getCourse().getId() == teachingclasses.get(i-1).getCourse().getId()&&success[i-1] && judgeSameTimeForCourse(i,teachingclass,classrooms.size(),room1,room2,schedule,day1,time1,day2,time2,teacherBusy)>0){
                int t = judgeSameTimeForCourse(i,teachingclass,classrooms.size(),room1,room2,schedule,day1,time1,day2,time2,teacherBusy);
                room1+=t;
                room2+=t;
            }else {
                boolean flag = false;//flag标志用来标记是否已经找到符合条件的一个安排.
                for (int room = 0; room < classrooms.size() && !flag; room++) {
                    if(teachingclass.getNumber()>classrooms.get(room).getNumber()){
                        continue;
                    }
                    for (int day = 1; day < 6 && !flag; day++) {
                        for (int time = 1; time < 4 && !flag; time++) {
                            if (schedule[room][day][time] == null && !teacherBusy[teachingclass.getTeacher().getId()][day][time] && judgeDepartWithLevel(departWithLevelBusy, indexOfDepartWithLevel, departWithLevelListOfCourse, day, time)) {
                                flag = true;
                                room1 = room;
                                day1 = day;
                                time1 = time;
                            }
                        }
                    }
                }
                if (!flag) {
                    success[i] = false;
                    System.out.println(teachingclass.getCourse().getName()+"==============================================1");
                    continue;
                }

                flag = false;
                for (int room = 0; room < classrooms.size() && !flag; room++) {
                    if(teachingclass.getNumber()>classrooms.get(room).getNumber()){
                        continue;
                    }
                    for (int day = 1; day < 6 && !flag; day++) {
                        if (Math.abs(day - day1) < 1)
                            continue;
                        for (int time = 1; time < 4 && !flag; time++) {
                            if(room == room1 && day == day1 && time == time1)
                                continue;
                            if(time1 == 1 && time==1)
                                continue;
                            if (schedule[room][day][time] == null && !teacherBusy[teachingclass.getTeacher().getId()][day][time] &&judgeDepartWithLevel(departWithLevelBusy,indexOfDepartWithLevel,departWithLevelListOfCourse,day,time)) {
                                flag = true;
                                room2 = room;
                                day2 = day;
                                time2 = time;
                            }
                        }
                    }
                }
                if (!flag) {
                    success[i] = false;
                    System.out.println(teachingclass.getCourse().getName()+teachingclass.getTeacher().getName()+"==============================================2");
                    continue;
                }
            }
            success[i] = true;
            schedule[room1][day1][time1 ] = schedule[room2][day2][time2] = teachingclass;
            teacherBusy[teachingclass.getTeacher().getId()][day1][time1] = teacherBusy[teachingclass.getTeacher().getId()][day2][time2] = true;
            for (DepartWithLevel d: departWithLevelListOfCourse){
                int index = indexOfDepartWithLevel.get(d.getName()+d.getLevel());
                departWithLevelBusy[index][day1][time1] = departWithLevelBusy[index][day2][time2] = true;
            }

            System.out.println(String.format("%-5d\t\t%d\t%d\t%d\t%d\t%d\t%d\t%-10s%-40s",i+1,room1,day1,time1,room2,day2,time2,schedule[room1][day1][time1].getTeacher().getName(),schedule[room1][day1][time1].getCourse().getName()));
        }
        Assert.assertEquals(1,1);
    }

    private int judgeSameTimeForCourse(int i, Teachingclass teachingclass, int size, int room1, int room2, Teachingclass[][][] schedule, int day1, int time1, int day2, int time2, boolean[][][] teacherBusy) {
        for (int j = 1;room1+j<size&&room2+j<size;j++) {
            if (schedule[room1 + j][day1][time1] == null && schedule[room2 + j][day2][time2] == null && !teacherBusy[teachingclass.getTeacher().getId()][day1][time1] && !teacherBusy[teachingclass.getTeacher().getId()][day2][time2]) {
                return j;
            }
        }
        return 0;
    }

    private boolean judgeDepartWithLevel(boolean[][][] departWithLevelBusy, HashMap<String, Integer> indexOfDepartWithLevel, List<DepartWithLevel> departWithLevelListOfCourse, int day, int time) {
        for (DepartWithLevel d: departWithLevelListOfCourse){
            int index = indexOfDepartWithLevel.get(d.getName()+d.getLevel());
            if(departWithLevelBusy[index][day][time]){
                //System.out.println(d.getName()+d.getLevel()+ "   "+ index + "   "+day +"   "+time);
                return false;
            }
        }
        return true;
    }
}
