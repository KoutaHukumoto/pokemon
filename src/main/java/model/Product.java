package model;

import java.io.Serializable;

public class Product implements Serializable {

	private String name;

	private int id, money;

	public Product() {

	}

	public Product(int id, String name, int money) {
		// TODO 自動生成されたコンストラクター・スタブ
		this.id = id;
		this.name = name;
		this.money = money;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

}
