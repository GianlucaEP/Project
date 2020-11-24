package it.rt.corso.beans;

/**
 * class that rapresents the data to be stored in the costs page in an Excel of a Gantt chart
 * */
public class Cost {
	private String cost;
	private String inflation;
	private String price;
	private String partial;
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getInflation() {
		return inflation;
	}
	public void setInflation(String inflation) {
		this.inflation = inflation;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPartial() {
		return partial;
	}
	public void setPartial(String partial) {
		this.partial = partial;
	}
	
	
}
