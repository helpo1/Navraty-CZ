/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func int DIA_Alrik_askfordt_condition - upraveny podmínky dialogu

*/



instance DIA_Alrik_EXIT(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 999;
	condition = DIA_Alrik_EXIT_Condition;
	information = DIA_Alrik_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alrik_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alrik_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alrik_PICKPOCKET(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 900;
	condition = DIA_Alrik_PICKPOCKET_Condition;
	information = DIA_Alrik_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Alrik_PICKPOCKET_Condition()
{
	return C_Beklauen(55,50);
};

func void DIA_Alrik_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
	Info_AddChoice(DIA_Alrik_PICKPOCKET,Dialog_Back,DIA_Alrik_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alrik_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alrik_PICKPOCKET_DoIt);
};

func void DIA_Alrik_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};

func void DIA_Alrik_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};


instance DIA_Alrik_Hallo(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Hallo_Condition;
	information = DIA_Alrik_Hallo_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Alrik_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Alrik_Hallo_Info()
{
	AI_Output(other,self,"DIA_Alrik_Hallo_15_00");	//Co tady děláš?

	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_01");	//(smích) Bydlím tady!
	}
	else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_02");	//A co tu dělám? Piju tady.
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_03");	//Jdu se trochu projít.
	};

	if(AlrikRECRUITEDDT == FALSE)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_04");	//Ale jestli myslíš, co dělám celý den - pořádám souboje.
	};
};


instance DIA_Alrik_YouFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_YouFight_Condition;
	information = DIA_Alrik_YouFight_Info;
	permanent = FALSE;
	description = "Ty pořádáš souboje?";
};

func int DIA_Alrik_YouFight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Hallo) && (AlrikRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_YouFight_Info()
{
	AI_Output(other,self,"DIA_Alrik_YouFight_15_00");	//Ty pořádáš souboje?
	AI_Output(self,other,"DIA_Alrik_YouFight_09_01");	//Každý den od poledne do večera.

	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_YouFight_09_02");	//A přímo zde!
	};
	AI_Output(self,other,"DIA_Alrik_YouFight_09_03");	//Za skladištěm v přístavní čtvrti! Domove, sladký domove!
};


instance DIA_Alrik_Regeln(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Regeln_Condition;
	information = DIA_Alrik_Regeln_Info;
	permanent = FALSE;
	description = "Jaká jsou pravidla souboje?";
};


func int DIA_Alrik_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight) && (AlrikRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Regeln_Info()
{
	AI_Output(other,self,"DIA_Alrik_Regeln_15_00");	//Jaká jsou pravidla souboje?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_01");	//Celkem jednoduchá. Všechny normální zbraně jsou povoleny. Ale žádné luky, žádné kuše a ŽÁDNÁ MAGIE!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_02");	//Bojujeme dokud jeden nepadne, ale jak padne na zem, je konec, rozumíš?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_03");	//A kdo opustí prostor, ten taky prohrál!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_04");	//Sázky jsou 50 zlatých. Jestli vyhraješ, máš 100 a jestli ne, nemáš nic. (šklebí se)
	AI_Output(self,other,"DIA_Alrik_Regeln_09_05");	//Rozumíš?
	AI_Output(other,self,"DIA_Alrik_Regeln_15_06");	//Jasně!
};

func void B_Alrik_Again()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_03");	//Jak to jde? Chceš proti mě znovu?
};


instance DIA_Alrik_NewFights3(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights3_Condition;
	information = DIA_Alrik_NewFights3_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights3_Condition()
{
	if((Kapitel >= 3) && (Kapitel <= 4) && (Alrik_ArenaKampfVerloren <= 6))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights3_Info()
{
	B_AddFightSkill(self,NPC_TALENT_1H,5);
	B_SetAttributesToChapter(self,5);
	B_Alrik_Again();
};


instance DIA_Alrik_NewFights5(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights5_Condition;
	information = DIA_Alrik_NewFights5_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights5_Condition()
{
	if((Kapitel >= 5) && (Alrik_ArenaKampfVerloren <= 9))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights5_Info()
{
	B_AddFightSkill(self,NPC_TALENT_1H,5);
	B_SetAttributesToChapter(self,6);
	B_Alrik_Again();
};

func void B_Alrik_Enough()
{
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_05");	//Myslím, že už jsi vyhrával dost.
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_06");	//Neber si to zle, ale od posledního souboje mě bolí hlava...
};

func void B_Alrik_ComeBackLater()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_02");	//Přijď pozděj, zatím budu trénovat...
};


instance DIA_Alrik_WannaFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WannaFight_Condition;
	information = DIA_Alrik_WannaFight_Info;
	permanent = TRUE;
	description = "Chci s tebou bojovat!";
};

func int DIA_Alrik_WannaFight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Regeln) && (self.aivar[AIV_ArenaFight] == AF_NONE) && (AlrikRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_WannaFight_Info()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_15_00");	//Chci s tebou bojovat!
	Info_ClearChoices(DIA_Alrik_WannaFight);

	if((Alrik_ArenaKampfVerloren > 0) && (Npc_HasItems(self,ItMw_AlriksSword_Mis) == 0))
	{
		if(MIS_Alrik_Sword == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_01");	//První mi dej můj meč a pak uvidíme...

			if(Npc_HasItems(other,ItMw_AlriksSword_Mis) >= 1)
			{
				Info_ClearChoices(DIA_Alrik_WannaFight);
				Info_AddChoice(DIA_Alrik_WannaFight,"(dát meč)",DIA_Alrik_WannaFight_GiveSword);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_02");	//Než budu moci znovu bojovat, tak budu potřebovat lepší zbraň!
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_03");	//Pár dní zpět jsem musel prodat svůj meč Jorovi.
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_04");	//Bez něj jsem nemožný, ale jestli mi ho doneseš zpět, dáme si to znovu!
			Alrik_VomSchwertErzaehlt = TRUE;
		};
	}
	else if((Kapitel <= 2) && (Alrik_ArenaKampfVerloren > 3))
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_00");	//Myslím, že to bude prozatím stačit.
		AI_Output(self,other,"DIA_Alrik_Add_09_01");	//Nech mě chvíli si odpočinout.
		B_Alrik_ComeBackLater();
	}
	else if((Kapitel >= 3) && (Kapitel <= 4) && (Alrik_ArenaKampfVerloren > 6))
	{
		B_Alrik_Enough();
		B_Alrik_ComeBackLater();
	}
	else if(Kapitel >= 5)
	{
		if(Alrik_ArenaKampfVerloren > 9)
		{
			B_Alrik_Enough();
			AI_Output(self,other,"DIA_Alrik_Add_09_04");	//Nahrabal jsem si dost zlata.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Add_09_04A");	//Myslím, že už dost.
		};
		if(Npc_IsDead(edda) == FALSE)
		{
			AI_Output(self,other,"DIA_Alrik_Add_09_05");	//Dost na to, abych si našel místo někde ve meste...
			AI_Output(self,other,"DIA_Alrik_Add_09_06");	//Kdo ví, třeba si otevřu obchod se zbraněmi...
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Add_09_05A");	//Konečně jsem to koupil.
			AI_Output(self,other,"DIA_Alrik_Add_09_06A");	//Nyní už nežiji za skladištěm.
		};
	}
	else if(Wld_IsTime(11,0,19,0))
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_07");	//Máš 50 zlatých?
		Info_ClearChoices(DIA_Alrik_WannaFight);
		Info_AddChoice(DIA_Alrik_WannaFight,"Hm...",DIA_Alrik_WannaFight_NoGold);

		if(Npc_HasItems(other,ItMi_Gold) >= 50)
		{
			Info_AddChoice(DIA_Alrik_WannaFight,"Tady jsou...",DIA_Alrik_WannaFight_Gold);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_08");	//Bojuji pouze od poledne do večera.
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_09");	//Boje nejsou o ničem, když tu nejsou sázející diváci!
		if(Wld_IsTime(19,0,3,30))
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_10");	//Je moc pozdě, vrať se zítra v poledne!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_11");	//Je moc brzy, vrať se pozděj!
		};
	};
};

func void DIA_Alrik_WannaFight_GiveSword()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Tady...
	B_GiveInvItems(other,self,ItMw_AlriksSword_Mis,1);
	AI_EquipBestMeleeWeapon(self);
	AI_StopProcessInfos(self);
};

func void DIA_Alrik_WannaFight_Gold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Tady...
	B_GiveInvItems(other,self,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_01");	//(hlasitě) Máme nového vyzivatele!
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_02");	//Sázky jsou uzavřeny...
	Npc_RemoveInvItems(self,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_03");	//Připraven?
	self.aivar[AIV_ArenaFight] = AF_RUNNING;
	Alrik_Kaempfe = Alrik_Kaempfe + 1;
	Info_ClearChoices(DIA_Alrik_WannaFight);
	Info_AddChoice(DIA_Alrik_WannaFight,"Moment...",DIA_Alrik_WannaFight_Moment);
	Info_AddChoice(DIA_Alrik_WannaFight,"Začněme!",DIA_Alrik_WannaFight_NOW);
};

func void DIA_Alrik_WannaFight_NoGold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NoGold_15_00");	//Noo...
	AI_Output(self,other,"DIA_Alrik_WannaFight_NoGold_09_01");	//Tak je sežeň!
	Info_ClearChoices(DIA_Alrik_WannaFight);
};

func void DIA_Alrik_WannaFight_NOW()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NOW_15_00");	//Začněme!
	AI_Output(self,other,"DIA_Alrik_WannaFight_NOW_09_01");	//Tak se na tebe kouknem!

	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
	};

	AI_StopProcessInfos(self);
	CreateInvItems(self,ItMi_Gold,100);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Alrik_WannaFight_Moment()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Moment_15_00");	//Moment...
	AI_Output(self,other,"DIA_Alrik_WannaFight_Moment_09_01");	//Klidně... Ale já začínám teď!

	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
	};

	AI_StopProcessInfos(self);
	CreateInvItems(self,ItMi_Gold,100);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Alrik_AfterFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_AfterFight_Condition;
	information = DIA_Alrik_AfterFight_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Alrik_AfterFight_Condition()
{
	if((self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		if(self.aivar[AIV_ArenaFight] != AF_NONE)
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
	};
};

func void DIA_Alrik_AfterFight_Info()
{
	if((self.aivar[AIV_ArenaFight] != AF_NONE) && (self.aivar[AIV_ArenaFight] != AF_AFTER_PLUS_DAMAGE))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			B_GivePlayerXP(100);
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_00");	//Chlape, jseš dobrej.

			if(Npc_HasItems(self,ItMi_Gold) >= 100)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_01");	//Tady je 100 zlatých, zasloužil sis je!
				B_GiveInvItems(self,other,ItMi_Gold,100);
			}
			else if(Npc_HasItems(self,ItMi_Gold) == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_02");	//Vidím, že už sis vzal své zlato.
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_03");	//Mohl jsi klidně počkat až ti ho dám - já slovo držím!
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_04");	//Vybral jsi mi kapsy, když jsem byl v bezvědomí!
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_05");	//To nebylo pěkné, chlape. Své peníze bys stejne dostal.
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
			};

			Alrik_ArenaKampfVerloren = Alrik_ArenaKampfVerloren + 1;

			if(Alrik_Ok_01 == FALSE)
			{
				Alrik_Ok_01 = TRUE;
			};
		}
		else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_06");	//Dobrý boj! (škleb)
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_07");	//Jestli chceš znovu, jsem tady pro tebe!
		};
		if(Alrik_Kaempfe == 1)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_08");	//A ještě neco - nemluv o tom, co se deje za skladištem.
			if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_09");	//Domobrana by nás hodila do basy. Ti chlapi nemaj rádi sázení na boje.
			};
		};
		self.aivar[AIV_ArenaFight] = AF_NONE;
		self.aivar[AIV_LastFightComment] = TRUE;
	}
	else
	{
		if(self.aivar[AIV_ArenaFight] == AF_AFTER_PLUS_DAMAGE)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_10");	//Boj skončil, nulo!
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_11");	//Nemám rád, když lidé poruší pravidla.
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_12");	//Zmiz odsud!
		}
		else
		{
			if(Alrik_Kaempfe == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_13");	//Jestli chceš bojovat, musíš mě vyzvat.
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_14");	//Jestli jsi chtěl další boj, vše co bylo třeba bylo vyzvat me!
			};

			AI_Output(self,other,"DIA_Alrik_AfterFight_09_15");	//Nechci nic s hajzlem jako jsi ty. Zmiz!
		};

		self.aivar[AIV_ArenaFight] = AF_NONE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Alrik_DuWohnst(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_DuWohnst_Condition;
	information = DIA_Alrik_DuWohnst_Info;
	permanent = FALSE;
	description = "Ty žiješ za skladištěm?";
};


func int DIA_Alrik_DuWohnst_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight) && (Kapitel < 5) && (AlrikRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_DuWohnst_Info()
{
	AI_Output(other,self,"DIA_Alrik_DuWohnst_15_00");	//(překvapen) Ty žiješ za skladištěm?
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_01");	//Je to jen dočasné. Kdybys měl tolik zlata jako já, mohl bys mít podobný luxus (šklebí se)!
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_02");	//Byl jsem bojový instruktor armády, ale odešel jsem hledat štěstí jako dobrodruh.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_03");	//Nyní toho lituji, protože posledních 100 zlatých jsem musel dát městské stráži.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_04");	//Takže hledám, jak si vydělat. Dokonce jsem prodal svůj meč.
	Alrik_VomSchwertErzaehlt = TRUE;
};


instance DIA_Alrik_WerSchwert(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WerSchwert_Condition;
	information = DIA_Alrik_WerSchwert_Info;
	permanent = FALSE;
	description = "Komu jsi prodal svůj meč?";
};

func int DIA_Alrik_WerSchwert_Condition()
{
	if(Alrik_VomSchwertErzaehlt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Alrik_WerSchwert_Info()
{
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_00");	//Komu jsi prodal svůj meč?
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_01");	//Vyměnil jsem ho na tržišti za nejaké zásoby.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_02");	//Ten chlap se jmenuje Jora. Dal mi kus masa a pochodně, ale ty jsou už dávno pryč.
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_03");	//Asi mi ho nedá jen tak...
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_04");	//Je to starý meč. Nebude chtít hodně. Jen pomysli na to, že me znovu vyzveš (šklebí se).
	MIS_Alrik_Sword = LOG_Running;
	Log_CreateTopic(TOPIC_AlrikSchwert,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AlrikSchwert,LOG_Running);
	B_LogEntry(TOPIC_AlrikSchwert,"Alrik musel prodat svůj meč Jorovi v obchodní čtvrti. Jestli ho dokážu donést zpět Alrikovi, můžu ho znovu vyzvat.");
};

var int Alrik_EinmalSchwertBonus;

instance DIA_Alrik_HaveSword(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_HaveSword_Condition;
	information = DIA_Alrik_HaveSword_Info;
	permanent = FALSE;
	description = "Tady je tvůj meč!";
};

func int DIA_Alrik_HaveSword_Condition()
{
	if((Npc_HasItems(other,ItMw_AlriksSword_Mis) >= 1) && (MIS_Alrik_Sword == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Alrik_HaveSword_Info()
{
	B_GivePlayerXP(XP_AlriksSword);
	AI_Output(other,self,"DIA_Alrik_HaveSword_15_00");	//Tady je tvůj meč!
	B_GiveInvItems(other,self,ItMw_AlriksSword_Mis,1);
	AI_Output(self,other,"DIA_Alrik_HaveSword_09_01");	//Áá! To je o hodně lepší, než ten starej klacek!
	AI_Output(self,other,"DIA_Alrik_HaveSword_09_02");	//Výborně, můžeš me znovu vyzvat!
	MIS_Alrik_Sword = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_AlrikSchwert,LOG_SUCCESS);
	B_LogEntry(TOPIC_AlrikSchwert,"Vrátil jsem Alrikovi jeho meč.");

	if(Alrik_EinmalSchwertBonus == FALSE)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,5);
		Alrik_EinmalSchwertBonus = TRUE;
	};
	if(Alrik_Ok_02 == FALSE)
	{
		Alrik_Ok_02 = TRUE;
	};

	AI_EquipBestMeleeWeapon(self);
};

instance DIA_Alrik_Krieg(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Krieg_Condition;
	information = DIA_Alrik_Krieg_Info;
	permanent = FALSE;
	description = "Víš něco o válce se skřety?";
};


func int DIA_Alrik_Krieg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_DuWohnst) || (hero.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Krieg_Info()
{
	AI_Output(other,self,"DIA_Alrik_Krieg_15_00");	//Víš něco o válce se skřety?
	AI_Output(self,other,"DIA_Alrik_Krieg_09_01");	//Není toho co říct. Válka se táhne už moc dlouho.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_02");	//Lidé hladoví a rolníci revoltují proti králi.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_03");	//Je jich moc. Jestli válka neskončí, říše se rozpadne.
};

var int Alrik_VorausErzaehlt;

instance DIA_Alrik_Ausbilden(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Ausbilden_Condition;
	information = DIA_Alrik_Ausbilden_Info;
	permanent = TRUE;
	description = "Můžeš mě neco naučit?";
};

func int DIA_Alrik_Ausbilden_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Alrik_DuWohnst) || (hero.guild != GIL_NONE)) && (Alrik_Teach1H == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Ausbilden_Info()
{
	AI_Output(other,self,"DIA_Alrik_Ausbilden_15_00");	//Můžeš mě neco naučit?

	if((Alrik_Kaempfe == 0) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Alrik_Ausbilden_09_01");	//Jestli se chceš opravdu naučit bojovat, znovu mě vyzvi. Nejlepší lekce je boj.
		Alrik_VorausErzaehlt = TRUE;
	}
	else
	{
		if(Alrik_VorausErzaehlt == TRUE)
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_02");	//Držím své slovo. Naučím tě co budeš chtít.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_03");	//Pokud jsi dostatečně zkušený.
		};
		Alrik_Teach1H = TRUE;
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Alrik za skladištěm ve meste me může učit jednoručímu boji.");
	};
};


var int Alrik_Merke_1h;

instance DIA_Alrik_Teach(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Teach_Condition;
	information = DIA_Alrik_Teach_Info;
	permanent = TRUE;
	description = "Uč mě.";
};

func int DIA_Alrik_Teach_Condition()
{
	if(Alrik_Teach1H == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Alrik_Teach_Info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Uč mě.
	Alrik_Merke_1h = other.HitChance[NPC_TALENT_1H];
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,DIA_Alrik_Teach_Shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,DIA_Alrik_Teach_Shield_5);
	};
};

func void DIA_Alrik_Teach_Back()
{
	Info_ClearChoices(DIA_Alrik_Teach);
};

func void DIA_Alrik_Teach_Shield_1()
{
	B_TeachShield(self,other,1,50);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_Shield_5()
{
	B_TeachShield(self,other,5,50);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void dia_alrik_teach_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void dia_alrik_teach_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void dia_alrik_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void dia_alrik_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_crossbow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,40);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_crossbow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,40);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

instance DIA_Alrik_Shield(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Shield_Condition;
	information = DIA_Alrik_Shield_Info;
	permanent = FALSE;
	description = "Ty bojuješ se štítem?";
};

func int DIA_Alrik_Shield_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Shield_Info()
{
	AI_Output(other,self,"DIA_Alrik_Shield_01_00");	//Ty bojuješ se štítem?
	AI_Output(self,other,"DIA_Alrik_Shield_01_01");	//Samozřejmě! Se štítem nejsi nikdy nekrytý. Je to to moje hlavní opora v boji.
	AI_Output(other,self,"DIA_Alrik_Shield_01_02");	//A mohl bys mě naučit jak bojovat se štítem?

	if((Alrik_Ok_01 == TRUE) && (Alrik_Ok_02 == TRUE))
	{
		AI_Output(self,other,"DIA_Alrik_Shield_01_03");	//Hmm... Proč ne? Vypadáš jako celkem vnímavý student.
		AI_Output(self,other,"DIA_Alrik_Shield_01_04");	//Ale potřebuješ nějaké zkušenosti s bojem.
		AI_Output(self,other,"DIA_Alrik_Shield_01_05");	//A samozřejmě nejaké to zlato. Zadarmo to nebude.
		Alrik_Ok_Final = TRUE;
	}
	else if(Alrik_Ok_01 == FALSE)
	{
		AI_Output(self,other,"DIA_Alrik_Shield_01_06");	//Pro začátek mi ukaž co dokážeš. Pak uvidíme!
	}
	else if(Alrik_Ok_02 == FALSE)
	{
		AI_Output(self,other,"DIA_Alrik_Shield_01_07");	//Pro začátek budu potřebovat normální zbraň namísto klacku.
		AI_Output(self,other,"DIA_Alrik_Shield_01_08");	//Jinak tě prostě nedokážu nic naučit.
	};

	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Alrik mě může naučit jak bojovat se štítem.");
};

instance DIA_Alrik_Shield_Teach(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Shield_Teach_Condition;
	information = DIA_Alrik_Shield_Teach_Info;
	permanent = TRUE;
	description = "Nauč mě jak bojovat se štítem. (VB: 10, cena: 1000 zlatých)";
};

func int DIA_Alrik_Shield_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Shield) && (hero.attribute[ATR_REGENERATEMANA] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Shield_Teach_Info()
{
	AI_Output(other,self,"DIA_Alrik_Shield_Teach_01_00");	//Nauč mě jak bojovat se štítem.

	if((Alrik_Ok_Final == TRUE) || ((Alrik_Ok_01 == TRUE) && (Alrik_Ok_02 == TRUE)))
	{
		if((hero.lp >= 10) && (Npc_HasItems(other,ItMi_Gold) >= 1000))
		{
			hero.lp = hero.lp - 10;
			RankPoints = RankPoints + 10;
			B_GiveInvItems(other,self,ItMi_Gold,1000);
			Npc_RemoveInvItems(self,ItMi_Gold,1000);
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_01");	//Dobře. Pozorně poslouchej.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_02");	//Štít ti v těžkých časech dokáže zachránit prdel před smrtícím úderem.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_03");	//Ne každý dokáže bojovat se štítem, ale jednoznačně se to vyplatí.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_04");	//Základní věcí je držet štít na úrovni očí.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_05");	//Takhle uvidíš svého nepřítele a zároveň si budeš chránit tělo před úderem.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_06");	//Tvůj úder mečem musí být rychlý a krátký. Zaútočit a pak se znovu schovat za štít.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_07");	//Tvůj nepřítel si bude lámat hlavu nad tím jak se dostat cez tvoji obranu.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_08");	//A dříve nebo později udělá chybu, kterou budeš moci využít.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_09");	//Když se budeš snažit jedného dne se z tebe může stát skutečný majster boje so štítem.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_10");	//A ještě něco. Vem si tenhle dřevěný štít jako dárek ode mě.
			B_GiveInvItems(self,other,ItAr_Shield_01,1);
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_11");	//Nakonec je to něco, co budeš muset trénovat.
			AI_Print("Naučeno: Boj se štítem");
			Snd_Play("LevelUP");
			hero.attribute[ATR_REGENERATEMANA] = TRUE;
			Npc_SetTalentSkill(hero,NPC_TALENT_RHETORIKA,1);
			Npc_SetTalentValue(hero,NPC_TALENT_RHETORIKA,hero.attribute[ATR_REGENERATEMANA]);
		}
		else
		{
			if(hero.lp < 10)
			{
				AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_16");	//Nemáš dostatek zkušenostních bodů.
			}
			else if(Npc_HasItems(other,ItMi_Gold) < 1000)
			{
				AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_17");	//Nemáš dost zlata.	
			};
		};
	}
	else
	{
		if(Alrik_Ok_01 == FALSE)
		{
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_12");	//Nejdřív mi ukaž co dokážeš.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_13");	//Pak si promluvíme.
		}
		else if(Alrik_Ok_02 == FALSE)
		{
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_14");	//Co nevidíš tenhle zatracený klacek v mý ruce?
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_15");	//Bez normální zbraně tě nic nenaučím!
		};
	};
};

instance DIA_Alrik_Armor(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Armor_Condition;
	information = DIA_Alrik_Armor_Info;
	permanent = FALSE;
	description = "Vidím, že máš pěknou zbroj.";
};

func int DIA_Alrik_Armor_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Alrik_YouFight) == TRUE) && (AlrikRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Armor_Info()
{
	AI_Output(other,self,"DIA_Alrik_Armor_01_00");	//Vidím, že máš pěknou zbroj.
	AI_Output(self,other,"DIA_Alrik_Armor_01_01");	//Líbí se ti? Vsadím se, že takovou nenajdeš nikde jinde.
	AI_Output(other,self,"DIA_Alrik_Armor_01_02");	//Rád bych si ji skusil.
	AI_Output(self,other,"DIA_Alrik_Armor_01_03");	//Není nic jednoduchšího. Někde bych tady měl mít další kus.
	AI_Output(self,other,"DIA_Alrik_Armor_01_04");	//Ale musíš zaň zaplatit.
	AI_Output(other,self,"DIA_Alrik_Armor_01_05");	//A kolik za ni chceš?
	AI_Output(self,other,"DIA_Alrik_Armor_01_06");	//Hmmm... Myslím, že 500 zlatých by mělo stačit.
	AI_Output(other,self,"DIA_Alrik_Armor_01_07");	//Proč je tak drahá?
	AI_Output(self,other,"DIA_Alrik_Armor_01_08");	//Nooo... Vážně ty peníze potřbuji.
	AI_Output(self,other,"DIA_Alrik_Armor_01_09");	//Z jejich pomocí bych konečně byl schopen začít nový život.
	AI_Output(self,other,"DIA_Alrik_Armor_01_10");	//A současně bych mohl splatit i svoje dluhy.
	AI_Output(self,other,"DIA_Alrik_Armor_01_11");	//Takže promiň chlape, ale nemohu ti ji prodat lacněji.
};

var int BuyAlrikArmor;

instance DIA_Alrik_Armor_Trade(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Armor_Trade_Condition;
	information = DIA_Alrik_Armor_Trade_Info;
	permanent = TRUE;
	description = "Koupit zbroj dobrodruha. (cena: 500 zlatých)";
};

func int DIA_Alrik_Armor_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Armor) && (BuyAlrikArmor == FALSE) && (AlrikRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Armor_Trade_Info()
{
	AI_Output(other,self,"DIA_Alrik_Armor_Trade_01_00");	//Prodej mi svou zbroj.

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		B_GiveInvItems(other,self,ItMi_Gold,500);
		Npc_RemoveInvItems(self,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Alrik_Armor_Trade_01_01");	//Tady ji máš!
		B_GiveInvItems(self,other,ITAR_ADVENTURE_HERO,1);
		AI_Output(self,other,"DIA_Alrik_Armor_Trade_01_02");	//Věř mi, nebudeš toho litovat.
		BuyAlrikArmor = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Armor_Trade_01_03");	//Nemáš dost zlata!
	};
};

instance DIA_Alrik_ASKFORDT(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 6;
	condition = DIA_Alrik_askfordt_condition;
	information = DIA_Alrik_askfordt_info;
	permanent = FALSE;
	description = "Potřebuji lidi.";
};

func int DIA_Alrik_askfordt_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	// if((HURRAYICANHIRE == TRUE) && (WOLFRECRUITEDDT == TRUE) && (WolfDayHire < DayNow) && (Alrik_Ok_01 == TRUE) && (Alrik_Ok_02 == TRUE))
	if((HURRAYICANHIRE == TRUE) && (AlrikRECRUITEDDT == FALSE) && (Alrik_Ok_01 == TRUE) && (Alrik_Ok_02 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_askfordt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Alrik_AskforDT_15_00");	//Potřebuji lidi.
	AI_Output(self,other,"DIA_Alrik_AskforDT_17_01");	//Proč? Můžu-li se zeptat.
	AI_Output(other,self,"DIA_Alrik_AskforDT_17_02");	//Na ochranu mého tábora. Vypadáš jako zkušený bojovník, tak mě napadlo...
	AI_Output(self,other,"DIA_Alrik_AskforDT_17_03");	//Opravdu? Máš tábor?
	AI_Output(other,self,"DIA_Alrik_AskforDT_17_04");	//Jo, nedaleko farmy Onara, na místě staré věže.
	AI_Output(self,other,"DIA_Alrik_AskforDT_17_05");	//Hmmm... vidím že nikde nechybíš. Když máš tolik času.
	AI_Output(other,self,"DIA_Alrik_AskforDT_17_06");	//No co říkáš? Koneckonců je to lepší než sedět každý den na prdeli v přístavu.
	AI_Output(self,other,"DIA_Alrik_AskforDT_17_07");	//A to je pravda! Určitě souhlasím s návrhem. Ale chci dostat každý den minimálně to co vydělám tady v aréně.
	AI_Output(other,self,"DIA_Alrik_AskforDT_17_08");	//Aréna, to je náročná práce! Ale jsem ochoten ti zaplatit 50 zlatých na den. Pokud tedy přijímáš...
	AI_Output(self,other,"DIA_Alrik_AskforDT_17_09");	//Dobře, dobře. 
	AI_Output(other,self,"DIA_Alrik_AskforDT_17_10");	//Pak nechci ztrácet čas a půjdu omrknout tu tvou pevnost.
	AI_Output(other,self,"DIA_Alrik_AskforDT_17_11");	//Pokud mi ti strážci u brány začnou rozpravovat o všech těch soubojích. Tak se mi začne stýskat.
	AI_Output(self,other,"DIA_Alrik_AskforDT_17_12");	//Dobře, uvidíme.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Alrik bude nyní chránit můj tábor.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	AlrikRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_Alrik_INTOWER(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 22;
	condition = DIA_Alrik_intower_condition;
	information = DIA_Alrik_intower_info;
	permanent = TRUE;
	description = "Všechno v pořádku?";
};

func int DIA_Alrik_intower_condition()
{
	if((AlrikRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_Alrik_intower_info()
{
	AI_Output(other,self,"DIA_Alrik_InTower_OrcKap_15_00");	//Všechno v pořádku?
	AI_Output(self,other,"DIA_Alrik_InTower_OrcKap_01_01");	//Zatím je klid.
};

instance DIA_Alrik_BackShield(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_BackShield_Condition;
	information = DIA_Alrik_BackShield_Info;
	permanent = FALSE;
	description = "Dej ten štít stranou.";
};

func int DIA_Alrik_BackShield_Condition()
{
	if(Npc_HasItems(other,ItAr_Shield_01_Alrik) > 1)
	{
		return TRUE;
	};
};

func void DIA_Alrik_BackShield_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Tady jsi...
	B_GiveInvItems(other,self,ItAr_Shield_01_Alrik,1);
	Npc_RemoveInvItems(self,ItAr_Shield_01_Alrik,Npc_HasItems(self,ItAr_Shield_01_Alrik));
	AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//Časem!
	AI_StopProcessInfos(self);
	B_SetFightSkills(self,30);
};