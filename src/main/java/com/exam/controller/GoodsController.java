package com.exam.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.dto.Goods;
import com.exam.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	GoodsService goodsService;
	
	
    public GoodsController(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @GetMapping
    public String showGoodsList(Model model) {
        List<Goods> goods = goodsService.getAllGoods();
        model.addAttribute("goodsForm", goods);
        return "goodsForm";
    }
    
    @GetMapping("/list")
    public String listGoods(Model model) {
        List<Goods> goodsList = goodsService.getAllGoods();
        model.addAttribute("goodsList", goodsList);
        return "goodsList";
    }

    @GetMapping("/form")
    public String showGoodsForm(Model model) {
        model.addAttribute("goods", new Goods());
        return "goodsForm";
    }

    @PostMapping("/add")
    public String addGoods(@ModelAttribute Goods goods) {
        goodsService.saveGoods(goods);
        return "redirect:/goods/list";
    }
}