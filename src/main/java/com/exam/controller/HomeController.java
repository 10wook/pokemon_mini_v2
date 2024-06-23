package com.exam.controller;

import com.exam.dto.ProductDetail;
import com.exam.service.ProductDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class HomeController {

    private final ProductDetailService productDetailService;

    @Autowired
    public HomeController(ProductDetailService productDetailService) {
        this.productDetailService = productDetailService;
    }

    @GetMapping("/home")
    public String home(@RequestParam(value = "query", required = false) String query, Model model) {
        List<ProductDetail> products;
        if (query != null && !query.isEmpty()) {
            products = productDetailService.searchProducts(query);
        } else {
            products = productDetailService.getAllProducts();
        }
        model.addAttribute("products", products);
        return "home";
    }
}
