/*
 *
 */
package net.calba.backpain;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.springframework.security.authentication.encoding.LdapShaPasswordEncoder;
/**
 *
 * @author Mukhtiar Ahmed
 *
 */
public final class Util {
	
	
	private static final Logger LOGGER = Logger
			.getLogger(Util.class);
	
	
	
	public static final int PAGE_SIZE = 15;	
	
	
	public static final int DEFAULT_PAGE = 1;
	
	
	public static final SimpleDateFormat format = new SimpleDateFormat("EEEE MMMM dd yyyy, HH:mm:ss a");
	
	public static final SimpleDateFormat simpleFormat = new SimpleDateFormat("dd/MM/yyyy");
	
	public static final SimpleDateFormat reportFormat = new SimpleDateFormat("EEEE MMMM dd yyyy");
	
    /**
     * private constructor.
     */
    private Util() {

    }

    /**
     * Ldap SHA password encoder.
     */
    private static LdapShaPasswordEncoder shaEncoder =
            new LdapShaPasswordEncoder();

    /**
     * Encode text in SHA.
     * @param text String value
     * @return String value
     */
    public static String sha1(final String text) {
            return shaEncoder.encodePassword(text, null);
    }

    /**
     * Validate email.
     * @param hex String value
     * @return boolean value
     */
    public static boolean validateEmail(final String hex) {
            final Pattern pattern = Pattern.compile(
                    "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+"
                    + "(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
            Matcher matcher;
            matcher = pattern.matcher(hex);
            return matcher.matches();
    }
    
    public static String formatDate(Date date) {
    	String str = "";
    	try {
			str = simpleFormat.format(date);
		} catch(Exception e) {}
    	return str;
    }
    
    public static Date formatDate(String str) {
    	Date date = null;
    	try {
    		date = simpleFormat.parse(str);
		} catch(Exception e) {}
    	return date;
    }
    
    
    public static Date getDateWithoutTime(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    public static Date getTodayDate() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }
    
    
    
    public static void main(String [] args) {
    	System.out.println(sha1("password"));
    	System.out.println(formatDate(new Date()));
    	System.out.println(formatDate(formatDate("23/03/1970")));
    	
    	 Pattern p = Pattern.compile("^([0-9\\+ \\-]{7,15})$");
    	 Matcher m = p.matcher("+1 784 676-5098");
    	 System.out.println(m.matches());
    	 m = p.matcher("846-765-5098");
    	 System.out.println(m.matches());
    	 
    	 m = p.matcher("1345678");
    	 System.out.println(m.matches());
    	
    }
    
   


       

}
