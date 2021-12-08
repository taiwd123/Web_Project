package util;
import java.util.Base64;
public class SecurityUtil {
    public static String encoded(String text) {
        return Base64.getEncoder().encodeToString(text.getBytes());
    }
    public static String decoded(String encodedString) {
        byte[] decodedBytes = Base64.getDecoder().decode(encodedString);
        return new String(decodedBytes);
    }
}