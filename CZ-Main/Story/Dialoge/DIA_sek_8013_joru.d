
instance DIA_JORU_EXIT(C_Info)
{
	npc = sek_8013_joru;
	nr = 999;
	condition = dia_joru_exit_condition;
	information = dia_joru_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_joru_exit_condition()
{
	return TRUE;
};

func void dia_joru_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_joru_PICKPOCKET(C_Info)
{
	npc = sek_8013_joru;
	nr = 900;
	condition = dia_joru_PICKPOCKET_Condition;
	information = dia_joru_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_joru_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void dia_joru_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_joru_PICKPOCKET);
	Info_AddChoice(dia_joru_PICKPOCKET,Dialog_Back,dia_joru_PICKPOCKET_BACK);
	Info_AddChoice(dia_joru_PICKPOCKET,DIALOG_PICKPOCKET,dia_joru_PICKPOCKET_DoIt);
};

func void dia_joru_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_joru_PICKPOCKET);
};

func void dia_joru_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_joru_PICKPOCKET);
};

instance DIA_JORU_HELLO(C_Info)
{
	npc = sek_8013_joru;
	nr = TRUE;
	condition = dia_joru_hello_condition;
	information = dia_joru_hello_info;
	permanent = FALSE;
	description = "Ahoj já jsem tu nový. Řekni mi něco o táboře.";
};


func int dia_joru_hello_condition()
{
	return TRUE;
};

func void dia_joru_hello_info()
{
	AI_Output(other,self,"DIA_Joru_Hello_15_00");	//Ahoj já jsem tu nový. Řekni mi něco o táboře.

	if(PSI_TALK == TRUE)
	{
		AI_Output(self,other,"DIA_Joru_Hello_11_01");	//Nevybral sis zrovna nejvhodnější čas. Templáři se připravují na boj a my novicové ve dne i v noci pracujeme(unaveně)
		AI_Output(self,other,"DIA_Joru_Hello_11_02");	//Nemám čas na vykecávání. Tak mě nevyrušuj. Teda v případě že nechceš zrovna něco koupit.
		Log_CreateTopic(TOPIC_TRADERPSI,LOG_NOTE);
		B_LogEntry(TOPIC_TRADERPSI,"Kovář Joru vyrábí zbraně a taky je prodává. Většinu času sedí ve své kovárně.");
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_Hello_11_03");	//Nemám čas se vykecávat. Neruš mě.
	};
};

instance DIA_JORU_TRADE(C_Info)
{
	npc = sek_8013_joru;
	nr = 800;
	condition = dia_joru_trade_condition;
	information = dia_joru_trade_info;
	permanent = TRUE;
	description = "Ukaž mi, co máš na skladě.";
	trade = TRUE;
};

func int dia_joru_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_joru_hello) && (PSI_TALK == TRUE) && Wld_IsTime(7,0,22,0))
	{
		return TRUE;
	};
};

func void dia_joru_trade_info()
{
	var int daynow;
	daynow = Wld_GetDay();

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Joru_Trade_15_00");	//Ukaž mi, co máš na skladě.
	AI_Output(self,other,"DIA_Joru_Trade_11_01");	//Tak to je něco jiného. Tady je vše, co mám.
	Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
	Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));

	if((SekBelt_01 == FALSE) && ((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR)))
	{
		CreateInvItems(self,ItBE_Addon_SEK_01,1);
		SekBelt_01 = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_JORU_ARMORCANTEACH(C_Info)
{
	npc = sek_8013_joru;
	nr = 5;
	condition = dia_joru_armorcanteach_condition;
	information = dia_joru_armorcanteach_info;
	permanent = TRUE;
	description = "Dovedl bys vykovat zbroj?";
};

func int dia_joru_armorcanteach_condition()
{
	if((JORU_TEACHARMOR == FALSE) && Npc_KnowsInfo(hero,dia_joru_hello) && (PSI_TALK == TRUE) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_SEK) || (hero.guild == GIL_NONE) || (other.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_joru_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Joru_ArmorCanTeach_01_00");	//Dovedl bys vykovat zbroj?
	AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_01");	//Bohužel tomu zas tak moc nerozumím. Nejsem jako Darrion.
	AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_02");	//On byl mistrem v kování zbrojí. Vykoval všechny zbroje templářům. To bylo ještě v kolonii.
	AI_Output(other,self,"DIA_Joru_ArmorCanTeach_01_03");	//A kde je teď?
	AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_04");	//To nikdo neví. Po dlouhou dobu jsem nic o něm slyšel, a kdo ví, co se s ním stalo!
	AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_05");	//Tedy, jestli chceš vyrobit opravdu silnou zbroj, pak ho musíš zkusit najít.
	AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_06");	//Jediná věc kterou tě mohu naučit, je jak vylepšit tvou roušku novice...
	AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_07");	//... Anebo ti můžu prodat zbroj novice, ale samozřejmě až budeš patřit do Bratrstva.
	AI_Output(other,self,"DIA_Joru_ArmorCanTeach_01_08");	//Co musím umět, abys mi ukázal, jak vylepšit roucho?
	AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_09");	//No... pro začátek musíš umět alespoň základy kovářství.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Joru_ArmorCanTeach_01_10");	//Základy už mám.
		AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_11");	//A vcelku velké! To je dobré, to bohatě stačí.
		AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_12");	//Takže, začneme, až mi zaplatíš.
		AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_13");	//Až pak začneme s tréninkem.
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_14");	//Vidím, že ani netušíš, jak držet kladivo.
		AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_15");	//Tak, se ke mně vrať až se naučíš alespoň základy.
		AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_16");	//A pak mi smaozřejmě, budeš muset za lekci zaplatit. Tak s tím počítej.
	};
	JORU_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Joru mě může naučit, jak vylepšit bederní roušku novice. Všechny složitější templářské zbroje ale vykoval Darrion a on jediný mi taky může ukázat, jak je překovat. Joru bohužel neví, kde teď Darrion pobývá.");
};

func void b_joru_teacharmor_1()
{
	AI_Output(self,other,"DIA_Joru_TeachArmor_1_01_01");	//Tak tedy začněme. Zkontroluj si, jestli máš všechen materiál hezky po ruce. Vezmi si kus syrové oceli...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_PSICAMP_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Joru_TeachArmor_1_01_02");	//... Dej ji na kovadlinu a mlať do ní...
		AI_Output(self,other,"DIA_Joru_TeachArmor_1_01_03");	//... Měl bys cítit, jak se kov napíná. Poslouchej jeho zvuk...
		AI_Output(self,other,"DIA_Joru_TeachArmor_1_01_04");	//... Musíš si dávat pozor, abys ho nerozmlátil... Tady je... Podívej... (ukazuje)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Joru_TeachArmor_1_01_05");	//... Je hotové!
		AI_Output(self,other,"DIA_Joru_TeachArmor_1_01_06");	//To je všehcno, co musíš vědět. Běž si to vyzkoušet.
	};
};

func void b_joruarmorchoices()
{
	Info_ClearChoices(dia_joru_armorteach);
	Info_AddChoice(dia_joru_armorteach,Dialog_Back,dia_joru_armorteach_back);

	if(PLAYER_TALENT_SMITH[28] == FALSE)
	{
		Info_AddChoice(dia_joru_armorteach,"Bederní rouška Bratrstva (cena: 200 zlatých)",dia_joru_armorteach_itar_sekbed_v1);
	};
	if((PLAYER_TALENT_SMITH[29] == FALSE) && (BuyTemplerLight == TRUE))
	{
		Info_AddChoice(dia_joru_armorteach,B_BuildLearnStringEx("Lehká zbroj templáře (cena: 3000 zlatých",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_TPL_L_V1)),dia_joru_armorteach_itar_tpl_l_v1);
	};
};

instance DIA_JORU_ARMORTEACH(C_Info)
{
	npc = sek_8013_joru;
	nr = 5;
	condition = dia_joru_armorteach_condition;
	information = dia_joru_armorteach_info;
	permanent = TRUE;
	description = "Nauč mě, jak vylepšit zbroj.";
};

func int dia_joru_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (JORU_TEACHARMOR == TRUE) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_SEK) || (other.guild == GIL_TPL)))
	{
		if((PLAYER_TALENT_SMITH[28] == FALSE) || (PLAYER_TALENT_SMITH[29] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_joru_armorteach_info()
{
	AI_Output(other,self,"DIA_Joru_ArmorTeach_01_00");	//Nauč mě, jak vylepšit zbroj.
	if(Wld_IsTime(7,0,22,0))
	{
		AI_Output(self,other,"DIA_Joru_ArmorTeach_01_01");	//A co chceš vědět?
		b_joruarmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_ArmorTeach_01_02");	//Dnes jsem už přestal pracovat...
		AI_Output(self,other,"DIA_Joru_ArmorTeach_01_03");	//Přijď zítra, pak si o tom promluvíme.
	};
};

func void dia_joru_armorteach_back()
{
	Info_ClearChoices(dia_joru_armorteach);
};

func void dia_joru_armorteach_itar_sekbed_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 200)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_SEKBED_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,200);
			b_joru_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_TeachArmor_04_00");	//Nemáš dost peněz. Přijď až je budeš mít.
	};

	b_joruarmorchoices();
};

func void dia_joru_armorteach_itar_tpl_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 3000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_TPL_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,3000);
			b_joru_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_TeachArmor_04_00");	//Nemáš dost peněz. Přijď až je budeš mít.
	};

	b_joruarmorchoices();
};


instance DIA_JORU_TRADEARMOR(C_Info)
{
	npc = sek_8013_joru;
	nr = 3;
	condition = dia_joru_tradearmor_condition;
	information = dia_joru_tradearmor_info;
	permanent = TRUE;
	description = "Prodej mi zbroj novice.";
};


func int dia_joru_tradearmor_condition()
{
	if((other.guild == GIL_SEK) && (PSI_TALK == TRUE) && ((JORU_TRADEARMOR_MIDDLE == FALSE) || (JORU_TRADEARMOR_MIDDLE2 == FALSE)))
	{
		return TRUE;
	};
};

func void dia_joru_tradearmor_info()
{
	AI_Output(other,self,"DIA_Joru_TradeArmor_01_00");	//Prodej mi zbroj novice.
	Info_ClearChoices(dia_joru_tradearmor);
	Info_AddChoice(dia_joru_tradearmor,Dialog_Back,dia_joru_tradearmor_back);
	if(JORU_TRADEARMOR_MIDDLE == FALSE)
	{
		Info_AddChoice(dia_joru_tradearmor,"Těžká zbroj novice Bratrstva (cena: 1000 zlatých)",dia_joru_tradearmor_buy1);
	};
	if(JORU_TRADEARMOR_MIDDLE2 == FALSE)
	{
		Info_AddChoice(dia_joru_tradearmor,"Zbroj novice Bratrstva (cena: 450 zlatých)",dia_joru_tradearmor_buy11);
	};
};

func void dia_joru_tradearmor_back()
{
	Info_ClearChoices(dia_joru_tradearmor);
};

func void dia_joru_tradearmor_buy1()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_SLP_L))
	{
		AI_Output(self,other,"DIA_Joru_TradeArmor_Buy1_01_01");	//Úžasné!
		AI_Print("Získáno 1x Těžká zbroj novice Bratrstva");
		CreateInvItems(other,itar_slp_l,1);
		JORU_TRADEARMOR_MIDDLE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_TradeArmor_Buy1_01_02");	//Žádné prachy, žádná zbroj...
	};
	Info_ClearChoices(dia_joru_tradearmor);
};

func void dia_joru_tradearmor_buy11()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,450))
	{
		AI_Output(self,other,"DIA_Joru_TradeArmor_Buy1_01_01");	//Úžasné!
		AI_Print("Získáno 1x Zbroj novice Bratrstva");
		CreateInvItems(other,itar_slp_ul,1);
		JORU_TRADEARMOR_MIDDLE2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_TradeArmor_Buy1_01_02");	//Žádné prachy, žádná zbroj...
	};
	Info_ClearChoices(dia_joru_tradearmor);
};


instance DIA_JORU_SEKTEHEILEN(C_Info)
{
	npc = sek_8013_joru;
	nr = 1;
	condition = dia_joru_sekteheilen_condition;
	information = dia_joru_sekteheilen_info;
	permanent = FALSE;
	description = "Napij se. Pomůže ti to od bolesti hlavy.";
};


func int dia_joru_sekteheilen_condition()
{
	if((Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && Npc_KnowsInfo(hero,dia_baalorun_sekteheilengot))
	{
		return TRUE;
	};
};

func void dia_joru_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Joru_SekteHeilen_01_00");	//Napij se. Pomůže ti to od bolesti hlavy.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Output(self,other,"DIA_Joru_SekteHeilen_01_01");	//Citím se mnohem lépe!
	AI_Output(self,other,"DIA_Joru_SekteHeilen_01_02");	//Děkuji ti, hrozně moc.
};

instance DIA_Joru_DoCrossBow(C_Info)
{
	npc = sek_8013_joru;
	nr = 1;
	condition = DIA_Joru_DoCrossBow_condition;
	information = DIA_Joru_DoCrossBow_info;
	permanent = FALSE;
	description = "Víš, jak vyrobit kuši?";
};

func int DIA_Joru_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Joru_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Joru_DoCrossBow_01_01");	//Víš, jak vyrobit kuši?
	AI_Output(self,other,"DIA_Joru_DoCrossBow_01_02");	//Kuši? Ne-e. Jdi se raději zeptat nějakého tesaře nebo truhláře.
	AI_Output(other,self,"DIA_Joru_DoCrossBow_01_05");	//Dobře.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Vyrobit kuši může pouze tesař nebo truhlář.");
};