package com.example.demo;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

	MemberInfo memberinfo = new MemberInfo();
	sale Sale = new sale();
	wallet Wallet = new wallet();
	
	@Autowired
    private MemberDao memberDao;
	
	@Autowired
    private ProductDao productDao;
	
    @Autowired
    @Qualifier("scheduleDao")
    private ScheduleDao ScheduleDao;
	
	private JdbcTemplate jdbcTemplate;
	
	String pass = "1234";
    
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public String start() {
		Sale.setSale(0);
		Wallet.setWallet(300000);
        return "Login";
    }
	
	public MainController(JdbcTemplate jdbcTemplate) {
		      this.jdbcTemplate = jdbcTemplate;
		 }


	@PostMapping(value = "Login")
	public String login(@RequestParam("id") String id, @RequestParam("password") String password, Model model) {
	    List<Member> members = memberDao.selectAll();	//데베 저장되어 있는 member 데이터베이스 가져와서 리스트로 저장
	    for (Member member : members) {
	        if (member.getId().equals(id) && member.getPassword().equals(password)) {
	            System.out.println(member.getName() + "dd");
	            model.addAttribute("name", member.getName());
	            memberinfo.setName(member.getName());
	            return "redirect:/Home";
	        }
	    }
	    model.addAttribute("error", "Please check your ID and password.");
	    return "Login";
	}

	
    List<Product> productList = new ArrayList<>();
    @PostMapping(value = "/Home")
    public String homePage(@RequestParam("productcode") String productcode, Model model) {//
        List<Product> products = productDao.selectAll();

        for (Product product : products) {
            if (product.getCode().equals(productcode)) {
                System.out.println(product.getProductname());
                productList.add(product);
            }
        }
        model.addAttribute("wallet", Wallet.getWallet());
        model.addAttribute("products", productList);
    	model.addAttribute("sale", String.valueOf(Sale.getSale()));
    	model.addAttribute("name", String.valueOf(memberinfo.getName()));
    	System.out.println(productList);
    	return "Home";
    }
	
    
    @GetMapping(value = "/Home")
    public String homePage2(Model model) {//
    	model.addAttribute("products", productList);
        model.addAttribute("wallet", Wallet.getWallet());
    	model.addAttribute("sale", String.valueOf(Sale.getSale()));
    	model.addAttribute("name", String.valueOf(memberinfo.getName()));
    	return "Home";
    }
    
    @GetMapping(value = "/admin")
    public String homePage2() {//
    	
    	return "admin";

    }
    
	@PostMapping(value = "/admin")
	public String adminlogin(@RequestParam("password") String password, Model model) {
	        if (password.equals(pass)) {
	        	 return "redirect:/adminsucess";
	        }
	    model.addAttribute("error", "Please check your password.");
	    return "admin";
	}
	
	
    List<Product> productList2 = new ArrayList<>();
    @GetMapping(value = "/adminsucess")
    public String adminsucess(Model model) {//
    	productList2.clear();
        List<Product> topSellingProducts = ScheduleDao.getTopSellingProducts("day");
        model.addAttribute("topSellingProducts", topSellingProducts);
        
        List<Product> weektopSellingProducts = ScheduleDao.getTopSellingProducts("week");
        model.addAttribute("weektopSellingProducts", weektopSellingProducts);
        
        List<Product> monthtopSellingProducts = ScheduleDao.getTopSellingProducts("month");
        model.addAttribute("monthtopSellingProducts", monthtopSellingProducts);

        List<Product> products = productDao.selectAll();
        for (Product product : products) {
                productList2.add(product);
        }
    	model.addAttribute("wallet", Wallet);
        model.addAttribute("products", productList2);
    	return "adminsucess";

    }
    
    @PostMapping(value = "/adminsucess")
    public String adminsucess2(@RequestParam("productcode") String productcode, 
    		@RequestParam("productname") String productname, @RequestParam("productquantity") long productquantity, 
    		@RequestParam("productprice") long productprice, Model model) {
    	 model.addAttribute("wallet", Wallet); 
    	 LocalDateTime productdate = LocalDateTime.now();
    	 Object[] params = {productcode,productname,productquantity,productprice,productdate};
    	 productDao.InsertProduct(params);       
         productList2.clear(); // productList 초기화
         
         List<Product> topSellingProducts = ScheduleDao.getTopSellingProducts("day");
         model.addAttribute("topSellingProducts", topSellingProducts);
         
         List<Product> weektopSellingProducts = ScheduleDao.getTopSellingProducts("week");
         model.addAttribute("weektopSellingProducts", weektopSellingProducts);
         
         List<Product> monthtopSellingProducts = ScheduleDao.getTopSellingProducts("month");
         model.addAttribute("monthtopSellingProducts", monthtopSellingProducts);
         
         
        List<Product> products = productDao.selectAll();
        for (Product product : products) {
                System.out.println(product.getProductname());
                productList2.add(product);
        }
        model.addAttribute("products", productList2);
        model.addAttribute("wallet", Wallet.getWallet());
    	return "adminsucess";

    }
    
	@PostMapping(value = "/up")
	public String qtyup2(@RequestParam("qtyup") String qtyup, Model model) {
		System.out.println(qtyup);

            productDao.increaseQuantity(qtyup, 1);
            
            
	    return "redirect:/adminsucess";
	}
	@PostMapping(value = "/down")
	public String qtydown2(@RequestParam("qtydown") String qtydown, Model model) {
		System.out.println(qtydown);

            productDao.decreaseQuantity(qtydown, 1);
            
            
	    return "redirect:/adminsucess";
	}
	
	@PostMapping(value = "/productdelete")
	public String productdelete(@RequestParam("delete") String delete, Model model) {
            productDao.deleteProduct(delete);
            System.out.println(delete);
            
	    return "redirect:/adminsucess";
	}
	
	@PostMapping(value = "/cancel")
	public String productcancel(@RequestParam("cancelcode") String cancelcode, Model model) {

	    List<Product> products = productDao.selectAll();
	    Iterator<Product> iterator = productList.iterator();

	    while (iterator.hasNext()) {
	        Product product = iterator.next();
	        if (product.getProductname().equals(cancelcode)) {
	            System.out.println(product.getProductname());
	            iterator.remove();
	        }
	    }
            
            
	    return "redirect:/Home";
	}
    
    
    @PostMapping(value = "/payment")
    public String payment(@RequestParam("saleAmount") long saleAmount, Model model) {
    	for (Product product : productList) {
            productDao.decreaseQuantity(product.getCode(), 1);
       	    LocalDateTime productdate = LocalDateTime.now();
       	    Object[] params = {product.getCode(),product.getProductname(), 1 ,product.getPrice(), productdate};
       	    ScheduleDao.InsertSchedule(params);
        }
        long sale = saleAmount;
        productList.clear();
        model.addAttribute("sale", String.valueOf(Sale.getSale()));
        model.addAttribute("name", String.valueOf(memberinfo.getName()));
        Wallet.setWallet(Wallet.getWallet()+sale);
        model.addAttribute("wallet", Wallet.getWallet());
        System.out.println(Wallet.getWallet());
        System.out.println(Sale.getSale());
        
        return "Home";
    }
    
    
    @PostMapping(value = "/register")
    public String register2(@RequestParam("id") String id, @RequestParam("password") String password, 
    		@RequestParam("name") String name, @RequestParam("grade") String grade, Model model) {
   	    Object[] params = {id,password,name,grade};
   	    memberDao.InsertMember(params);       
    	return "Login";
    }
    
    @GetMapping(value = "/register")
    public String register(Model model) {
    	return "register";
    }
    
    

}