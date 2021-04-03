package com.gachifarm.domain;

public class Product {
	//product 수정
	int product_id;
	int saleType_id;
	int category_id;
	
	String prdtName;	//상품이름		
	String user_id;		//사용자로그인 아이디
	String description;	//상품 상세설명
	
	String origin;
	String supplier;
	String unit;
	String status;
	int qty;
	int price;
	String imagePath;
	String imageName;
	
	public Product() {
		super();
	}
	
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getSaleType_id() {
		return saleType_id;
	}
	public void setSaleType_id(int saleType_id) {
		this.saleType_id = saleType_id;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getPrdtName() {
		return prdtName;
	}
	public void setPrdtName(String prdtName) {
		this.prdtName = prdtName;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}


	
	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", saleType_id=" + saleType_id + ", category_id=" + category_id
				+ ", prdtName=" + prdtName + "]";
	}

	
	
}
