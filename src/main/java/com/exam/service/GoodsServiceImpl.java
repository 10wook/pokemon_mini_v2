package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.exam.dto.Goods;
import com.exam.mapper.GoodsMapper;

@Service
public class GoodsServiceImpl implements GoodsService {
	
     GoodsMapper goodsMapper;
     
     @Autowired
     public GoodsServiceImpl(GoodsMapper goodsMapper) {
    	 this.goodsMapper = goodsMapper;
     }
     
     
    @Override
    public List<Goods> getAllGoods() {
        return goodsMapper.getAllGoods();
    }

    @Override
    public void saveGoods(Goods goods) {
        goodsMapper.insert(goods);
    }

}
