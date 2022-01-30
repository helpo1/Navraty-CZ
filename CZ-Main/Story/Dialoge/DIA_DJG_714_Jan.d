/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void DIA_Jan_DragonBlood_1 - upraveny výpisy
func void DIA_Jan_DragonBlood_all - upraveny výpisy
func void b_janarmorchoices - upraveny výpisy (B_BuildLearnString -> B_BuildLearnStringEx)

*/




instance DIA_Jan_EXIT(C_Info)
{
	npc = DJG_714_Jan;
	nr = 999;
	condition = DIA_Jan_EXIT_Condition;
	information = DIA_Jan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JAN_Hello(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Hello_Condition;
	information = DIA_Jan_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jan_Hello_Condition()
{
	if((Kapitel >= 4) && Npc_IsInState(self,ZS_Talk) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Hello_Info()
{
	AI_Output(self,other,"DIA_Jan_Hello_10_00");	//Jaký idiot mě sem dostal?!
	AI_Output(self,other,"DIA_Jan_Hello_10_01");	//Měl jsem dojem, že je tu něco, co by stálo za to. Ale až na pár arogantních paladinů a skřetů tu není vůbec nic.
};


instance DIA_JAN_Dragons(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Dragons_Condition;
	information = DIA_Jan_Dragons_Info;
	permanent = FALSE;
	description = "Zapomněli jsme na draky, co!";
};


func int DIA_Jan_Dragons_Condition()
{
	if(Npc_KnowsInfo(other,DIA_JAN_Hello) && (MIS_JanBecomesSmith == FALSE) && (Kapitel == 4) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Dragons_Info()
{
	AI_Output(other,self,"DIA_Jan_Dragons_15_00");	//Zapomněli jsme na draky, co!
	AI_Output(self,other,"DIA_Jan_Dragons_10_01");	//(posměšně) Jak bych mohl zapomenout. Já ti povím, co. Já jsem kovář, ne válečník.
	AI_Output(self,other,"DIA_Jan_Dragons_10_02");	//Dělám zbraně. Bojování přenechávám někomu jinému.
	AI_Output(other,self,"DIA_Jan_Dragons_15_03");	//Tak proč jsi nezůstal u kovadliny?
	AI_Output(self,other,"DIA_Jan_Dragons_10_04");	//Paladinové mě nechtěli pustit do kovárny. Nemohl jsem nic dělat, pokud jsem nechtěl skončit v hladomorně.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_Dragons_10_05");	//Ty jsi taky jedním z nich. Tak co kdybys u nich za mě ztratil slovo?
	};
	Info_ClearChoices(DIA_JAN_Dragons);
	Info_AddChoice(DIA_JAN_Dragons,"Měl bych si hledět svého.",DIA_JAN_Dragons_ShitHappen);
	Info_AddChoice(DIA_JAN_Dragons,"Co z toho budu mít, když ti pomůžu?",DIA_JAN_Dragons_Reward);
	Info_AddChoice(DIA_JAN_Dragons,"Pokusím se ti pomoct.",DIA_JAN_Dragons_HelpYou);
};

func void DIA_JAN_Dragons_HelpYou()
{
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_00");	//Pokusím se ti pomoct.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_01");	//Jak to chceš udělat? Parcival nařídil, aby nás nespouštěli z očí.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_02");	//Nikdo si nedovolí neuposlechnout.
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_03");	//To nech na mně.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_04");	//Nedovedu si představit, že by tě vyslechl.
	Log_CreateTopic(TOPIC_JanBecomesSmith,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JanBecomesSmith,LOG_Running);
	B_LogEntry(TOPIC_JanBecomesSmith,"Drakobijec Jan z hradu v Hornickém údolí chce pracovat v kovárně. Parcival mu to ale nechce dovolit.");
	MIS_JanBecomesSmith = LOG_Running;
	Info_ClearChoices(DIA_JAN_Dragons);
};

func void DIA_JAN_Dragons_Reward()
{
	AI_Output(other,self,"DIA_JAN_Dragons_Reward_15_00");	//Co z toho budu mít, když ti pomůžu?
	AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_01");	//Nemám vůbec nic. Nanejvýš tě můžu něčemu přiučit.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_02");	//Znám postup, jak udělat čepele z magické rudy ještě tvrdší.
	};
	Jan_TeachPlayer = TRUE;
};

func void DIA_JAN_Dragons_ShitHappen()
{
	AI_Output(other,self,"DIA_JAN_Dragons_ShitHappen_15_00");	//Měl bych si hledět svého.
	AI_Output(self,other,"DIA_JAN_Dragons_ShitHappen_10_01");	//No úžasný. Já teď nemůžu opustit hrad a ani nemůžu nic vykovat.
	Info_ClearChoices(DIA_JAN_Dragons);
};


instance DIA_JAN_Home(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Home_Condition;
	information = DIA_Jan_Home_Info;
	permanent = FALSE;
	description = "Odkud jsi přišel?";
};


func int DIA_Jan_Home_Condition()
{
	if(Npc_KnowsInfo(other,DIA_JAN_Hello) && (Kapitel >= 4) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Home_Info()
{
	AI_Output(other,self,"DIA_Jan_Home_15_00");	//Odkud jsi přišel?
	AI_Output(self,other,"DIA_Jan_Home_10_01");	//Přidal jsem se k nějakým mužům z hor. Měli jsme namířeno do údolí, kde jsme si chtěli trochu přilepšit lovem draků.
	AI_Output(self,other,"DIA_Jan_Home_10_02");	//Jejich velitel vystupoval pod jménem Sylvio. Chlape, to bylo hovado. Zacházel se mnou jako s kusem hadru.
};


instance DIA_JAN_OldCamp(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_OldCamp_Condition;
	information = DIA_Jan_OldCamp_Info;
	permanent = TRUE;
	description = "Co všechno se na hradě stalo?";
};


func int DIA_Jan_OldCamp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_JAN_Hello) && (Kapitel == 4) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_OldCamp_Info()
{
	AI_Output(other,self,"DIA_Jan_OldCamp_15_00");	//Co všechno se na hradě stalo?
	AI_Output(self,other,"DIA_Jan_OldCamp_10_01");	//Nic, o čem bych věděl. Jasně, znepokojuje mě, co se děje venku za hradbama.
};


instance DIA_JAN_Parcival(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Parcival_Condition;
	information = DIA_Jan_Parcival_Info;
	permanent = FALSE;
	description = "Mluvil jsem s Parcivalem.";
};


func int DIA_Jan_Parcival_Condition()
{
	if((MIS_JanBecomesSmith != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Parcival_Jan) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Parcival_Info()
{
	AI_Output(other,self,"DIA_Jan_Parcival_15_00");	//Mluvil jsem s Parcivalem.
	AI_Output(self,other,"DIA_Jan_Parcival_10_01");	//Takže?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_02");	//Nám drakobijcům prostě nevěří.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_03");	//Vám drakobijcům prostě nevěří.
	};
	AI_Output(self,other,"DIA_Jan_Parcival_10_04");	//Sakra. Prostě chci jen nějakou práci.
	AI_Output(self,other,"DIA_Jan_Parcival_10_05");	//Tak to asi budu muset vzdát. Teď už mi může pomoct jen Garond.
};


instance DIA_JAN_JanIsSmith(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_JanIsSmith_Condition;
	information = DIA_Jan_JanIsSmith_Info;
	permanent = FALSE;
	description = "Běž si pro kladivo, máš práci.";
};


func int DIA_Jan_JanIsSmith_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_JanIsSmith_Info()
{
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_00");	//Běž si pro kladivo, máš práci.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_01");	//Tys to dokázal? Jak si to zařídil?
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_02");	//Přimluvil jsem se za tebe, tak ať mě nezklameš.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_03");	//Neměj strach. Jsem rád, že vůbec můžu pracovat.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SMITH");
};


instance DIA_JAN_SellWeapons(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_SellWeapons_Condition;
	information = DIA_Jan_SellWeapons_Info;
	permanent = FALSE;
	description = "Prodáváš nějaké zbraně?";
};


func int DIA_Jan_SellWeapons_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (Jan_TeachPlayer == FALSE) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_SellWeapons_Info()
{
	AI_Output(other,self,"DIA_Jan_SellWeapons_15_00");	//Prodáváš nějaké zbraně?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_01");	//To víš. A pak mě tví kolegové šoupnou za mříže za černej obchod, co? Ne, zapomeň na to!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_02");	//Udělal bych to, kdybych mohl. Ale nejdřív musím udělat dost zbraní pro paladiny tady na hradě.
	};
	AI_Output(self,other,"DIA_Jan_SellWeapons_10_03");	//Ale můžu ti ukázat, jak si vykovat vlastní zbraň.
	Jan_TeachPlayer = TRUE;
};


instance Jan_Training_Talente(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = Jan_Training_Talente_Condition;
	information = Jan_Training_Talente_Info;
	permanent = TRUE;
	description = "Nauč mě kovářskému řemeslu.";
};


func int Jan_Training_Talente_Condition()
{
	if((Jan_TeachPlayer == TRUE) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void Jan_Training_Talente_Info()
{
	AI_Output(other,self,"DIA_Jan_TeachPlayer_15_00");	//Nauč mě kovářskému řemeslu.
	AI_Output(self,other,"DIA_Jan_TeachPlayer_10_01");	//Co přesně chceš vyrobit?
	Info_ClearChoices(Jan_Training_Talente);
	Info_AddChoice(Jan_Training_Talente,Dialog_Back,Jan_Training_Smith_Back);
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt("Naučit se základy kovářství",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),Jan_Training_Smith_Common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_01)),Jan_Training_Smith_1hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_01,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_01)),Jan_Training_Smith_2hSpecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt(NAME_ItMw_1H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_1H_Special_02)),Jan_Training_Smith_1hSpecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente,b_buildlearnstringforsmithhunt(NAME_ItMw_2H_Special_02,B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_2H_Special_02)),Jan_Training_Smith_2hSpecial2);
		};
	};
};

func void Jan_Training_Smith_Back()
{
	Info_ClearChoices(Jan_Training_Talente);
};

func void Jan_Training_Smith_Common()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_Common);
};

func void Jan_Training_Smith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_01);
};

func void Jan_Training_Smith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_01);
};

func void Jan_Training_Smith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_1H_Special_02);
};

func void Jan_Training_Smith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self,other,WEAPON_2H_Special_02);
};


var int DIA_JAN_SellArmor_permanent;

instance DIA_JAN_SellArmor(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_SellArmor_Condition;
	information = DIA_Jan_SellArmor_Info;
	permanent = TRUE;
	description = "Můžu si od tebe koupit nějakou zbroj?";
};


func int DIA_Jan_SellArmor_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (MIS_OCGateOpen == FALSE) && (DIA_JAN_SellArmor_permanent == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_SellArmor_Info()
{
	AI_Output(other,self,"DIA_Jan_SellArmor_15_00");	//Můžu si od tebe koupit nějakou zbroj?

	if((hero.guild == GIL_PAL) || (hero.guild == GIL_TPL))
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_01");	//Tvé zbroji se nic nevyrovná. Zapomeň na to.
	}
	else if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_02");	//Mág, co chce zbroj? Zapomeň na to - běž se podívat za krejčím. Pro tebe zbroj udělat nedokážu.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_03");	//Kdybych nějakou měl, tak bych ti ji prodal. Bohužel, žádnou nemám.

		if((SBMode == TRUE) || (RealMode[2] == TRUE))
		{
			Info_ClearChoices(DIA_JAN_SellArmor);
			Info_AddChoice(DIA_JAN_SellArmor,"A mohl bys pro mě nějakou udělat?",DIA_JAN_SellArmor_BuildOne);
		};
	};
};

func void DIA_JAN_SellArmor_Sorry()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_Sorry_15_00");	//Hádám, že s tím nejde nic dělat.
	AI_Output(self,other,"DIA_JAN_SellArmor_Sorry_10_01");	//Kdybys přece jen na něco narazil, dej mi vědět.
	Info_ClearChoices(DIA_JAN_SellArmor);
};

func void DIA_JAN_SellArmor_BuildOne()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_00");	//A mohl bys pro mě nějakou udělat?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_01");	//Dobrá, jestli stojíš o něco lepšího, musíš mi opatřit vhodný materiál.
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_02");	//Co potřebuješ?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_03");	//Chceš bojovat s draky, ne? Přines mi nějaký dračí šupiny - s tím už bych pro tebe mohl něco udělat.
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_04");	//20 šupin by mohlo stačit.
	DIA_JAN_SellArmor_permanent = TRUE;
	Info_ClearChoices(DIA_JAN_SellArmor);
};


var int Jan_Sells_Armor;

instance DIA_JAN_Dragonscales(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_Dragonscales_Condition;
	information = DIA_Jan_Dragonscales_Info;
	permanent = TRUE;
	description = "Mám pro tebe ty dračí šupiny.";
};


func int DIA_Jan_Dragonscales_Condition()
{
	if((MIS_JanBecomesSmith == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_JAN_JanIsSmith) && (MIS_OCGateOpen == FALSE) && (DIA_JAN_SellArmor_permanent == TRUE) && (Jan_Sells_Armor == FALSE) && (Npc_HasItems(other,ItAt_DragonScale) >= 1))
	{
		return 1;
	};
};


var int DIA_JAN_Dragonscales_OneTime;

func void DIA_Jan_Dragonscales_Info()
{
	AI_Output(other,self,"DIA_JAN_Dragonscales_15_00");	//Mám pro tebe ty dračí šupiny.

	if(Npc_HasItems(other,ItAt_DragonScale) >= 20)
	{
		B_GiveInvItems(other,self,ItAt_DragonScale,20);
		Npc_RemoveInvItems(self,ItAt_DragonScale,20);
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_01");	//Dobrá! S tím už se dá něco dělat.
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_02");	//Vrať se zítra, to už bych mohl mít zbroj hotovou.
		if(DIA_JAN_Dragonscales_OneTime == FALSE)
		{
			B_GivePlayerXP(XP_Addon_JanSellsArmor);
			DIA_JAN_Dragonscales_OneTime = TRUE;
		};
		Jan_Sells_Armor = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_03");	//Potřebuju 20 dračích šupin, jinak ti nebudu moct žádnou zbroj vyrobit.
	};
};


var int DJG_Armor_is_offered;
var int DIA_JAN_ArmorReady_NoPerm;

instance DIA_JAN_ArmorReady(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_ArmorReady_Condition;
	information = DIA_Jan_ArmorReady_Info;
	permanent = TRUE;
	description = "Je ta zbroj hotová?";
};

func int DIA_Jan_ArmorReady_Condition()
{
	if((MIS_OCGateOpen == FALSE) && (Jan_Sells_Armor != FALSE) && (DIA_JAN_ArmorReady_NoPerm == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_ArmorReady_Info()
{
	AI_Output(other,self,"DIA_JAN_ArmorReady_15_00");	//Je ta zbroj hotová?
	if(Jan_Sells_Armor == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_01");	//Ne, ještě ne. Vrať se zítra.
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_02");	//Ano. Vážně mistrovský kousek. Můžeš si ho koupit, pokud o něj stojíš.
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_03");	//Udělám ti zvláštní cenu. 12 000 zlatých.
		AI_Output(other,self,"DIA_JAN_ArmorReady_15_04");	//Co?! Po tom všem, co jsem pro tebe udělal?
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_05");	//Nebuď takovej. Musím se nějak živit. Buď ber, nebo nech ležet.
		DJG_Armor_is_offered = TRUE;
		DIA_JAN_ArmorReady_NoPerm = TRUE;
	};
};


var int Jan_DIA_Jan_DJG_ARMOR_M_permanent;

instance DIA_Jan_DJG_ARMOR_M(C_Info)
{
	npc = DJG_714_Jan;
	nr = 4;
	condition = DIA_Jan_DJG_ARMOR_M_Condition;
	information = DIA_Jan_DJG_ARMOR_M_Info;
	permanent = TRUE;
	description = "Koupit zbroj z dračích šupin. (cena: 15000 zlatých)";
};

func int DIA_Jan_DJG_ARMOR_M_Condition()
{
	if((Jan_DIA_Jan_DJG_ARMOR_M_permanent == FALSE) && (hero.guild == GIL_DJG) && (DJG_Armor_is_offered == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jan_DJG_ARMOR_M_Info()
{
	AI_Output(other,self,"DIA_Jan_DJG_ARMOR_M_15_00");	//Chci si koupit novou zbroj.

	if(Npc_HasItems(other,ItMi_Gold) >= 15000)
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_01");	//Jak vidíš, tak má cenu zlata.
		B_GiveInvItems(other,self,ItMi_Gold,15000);
		Npc_RemoveInvItems(self,ItMi_Gold,15000);
		CreateInvItems(self,ITAR_Dargonscale,1);
		B_GiveInvItems(self,other,ITAR_Dargonscale,1);
		Jan_DIA_Jan_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_02");	//Nemáš dost zlata!
	};
};

instance DIA_Jan_DragonPlettBericht(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_DragonPlettBericht_Condition;
	information = DIA_Jan_DragonPlettBericht_Info;
	description = "A co se týče těch draků...";
};

var int DIA_Jan_DragonPlettBericht_NoPerm;

func int DIA_Jan_DragonPlettBericht_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_JAN_Dragons) && (DIA_Jan_DragonPlettBericht_NoPerm == FALSE) && (MIS_OCGateOpen == FALSE) && (MIS_KilledDragons != 0))
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonPlettBericht_Info()
{
	if(MIS_KilledDragons == 1)
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_00");	//Zabil jsem draka.
	}
	else if((MIS_KilledDragons == 2) || (MIS_KilledDragons == 3))
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_01");	//Zabil jsem pár draků.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_02");	//Zabil jsem všechny draky.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_03");	//A co? Jsi přece drakobijec, ne?
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_04");	//Nejsi náhodou taky jedním z nich?
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_05");	//To je výborný. Ale abych pravdu řekl, vůbec mě to nezajímá.
	};
	AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_06");	//Už jsem ti říkal, že raděj vyrábím zbraně, než abych chodil zabíjet draky.
	if((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_07");	//Nicméně, je jedna věc, co by mě mohla zajímat.
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_08");	//Pokud bys mi chtěl přinýst nějakou dračí krev, slušně ti za ni zaplatím.
		Jan_WantsDragonBlood = TRUE;
	};
};


instance DIA_Jan_DragonBlood(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_DragonBlood_Condition;
	information = DIA_Jan_DragonBlood_Info;
	permanent = TRUE;
	description = "Mám pro tebe tu dračí krev.";
};


func int DIA_Jan_DragonBlood_Condition()
{
	if((Jan_WantsDragonBlood == TRUE) && (MIS_OCGateOpen == FALSE) && Npc_HasItems(other,ItAt_DragonBlood) && ((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD)))
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonBlood_Info()
{
	AI_Output(other,self,"DIA_Jan_DragonBlood_15_00");	//Mám pro tebe tu dračí krev.
	AI_Output(self,other,"DIA_Jan_DragonBlood_10_01");	//To je skvělý. Koupím všechnu, co máš.
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(všechnu)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(jednu dávku)",DIA_Jan_DragonBlood_1);
	};
};

func void DIA_Jan_DragonBlood_BACK()
{
	Info_ClearChoices(DIA_Jan_DragonBlood);
};

func void DIA_Jan_DragonBlood_1()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;
	var string BloodText;
	var string BloodLeft;
	DragonBloodCount = 1;
	B_GiveInvItems(other,self,ItAt_DragonBlood,DragonBloodCount);
	Npc_RemoveInvItems(self,ItAt_DragonBlood,DragonBloodCount);
	XP_DJG_BringDragonBloods = DragonBloodCount * XP_AmbientKap4;
	B_GivePlayerXP(XP_DJG_BringDragonBloods);
	DragonBloodGeld = DragonBloodCount * Value_DragonBlood;
	CreateInvItems(self,ItMi_Gold,DragonBloodGeld);
	B_GiveInvItems(self,other,ItMi_Gold,DragonBloodGeld);
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(všechnu)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(jednu dávku)",DIA_Jan_DragonBlood_1);
	};
	BloodLeft = IntToString(Npc_HasItems(other,ItAt_DragonBlood));
	// BloodText = ConcatStrings(BloodLeft,PRINT_NumberLeft);
	BloodText = ConcatStrings("Zbývá ",BloodLeft);
	BloodText = ConcatStrings(BloodText," dávek");
	AI_Print(BloodText);
};

func void DIA_Jan_DragonBlood_all()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;
	var string BloodText;
	var string BloodLeft;
	DragonBloodCount = Npc_HasItems(other,ItAt_DragonBlood);
	B_GiveInvItems(other,self,ItAt_DragonBlood,DragonBloodCount);
	Npc_RemoveInvItems(self,ItAt_DragonBlood,DragonBloodCount);
	XP_DJG_BringDragonBloods = DragonBloodCount * XP_AmbientKap4;
	B_GivePlayerXP(XP_DJG_BringDragonBloods);
	DragonBloodGeld = DragonBloodCount * Value_DragonBlood;
	CreateInvItems(self,ItMi_Gold,DragonBloodGeld);
	B_GiveInvItems(self,other,ItMi_Gold,DragonBloodGeld);
	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood,Dialog_Back,DIA_Jan_DragonBlood_BACK);
	if(Npc_HasItems(other,ItAt_DragonBlood) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood,"(všechnu)",DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood,"(jednu dávku)",DIA_Jan_DragonBlood_1);
	};
	BloodLeft = IntToString(Npc_HasItems(other,ItAt_DragonBlood));
	// BloodText = ConcatStrings(BloodLeft,PRINT_NumberLeft);
	BloodText = ConcatStrings("Zbývá ",BloodLeft);
	BloodText = ConcatStrings(BloodText," dávek");
	AI_Print(BloodText);
};


instance DIA_Jan_NACHOCGATEOPEN(C_Info)
{
	npc = DJG_714_Jan;
	nr = 3;
	condition = DIA_Jan_NACHOCGATEOPEN_Condition;
	information = DIA_Jan_NACHOCGATEOPEN_Info;
	permanent = TRUE;
	description = "Je všechno v pořádku?";
};


func int DIA_Jan_NACHOCGATEOPEN_Condition()
{
	if(MIS_OCGateOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jan_NACHOCGATEOPEN_Info()
{
	AI_Output(other,self,"DIA_Jan_NACHOCGATEOPEN_15_00");	//Je všechno v pořádku?
	AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_01");	//V pořádku není naprosto nic!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_02");	//Proč jste vy idioti otevírali tu bránu? Vy paladinové jste taky chytrý jak prdy ve spodkách!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_03");	//Tak oni prostě šli a otevřeli tu bránu. Tupci! Tohle prostě nepochopim.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Jan_PICKPOCKET(C_Info)
{
	npc = DJG_714_Jan;
	nr = 900;
	condition = DIA_Jan_PICKPOCKET_Condition;
	information = DIA_Jan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jan_PICKPOCKET_Condition()
{
	return C_Beklauen(37,95);
};

func void DIA_Jan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
	Info_AddChoice(DIA_Jan_PICKPOCKET,Dialog_Back,DIA_Jan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jan_PICKPOCKET_DoIt);
};

func void DIA_Jan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
};

func void DIA_Jan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
};


instance DIA_JAN_ARMORCANTEACH(C_Info)
{
	npc = DJG_714_Jan;
	nr = 5;
	condition = dia_jan_armorcanteach_condition;
	information = dia_jan_armorcanteach_info;
	permanent = TRUE;
	description = "Můžeš vykovat zbroj?";
};


func int dia_jan_armorcanteach_condition()
{
	if((JAN_TEACHARMOR == FALSE) && (other.guild == GIL_DJG) && (MIS_JanBecomesSmith == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_jan_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Jan_ArmorCanTeach_01_00");	//Můžeš vykovat zbroj?
	AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_01");	//Jo, něco jo. Co přesně chceš?
	AI_Output(other,self,"DIA_Jan_ArmorCanTeach_01_02");	//Jestli bys mě to nemohl naučit. Nemohl?
	AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_03");	//No, proč ne, přece jen jsi také drakobijec, tak bych ti alespoň mohl ukázat jak takovou zbroj vylepšit.
	AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_04");	//Ale musíš nejdříve porozumět základům kovařiny.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Jan_ArmorCanTeach_01_05");	//Kování celkem rozumím.
		AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_06");	//No, tak ti můžu ukázat jak na to.
		AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_07");	//Ale nebude to zadarmo.
		AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_08");	//Řekni kdy budeš chtít a začneme.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_09");	//Nemáš páru co kovařina vůbec je!
		AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_10");	//Chlape, jdi se naučit základy a pak si promluvíme na toto téma.
		AI_Output(self,other,"DIA_Jan_ArmorCanTeach_01_11");	//Ale nebude to zadarmo.
	};

	JAN_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Jan mě může naučit, jak vylepšit zbroje drakobijců.");
};

func void b_jan_teacharmor_4()
{
	AI_Output(self,other,"DIA_Jan_TeachArmor_4_01_01");	//Tak začněme... Vždy se ujisti, že máš všechny materiály po ruce...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Jan_TeachArmor_4_01_02");	//... Polož na kovadlinu plát kovu a kousek magické rudy...
		AI_Output(self,other,"DIA_Jan_TeachArmor_4_01_03");	//... Rudou potom plát pečlivě pokryj...
		AI_Output(self,other,"DIA_Jan_TeachArmor_4_01_04");	//... Potom připevníš plát ke zbroji - asi nějak takhle... Podívej... (ukazuje)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Jan_TeachArmor_4_01_05");	//... A je to!
		AI_Output(self,other,"DIA_Jan_TeachArmor_4_01_06");	//To je vše, co bys měl vědět.
	};
};

func void b_jan_teacharmor_5()
{
	AI_Output(self,other,"DIA_Jan_TeachArmor_5_01_01");	//Dobrá, začneme, tohle je o něco nákladnější a náročnější, ale stojí to za to...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Jan_TeachArmor_5_01_02");	//... Vezmi ocel a rozděl ji na části... Ujisti se, že jsou všechny stejně velké...
		AI_Output(self,other,"DIA_Jan_TeachArmor_5_01_03");	//... Potom vem každou část zvlášť a vždy dvě dej na sebe a mezeru vyplň rudou...
		AI_Output(self,other,"DIA_Jan_TeachArmor_5_01_04");	//... Takto vyztužený kov se díky magii rudy neprohne... Dívej se, asi takhle... (ukazuje)
		AI_Output(self,other,"DIA_Jan_TeachArmor_5_01_05");	//... Nyní můžeš plát připevnit na místo na zbroji...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Jan_TeachArmor_5_01_06");	//... A je to! (směje se) Jen trochu tréninku a bude ti to připadat primitivní.
		AI_Output(self,other,"DIA_Jan_TeachArmor_5_01_07");	//Nyní si to běž zkusit sám.
	};
};

func void b_jan_teacharmor_6()
{
	AI_Output(self,other,"DIA_Jan_TeachArmor_6_01_01");	//S touto znalostí můžeš stvořit zbroj, která se svou výdrží a pevností předčí všechny ostatní...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_BIGFARM_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Jan_TeachArmor_6_01_02");	//... Dívej se pozorně - normálně vem ocel a polož ji na kovadlinu...
		AI_Output(self,other,"DIA_Jan_TeachArmor_6_01_03");	//... Smíchej ji do směsi s magickou rudou a po té výsledek pokryj černou rudou...
		AI_Output(self,other,"DIA_Jan_TeachArmor_6_01_04");	//... Udělej si dva takové pláty a pokryj jimi kostru zbroje... Takhle nějako... (ukazuje)
		AI_Output(self,other,"DIA_Jan_TeachArmor_6_01_05");	//... Takhle se zpevní samotný základ zbroje... Trochu upravíme, aby seděla...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Jan_TeachArmor_6_01_06");	//... A to je vše, zbroj je hotova! Nebo lépe řečeno - vylepšena.
		AI_Output(self,other,"DIA_Jan_TeachArmor_6_01_07");	//Už nemám nic, co bych tě naučil - ovládl jsi toto umění.
	};
};

func void b_janarmorchoices()
{
	Info_ClearChoices(dia_jan_armorteach);
	Info_AddChoice(dia_jan_armorteach,Dialog_Back,dia_jan_armorteach_back);

	if((PLAYER_TALENT_SMITH[20] == FALSE) && (SHOW_DJG_ARMOR_L == TRUE))
	{
		Info_AddChoice(dia_jan_armorteach,B_BuildLearnStringEx("Lehká zbroj drakobijce (cena: 4000 zlatých)",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_DJG_L_V1)),dia_jan_armorteach_itar_djg_l_v1);
	};
	if((PLAYER_TALENT_SMITH[21] == FALSE) && (Show_DJG_Armor_M == TRUE))
	{
		Info_AddChoice(dia_jan_armorteach,B_BuildLearnStringEx("Zbroj drakobijce (cena: 6000 zlatých)",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_DJG_M_V1)),dia_jan_armorteach_itar_djg_m_v1);
	};
	if((PLAYER_TALENT_SMITH[22] == FALSE) && (SHOW_DJG_ARMOR_H == TRUE))
	{
		Info_AddChoice(dia_jan_armorteach,B_BuildLearnStringEx("Těžká zbroj drakobijce (cena: 8000 zlatých)",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_DJG_H_V1)),dia_jan_armorteach_itar_djg_h_v1);
	};
};


instance DIA_JAN_ARMORTEACH(C_Info)
{
	npc = DJG_714_Jan;
	nr = 5;
	condition = dia_jan_armorteach_condition;
	information = dia_jan_armorteach_info;
	permanent = TRUE;
	description = "Nauč mě, jak vylepšit zbroj.";
};


func int dia_jan_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (JAN_TEACHARMOR == TRUE) && (other.guild == GIL_DJG) && (MIS_JanBecomesSmith == LOG_SUCCESS))
	{
		if((PLAYER_TALENT_SMITH[20] == FALSE) || (PLAYER_TALENT_SMITH[21] == FALSE) || (PLAYER_TALENT_SMITH[22] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_jan_armorteach_info()
{
	AI_Output(other,self,"DIA_Jan_ArmorTeach_01_00");	//Nauč mě, jak vylepšit zbroj.
	if(Wld_IsTime(8,0,20,0))
	{
		AI_Output(self,other,"DIA_Jan_ArmorTeach_01_01");	//Co chceš vědět...
		b_janarmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_ArmorTeach_01_02");	//Pro dnešek mám dost...
		AI_Output(self,other,"DIA_Jan_ArmorTeach_01_03");	//Přijď zítra a promluvíme si o tom.
	};
};

func void dia_jan_armorteach_back()
{
	Info_ClearChoices(dia_jan_armorteach);
};

func void dia_jan_armorteach_itar_djg_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 4000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,4000);
			b_jan_teacharmor_4();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_TeachArmor_04_00");	//Nemáš dost zlata, takže na to můžeš rovnou zapomenout...
	};
	b_janarmorchoices();
};

func void dia_jan_armorteach_itar_djg_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 6000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,6000);
			b_jan_teacharmor_5();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_TeachArmor_05_00");	//Nemáš dost zlata, takže na to můžeš rovnou zapomenout...
	};
	b_janarmorchoices();
};

func void dia_jan_armorteach_itar_djg_h_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 8000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_DJG_H_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,8000);
			b_jan_teacharmor_6();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_TeachArmor_06_00");	//Nemáš dost zlata, takže na to můžeš rovnou zapomenout...
	};
	b_janarmorchoices();
};
