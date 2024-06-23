package com.exam.service;

import com.exam.dto.ProductDetail;
import java.util.List;

public interface ProductDetailService {
    ProductDetail getProductById(int productId);
    List<ProductDetail> getAllProducts();
    List<ProductDetail> searchProducts(String query); // 검색 메서드 추가
}
