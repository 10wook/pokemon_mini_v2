package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.exam.dto.ProductDetail;
import com.exam.mapper.ProductDetailMapper;

@Service
public class ProductDetailServiceImpl implements ProductDetailService {
	
	private final ProductDetailMapper productDetailMapper;

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
