package vo;

public class Products {
	private int productId; //상품 번호
	private int categoryId;	//분류 번호
	private String productName;	// 상품이름
	private int  productPrice;	//상품 가격 
	private String productContent;	// 상품 내용
	private String productSoldout;	// 상품의 품절 여부 "Y,N " 
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public String getProductSoldout() {
		return productSoldout;
	}
	public void setProductSoldout(String productSoldout) {
		this.productSoldout = productSoldout;
	}
	public String getProductPic() {
		return productPic;
	}
	public void setProductPic(String productPic) {
		this.productPic = productPic;
	}
	private String productPic;		// 상품의 이미지
}