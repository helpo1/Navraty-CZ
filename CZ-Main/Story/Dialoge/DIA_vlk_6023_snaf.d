
instance DIA_SNAF_NW_EXIT(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 999;
	condition = dia_snaf_nw_exit_condition;
	information = dia_snaf_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_snaf_nw_exit_condition()
{
	return TRUE;
};

func void dia_snaf_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SNAF_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 900;
	condition = dia_snaf_nw_pickpocket_condition;
	information = dia_snaf_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_snaf_nw_pickpocket_condition()
{
	return C_Beklauen(75,150);
};

func void dia_snaf_nw_pickpocket_info()
{
	Info_ClearChoices(dia_snaf_nw_pickpocket);
	Info_AddChoice(dia_snaf_nw_pickpocket,Dialog_Back,dia_snaf_nw_pickpocket_back);
	Info_AddChoice(dia_snaf_nw_pickpocket,DIALOG_PICKPOCKET,dia_snaf_nw_pickpocket_doit);
};

func void dia_snaf_nw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_snaf_nw_pickpocket);
};

func void dia_snaf_nw_pickpocket_back()
{
	Info_ClearChoices(dia_snaf_nw_pickpocket);
};


instance DIA_SNAF_NW_HI(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 1;
	condition = dia_snaf_nw_hi_condition;
	information = dia_snaf_nw_hi_info;
	important = TRUE;
};


func int dia_snaf_nw_hi_condition()
{
	return TRUE;
};

func void dia_snaf_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_00");	//Tak tak, koho to vidím?
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_01");	//Snafe, jsi to ty?
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_02");	//Osobně. Je to velké překvapení?
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_03");	//Nečekal jsem, že tě tu potkám.
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_04");	//Já také ne, myslel jsem, že jsi někde hodně daleko...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Snaf_NW_Hi_01_05");	//Mág Ohně? No koho by to napadlo?
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Snaf_NW_Hi_01_06");	//Paladin! No koho by to napadlo?
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Snaf_NW_Hi_01_07");	//Žoldák! No koho by to napadlo?
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Snaf_NW_Hi_01_0A");	//Mág Vody! No koho by to napadlo...
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Snaf_NW_Hi_01_0B");	//NEKTROMANT! No koho by to napadlo?
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Snaf_NW_Hi_01_0C");	//Sektář, no kdo by si pomyslel...
	};
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_08");	//Co ty tady děláš?
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_09");	//Copak nevidíš? Pracuji zde... 
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_10");	//Kardif tě vzal k sobě?
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_11");	//Podělil jsem se s ním o své nejlepší recepty, on mi na oplátku nabídl práci.
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_12");	//Já si nestěžuji. A Kardif mé méně problémů.
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_13");	//Nevypadá to, že by litoval,že mě vzal k sobě.
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_14");	//Ano, dobře ses zabydlel.
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_15");	//Samo sebe. Dobře tedy - mám ještě hodně práce, takže na pokec nemám čas. Dokonce ani se starým známým!
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_16");	//Dobrá tedy, pracuj. Nebudu ti tu překážet.
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_17");	//Děkuji.
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_18");	//Bez problémů.
};

instance DIA_Snaf_NW_Booze(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 3;
	condition = DIA_Snaf_NW_Booze_Condition;
	information = DIA_Snaf_NW_Booze_Info;
	permanent = FALSE;
	description = "Tady máš to pivo, příteli.";
};

func int DIA_Snaf_NW_Booze_Condition()
{
	if((Npc_HasItems(other,ItFo_Addon_LousHammer) >= 1) && (MIS_SnafHammer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Snaf_NW_Booze_Info()
{
	B_GivePlayerXP(XP_Addon_Loushammer);
	AI_Output(other,self,"DIA_Addon_Snaf_Booze_15_00");	//Tady máš to pivo, příteli.
	B_GiveInvItems(other,self,ItFo_Addon_LousHammer,1);
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_01");	//Dovol mi ti udělat omáčku.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_02");	//Hotovo! Můžeš jí zkusit hned teď.
	B_GiveInvItems(self,other,ItFo_Addon_FireStew,1);
	MIS_SnafHammer = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_Addon_Hammer,LOG_SUCCESS);
	B_LogEntry(Topic_Addon_Hammer,"Donesl jsem Snafovy chlast.");
};

instance DIA_SNAF_NW_CITY(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 2;
	condition = dia_snaf_nw_city_condition;
	information = dia_snaf_nw_city_info;
	permanent = TRUE;
	description = "Něco nového?";
};

func int dia_snaf_nw_city_condition()
{
	if(Npc_KnowsInfo(other,dia_snaf_nw_hi))
	{
		return TRUE;
	};
};

func void dia_snaf_nw_city_info()
{
	AI_Output(other,self,"DIA_Snaf_NW_City_01_00");	//Něco nového?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Snaf_NW_City_01_01");	//Celkem ne, jen se divím, že k mágům Ohně se dostal bandita z tábora v bažinách...
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Snaf_NW_City_01_02");	//Celkem ne, jen se divím, že k paladinům se dostal bandita z tábora v bažinách...
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Snaf_NW_City_01_03");	//Celkem ne, jen se divím, že k žoldákům se dostal bandita z tábora v bažinách...
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Snaf_NW_City_01_04");	//Celkem ne, jen se divím, že k mágům Vody se dostal bandita z tábora v bažinách...
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Snaf_NW_City_01_05");	//Celkem ne, jen se divím, že k mágům Temnot se dostal bandita z tábora v bažinách...
	}
	else
	{
		AI_Output(self,other,"DIA_Snaf_NW_City_01_06");	//Celkem ne, nic zajímavého.
	};
};

instance DIA_Addon_Snaf_NW_TeachCookDone(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 6;
	condition = DIA_Addon_Snaf_NW_TeachCookDone_Condition;
	information = DIA_Addon_Snaf_NW_TeachCookDone_Info;
	permanent = TRUE;
	description = "Nauč mě vařit vývary.";
};

func int DIA_Addon_Snaf_NW_TeachCookDone_Condition()
{
	if((SnafTeachCook == TRUE) && ((Snaf_Meal_01 == FALSE) || (Snaf_Meal_02 == FALSE) || (Snaf_Meal_03 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_NW_TeachCookDone_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCookDone_01_00");	//Nauč mě vařit vývary.
	AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_01_01");	//Dobře, s čím začnem?
	Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
	Info_AddChoice(DIA_Addon_Snaf_NW_TeachCookDone,Dialog_Back,DIA_Addon_Snaf_NW_TeachCookDone_back);

	if(Snaf_Meal_01 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_NW_TeachCookDone,"Vývar z tmavých hub (cena: 500 zlatých)",DIA_Addon_Snaf_NW_TeachCookDone_BlackMeal);
	};
	if(Snaf_Meal_02 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_NW_TeachCookDone,"Vývar z otrokových chlebů (cena: 750 zlatých)",DIA_Addon_Snaf_NW_TeachCookDone_HotMeal);
	};
	if(Snaf_Meal_03 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_NW_TeachCookDone,"Masové ragú (cena: 250 zlatých)",DIA_Addon_Snaf_NW_TeachCookDone_MeatMeal);
	};
};

func void DIA_Addon_Snaf_NW_TeachCookDone_back()
{
	Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
};

func void DIA_Addon_Snaf_NW_TeachCookDone_BlackMeal()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_00");	//Vývar z tmavých hub.

	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_01");	//Není nic jednodušího. Potřebujem asi 50 tmavých hub.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_02");	//Dáme je do hrnce s vodou, a vaříme dokuď voda nezčerná.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_03");	//Pak přidej lístek ohnivého býlí. Pro odstranění hořkosti polévky!
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_04");	//To je vše.
		AI_Print("Naučeno: Vaření - 'Vývar z tmavých hub'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro VÝVAR Z TMAVÝCH HUB: 50x tmavá houba a ohnivé býlí.");
		Snd_Play("LevelUP");
		Snaf_Meal_01 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_05");	//Máš mě snad za blázna?
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_06");	//Nic tě nenaučím dokuď zlato neuvidím.
		Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
	};
};

func void DIA_Addon_Snaf_NW_TeachCookDone_HotMeal()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_00");	//Vývar z otrokových chlebů.

	if(Npc_HasItems(hero,ItMi_Gold) >= 750)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,750);
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_01");	//Pro tuhletu polívku se ukázalo že je důležité nelitovat hub.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_02");	//Dáš padesát kousků hub do hrnce, potom ohnivý kořen a pomaly míchat v rozpáleném hrnci.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_03");	//Za méně než půl hodiny je polévka hotová.
		AI_Print("Naučeno: Vaření - 'Vývar z otrokových chlebů'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro VÝVAR Z OTROKOVÝCH CHLEBŮ: 50x otrokův chléb a ohnivý kořen.");
		Snd_Play("LevelUP");
		Snaf_Meal_02 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_04");	//Máš mě snad za blázna?
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_05");	//Nic tě nenaučím dokuď zlato neuvidím.
		Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
	};
};


func void DIA_Addon_Snaf_NW_TeachCookDone_MeatMeal()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_00");	//Masové ragú.

	if(Npc_HasItems(hero,ItMi_Gold) >= 250)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,250);
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_01");	//Je to můj vlastní recept. (hrdě) Nic v přebytku.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_02");	//Jen trocha masa a mastných hub.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_03");	//Naházíš všechno do hrnce, vaříš - a ten nejchutnější pokrm světa co jsem kdy ochutnal je hotový.
		AI_Print("Naučeno: Vaření - 'Masové ragú'");
		B_LogEntry(TOPIC_COOK,"Ingredience pro MASOVÉ RAGÚ: 2x tmavá houba a maso ze žravé štěnice.");
		Snd_Play("LevelUP");
		Snaf_Meal_03 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_04");	//Máš mě snad za blázna?
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_05");	//Nic tě nenaučím dokuď zlato neuvidím.
		Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
	};
};