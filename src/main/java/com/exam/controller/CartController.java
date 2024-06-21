package com.exam.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.exam.dto.ProductDetail;
import com.exam.service.ProductDetailService;

@Controller
public class CartController {
		
		//ProductDetailService productService;
    @GetMapping("/cart")
    public String cart(Model model) {
        // 장바구니 아이템을 모델에 추가 (임시로 빈 리스트 사용)
        model.addAttribute("cartItems", new ArrayList<>());
        return "cart";
    }
//    @GetMapping("/productDetail")
//    public String showProductDetail(@RequestParam int productId, Model model) {
//        ProductDetail productDetail = productService.getProductById(productId);
//        if (productDetail == null) {
//            return "error/404"; // 상품이 없을 경우 404 페이지로 이동
//        }
//        model.addAttribute("productDetail", productDetail);
//        return "productDetail";
//    }
}
