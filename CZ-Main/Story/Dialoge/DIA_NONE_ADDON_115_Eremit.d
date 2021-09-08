
instance DIA_Addon_Eremit_EXIT(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 999;
	condition = DIA_Addon_Eremit_EXIT_Condition;
	information = DIA_Addon_Eremit_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Eremit_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Eremit_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Eremit_Hello(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 1;
	condition = DIA_Addon_Eremit_Hello_Condition;
	information = DIA_Addon_Eremit_Hello_Info;
	description = "Co tady děláš?";
};


func int DIA_Addon_Eremit_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Eremit_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_00");	//(překvapeně) Co tady děláš?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_00");	//Co tu dělám?! A co TY tu k čertu děláš?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_01");	//Šel jsem co do nejodlehlejší části ostrova, abych měl klid!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_02");	//Občanská válka, útočící banditi, hordy skřetů skoro na prahu...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_03");	//To není pro mě. Už nikdy víc. Proto jsem se rozhodl, že odejdu z toho šílenství.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_04");	//Tady je taky pár skřetů, ale jsou daleko a není jich tolik.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_05");	//A ostatní lidé sem - díky Innosovi - nechodí. (mrzutě) Až dodnes.
};


instance DIA_Addon_Eremit_SeekTafeln(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 2;
	condition = DIA_Addon_Eremit_SeekTafeln_Condition;
	information = DIA_Addon_Eremit_SeekTafeln_Info;
	description = "Hledám kamenné tabulky. Nenašel jsi náhodou nějaké?";
};


func int DIA_Addon_Eremit_SeekTafeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Eremit_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_SeekTafeln_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_02");	//Hledám kamenné tabulky. Nenašel jsi náhodou nějaké?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_06");	//Ale ano, mám jich tu pár... Ale nedám ti je!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_07");	//Jsou tou jedinou věcí, kterou můžu číst.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_08");	//Úplně jim nerozumím, ale některé texty jsem už dešifroval.
};


var int Eremit_Teach_Once;

instance DIA_Addon_Eremit_Teach(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 3;
	condition = DIA_Addon_Eremit_Teach_Condition;
	information = DIA_Addon_Eremit_Teach_Info;
	permanent = TRUE;
	description = "O kamenných tabulkách...";
};


func int DIA_Addon_Eremit_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Eremit_SeekTafeln) && (Eremit_Teach_Once == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Eremit_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_03");	//O kamenných tabulkách...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_25");	//Chceš, abych tě je naučil číst?
	if(MIS_Eremit_Klamotten != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_26");	//(rychle) Ale moje tabulky nedostaneš! Budeš si muset sehnat vlastní.
	};
	Info_ClearChoices(DIA_Addon_Eremit_Teach);
	Info_AddChoice(DIA_Addon_Eremit_Teach,Dialog_Back,DIA_Addon_Eremit_Teach_No);
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Eremit_Teach_Yes);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Eremit_Teach_Yes);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Eremit_Teach_Yes);
	};
};

func void B_Addon_Eremit_TeachLanguage()
{
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_27");	//Je to celkem jednoduché, sleduj. 'G' je 'O', 'T' je 'H', 'I' je 'C'.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_28");	//Jak to jednou pochopíš, zbytek tě napadne docela rychle...
	Eremit_Teach_Once = TRUE;
};

func void DIA_Addon_Eremit_Teach_No()
{
	Info_ClearChoices(DIA_Addon_Eremit_Teach);
};

func void DIA_Addon_Eremit_Teach_Yes()
{
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_29");	//Myslím, že už tě nemůžu nic naučit...
		Eremit_Teach_Once = TRUE;
	}
	else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	}
	else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	}
	else if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		B_Addon_Eremit_TeachLanguage();
	};
};


instance DIA_Addon_Eremit_Klamotten(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 4;
	condition = DIA_Addon_Eremit_Klamotten_Condition;
	information = DIA_Addon_Eremit_Klamotten_Info;
	permanent = TRUE;
	description = "Něco pro tebe mám...";
};


func int DIA_Addon_Eremit_Klamotten_Condition()
{
	if(MIS_Eremit_Klamotten == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_Klamotten_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_01");	//Něco pro tebe mám...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_19");	//Opravdu? Dej mi to! Podívám se, zda-li se to bude hodit.
	Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
	Info_AddChoice(DIA_Addon_Eremit_Klamotten,Dialog_Back,DIA_Addon_Eremit_Klamotten_BACK);
	if(Npc_HasItems(other,ITAR_PIR_L_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"(dát lehkou zbroj piráta)",DIA_Addon_Eremit_Klamotten_PIR_L);
	};
	if(Npc_HasItems(other,ITAR_PIR_M_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"(dát zbroj piráta)",DIA_Addon_Eremit_Klamotten_PIR_M);
	};
	if(Npc_HasItems(other,ITAR_PIR_H_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"(dát těžkou zbroj piráta)",DIA_Addon_Eremit_Klamotten_PIR_H);
	};
	if(Npc_HasItems(other,ITAR_RANGER_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"(dát zbroj 'Kruhu Vody')",DIA_Addon_Eremit_Klamotten_Ranger);
	};
	if(Npc_HasItems(other,ITAR_Vlk_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"(dát lehký oděv měšťana)",DIA_Addon_Eremit_Klamotten_VLK_L);
	};
	if(Npc_HasItems(other,ITAR_Vlk_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"(dát oděv měšťana)",DIA_Addon_Eremit_Klamotten_VLK_M);
	};
	if(Npc_HasItems(other,ITAR_Vlk_H) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"(dát honosný oděv měšťana)",DIA_Addon_Eremit_Klamotten_VLK_H);
	};
	if(Npc_HasItems(other,ITAR_Bau_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"(dát lehký oděv farmáře)",DIA_Addon_Eremit_Klamotten_BAU_L);
	};
	if(Npc_HasItems(other,ITAR_Bau_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"(dát oděv farmáře)",DIA_Addon_Eremit_Klamotten_BAU_M);
	};
	if(Npc_HasItems(other,ITAR_DJG_Crawler) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"(dát zbroj z krunýřů důlního červa)",DIA_Addon_Eremit_Klamotten_DJG_Crawler);
	};
	if(Npc_HasItems(other,ITAR_Leather_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"(dát koženou zbroj)",DIA_Addon_Eremit_Klamotten_Leather);
	};
	if(Npc_HasItems(other,ITAR_Prisoner) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"(dát kalhoty kopáče)",DIA_Addon_Eremit_Klamotten_Prisoner);
	};
};

func void B_Eremit_Tatsache()
{
	AI_EquipBestArmor(self);
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_20");	//Jako ulité!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_21");	//Hmm, co bych ti mohl dát? Všechno zlato jsem dal pirátům za vstup.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_22");	//Můžu ti dát nějaké staré kamenné tabulky.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_23");	//Na, ber. Já si můžu najít další.
	B_GiveInvItems(self,other,ItWr_StonePlateCommon_Addon,2);
	MIS_Eremit_Klamotten = LOG_SUCCESS;

	if(MIS_LanceChange == LOG_Success)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_Done_01_01");	//No, teď můžeš jít za mágy.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(NONE_ADDON_115_Eremit,"WaterMage");
	}
	else
	{
		Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
	};
};

func void DIA_Addon_Eremit_Klamotten_BACK()
{
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_24");	//Mno, nejdřív jsi mě uklidnil a pak... (povzdechne si)
	Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
};

func void DIA_Addon_Eremit_Klamotten_PIR_L()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_PIR_L_Addon,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_PIR_M()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ITAR_PIR_M_Addon,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_PIR_H()
{
	B_GivePlayerXP(250);
	B_GiveInvItems(other,self,ITAR_PIR_H_Addon,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Ranger()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_RANGER_Addon,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VLK_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Vlk_L,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VLK_M()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_Vlk_M,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VLK_H()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ITAR_Vlk_H,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_BAU_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Bau_L,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_BAU_M()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_Bau_M,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_DJG_Crawler()
{
	B_GivePlayerXP(500);
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Leather()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_Leather_L,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Prisoner()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ITAR_Prisoner,1);
	B_Eremit_Tatsache();
};

instance DIA_Addon_Eremit_PERM(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 99;
	condition = DIA_Addon_Eremit_PERM_Condition;
	information = DIA_Addon_Eremit_PERM_Info;
	permanent = TRUE;
	description = "Jaké to je žít jako poustevník?";
};

func int DIA_Addon_Eremit_PERM_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Eremit_Hello) == TRUE) && ((MIS_LanceChange != LOG_Success) || (MIS_Eremit_Klamotten != LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_04");	//Jaké to je žít jako poustevník?

	if(MIS_Eremit_Klamotten == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_09");	//(pyšně) Dělám si vše sám. Zbraně, nástroje, chatrč, prostě vše.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_10");	//Přišel jsem sem a neměl jsem nic, ale má snaha...
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_11");	//Jinak...
		AI_Output(other,self,"DIA_Addon_Eremit_Doppelt_15_01");	//Ano?
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_12");	//Někdy si přeji, abych si s sebou vzal nějaké oblečení.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_13");	//Neumím šít ani stahovat kůži ze zvířat...
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_14");	//A noci, v této části ostrova, nejsou zrovna nejteplejší.
		MIS_Eremit_Klamotten = LOG_Running;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_15");	//Vystačím si.

		if(MIS_Eremit_Klamotten == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_18");	//S těmito šaty přežiju zimu a pak... Uvidíme...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_16");	//Je to lepší jak v Khorinisu!
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_17");	//Dokonce i bez pokrývek.
		};
	};
};

instance DIA_Addon_Eremit_LanceChange(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 99;
	condition = DIA_Addon_Eremit_LanceChange_Condition;
	information = DIA_Addon_Eremit_LanceChange_Info;
	permanent = FALSE;
	description = "Co si myslíš o mázích Vody?";
};

func int DIA_Addon_Eremit_LanceChange_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Eremit_Hello) && (MIS_LanceChange == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_LanceChange_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_01");	//Co si myslíš o mázích Vody?
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_02");	//Jsou pravděpodobně jediní lidé, které bych tady na ostrově viděl rád.
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_03");	//Opravdu? Z jakého důvodu?
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_04");	//Budeš se divit, ale já jsem se kdysi dávno chtěl stát mágem Vody.
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_05");	//Vážně?
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_06");	//Jistě! Nebo mi nevěříš?
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_07");	//Věřím. Ale proč ses jím nestal?
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_08");	//Bohužel, mé magické schopnosti nebyly dostatečně vysoké ani pro obyčejná kouzla.
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_09");	//Proto jsem změnil názor. Mimochodem, proč se na ně najednou vyptáváš?
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_10");	//Faktem je, že mágové Vody jsou tady.
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_11");	//Opravdu?!
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_12");	//Jistě! Jejich úkol je ve velkých starověkých ruinách, které jsou uprostřed tohoto údolí.
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_13");	//Vím, kde to je. A co dělají úctyhodní mágové v této opuštěné části ostrova?
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_14");	//Učí se kulturu Stavitelů. A navíc hledají osoby, které by jim v tom mohly pomoci.
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_15");	//Dlouho jsem tady žil a naučil se hodně o této starobylé kultuře.
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_16");	//Zajímavé, odkud?
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_17");	//Z kamenných desek, které jsou roztroušeny po celém údolí.
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_18");	//Aha, takže ty stále můžeš přečíst starodávné tabulky?
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_19");	//Ano! Je to poměrně snadné, když se podíváš na znaky, které jsou na nich znázorněny.
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_20");	//Pak si myslím, že bys jim mohl být dost užitečný.
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_21");	//To si myslíš?
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_22");	//Jsem si tím jistý. Nechceš, abych jim o tobě řekl?
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_23");	//No, pokud mágům nebude vadit má společnost, pak... Proč ne.
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_24");	//Pak jim tedy o tobě řeknu.
	EremitAgreed = TRUE;
	B_LogEntry(TOPIC_LanceChange,"Poustevník, který žije v hlubinách ostrova, se perfektně hodí, aby se stal novým asistentem mágů Vody. Kromě toho, hodně ví o kultuře Stavitelů a je schopen číst kamenné tabulky. Měl bych o něm říct Saturasovi.");
};

instance DIA_Addon_Eremit_LanceChange_Done(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 99;
	condition = DIA_Addon_Eremit_LanceChange_Done_Condition;
	information = DIA_Addon_Eremit_LanceChange_Done_Info;
	permanent = FALSE;
	description = "Mágové Vody tě očekávají.";
};

func int DIA_Addon_Eremit_LanceChange_Done_Condition()
{
	if(MIS_LanceChange == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_LanceChange_Done_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_Done_01_01");	//Mágové Vody tě očekávají.
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_Done_01_02");	//Tak to bychom neměli ztrácet čas.


	if(MIS_Eremit_Klamotten != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_Done_01_03");	//Ale já se před nimi nemohu objevit úplně nahý!
		AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_Done_01_04");	//Musím tento problém nějak vyřešit.
	}
	else
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(NONE_ADDON_115_Eremit,"WaterMage");
	};
};