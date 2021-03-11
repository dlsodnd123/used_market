package kr.green.usedmarket.vo;

public class CategorySortVo {
	private String sort;
	private String category;
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "CategorySortVo [sort=" + sort + ", category=" + category + "]";
	}	
}
