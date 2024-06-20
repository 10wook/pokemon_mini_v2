package com.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {

    @GetMapping("/productDetail")
    public String productDetail(@RequestParam("productId") int productId, Model model) {
        model.addAttribute("productId", productId);
        return "productDetail";
    }
}
