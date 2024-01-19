package model;

import java.io.Serializable;

public class pokemon implements Serializable {

	private String name, type, Skill1, Skill2, Skill3, Skill4;

	private int id, hp, attack, defence, spattack, spdefence, speed;

	public pokemon(String name, String type, String Skill1, String Skill2, String Skill3, String Skill4, int hp,
			int attack,
			int defence, int spattack, int spdefence, int speed) {
		this.name = name;
		this.Skill1 = Skill1;
		this.Skill2 = Skill2;
		this.Skill3 = Skill3;
		this.Skill4 = Skill4;
		this.type = type;
		this.hp = hp;
		this.attack = attack;
		this.defence = defence;
		this.spattack = spattack;
		this.spdefence = spdefence;
		this.speed = speed;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getHp() {
		return hp;
	}

	public void setHp(int hp) {
		this.hp = hp;
	}

	public int getAttack() {
		return attack;
	}

	public void setAttack(int attack) {
		this.attack = attack;
	}

	public int getDefence() {
		return defence;
	}

	public void setDefence(int defence) {
		this.defence = defence;
	}

	public int getSpattack() {
		return spattack;
	}

	public void setSpattack(int spattack) {
		this.spattack = spattack;
	}

	public int getSpdefence() {
		return spdefence;
	}

	public void setSpdefence(int spdefence) {
		this.spdefence = spdefence;
	}

	public int getSpeed() {
		return speed;
	}

	public void setSpeed(int speed) {
		this.speed = speed;
	}

	public String getSkill1() {
		return Skill1;
	}

	public void setSkill1(String skill1) {
		Skill1 = skill1;
	}

	public String getSkill2() {
		return Skill2;
	}

	public void setSkill2(String skill2) {
		Skill2 = skill2;
	}

	public String getSkill3() {
		return Skill3;
	}

	public void setSkill3(String skill3) {
		Skill3 = skill3;
	}

	public String getSkill4() {
		return Skill4;
	}

	public void setSkill4(String skill4) {
		Skill4 = skill4;
	}

}
