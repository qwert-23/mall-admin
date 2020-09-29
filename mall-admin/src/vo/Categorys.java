package vo;

public class Categorys {
	private int categoryId;		//분류 번호
	private String categoryName;	//분류 이름 
	private String cateogryPic;
	private String cateogryCk;
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCateogryPic() {
		return cateogryPic;
	}
	public void setCateogryPic(String cateogryPic) {
		this.cateogryPic = cateogryPic;
	}
	public String getCateogryCk() {
		return cateogryCk;
	}
	public void setCateogryCk(String cateogryCk) {
		this.cateogryCk = cateogryCk;
	}

}
