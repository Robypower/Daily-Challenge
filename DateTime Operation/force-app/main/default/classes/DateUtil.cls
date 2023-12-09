/**
* The DateUtil class implementation for multiple operation
* on Date.
*
* @author  Onkar Pawar
* @version 1.0
* @since   2023-11-26
*/
public with sharing class DateUtil {
   
   public static Integer year = 0;
   public static Integer month = 0;
   public static Integer day = 0;

   public static Integer getAge(Date today, Date dob){
      //Datetime start = System.now();
      year = month = day = 0;
      DateTime td =  today;
      year = (today.year() - dob.year())-1;
      td = td.addYears(-year);
      while(dob <= td){
         td = td.addYears(-1);
         if(dob > td){
            td = td.addYears(1);
            break;
         }
         year++;
      }


      while(dob < td){
         td = td.addMonths(-1);
         if(dob > td){
            td = td.addMonths(1);
            break;
         }
         month++;
      }


      while(dob < td){
         td = td.addDays(-1);
         if(dob > td){
            td = td.addDays(1);
            break;
         }
         day++;
      }
      // System.debug('td->'+td);
      // System.debug('year->'+year);
      // System.debug('month->'+month);
      // System.debug('day->'+day);
      // System.debug('execution time->'+(System.now().getTime()-start.getTime()));
      return year;
   }
}