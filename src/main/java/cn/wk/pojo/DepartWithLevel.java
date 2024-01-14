package cn.wk.pojo;

import java.util.Objects;

public class DepartWithLevel extends Depart {
    private Integer level;

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    @Override
    public boolean equals(Object o) {
        DepartWithLevel that = (DepartWithLevel)o;
        return level.equals(that.level) && getId().equals(that.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hash(level);
    }
}
