package int202.mid.exam.mid_exam_041.model;
//65130500041

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class User {
    private String username;
    private String email;

    public User(String username, String email) {
        this.username = username;
        this.email = email;
    }


}
