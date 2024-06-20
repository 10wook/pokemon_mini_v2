package com.exam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.dto.ProductDetail;
import com.exam.service.ProductDetailService;

@Controller
public class ProductDetailController {

	 private final ProductDetailService productService;

	    @Autowired
	    public ProductDetailController(ProductDetailService productService) {
	        this.productService = productService;
	    }

	    @GetMapping("/productDetail")
	    public String showProductDetail(@RequestParam int productId, Model model) {
	        ProductDetail productDetail = productService.getProductById(productId);
	        if (productDetail == null) {
	            return "error/404"; // 상품이 없을 경우 404 페이지로 이동
	        }
	        model.addAttribute("productDetail", productDetail);
	        return "productDetail";
	    }
}
