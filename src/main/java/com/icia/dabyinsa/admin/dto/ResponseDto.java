package com.icia.dabyinsa.admin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ResponseDto<T> {
	
	int stauts;
	T value;
}
