package com.exam.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.exam.dto.ProductDetail;
import com.exam.mapper.ProductDetailMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class ProductDetailServiceImpl implements ProductDetailService {
    
    private final ProductDetailMapper productDetailMapper;
    private static final Logger logger = LoggerFactory.getLogger(ProductDetailServiceImpl.class);

    @Autowired
    public ProductDetailServiceImpl(ProductDetailMapper productDetailMapper) {
        this.productDetailMapper = productDetailMapper;
    }

    @Override
    public ProductDetail getProductById(int productId) {
        ProductDetail productDetail = productDetailMapper.getProductById(productId);
        if (productDetail == null) {
            return null; // 예외 처리 필요
        }
        return convertToDTO(productDetail);
    }
    
    @Override
    public List<ProductDetail> getAllProducts() {
        List<ProductDetail> productDetails = productDetailMapper.getAllProducts();
        logger.info("Fetched Products: {}", productDetails); // 로그 추가
        return productDetails;
    }

    @Override
    public List<ProductDetail> searchProducts(String query) {
        List<ProductDetail> searchResults = productDetailMapper.searchProducts(query);
        logger.info("Search Query: {}, Results: {}", query, searchResults); // 로그 추가
        return searchResults;
    }

    private ProductDetail convertToDTO(ProductDetail productDetail) {
        ProductDetail dto = new ProductDetail();
        dto.setId(productDetail.getId());
        dto.setCategory(productDetail.getCategory());
        dto.setName(productDetail.getName());
        dto.setDescription(productDetail.getDescription());
        dto.setPrice(productDetail.getPrice());
        dto.setImageUrl(productDetail.getImageUrl());
        return dto;
    }
}
