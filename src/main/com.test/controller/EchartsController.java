package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class EchartsController {

    @Autowired
    private UserService userService;

    @GetMapping("/toBar")
    public String toBar(HttpServletRequest request, Model model) {
        return "echarts/myecharts";
    }

    @RequestMapping("/queryForList")
    @ResponseBody
    public List<Map<String, Object>> queryForList() {
        List<Map<String, Object>> lists = userService.queryForList();

        for (Map<String, Object> map : lists) {
            for (String s : map.keySet()) {
                System.out.print("age: " + map.get(s) +" ");
            }
        }

        return lists;
    }

}
