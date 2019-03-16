
instance DIA_Milten_DI_EXIT(C_Info)
{
	npc = PC_Mage_DI;
	nr = 999;
	condition = DIA_Milten_DI_EXIT_Condition;
	information = DIA_Milten_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Milten_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Milten_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Milten_DI_Hello(C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_Hello_Condition;
	information = DIA_Milten_DI_Hello_Info;
	description = "Jako za starých časů.";
};


func int DIA_Milten_DI_Hello_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_Hello_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_00");	//Jako za starých časů.
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_01");	//Jak říkáš. Jsem zvědavý, jestli se ti to tentokrát podaří.
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_02");	//Co?
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_03");	//Zachránit si zadek dřív, než zase propukne peklo.
};


instance DIA_Milten_DI_TRADE(C_Info)
{
	npc = PC_Mage_DI;
	nr = 12;
	condition = DIA_Milten_DI_TRADE_Condition;
	information = DIA_Milten_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Nemůžeš postrádat pár lektvarů?";
};


func int DIA_Milten_DI_TRADE_Condition()
{
	if((UndeadDragonIsDead == FALSE) && Npc_KnowsInfo(other,DIA_Milten_DI_Hello))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Milten_DI_TRADE_15_00");	//Nemůžeš postrádat pár lektvarů?

	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItPo_Health_02,Npc_HasItems(self,ItPo_Health_02));
	CreateInvItems(self,ItPo_Health_02,15);
	Npc_RemoveInvItems(self,ItPo_Mana_02,Npc_HasItems(self,ItPo_Mana_02));
	CreateInvItems(self,ItPo_Mana_02,15);
	CreateInvItems(self,ItMi_Flask,3);
	AI_Output(self,other,"DIA_Milten_DI_TRADE_03_01");	//Ber, dokud jsou.
};


instance DIA_Milten_DI_Rat(C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_Rat_Condition;
	information = DIA_Milten_DI_Rat_Info;
	description = "Co mi můžeš dát za radu?";
};


func int DIA_Milten_DI_Rat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Milten_DI_Hello) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_Rat_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_15_00");	//Co mi můžeš dát za radu?
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_01");	//Hmm. Je to velká čest, že ze všech lidí se ptáš na radu právě mě. Celou dobu myslím na jedinou věc.
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_02");	//Přinesl jsi Innosovo oko?
	Info_ClearChoices(DIA_Milten_DI_Rat);
	if(SC_InnosEyeVergessen_DI == TRUE)
	{
		Info_AddChoice(DIA_Milten_DI_Rat,"Ne.",DIA_Milten_DI_Rat_nein);
	}
	else
	{
		Info_AddChoice(DIA_Milten_DI_Rat,"Samozřejmě.",DIA_Milten_DI_Rat_ja);
	};
};

func void DIA_Milten_DI_Rat_nein()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_nein_15_00");	//Ne.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_01");	//(pobouřeně) Ty jsi tak... Co uděláš, když tady na ostrově narazíš na draky?
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_02");	//Copak jsi ještě nedostal rozum? Máme tady dokonce alchymistickou kolonu, abychom tu pitomou věc mohli zase nabít.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_03");	//Co to ksakru děláš? Doufám, že nás tvoje nedbalost nebude stát krk.
	Info_ClearChoices(DIA_Milten_DI_Rat);
};

func void DIA_Milten_DI_Rat_ja()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_ja_15_00");	//Samozřejmě.
	AI_Output(self,other,"DIA_Milten_DI_Rat_ja_03_01");	//Promiň, že se tak hloupě ptám. Jsem trochu nervózní.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Milten_DI_Rat);
};


instance DIA_Milten_DI_PEDROTOT(C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_PEDROTOT_Condition;
	information = DIA_Milten_DI_PEDROTOT_Info;
	description = "Našel jsem Pedra.";
};


func int DIA_Milten_DI_PEDROTOT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_DI_YOU))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_PEDROTOT_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_00");	//Našel jsem Pedra.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_01");	//(překvapeně) Cože? Kde? Tady na ostrově? Sakra, to je naprosto k neuvěření.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_02");	//Vážně jsem netušil, že to je tak tvrdý parchant.
	if(Npc_IsDead(Pedro_DI))
	{
		AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_03");	//Je mrtvý.
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_04");	//Vážně? Dobrá. Pokoj jeho duši. Nemůžu sice říct, že by mi ho bylo nějak líto, ale stejně bych s ním rád prohodil slovo.
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_05");	//Před nedávnem jsme se trochu chytili.
	};
};


instance DIA_Milten_DI_TeachMagic(C_Info)
{
	npc = PC_Mage_DI;
	nr = 31;
	condition = DIA_Milten_DI_TeachMagic_Condition;
	information = DIA_Milten_DI_TeachMagic_Info;
	permanent = TRUE;
	description = "Rád bych si vylepšil své magické schopnosti.";
};


func int DIA_Milten_DI_TeachMagic_Condition()
{
	if((UndeadDragonIsDead == FALSE) && Npc_KnowsInfo(other,DIA_Milten_DI_Hello))
	{
		return TRUE;
	};
};


var int DIA_Milten_DI_TeachMagic_OneTime;

func void DIA_Milten_DI_TeachMagic_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_TeachMagic_15_00");	//Chci zlepšit mé magické dovednosti.
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_01");	//Uvidím, co bude v mých silách.
	}
	else if(DIA_Milten_DI_TeachMagic_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_02");	//Pomůžu ti, ale jen pod podmínkou, že se postaráš, aby skřeti zůstali tam, kde jsou.
		DIA_Milten_DI_TeachMagic_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_03");	//Co přesně?
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);
	if((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"Vytvořit runy",DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_MANA_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MAX))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00");	//Innosova ruka tě chrání.
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);

	if((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"Vytvořit runy",DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_MANA_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MAX))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00");	//Nechť ti na cestu svítí světlo Innosovo.
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);

	if((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"Vytvořit runy",DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_RUNES()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00");	//Ale ne! To vážně není můj obor, ale nějak to holt zvládneme.

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"4. kruh magie",DIA_Milten_DI_TeachMagic_Runen_Circle_4);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 5) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"5. kruh magie",DIA_Milten_DI_TeachMagic_Runen_Circle_5);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"6. kruh magie",DIA_Milten_DI_TeachMagic_Runen_Circle_6);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);

	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_ChargeFireball);
	};
	if(PLAYER_TALENT_RUNES[93] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_FIRELIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FIRELIGHT)),dia_milten_di_teachmagic_runen_circle_4_spl_firelight);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_firelight()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FIRELIGHT);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis);
	};
	if(PLAYER_TALENT_RUNES[SPL_Explosion] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_Explosion,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Explosion)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Explosion);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Explosion()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Explosion);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void DIA_Milten_DI_TeachMagic_BACK()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
};


instance DIA_Milten_DI_DementorObsessionBook(C_Info)
{
	npc = PC_Mage_DI;
	nr = 99;
	condition = DIA_Milten_DI_DementorObsessionBook_Condition;
	information = DIA_Milten_DI_DementorObsessionBook_Info;
	description = "Tahle kniha, Almanach posedlých, neříká ti to nic?";
};


func int DIA_Milten_DI_DementorObsessionBook_Condition()
{
	if(Npc_HasItems(other,ITWR_DementorObsessionBook_MIS))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_DementorObsessionBook_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_DementorObsessionBook_15_00");	//Tahle kniha, Almanach posedlých, neříká ti to nic?
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_01");	//Na tenhle druh knih je odborník Pyrokar.
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_02");	//Omlouvám se. Vím toho příliš málo na to, abych o něčem takovém řekl cokoliv smysluplného.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Milten_DI_DragonEgg(C_Info)
{
	npc = PC_Mage_DI;
	nr = 99;
	condition = DIA_Milten_DI_DragonEgg_Condition;
	information = DIA_Milten_DI_DragonEgg_Info;
	description = "Máš zkušenosti s dračími vejci?";
};


func int DIA_Milten_DI_DragonEgg_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_DragonEgg_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_DragonEgg_15_00");	//Máš zkušenosti s dračími vejci?
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_01");	//Ne, moc ne. Ale slyšel jsem, že jeden chytrý alchymista z nich prý dokázal vařit mocné lektvary.
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_02");	//Recept po mně však nechtěj. Netuším, jak to dělal.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Milten_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Mage_DI;
	nr = 31;
	condition = DIA_Milten_DI_UndeadDragonDead_Condition;
	information = DIA_Milten_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Tak, a je to! Chrám je teď zbavený své síly!";
};


func int DIA_Milten_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Milten_DI_UndeadDragonDead_OneTime;

func void DIA_Milten_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_00");	//Tak, a je to! Chrám je teď zbavený své síly.
	if(DIA_Milten_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_01");	//Jak ty to vždycky děláš?
		AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_02");	//Ať se propadnu, jestli to vím.
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_03");	//(se smíchem) Dočkáme se vůbec někdy klidu? Určitě bychom si to zasloužili.
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_04");	//Co máš v plánu teď?
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_05");	//Rád bych si založil vlastní akademii a kázal naši víru. Ale možná to dopadne trochu jinak.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_06");	//Nikdy jsem nelitoval, že jsem se stal mágem Ohně. Jak to vidíš ty?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_07");	//Já si nejsem tak úplně jistý.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_08");	//(se smíchem) Suchar, jako obvykle. Hej, chlape. Právě jsi zachránil svět. Copak to není důvod k oslavám?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_09");	//Hmm. Možná.
		};
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_10");	//Ale no tak, kamaráde. Myslím, že právě potřebujeme pořádnýho panáka.
		DIA_Milten_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_11");	//Měl bys jít rovnou za kapitánem a říct mu, ať zvedne kotvy.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Mage_DI_PICKPOCKET(C_Info)
{
	npc = PC_Mage_DI;
	nr = 900;
	condition = DIA_Mage_DI_PICKPOCKET_Condition;
	information = DIA_Mage_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Mage_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(45,120);
};

func void DIA_Mage_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
	Info_AddChoice(DIA_Mage_DI_PICKPOCKET,Dialog_Back,DIA_Mage_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mage_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mage_DI_PICKPOCKET_DoIt);
};

func void DIA_Mage_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
};

func void DIA_Mage_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
};

