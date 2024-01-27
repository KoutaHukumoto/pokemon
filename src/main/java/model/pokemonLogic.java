package model;

import java.util.ArrayList;

public class pokemonLogic {

	public pokemon getpokemon(ArrayList<pokemon> pokemonlist, String pokemonname1) {

		for (pokemon pokemon : pokemonlist) {
			if (pokemon.getName().equals(pokemonname1)) {
				pokemon getpokemon = new pokemon(pokemon.getName(), pokemon.getType(),
						pokemon.getSkill1(), pokemon.getSkill2(), pokemon.getSkill3(),
						pokemon.getSkill4(), pokemon.getHp(), pokemon.getAttack(),
						pokemon.getDefence(), pokemon.getSpattack(), pokemon.getSpdefence(),
						pokemon.getSpeed());

				return getpokemon;
			}
		}
		return null;
	}

	public ArrayList<pokemon> getpokemonskill(ArrayList<pokemon> skilllist, pokemon getpokemon) {
		ArrayList<pokemon> pokemonskillList = new ArrayList<pokemon>();

		for (pokemon skill : skilllist) {
			if (skill.getSkillName().equals(getpokemon.getSkill1()) ||
				    skill.getSkillName().equals(getpokemon.getSkill2()) ||
				    skill.getSkillName().equals(getpokemon.getSkill3()) ||
				    skill.getSkillName().equals(getpokemon.getSkill4()))  {
				pokemonskillList.add(new pokemon(skill.getSkillName(), skill.getType(), skill.getDmg(),skill.getTag()));
			}
		}
		return pokemonskillList;
	}

}
