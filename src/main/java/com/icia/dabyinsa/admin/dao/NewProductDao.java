package com.icia.dabyinsa.admin.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.icia.dabyinsa.admin.dto.product.prodinfoDto;

@Mapper
public interface NewProductDao {
    
	//상품등록
    public void NewProduct(prodinfoDto pi);
   
    //자체코드 중복체크
	public int Check(String ck);
	
	//파일 정보 저장
	public void fileInsert(Map<String, String> fmap);

}
