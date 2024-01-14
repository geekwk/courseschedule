package cn.wk.controller;

import cn.wk.pojo.*;
import cn.wk.service.*;
import com.alibaba.fastjson2.JSONArray;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/courseSchedule")
public class ScheduleController {

    @Autowired
    private PlanService planService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private StudentService studentService;


    @Autowired
    private ClassroomService classroomService;

    /**
     * 生产教学班
     * @param year
     * @param term
     * @param departId
     * @param session
     * @return
     */
    @RequestMapping("/addTeachingClass")
    public Result addTeachingClass(int year , int term, String departId, HttpSession session){
        System.out.println("开始生成教学班.......");

        List<Integer> departid = JSONArray.parseArray(departId,Integer.TYPE);

        Integer number = 0;

        int[] studentNumberOfCours = new int[100];//每个课程有多少人要上课
        int[] t_counts = new int[450];//每个教室代课的数量

        HashMap<String, Integer> numberOfCourseHashMap = new HashMap<>();

        ArrayList<Plan> plans = new ArrayList<>();

        ArrayList<Teachingclass> teachingclasses = new ArrayList<>();

        for (Integer id : departid) {
            for (int i = 0; i <= 3; i++) {
                List<Plan> planByTerm = planService.getPlanByTerm(id, year - i, term + 2 * i);

                for (Plan p : planByTerm) {
                    //System.out.println(p.getDepart().getId()+"---"+p.getLevel());
                    if (numberOfCourseHashMap.containsKey("" + p.getDepart().getId() + p.getLevel())) {
                        number = numberOfCourseHashMap.get("" + p.getDepart().getId() + p.getLevel());
                    } else {
                        number = studentService.getStudentNumberOfDepartAndLevel(p.getDepart().getId(), p.getLevel());
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
                int numberOfEachTeachingClass = studentNumberOfCours[i]/ceil+1;

                Course course = courseService.getCourseById(i);
                System.out.println(course.getName() +"  教学班数量:"+ceil);

                while (ceil-- > 0) {
                    int b = 100;
                    Teacher a = null;
                    //找到已安排课程量最少的老师
                    for (Teacher t : course.getTeacherList()) {
                        int id = t.getId();
                        if (t_counts[id] <= b) {
                            a = t;
                            b = t_counts[id];
                        }
                    }
                    t_counts[a.getId()]++;
                    a.setPassword(null);

                    Teachingclass teachingclass = new Teachingclass();
                    teachingclass.setCourse(course);
                    teachingclass.setNumber(numberOfEachTeachingClass);
                    teachingclass.setTeacher(a);
                    teachingclass.setYear(year);
                    teachingclass.setTerm(term);
                    teachingclass.setStart(1);
                    teachingclass.setEnd(16);
                    teachingclasses.add(teachingclass);
                }
            }
        }
        /*
        for (Teachingclass t:teachingclasses)
            System.out.println(t.getCourse().getName()+ "    "+t.getTeacher().getName());
        for (int i = 1;i<t_counts.length;i++){
            if(t_counts[i]>0)
                System.out.println(teacherService.getTeacherById(i).getName()+"=="+t_counts[i]);
        }
        */

        //添加到session,减少数据传递
        session.setAttribute("teachingclasses",teachingclasses);

        //保存数据
        //teachingclassService.addTeachingclasses(teachingclasses);

        return Result.success("成功创建教学班!").add("teachingclasses",teachingclasses);
    }

    /**
     * 教学班安排
     * @param year
     * @param term
     * @param departIdOfJson
     * @param classroomsOfJson
     * @param session
     * @return
     */
    @RequestMapping("/courseSchedule")
    public Result courseSchedule(int year , int term, String departIdOfJson, String classroomsOfJson, HttpSession session){
        List<Integer> departid = JSONArray.parseArray(departIdOfJson,Integer.class);
        List<String> classroomName = JSONArray.parseArray(classroomsOfJson, String.class);
        //从session获得教学班表
        ArrayList<Teachingclass> teachingclasses = (ArrayList<Teachingclass>)session.getAttribute("teachingclasses");
        //从数据库获得教学班表
        //List<Teachingclass> teachingclasses = teachingclassService.getTeachingclasses();

        List<Classroom> classrooms = new ArrayList<>();
        for (String s:classroomName){
            classrooms.add(classroomService.getClassroomByClassroom(s));
        }

        List<DepartWithLevel> departWithLevelList = planService.getDepartWithLevelList();
        HashMap<String, Integer> indexOfDepartWithLevel = new HashMap<>();
        for (int i = 0;i<departWithLevelList.size();i++){
            DepartWithLevel departWithLevel = departWithLevelList.get(i);
            //System.out.println(departWithLevel.getName()+departWithLevel.getLevel());
            indexOfDepartWithLevel.put(departWithLevel.getName()+departWithLevel.getLevel(),i);
        }

        List<Schedule> schedules = new ArrayList<>();

        /**
         * 排课
         * 只排第一周的课,其他周复制
         * 贪心的思想,同一门课的不同教学部,安排同一个上课时间的不同教室,不同的课程,按先后顺序,一个教室一个教室的往后排.
         */

        boolean []success = new boolean[teachingclasses.size()+1];//标记某一教学部是否排课成功

        Teachingclass[][][]schedule = new Teachingclass[classrooms.size()+1][6][5];            //用于保存排课信息,并且保证同一个教室同一时间只能安排一个课程
        boolean[][][] departWithLevelBusy = new boolean[departWithLevelList.size()+1][6][5];    //用于判断是否与各个专业的教学计划冲突,即同个专业的两个课程在同一个时间上课
        boolean[][][] teacherBusy = new boolean[teacherService.getCountOfTeacher()+2][6][5];     //用户判断教师是否冲突,即同一时间一位老师只能在一个教室上课
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
            List<DepartWithLevel> departWithLevelListOfCourse = planService.getDepartWithLevelListOfCourse(teachingclass.getCourse().getId(),year,term);

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
                        for (int time = 1; time < 5 && !flag; time++) {
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
                    //System.out.println(teachingclass.getCourse().getName()+"==============================================1");
                    continue;
                }

                flag = false;
                for (int room = 0; room < classrooms.size() && !flag; room++) {
                    if(teachingclass.getNumber()>classrooms.get(room).getNumber()){
                        continue;
                    }
                    for (int day = 1; day < 6 && !flag; day++) {
                        if (Math.abs(day - day1) < 2)
                            continue;
                        for (int time = 1; time < 5 && !flag; time++) {
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
                    //System.out.println(teachingclass.getCourse().getName()+teachingclass.getTeacher().getName()+"==============================================2");
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

            //保存数据
            Schedule schedule1 = new Schedule(teachingclass, classrooms.get(room1), day1, time1);
            Schedule schedule2 = new Schedule(teachingclass, classrooms.get(room2), day2, time2);
            //返回前端界面
            schedules.add(schedule1);
            schedules.add(schedule2);
            //System.out.println(String.format("%-5d\t\t%d\t%d\t%d\t%d\t%d\t%d\t%-10s%-40s",i+1,room1,day1,time1,room2,day2,time2,schedule[room1][day1][time1].getTeacher().getName(),schedule[room1][day1][time1].getCourse().getName()));
        }

        //保存数据
        //scheduleService.addScheduleList(schedules);

        return Result.success("排课成功").add("schedule",schedules);
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
