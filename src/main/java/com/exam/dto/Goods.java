package com.exam.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.apache.ibatis.type.Alias;

@Alias("goods")
public class Goods {

	   private String gCode;
	    private String gCategory;
	    private String gName;
	    private String gContent;
	    private int gPrice;
	    private String gImage;
		public Goods(String gCode, String gCategory, String gName, String gContent, int gPrice, String gImage) {
			super();
			this.gCode = gCode;
			this.gCategory = gCategory;
			this.gName = gName;
			this.gContent = gContent;
			this.gPrice = gPrice;
			this.gImage = gImage;
		}
		public Goods() {
			super();
			// TODO Auto-generated constructor stub
		}
		public String getgCode() {
			return gCode;
		}
		public void setgCode(String gCode) {
			this.gCode = gCode;
		}
		public String getgCategory() {
			return gCategory;
		}
		public void setgCategory(String gCategory) {
			this.gCategory = gCategory;
		}
		public String getgName() {
			return gName;
		}
		public void setgName(String gName) {
			this.gName = gName;
		}
		public String getgContent() {
			return gContent;
		}
		public void setgContent(String gContent) {
			this.gContent = gContent;
		}
		public int getgPrice() {
			return gPrice;
		}
		public void setgPrice(int gPrice) {
			this.gPrice = gPrice;
		}
		public String getgImage() {
			return gImage;
		}
		public void setgImage(String gImage) {
			this.gImage = gImage;
		}

}
