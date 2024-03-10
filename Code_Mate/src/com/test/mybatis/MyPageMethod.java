package com.test.mybatis;

public class MyPageMethod
{
	public String nullOrBlindCheck(String item, int itemOpen, String itemName)
	{
		String result = item;
		
		// 설정된 값이 없을 때
		if (item == null)
		{
			result = itemName + " 미입력";
		}

		// 비공개로 설정된 항목일 때
		else if (itemOpen == 1)
		{
			result = itemName + " 비공개";
		}
		
		return result;
	}
	
	public String[] skillGradeIcon(String cp, int skillScore)
	{
		String[] result = new String[2];
		
		if (skillScore <= 1050)
		{
			result[0] = cp + "/img/grade_icon/1_seed.png";
			result[1] = "씨앗";
		}
		else if (skillScore <= 1100)
		{
			result[0] = cp + "/img/grade_icon/2_plant.png";
			result[1] = "새싹";
		}
		else if (skillScore <= 1150)
		{
			result[0] = cp + "/img/grade_icon/3_leaf.png";
			result[1] = "잎새";
		}
		else if (skillScore <= 1300)
		{
			result[0] = cp + "/img/grade_icon/4_branch.png";
			result[1] = "가지";
		}
		else if (skillScore <= 1500)
		{
			result[0] = cp + "/img/grade_icon/5_pear.png";
			result[1] = "열매";
		}
		else if (skillScore <= 1600)
		{
			result[0] = cp + "/img/grade_icon/6_tree.png";
			result[1] = "나무";
		}
		else if (skillScore >= 1601)
		{
			result[0] = cp + "/img/grade_icon/7_forest.png";
			result[1] = "숲";
		}

		return result;
	}
	
}
