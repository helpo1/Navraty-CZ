
var int brsharpsword;

instance DIA_Brian_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_EXIT_Condition;
	information = DIA_Brian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Brian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_PICKPOCKET(C_Info)
{
	npc = VLK_457_Brian;
	nr = 900;
	condition = DIA_Brian_PICKPOCKET_Condition;
	information = DIA_Brian_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Brian_PICKPOCKET_Condition()
{
	return C_Beklauen(55,100);
};

func void DIA_Brian_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
	Info_AddChoice(DIA_Brian_PICKPOCKET,Dialog_Back,DIA_Brian_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brian_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brian_PICKPOCKET_DoIt);
};

func void DIA_Brian_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
};

func void DIA_Brian_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
};

var int FirstTalkBrian;

instance DIA_Brian_NoTalkAtAll(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_NoTalkAtAll_Condition;
	information = DIA_Brian_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Brian_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brian_NoTalkAtAll_Info()
{
	if(FirstTalkBrian == FALSE)
	{
		AI_Output(self,other,"DIA_Brian_NoTalkAtAll_12_00");	//Tady nemáš co dělat. Padej pryč!
		FirstTalkBrian = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Brian_NoTalkAtAll_12_01");	//Jsi hluchý nebo co? Vypadni odsud.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Brian_HALLO(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_HALLO_Condition;
	information = DIA_Brian_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Brian_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Brian_HALLO_Info()
{
	AI_Output(self,other,"DIA_Brian_HALLO_04_00");	//Jsi ve městě nový, co? Jsem Brian! Jsem učedník mistra Harada.
};


instance DIA_Brian_AboutLehrling(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_AboutLehrling_Condition;
	information = DIA_Brian_AboutLehrling_Info;
	permanent = FALSE;
	description = "Jaké je to být učedníkem kováře?";
};

func int DIA_Brian_AboutLehrling_Condition()
{
	return TRUE;
};

func void DIA_Brian_AboutLehrling_Info()
{
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_00");	//Jaké je to být učedníkem kováře?
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_01");	//Proč se ptáš? Chceš se stát mým nástupcem?
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_02");	//Možná.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_03");	//Proč ne... Já už se brzy vyučím, a pak opustím město.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_04");	//Ale ne kvůli Haradovi. Je to dobrý mistr - hodně jsem se od něho naučil.
};


instance DIA_Brian_WhyLeave(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_WhyLeave_Condition;
	information = DIA_Brian_WhyLeave_Info;
	permanent = FALSE;
	description = "Proč chceš opustit město?";
};


func int DIA_Brian_WhyLeave_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_WhyLeave_Info()
{
	AI_Output(other,self,"DIA_Brian_WhyLeave_15_00");	//Proč chceš opustit město?
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_00");	//Protože mi ti lidé tady lezou na nervy! Hlavně ostatní mistři.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_01");	//Ještě jsem nezapomněl co to stálo - stát se učedníkem u Harada.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_02");	//Každý z těch vtipálků měl co říct.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_03");	//Chci se rozhodnout sám, koho můžu a koho nechci vzít do učení.
};


instance DIA_Brian_OtherMasters(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_OtherMasters_Condition;
	information = DIA_Brian_OtherMasters_Info;
	permanent = FALSE;
	description = "Kdo jsou ostatní mistři?";
};


func int DIA_Brian_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_WhyLeave) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Brian_OtherMasters_Info()
{
	AI_Output(other,self,"DIA_Brian_Add_15_00");	//Kdo jsou ostatní mistři?
	AI_Output(self,other,"DIA_Brian_Add_04_01");	//No, je to tesař Thorben, výrobce luků Bosper, alchymista Constantino a Matteo.
	AI_Output(self,other,"DIA_Brian_Add_04_02");	//Prodává zbroje, ale je to především obchodník.
	AI_Output(self,other,"DIA_Brian_Add_04_03");	//Dům každého z mistrů se nachazí tady v ulici.
	AI_Output(self,other,"DIA_Brian_Add_04_04");	//A Constantinova dílna je v průchodu, který vede ke chrámu.
};


instance DIA_Brian_AboutHarad(C_Info)
{
	npc = VLK_457_Brian;
	nr = 2;
	condition = DIA_Brian_AboutHarad_Condition;
	information = DIA_Brian_AboutHarad_Info;
	permanent = FALSE;
	description = "Řekni mi něco víc o mistru Haradovi.";
};


func int DIA_Brian_AboutHarad_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutHarad_Info()
{
	AI_Output(other,self,"DIA_Brian_AboutHarad_15_00");	//Řekni mi něco víc o mistru Haradovi.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_01");	//Teď zrovna nemá moc dobrou náladu.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_02");	//Před několika dny za ním přišli paladinové a příkázali mu, že bude kovat meče pro ně.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_03");	//Zakázali mu dokonce prodávat meče komukoli jinému.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_04");	//Teď dře celé dny a noci, jen aby tu práci co nejdříve dokončil.
	AI_Output(other,self,"DIA_Brian_NEEDWEAPONS_15_00");	//Můžu si u tebe koupit nějaké zbraně?
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_01");	//Bohužel ne. Já jsem jen pomocník.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_02");	//Zbraně, které se vyrobí v kovárně, jsou pro domobranu. Odnáší je do věží, kde je skladují.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_03");	//No, ale se vším ostatním, co se kovařiny týče, ti pomoci můžu.
};


instance DIA_Brian_NEEDWEAPONS(C_Info)
{
	npc = VLK_457_Brian;
	nr = 5;
	condition = DIA_Brian_NEEDWEAPONS_Condition;
	information = DIA_Brian_NEEDWEAPONS_Info;
	permanent = TRUE;
	description = "Nauč mě jak naostřit zbraně. (VB: 1, cena: 250 zlatých)";
};

func int DIA_Brian_NEEDWEAPONS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutHarad) && (KNOWHOWSHARPWEAPON == FALSE) && Wld_IsTime(7,5,20,35) && ((MIS_Jack_NewLighthouseOfficer != LOG_SUCCESS) || (MIS_Jack_NewLighthouseOfficer != LOG_Running)))
	{
		return TRUE;
	};
};

func void DIA_Brian_NEEDWEAPONS_Info()
{
	AI_Output(other,self,"DIA_Brian_WASKAUFEN_03_89");	//Nauč mě jak naostřit zbraně.

	if((other.lp >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 250))
	{
		KNOWHOWSHARPWEAPON = TRUE;
		other.lp = other.lp - 1;
		RankPoints = RankPoints + 1;
		Npc_RemoveInvItems(other,ItMi_Gold,250);
		AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_10");	//Dobře, pozorně sleduj, jak se to dělá. Vše, co potřebuješ, je zrezlá zbraň a ocelový prut.

		if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSSHARP"))
		{
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoWP(self,"NW_CITY_SMITH_SHARP");
			AI_AlignToWP(self);
			AI_UseMob(self,"BSSHARP",5);
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_12");	//Vezmeš zrezlý meč od vrchu a přikládáš ho na ocelový prut...
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_13");	//... a hladce jezdíš po brusu doprava-doleva...
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_14");	//... pro ocelový prut je potřeba více tlačit meč ke kameni...
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_15");	//... a že se meč nepřehřívá a nekroutí při broušení.
			AI_UseMob(self,"BSSHARP",-1);
			B_TurnToNpc(self,other);
		};

		AI_Print(PRINT_LearnSharp);
		Snd_Play("LevelUP");
	}
	else if(other.lp < 1)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < 250)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_03_90");	//Na to nemáš dost zlata! Vrať se později.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Brian_GiveSharpStone(C_Info)
{
	npc = VLK_457_Brian;
	nr = 2;
	condition = DIA_Brian_GiveSharpStone_Condition;
	information = DIA_Brian_GiveSharpStone_Info;
	permanent = FALSE;
	description = "Nabrousit zbraně se dá jen v kovárně?";
};

func int DIA_Brian_GiveSharpStone_Condition()
{
	if(KNOWHOWSHARPWEAPON == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Brian_GiveSharpStone_Info()
{
	AI_Output(other,self,"DIA_Brian_GiveSharpStone_01_00");	//Nabrousit zbraně se dá jen v kovárně?
	AI_Output(self,other,"DIA_Brian_GiveSharpStone_01_01");	//No jasně. Samozřejmě, pokud tedy u sebe nemáš brusný kámen.
	AI_Output(other,self,"DIA_Brian_GiveSharpStone_01_02");	//A ty máš takový?
	AI_Output(self,other,"DIA_Brian_GiveSharpStone_01_03");	//Měl jsem, dokud mi ho nějaký drzý zloděj neukradl.
	AI_Output(self,other,"DIA_Brian_GiveSharpStone_01_04");	//Jen jsem na chvíli odvrátil zrak - a hle... K čemu by ale někdo chtěl blbý kus kamene?
	MIS_BrianSharpStone = LOG_Running;
	Log_CreateTopic(TOPIC_BrianSharpStone,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrianSharpStone,LOG_Running);
	B_LogEntry(TOPIC_BrianSharpStone,"Brianovi nějaký zloděj ukradl brusný kámen. Nebyl by proti, kdyby se k němu dostal zpět.");
};

instance DIA_Brian_GiveSharpStoneDone(C_Info)
{
	npc = VLK_457_Brian;
	nr = 2;
	condition = DIA_Brian_GiveSharpStoneDone_Condition;
	information = DIA_Brian_GiveSharpStoneDone_Info;
	permanent = FALSE;
	description = "Našel jsem tvůj brousek.";
};

func int DIA_Brian_GiveSharpStoneDone_Condition()
{
	if((MIS_BrianSharpStone == LOG_Running) && (Npc_HasItems(hero,ItMi_ZharpStone) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brian_GiveSharpStoneDone_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Brian_GiveSharpStoneDone_01_00");	//Našel jsem tvůj brousek.
	AI_Output(self,other,"DIA_Brian_GiveSharpStoneDone_01_01");	//Vážně? (udiveně) Už jsem ani nedoufal, že by se ještě našel.
	AI_Output(self,other,"DIA_Brian_GiveSharpStoneDone_01_02");	//Víš co? Můžeš si ho nechat. Mě už je k ničemu. a tobě by ještě mohl přijít vhod.
	AI_Output(other,self,"DIA_Brian_GiveSharpStoneDone_01_03");	//Jak říkáš?
	MIS_BrianSharpStone = LOG_Success;
	Log_SetTopicStatus(TOPIC_BrianSharpStone,LOG_Success);
	B_LogEntry(TOPIC_BrianSharpStone,"Řekl jsem Brianovi že jsem našel jeho brousek, byl tak šťastný až mi ho nechal.");
};

var int Brian_Trade_einmal;

instance DIA_Brian_WASKAUFEN(C_Info)
{
	npc = VLK_457_Brian;
	nr = 4;
	condition = DIA_Brian_WASKAUFEN_Condition;
	information = DIA_Brian_WASKAUFEN_Info;
	permanent = TRUE;
	description = "Co si u tebe můžu koupit?";
	trade = TRUE;
};

func int DIA_Brian_WASKAUFEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutHarad) && Wld_IsTime(7,5,20,35) && ((MIS_Jack_NewLighthouseOfficer != LOG_SUCCESS) || (MIS_Jack_NewLighthouseOfficer != LOG_Running)))
	{
		return TRUE;
	};
};

func void DIA_Brian_WASKAUFEN_Info()
{
	var int daynow;
	daynow = Wld_GetDay();

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Brian_WASKAUFEN_15_00");	//Co si u tebe můžu koupit?

	if(Npc_IsDead(Harad))
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_01");	//Pokud mi ještě zbylo několik ocelových prutů, můžou být tvoje. Obávám se, že to je všechno.

		if(MIS_Jack_NewLighthouseOfficer == 0)
		{
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_02");	//Vzhledem k tomu, že už je Harad pryč, domobrana ze mě nespustí oči.
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_03");	//Já kovárnu nemám povoleno dál vést. Mají strach, že to celé prodám a prásknu do bot.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_01");	//Pokud mi ještě zbylo několik ocelových prutů, můžou být tvoje. Obávám se, že to je všechno.
	};

	if(Brian_Trade_einmal == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Haradův učedník Brian prodává ocelové pruty.");
		Brian_Trade_einmal = TRUE;
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
};


instance DIA_Brian_KAP3_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP3_EXIT_Condition;
	information = DIA_Brian_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_RepairNecklace(C_Info)
{
	npc = VLK_457_Brian;
	nr = 8;
	condition = DIA_Brian_RepairNecklace_Condition;
	information = DIA_Brian_RepairNecklace_Info;
	permanent = FALSE;
	description = "Umíš opravit i klenoty?";
};


func int DIA_Brian_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(hero,ItMi_InnosEye_Broken_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brian_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Brian_RepairNecklace_15_00");	//Umíš opravit i klenoty?
	AI_Output(self,other,"DIA_Brian_RepairNecklace_04_01");	//Jsem jen pomocník, mám radost, když mě nechají vyrobit alespoň dýku.
	if(Npc_IsDead(Harad) == FALSE)
	{
		AI_Output(self,other,"DIA_Brian_RepairNecklace_04_02");	//Šperky? Měl by ses raději obrátit na mistra.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Brian_KAP4_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP4_EXIT_Condition;
	information = DIA_Brian_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_KAP5_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP5_EXIT_Condition;
	information = DIA_Brian_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_NEWLIGHTHOUSEOFFICER(C_Info)
{
	npc = VLK_457_Brian;
	nr = 51;
	condition = DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition;
	information = DIA_Brian_NEWLIGHTHOUSEOFFICER_Info;
	description = "Zaslechl jsem, že ses zajímal o Jackův starý maják.";
};


func int DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition()
{
	if((Kapitel == 5) && (MIS_Jack_NewLighthouseOfficer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Brian_NEWLIGHTHOUSEOFFICER_Info()
{
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_00");	//Zaslechl jsem, že ses zajímal o Jackův starý maják.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_01");	//Jack uvažuje o tom, že by se vrátil na moře. Ale nemá nikoho, komu by přenechal maják.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_02");	//Ale Jack musí pochopit, že v době kdy bude pryč, předělám maják na kovárnu.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_03");	//Je v tom nějaký problém?
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_04");	//Pro mě ne! Stejně nezískám kovárnu Harada. Tuto myšlenku jsem dávno vypustil z hlavy.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_05");	//Souhlas. Uvidíme se u Jacka.
	MIS_Jack_NewLighthouseOfficer = LOG_SUCCESS;
	CreateInvItems(self,ItMw_1h_Vlk_Axe,1);
	EquipItem(self,ItMw_1h_Vlk_Axe);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
};


instance DIA_Brian_LIGHTHOUSEFREE(C_Info)
{
	npc = VLK_457_Brian;
	nr = 8;
	condition = DIA_Brian_LIGHTHOUSEFREE_Condition;
	information = DIA_Brian_LIGHTHOUSEFREE_Info;
	permanent = TRUE;
	description = "Co říkáš?";
};


func int DIA_Brian_LIGHTHOUSEFREE_Condition()
{
	if((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_01") < 1000) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Brian_LIGHTHOUSEFREE_Info()
{
	AI_Output(other,self,"DIA_Brian_LIGHTHOUSEFREE_15_00");	//Co říkáš?
	AI_Output(self,other,"DIA_Brian_LIGHTHOUSEFREE_04_01");	//No nazdar, takovej bordel. Jack to tu nepozná, až s tím budu hotov.
};

instance DIA_Brian_SharpKnife(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_SharpKnife_Condition;
	information = DIA_Brian_SharpKnife_Info;
	permanent = TRUE;
	description = "Potřebuji abys mi nabrousil nůž.";
};

func int DIA_Brian_SharpKnife_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutLehrling) && (Npc_GetDistToWP(self,"NW_CITY_SMITH_SHARP") <= 500) && (MIS_Hilda_SharpKnife == LOG_Running) && (HildaSharpKnife == FALSE) && (Npc_HasItems(other,ItMi_HildaKnife) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brian_SharpKnife_Info()
{
	AI_Output(other,self,"DIA_Brian_SharpKnife_15_00");	//Potřebuji abys mi nabrousil nůž.
	AI_Output(self,other,"DIA_Brian_SharpKnife_04_01");	//Jistě. Ale bude tě to něco stát.
	Info_ClearChoices(DIA_Brian_SharpKnife);

	if(Npc_HasItems(other,ItMi_Gold) >= 10)
	{
		Info_AddChoice(DIA_Brian_SharpKnife,"Tady je zlato.",DIA_Brian_SharpKnife_Ok);
	};

	Info_AddChoice(DIA_Brian_SharpKnife,"Nemám tolik peněz.",DIA_Brian_SharpKnife_No);

};

func void DIA_Brian_SharpKnife_Ok()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Brian_SharpKnife_Ok_15_00");	//Tady je zlato.
	B_GiveInvItems(other,self,ItMi_Gold,10);
	Npc_RemoveInvItems(self,ItMi_Gold,10);
	AI_Output(self,other,"DIA_Brian_SharpKnife_Ok_04_01");	//Dobrý! Počkej chvilku...
	AI_Output(self,other,"DIA_Brian_SharpKnife_Ok_04_02");	//... nu, to je všechno. Teď je ostřejší než břitva!
	HildaSharpKnife = TRUE;
	B_LogEntry(TOPIC_Hilda_SharpKnife,"Učedník Brian pro mě nabrousil Hildin nůž.");
	Info_ClearChoices(DIA_Brian_SharpKnife);
};

func void DIA_Brian_SharpKnife_No()
{
	AI_Output(other,self,"DIA_Brian_SharpKnife_No_15_00");	//Nemám tolik peněz.
	AI_Output(self,other,"DIA_Brian_SharpKnife_No_04_01");	//Omlouvám se, že nemůžu pomoct.
	Info_ClearChoices(DIA_Brian_SharpKnife);
};
