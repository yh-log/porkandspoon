package kr.co.porkandspoon.dto;

public class ChartDTO extends ResponseDTO{

    private int weekSum;
    private int week;
    private int monthSum;
    private int month;
    private long brandSum;
    private String brand;

    public int getWeekSum() {
        return weekSum;
    }

    public void setWeekSum(int weekSum) {
        this.weekSum = weekSum;
    }

    public int getWeek() {
        return week;
    }

    public void setWeek(int week) {
        this.week = week;
    }

    public int getMonthSum() {
        return monthSum;
    }

    public void setMonthSum(int monthSum) {
        this.monthSum = monthSum;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public long getBrandSum() {
        return brandSum;
    }

    public void setBrandSum(long brandSum) {
        this.brandSum = brandSum;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }
}
