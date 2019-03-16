func string B_BuildLearnString(var string text,var int kosten)
{
	var string concatText;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string B_BuildLearnStringEx(var string text,var int kosten)
{
	var string concatText;
	concatText = ConcatStrings(text,", ");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string b_buildlearnstringforskills(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	if(hero.level >= 100)
	{
		money = (kosten * 200) / TEMPSSBMODE;
	}
	else if(hero.level >= 70)
	{
		money = (kosten * 175) / TEMPSSBMODE;
	}
	else if(hero.level >= 60)
	{
		money = (kosten * 150) / TEMPSSBMODE;
	}
	else if(hero.level >= 50)
	{
		money = (kosten * 125) / TEMPSSBMODE;
	}
	else if(hero.level >= 45)
	{
		money = (kosten * 100) / TEMPSSBMODE;
	}
	else if(hero.level >= 40)
	{
		money = (kosten * 90) / TEMPSSBMODE;
	}
	else if(hero.level >= 35)
	{
		money = (kosten * 80) / TEMPSSBMODE;
	}
	else if(hero.level >= 30)
	{
		money = (kosten * 70) / TEMPSSBMODE;
	}
	else if(hero.level >= 25)
	{
		money = (kosten * 60) / TEMPSSBMODE;
	}
	else if(hero.level >= 20)
	{
		money = (kosten * 50) / TEMPSSBMODE;
	}
	else if(hero.level >= 15)
	{
		money = (kosten * 40) / TEMPSSBMODE;
	}
	else if(hero.level >= 10)
	{
		money = (kosten * 30) / TEMPSSBMODE;
	}
	else if(hero.level >= 5)
	{
		money = (kosten * 20) / TEMPSSBMODE;
	}
	else
	{
		money = (kosten * 10) / TEMPSSBMODE;
	};
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string b_buildlearnstringforfight(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	if(hero.level >= 100)
	{
		money = (kosten * 300) / TEMPSSBMODE;
	}
	else if(hero.level >= 70)
	{
		money = (kosten * 200) / TEMPSSBMODE;
	}
	else if(hero.level >= 60)
	{
		money = (kosten * 150) / TEMPSSBMODE;
	}
	else if(hero.level >= 50)
	{
		money = (kosten * 125) / TEMPSSBMODE;
	}
	else if(hero.level >= 40)
	{
		money = (kosten * 100) / TEMPSSBMODE;
	}
	else if(hero.level >= 30)
	{
		money = (kosten * 75) / TEMPSSBMODE;
	}
	else if(hero.level >= 20)
	{
		money = (kosten * 50) / TEMPSSBMODE;
	}
	else if(hero.level >= 10)
	{
		money = (kosten * 30) / TEMPSSBMODE;
	}
	else
	{
		money = (kosten * 15) / TEMPSSBMODE;
	};
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string b_buildlearnstringforcircles(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	money = (kosten * 250) / TEMPSSBMODE;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string b_buildlearnstringforalchemy(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	money = (kosten * 75) / TEMPSSBMODE;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string b_buildlearnstringforrunes(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	money = (kosten * 200) / TEMPSSBMODE;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string b_buildlearnstringforsmithhunt(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	money = (kosten * 75) / TEMPSSBMODE;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string B_BuildLearnStringForSmith_SLD(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	money = (kosten * 250) / TEMPSSBMODE;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string b_buildlearnstringforthief(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	money = (kosten * 100) / TEMPSSBMODE;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string b_buildlearnstringformakearrows(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else 
	{
		TEMPSSBMODE = 1;
	};

	money = (kosten * 100) / TEMPSSBMODE;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string b_buildlearnstringforlanguage(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	money = (kosten * 200) / TEMPSSBMODE;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string b_buildlearnstringforerzhunt(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	money = (kosten * 200) / TEMPSSBMODE;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string b_buildlearnstringforgoldhunt(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	money = (kosten * 100) / TEMPSSBMODE;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string b_buildlearnstringfordemonolog(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	money = (kosten * 250) / TEMPSSBMODE;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string b_buildlearnstringforstamina(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	money = (kosten * 50) / TEMPSSBMODE;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string b_buildlearnstringforhitpoints(var string text,var int kosten)
{
	var string concatText;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	money = (kosten * 100) / TEMPSSBMODE;
	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,PRINT_MONEYTEACH);
	concatText = ConcatStrings(concatText,IntToString(money));
	concatText = ConcatStrings(concatText,PRINT_SHULDEN2);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};

func string B_BuildLearnStringForOrc(var string text,var int kosten)
{
	var string concatText;

	concatText = ConcatStrings(text," (");
	concatText = ConcatStrings(concatText,PRINT_Kosten);
	concatText = ConcatStrings(concatText,IntToString(kosten));
	concatText = ConcatStrings(concatText,PRINT_LP);
	concatText = ConcatStrings(concatText,")");
	return concatText;
};
