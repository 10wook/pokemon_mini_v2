package com.exam.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {

    @GetMapping("/cart")
    public String cart(Model model) {
        // 장바구니 아이템을 모델에 추가 (임시로 빈 리스트 사용)
        model.addAttribute("cartItems", new ArrayList<>());
        return "cart";
    }
}
