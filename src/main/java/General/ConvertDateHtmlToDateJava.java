package General;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ConvertDateHtmlToDateJava {
    public static Date convertStringToDate(String dateString) {
        String inputDateFormat = "yyyy-MM-dd";
        SimpleDateFormat formatter = new SimpleDateFormat(inputDateFormat);
        try {
            return formatter.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}
