package com.springboot.kynspringboot.controller;

import com.springboot.kynspringboot.service.StoreService;
import com.springboot.kynspringboot.dao.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	

	@GetMapping("/StoreInfo")
	public String showStoreForm(Model model) {
	    Store store = new Store();
	    model.addAttribute("storeForm", store); 
	    return "StoreInfo"; 
	}

    @PostMapping("/save")
    public String saveStore(@ModelAttribute("storeForm") Store store) {
        storeService.save(store);
        return "redirect:/ViewStore";
    }

    @GetMapping("/ViewStore")
    public String viewStores(Model model) {
        List<Store> stores = storeService.getAllStores();
        model.addAttribute("stores", stores);
        return "ViewStore";
    }
    
    @GetMapping(value = "/updateStore")
	public String updateStore(@RequestParam Long id, Model model) {
		Store oldstores = storeService.getStoreById(id);
		
		model.addAttribute("storeForm", oldstores);
		
		return "StoreInfo";
	}
	
	@GetMapping(value = "/deleteStore")
	public String deleteStore(@RequestParam Long id) {
		storeService.deleteStore(id);
		return "redirect:/ViewStore";
	}
	
    
}