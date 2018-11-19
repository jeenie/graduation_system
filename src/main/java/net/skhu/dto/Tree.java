package net.skhu.dto;

public class Tree {
	String label;
	String itemId;
	String parentId;
	String order;
	
	
	public Tree(String label, String itemId, String parentId, String order) {
		super();
		this.label = label;
		this.itemId = itemId;
		this.parentId = parentId;
		this.order = order;
	}
	
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	
	
}
