package edu.mum.mumscrum.s5.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.mumscrum.s5.entity.Employee;
import edu.mum.mumscrum.s5.service.EmployeeService;

@Controller
public class EmployeeController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EmployeeController.class);

	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String getDashboard(Model model) {
		LOGGER.debug("Processing request for /dashboard");
		
		return "dashboard";
	}
	
	@RequestMapping(value = "/addpage", method = RequestMethod.GET)
	public String addpage(Model model) {
		LOGGER.debug("Processing request for /dashboard");
		
		return "sample";
	}
	
	@RequestMapping(value = "/employees", method = RequestMethod.GET)
	public String listEmployees(Model model) {
		LOGGER.debug("Processing request for /employees");
		
		model.addAttribute("employee", new Employee());
		model.addAttribute("listEmployees", this.employeeService.listEmployee());
		return "employee";
	}
	
	@RequestMapping(value="/employee/add", method=RequestMethod.GET)
	public String addEmp(Model model) {
		LOGGER.debug("Processing request for /employee/add GET");
		model.addAttribute("employee", new Employee());
		return "addemployee";
	}
	
	//For add and update person both
	@RequestMapping(value= "/employee/add", method = RequestMethod.POST)
	public String addEmployee(@ModelAttribute("employee") Employee e){
		LOGGER.debug("Processing request for /employee/add");
		
		if(e.getId() == 0){
			//new employee, add it
			this.employeeService.addEmployee(e);
		}else{
			//existing employee, call update
			this.employeeService.updateEmployee(e);
		}
		
		return "redirect:/employees";
		
	}
	
	@RequestMapping("/remove/{id}")
    public String removeEmployee(@PathVariable("id") int id){
		LOGGER.debug("Processing request for /employee/remove");

		try {
			this.employeeService.removeEmployee(id);
		}
		catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
		
        return "redirect:/employees";
    }
 
    @RequestMapping("/edit/{id}")
    public String editEmployee(@PathVariable("id") int id, Model model){
		LOGGER.debug("Processing request for /employee/edit");

		model.addAttribute("employee", this.employeeService.getEmployeeById(id));
//        model.addAttribute("listPersons", this.employeeService.listEmployee());
        return "addemployee";
    }
	
}
