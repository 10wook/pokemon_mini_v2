package com.exam.service;

import com.exam.dto.Goods;

import java.util.List;

public interface GoodsService {
    List<Goods> getAllGoods();
    void saveGoods(Goods goods);
}
