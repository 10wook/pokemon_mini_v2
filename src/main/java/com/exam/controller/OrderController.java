package com.exam.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {

    @GetMapping("/order")
    public String order(Model model) {
        // 주문 아이템을 모델에 추가 (임시로 빈 리스트 사용)
        model.addAttribute("orderItems", new ArrayList<>());
        return "order";
    }
}
