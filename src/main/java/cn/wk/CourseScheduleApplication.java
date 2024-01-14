package cn.wk;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan("cn.wk.mapper")
@SpringBootApplication
public class CourseScheduleApplication {
    public static void main(String[] args) {
        try {
            SpringApplication.run(CourseScheduleApplication.class, args);
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
