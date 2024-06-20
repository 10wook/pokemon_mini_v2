package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.exam.dto.ProductDetail;

@Mapper
public interface ProductDetailMapper {
	 ProductDetail getProductById(@Param("id") int productId);
}
