package spring.config;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import spring.controller.ChangePwdController;
import spring.controller.ItemListController;
import spring.controller.LogoutController;
import spring.controller.MainController;
import spring.controller.MemberListController;
import spring.dao.CartDao;
import spring.dao.ItemDao;
import spring.dao.MemberDao;
import spring.service.AuthService;
import spring.service.ChangePasswordService;
import spring.service.ItemRegisterService;
import spring.service.MemberRegisterService;


@Configuration
public class ControllerConfig {
	
	@Autowired
	private ChangePasswordService changePasswordService;
	@Autowired
	private MemberDao memberDao;
@Autowired
private ItemDao itemDao;

	
    @Bean
    public DataSource dataSource() {
        DataSource ds = new DataSource();
        ds.setDriverClassName("com.mysql.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost/spring5fs?characterEncoding=EUC-KR&serverTimezone=UTC");
        ds.setUsername("root");
        ds.setPassword("1234");
        ds.setInitialSize(2);
        ds.setMaxActive(10);
        ds.setTestWhileIdle(true);
        ds.setMinEvictableIdleTimeMillis(60000 * 3);
        ds.setTimeBetweenEvictionRunsMillis(10 * 1000);
        return ds;
    }
    
    @Bean
    public PlatformTransactionManager transactionManager() {
        DataSourceTransactionManager tm = new DataSourceTransactionManager();
        tm.setDataSource(dataSource());
        return tm;
    }
    
    @Bean
    public MemberDao memberDao() {
        return new MemberDao(dataSource());
    }
    
    @Bean
    public MemberRegisterService memberRegSvc() {
        return new MemberRegisterService(memberDao());
    }
    
    @Bean
    public ChangePasswordService changePwdSvc() {
        ChangePasswordService pwdSvc = new ChangePasswordService();
        pwdSvc.setMemberDao(memberDao());
        return pwdSvc;
    }
    
    @Bean
    public AuthService authService() {
        AuthService authService = new AuthService();
        authService.setMemberDao(memberDao());
        return authService;
    }
    
    @Bean
    public LogoutController logoutController() {
    	return new LogoutController();
    }
    
    @Bean
    public ItemDao itemDao() {
        return new ItemDao(dataSource());
    }
    @Bean
    public ItemRegisterService itemRegSvc() {
    	return new ItemRegisterService(itemDao()); 
    }
    @Bean
    public MainController mainController() {
    	return new MainController();
    }
    @Bean
    public ChangePwdController changePwdController() {
    	ChangePwdController controller = new ChangePwdController(); 
    	controller.setChangePasswordService(changePasswordService); 
    	return controller;
    }
    @Bean
    public MemberListController memberListController() {
    	MemberListController controller = new MemberListController(); 
    	controller.setMemberDao(memberDao);
    	return controller;
    }
    @Bean
    public CartDao cartDao() {
        return new CartDao(dataSource());
    }
    @Bean
    public ItemListController itemListController() {
    	ItemListController controller = new ItemListController(); 
    	controller.setItemDao(itemDao);
    	return controller;
    }
 

}
