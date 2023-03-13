package com.kh.board.model.vo;

public class Category {
	public int categoryNo;
	public String categoryName;
	
	public Category() {
		
		
	}

	public Category(int categoryNo, String categotyName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categotyName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "Category [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}
	
	
}
