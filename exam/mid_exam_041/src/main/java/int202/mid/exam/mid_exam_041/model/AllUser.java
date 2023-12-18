package int202.mid.exam.mid_exam_041.model;
//65130500041
import java.util.HashMap;
import java.util.Map;

public class AllUser {
    private static Map<String, User> users = new HashMap<>();


    public static void addUser(User user){
        users.put(user.getUsername(), user);
    }

    public static User getUsername(String username){
        return users.get(username);
    }

    public static User getEmail(String email){
        return users.get(email);
    }
}
