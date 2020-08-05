import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTime 
{
	
	public static String getCurrentDate()
	{
	    return (new SimpleDateFormat("dd:mm:yyyy").format(new Date()));
	}
	
	public static String getCurrentTime()
	{
		return (new SimpleDateFormat("hh:mm:ss").format(new Date()));
	}
}
