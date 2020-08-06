package inventory;
import java.util.Random;

public class SecretKeyGenerator 
{
	private static final String randString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    private static final Random generator = new Random();

    public static int getRandomInRange(int start, int end)
    {
        return start + generator.nextInt(end - start + 1);
    }

    public static String randomString() 
    {
        StringBuilder builder = new StringBuilder();
        int range=getRandomInRange(10,40);
        while (range-- != 0) 
        {
            int character = (int)(Math.random()*randString.length());
            builder.append(randString.charAt(character));
        }
        return builder.toString();
    }
}
