package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.springframework.stereotype.Repository;
import com.exam.dto.Goods;

@Mapper
@Repository
public interface GoodsMapper {
    List<Goods> getAllGoods();
    void insert(Goods goods);
}
