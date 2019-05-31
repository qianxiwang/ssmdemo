package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;

    /**
     * 根据id查询
     *
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/getUser")
    public String selectById(int id, Model model) {
        User user = userService.findUserById(id);

//        System.out.println("===============");
//        System.out.println("id: " + user.getId() + " name: " + user.getName() + " age: " + user.getAge());
//        System.out.println("===============");

        model.addAttribute("user", user);

        return "editUser";
    }

    /**
     * 查询所有用户
     *
     * @return
     */
    @RequestMapping("/getAllUser")
    public String getAllUser(Model model) {
        List<User> user = userService.findAll();
        model.addAttribute("userList", user);
        return "allUser";
    }


    /**
     * 查询所有
     *
     * @param pn：默认从第一页开始 请求参数
     * @param model
     * @return
     */
    @GetMapping("/userInfo")
    public String findAll(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
        //从第一条开始 每页查询五条数据
        PageHelper.startPage(pn, 5);
        List<User> users = userService.findAll();
        //将用户信息放入PageInfo对象里
        PageInfo page = new PageInfo(users, 5);

        System.out.println("page: " + page);

        model.addAttribute("pageInfo", page);

        return "allUser";
    }

    /**
     * 添加用户
     *
     * @return
     */
    @RequestMapping("/toAddUser")
    public String toAddUser() {
        return "addUser";
    }

    /**
     * 添加用户并重定向   功能还不行
     *
     * @param model
     * @param user
     * @return
     */
    @RequestMapping("/addUser")
    public String addUser(Model model, User user, HttpServletRequest request) {
        if (user != null) {
            userService.saveUser(user);
        }
        return "redirect:/user/userInfo";
    }


    /**
     * 根据id删除用户
     *
     * @param id
     */
    @RequestMapping("/delUser")
    public String deleteUser(int id, Model model) {

        model.addAttribute("user", userService.deleteUser(id));

        return "redirect:/user/userInfo";
    }

    /**
     * 修改用户
     *
     * @return
     */
    @RequestMapping("/updateUser")
    public String UpdateUser(Model model, User user) {
        if (userService.updateUser(user)) {
            user = userService.findUserById(user.getId());
            model.addAttribute("user", user);

            return "redirect:/user/userInfo";
        }
        return "error";
    }


}
