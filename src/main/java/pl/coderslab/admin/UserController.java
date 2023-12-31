package pl.coderslab.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;



@Controller
public class UserController {
    private final UserService userService;
    public UserController(UserService userService) {
        this.userService = userService;
    }
    @GetMapping("/create-user")
    @ResponseBody
    public String createUser() {
        User user = new User();
        user.setUsername("admin");
        user.setPassword("admin");
        userService.saveUser(user);
        return "admin";
    }
    @GetMapping("/login")
    public String login() {
        return "admin/login";
    }
}
