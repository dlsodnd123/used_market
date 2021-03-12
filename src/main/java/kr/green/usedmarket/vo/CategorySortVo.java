package kr.green.usedmarket.vo;

public class CategorySortVo {
	private String sort;
	private String category;
	private int page;
	private String order;
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
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	@Override
	public String toString() {
		return "CategorySortVo [sort=" + sort + ", category=" + category + ", page=" + page + ", order=" + order + "]";
	}	
}
