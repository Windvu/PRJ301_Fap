/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import entity.Days;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
/**
 *
 * @author sonnt
 */
public class DateTimeHelper {

    public static Date getBeginningOfWeek(Date date) {//Set the beginning day of week
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        // Set the first day of the week (SUNDAY in this case)
        calendar.setFirstDayOfWeek(Calendar.SUNDAY);
        // Set the calendar to the beginning of the week
        calendar.set(Calendar.DAY_OF_WEEK, calendar.getFirstDayOfWeek());
        // Reset hour, minutes, seconds and millis
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }

    public static Date addDaysToDate(Date date, int days) {// Helps to add days with begin from date 
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_MONTH, days); // Adds the specified number of days to the date
        return calendar.getTime();
    }

    public static ArrayList<Days> toList(java.sql.Date from, java.sql.Date to) {//Create a list of days from-to 
        ArrayList<Days> list = new ArrayList<>();
        Date temp = new Date(from.getTime());
        while (!temp.after(to)) {
            java.sql.Date days = convertUtilToSql(temp);
            // Tạo một đối tượng LocalDate và đặt ngày cần kiểm tra
         
            LocalDate localDate = temp.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

            // Lấy ngày của tuần từ đối tượng LocalDate
            DayOfWeek dayOfWeek = localDate.getDayOfWeek();

            // Lấy tên thứ từ enum DayOfWeek
            String dayName = dayOfWeek.toString();
            list.add(new Days(dayName, days));
            temp = addDaysToDate(temp, 1);

        }
        return list;
    }

    public static java.sql.Date convertUtilToSql(Date utilDate) {// exchange utilDate  =>  java.sql.Date
        if (utilDate != null) {
            return new java.sql.Date(utilDate.getTime());
        }
        return null;
    }
}
