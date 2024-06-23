package com.exam.mapper;

import com.exam.dto.ProductDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ProductDetailMapper {
    ProductDetail getProductById(@Param("id") int productId);
    List<ProductDetail> getAllProducts();
    List<ProductDetail> searchProducts(@Param("query") String query); // 검색 쿼리 추가
}
