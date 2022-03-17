package com.icia.dabyinsa.user.dto;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
public class MemberDto {
		public String m_id;
		public String m_pass;
		public String m_name;
		public String m_phone;
		public String m_email;
		public String enrolldate;
		public String deletedate;
		public int m_point;
		public String m_grade;
		public String m_provider;
		public String m_providerId;
		public int m_message;
		public String m_memo;
		public int m_postal;
		public String m_address;
		public String m_addr;
		public String m_role;
		private String gr_name;
		
		public List<String> getRoleList(){
	        if(this.m_role.length() > 0){
	            return Arrays.asList(this.m_role.split(","));
	        }
	        return new ArrayList<>();
	    }

		@Builder
		public MemberDto(String m_id, String m_pass, String m_name, String m_phone, String m_email, String enrolldate,
				String deletedate, int m_point, String m_grade, String m_provider, String m_providerId, int m_message,
				String m_memo, int m_postal, String m_address, String m_addr, String m_role, String gr_name) {
			this.m_id = m_id;
			this.m_pass = m_pass;
			this.m_name = m_name;
			this.m_phone = m_phone;
			this.m_email = m_email;
			this.enrolldate = enrolldate;
			this.deletedate = deletedate;
			this.m_point = m_point;
			this.m_grade = m_grade;
			this.m_provider = m_provider;
			this.m_providerId = m_providerId;
			this.m_message = m_message;
			this.m_memo = m_memo;
			this.m_postal = m_postal;
			this.m_address = m_address;
			this.m_addr = m_addr;
			this.m_role = m_role;
			this.gr_name = gr_name;
		}

		
}

