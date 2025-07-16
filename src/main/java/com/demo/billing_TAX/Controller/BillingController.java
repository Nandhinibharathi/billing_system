package com.demo.billing_TAX.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.billing_TAX.BillItemRepository.BillItemRepository;
import com.demo.billing_TAX.Model.BillItem;
import com.demo.billing_TAX.Model.Customer;

@Controller
public class BillingController {
  @Autowired BillItemRepository repo;

  @GetMapping("/")
  public String home() { return "index"; }

  @GetMapping("/grocery")
  public String items(Model m){ m.addAttribute("items", repo.findAll()); return "grocery"; }
  
  @PostMapping("/addItem")
  public String add(@RequestParam String name, @RequestParam double price,
                    @RequestParam int qty) {
    repo.save(new BillItem(null, name, price, qty));
    return "redirect:/grocery";
  }
  @PostMapping("/customer")
  public String saveCustomer(@ModelAttribute Customer customer, Model m) {
      // Add customer & items for billing view
      m.addAttribute("customer", customer);
      m.addAttribute("items", repo.findAll());
      return "bill"; // JSP view to render final bill
  }
 
  @GetMapping("/customer")
  public String customerForm(Model m) {
      m.addAttribute("customer", new Customer());
      m.addAttribute("items", repo.findAll());
      return "customer"; // Show the JSP form to collect customer data
  }


 
//At the bottom of BillingController
@PostMapping("/generateBill")
public String generateBill(Model m) {
   // pass current cart items
   m.addAttribute("items", repo.findAll());
   // you may include additional model attrs, e.g. total
   return "bill";          // your JSP view for final bill
}



  @GetMapping("/clear")
  public String clear(){ repo.deleteAll(); return "redirect:/"; }
}
