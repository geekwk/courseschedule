package cn.ahpu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan("cn.ahpu.mapper")
@SpringBootApplication
public class CourseScheduleApplication {
    public static void main(String[] args) {
        SpringApplication.run(CourseScheduleApplication.class, args);
    }
}
