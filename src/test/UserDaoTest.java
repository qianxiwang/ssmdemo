import dao.UserDao;
import domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


// 加载spring配置文件
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml"})
public class UserDaoTest {

    @Autowired
    private UserDao userDao;

    @Test
    public void findUserById() {

        User user = userDao.findUserById(1);
        System.out.println("-------------");
        System.out.println(user.getId() + " : " + user.getName() + " : " + user.getAge());
        System.out.println("-------------");
    }


}
