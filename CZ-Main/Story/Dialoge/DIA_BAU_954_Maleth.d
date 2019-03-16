
instance DIA_Maleth_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_EXIT_Condition;
	information = DIA_Maleth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Maleth_Hallo(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_Hallo_Condition;
	information = DIA_Maleth_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Maleth_Hallo_Condition()
{
	if((Kapitel < 3) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_Hallo_Info()
{
	AI_Output(self,other,"DIA_Maleth_Hallo_08_00");	//Hej, cizinče!

	if(hero.guild == GIL_NONE)
	{
		if(Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_01");	//Viděl jsem tě přicházet z hor.
		};
		AI_Output(self,other,"DIA_Maleth_Hallo_08_02");	//Můžeš být rád, žes nepřišel před třemi týdny.
		AI_Output(self,other,"DIA_Maleth_Hallo_08_03");	//Zatkli bychom tě jako uprchlého trestance. A udělali bychom s tebou krátký proces!
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_04");	//Vypadáš úplně vyčerpaně.
		}
		else
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_05");	//Když jsi přišel, vypadal jsi, že vypustíš duši.
			AI_Output(self,other,"DIA_Maleth_Hallo_08_06");	//Fajn, teď už vypadáš skoro jako člověk!
		};
	};
	AI_Output(self,other,"DIA_Maleth_Hallo_08_07");	//(nedůvěřivě) Co tady chceš?
};


instance DIA_Maleth_BANDITS(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_BANDITS_Condition;
	information = DIA_Maleth_BANDITS_Info;
	permanent = FALSE;
	description = "V horách mě přepadli banditi.";
};

func int DIA_Maleth_BANDITS_Condition()
{
	if((Kapitel < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BANDITS_Info()
{
	AI_Output(other,self,"DIA_Maleth_BANDITS_15_00");	//V horách mě přepadli banditi.
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_01");	//Ti zatracení mizerové! Asi to budou ti, kteří mi minulou noc ukradli jednu z ovcí!
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_02");	//Měls obrovské štěstí. Většina lidí se odtamtud nedostala živá.
};


instance DIA_Maleth_BanditsDEAD(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_BanditsDEAD_Condition;
	information = DIA_Maleth_BanditsDEAD_Info;
	permanent = FALSE;
	description = "Ti banditi už vám nebudou dělat žádné problémy.";
};


func int DIA_Maleth_BanditsDEAD_Condition()
{
	if((Npc_IsDead(Ambusher_1013) || (Bdt_1013_Away == TRUE)) && Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015) && Npc_KnowsInfo(other,DIA_Maleth_BANDITS))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsDEAD_Info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_00");	//Ti banditi už vám nebudou dělat žádné problémy.
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_01");	//Proč? Jsou mrtví?
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_02");	//Vytáhli zbraň na špatného chlapa.
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_03");	//Díky Innosovi! Tady - není to sice moc, ale chci, aby sis to vzal!
	B_GiveInvItems(self,other,ItFo_Wine,3);
	MIS_Maleth_Bandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_MalethKillBandits);
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_04");	//Řeknu to ostatním!
};


instance DIA_Maleth_BanditsALIVE(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_BanditsALIVE_Condition;
	information = DIA_Maleth_BanditsALIVE_Info;
	permanent = FALSE;
	description = "Vím, kde mají ti banditi skrýš.";
};

func int DIA_Maleth_BanditsALIVE_Condition()
{
	var C_Npc b13;
	var C_Npc b14;
	var C_Npc b15;

	b13 = Hlp_GetNpc(Bdt_1013_Bandit_L);
	b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);

	if(!(Npc_IsDead(b13) || !Npc_IsDead(b14) || !Npc_IsDead(b15)) && Npc_KnowsInfo(other,DIA_Maleth_BANDITS) && (MIS_Maleth_Bandits != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsALIVE_Info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsALIVE_15_00");	//Vím, kde mají ti banditi skrýš.
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_01");	//Chceš na ně jít? Tak z toho mě vynech! Je to moc nebezpečný!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_02");	//A kromě toho, musím dávat pozor na ovce!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_03");	//Ale jestli si myslíš, že nás té lůzy můžeš zbavit, bude ti celá farma vděčná.
	MIS_Maleth_Bandits = LOG_Running;
	Log_CreateTopic(TOPIC_Maleth,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Maleth,LOG_Running);
	B_LogEntry(TOPIC_Maleth,"Jestli se mi podaří pobít bandity na cestě z Xardasovy věže na Lobartův statek, lidé na Lobartově statku mi budou velmi vděční.");
};


instance DIA_Maleth_ToTheCity(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 2;
	condition = DIA_Maleth_ToTheCity_Condition;
	information = DIA_Maleth_ToTheCity_Info;
	permanent = FALSE;
	description = "Jdu do města.";
};

func int DIA_Maleth_ToTheCity_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_Hallo) && (Kapitel < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_ToTheCity_Info()
{
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_00");	//Jdu do města.
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_01");	//Asi budeš muset podplatit stráže, aby ses dostal, kam chceš.
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_02");	//A taky musíš vědět, co chtějí slyšet.
	}
	else
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_03");	//Můžou tě pustit dovnitř - když jim řekneš, co chtějí slyšet...
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_04");	//A to jako?
	AI_Output(self,other,"DIA_Maleth_ToTheCity_08_05");	//Fajn, například, že jsi z Lobartovy farmy a potřebuješ jít za městským kovářem...
	Log_CreateTopic(TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_City,LOG_Running);
	B_LogEntry(TOPIC_City,"Když strážím u městských bran řeknu, že přicházím z Lobartova statku a že mám namířeno ke kováři, pustí mě dovnitř.");
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_06");	//Ale asi ti to nebude moc platné. Nevypadáš jako farmář.
		B_LogEntry(TOPIC_City,"Samozřejmě že napřed musím taky vypadat jako farmář.");
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_07");	//Aha.
};


instance DIA_Maleth_Equipment(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 3;
	condition = DIA_Maleth_Equipment_Condition;
	information = DIA_Maleth_Equipment_Info;
	permanent = FALSE;
	description = "Potřebuju lepší vybavení!";
};


func int DIA_Maleth_Equipment_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_Hallo) && (Kapitel < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_Equipment_Info()
{
	AI_Output(other,self,"DIA_Maleth_Equipment_15_00");	//Potřebuju lepší vybavení!
	AI_Output(self,other,"DIA_Maleth_Equipment_08_01");	//To chápu. Ale řeknu ti rovnou: Nemáme nic, co bychom mohli postrádat!
	if(!Npc_IsDead(Lobart))
	{
		AI_Output(self,other,"DIA_Maleth_Equipment_08_02");	//Pokud můžeš zaplatit za to, co chceš, Lobart ti něco prodá.
		AI_Output(self,other,"DIA_Maleth_Equipment_08_03");	//Jinak se ho také můžeš zeptat, jestli by pro tebe neměl nějakou práci.
	};
};


instance DIA_Maleth_LOBART(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 3;
	condition = DIA_Maleth_LOBART_Condition;
	information = DIA_Maleth_LOBART_Info;
	permanent = FALSE;
	description = "Kde najdu Lobarta?";
};


func int DIA_Maleth_LOBART_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_Equipment) && !Npc_IsDead(Lobart) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_LOBART_Info()
{
	AI_Output(other,self,"DIA_Maleth_LOBART_15_00");	//Kde najdu Lobarta?
	AI_Output(self,other,"DIA_Maleth_LOBART_08_01");	//No, na farmě přece! Patří mu to tady!
	AI_Output(self,other,"DIA_Maleth_LOBART_08_02");	//A nezkoušej si s ním něco začínat! Už hodně tuláků od něj dostalo nakládačku a pak letěli z farmy.
};


instance DIA_Maleth_KAP3_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_KAP3_EXIT_Condition;
	information = DIA_Maleth_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Maleth_PROBLEME(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 30;
	condition = DIA_Maleth_PROBLEME_Condition;
	information = DIA_Maleth_PROBLEME_Info;
	description = "Stalo se tu poslední dobou něco zajímavého?";
};


func int DIA_Maleth_PROBLEME_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Maleth_PROBLEME_Info()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_15_00");	//Stalo se tu poslední dobou něco zajímavého?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_01");	//Sejdi dolů na cestu do města.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_02");	//Až se potkáš s černokabátníky, pak uvidíš, co je nového.
	Info_ClearChoices(DIA_Maleth_PROBLEME);
	Info_AddChoice(DIA_Maleth_PROBLEME,Dialog_Back,DIA_Maleth_PROBLEME_Back);
	Info_AddChoice(DIA_Maleth_PROBLEME,"Jak se mají ovečky?",DIA_Maleth_PROBLEME_schafe);
	Info_AddChoice(DIA_Maleth_PROBLEME,"Už tě ty černé kápě navštívily?",DIA_Maleth_PROBLEME_beidir);
};

func void DIA_Maleth_PROBLEME_beidir()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_beidir_15_00");	//Už tě ty černé kápě navštívily?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_beidir_08_01");	//Jo. Zůstaly tu několik dní. Jestli to chceš vědět, tak přišly rovnou z pekel.
};

func void DIA_Maleth_PROBLEME_schafe()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_15_00");	//Jak se mají ovečky?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_08_01");	//(vztekle) Jako by tě to vůbec zajímalo. Máš jiné problémy.
	Info_AddChoice(DIA_Maleth_PROBLEME,"Problémy? Co ty o tom víš?",DIA_Maleth_PROBLEME_schafe_probleme);
};

func void DIA_Maleth_PROBLEME_schafe_probleme()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_15_00");	//Problémy? Co ty o tom víš?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_01");	//(stroze) Patříš k městským strážím, ne? Tak s těma bastardama v černých kápích něco udělej.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_02");	//(vztekle) Vy zatracený žoldáci myslíte jen na jedinou věc: jak z ostatních dostat co nejvíc peněz do vlastní kapsy.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_03");	//Vy, vznešení pánové z kláštera, byste měli s těmi postavami v kápích něco dělat!
	};
	if(hero.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_04");	//Vy, kněží Adana, byste měli proti těm černokabátníkům něco podniknout!
	};
	if(hero.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_05");	//Odkdy se vy, mágové Temnoty, zajímáte o problémy ostatních?
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_06");	//Kdybyste tam u vás v Bratrstvu jen nehulili a něco dělali. No, tady máš příležitost...
	};
	Info_ClearChoices(DIA_Maleth_PROBLEME);
	Info_AddChoice(DIA_Maleth_PROBLEME,Dialog_Back,DIA_Maleth_PROBLEME_Back);
	Info_AddChoice(DIA_Maleth_PROBLEME,"Hej, dávej si bacha na pusu.",DIA_Maleth_PROBLEME_schafe_probleme_drohen);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(DIA_Maleth_PROBLEME,"Co máš za problém?",DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag);
	};
};

func void DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00");	//Co máš za problém?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01");	//Určitě za to může ta Vinova domácí černá pálenka, co mi před několika týdny vnutil.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02");	//Nemůžu si na nic vzpomenout, chlape. Jenom vím, že se mi ztratila moje vycházková hůl!
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03");	//A to je důvod, proč děláš takový povyk?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04");	//Tobě se to řekne, tvoje nebyla.
	Log_CreateTopic(TOPIC_MalethsGehstock,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MalethsGehstock,LOG_Running);
	B_LogEntry(TOPIC_MalethsGehstock,"Maleth se někde ožral jak dělo a ztratil přitom vycházkovou hůl. Jak ho znám, nikdy se z Lobartova statku moc nevzdálil, takže ta hůl by se měla válet někde poblíž.");
	Info_ClearChoices(DIA_Maleth_PROBLEME);
};

func void DIA_Maleth_PROBLEME_schafe_probleme_drohen()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00");	//Hej, dávej si bacha na pusu.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01");	//Jediný, co dovedeš, jsou řeči. Nejlíp uděláš, když půjdeš pryč.
};

func void DIA_Maleth_PROBLEME_Back()
{
	Info_ClearChoices(DIA_Maleth_PROBLEME);
};


instance DIA_Maleth_GEHSTOCK(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 33;
	condition = DIA_Maleth_GEHSTOCK_Condition;
	information = DIA_Maleth_GEHSTOCK_Info;
	description = "Mám dojem, že tahle hůl patří tobě.";
};


func int DIA_Maleth_GEHSTOCK_Condition()
{
	if(Npc_HasItems(other,ItMw_MalethsGehstock_MIS) && Npc_KnowsInfo(other,DIA_Maleth_PROBLEME))
	{
		return TRUE;
	};
};

func void DIA_Maleth_GEHSTOCK_Info()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_00");	//Mám dojem, že tahle hůl patří tobě.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_01");	//To je ohromný. Já...
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_02");	//Tak moment. Nejdřív za ni zaplať.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_03");	//Ale... Moc toho nemám.
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_04");	//Pak bys raději měl něco rychle vymyslet.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_05");	//Dobrá. A co tohle? Včera jsem tu viděl běžet nějaký bandity s několika měšci zlata.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_06");	//Když ti řeknu, kam schovali svou kořist, vrátíš mi za to moji hůl?
	TOPIC_END_MalethsGehstock = TRUE;
	B_GivePlayerXP(XP_FoundMalethsGehstock);
	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
	Info_AddChoice(DIA_Maleth_GEHSTOCK,"Promiň, ale to mě nezajímá. Chci zlato.",DIA_Maleth_GEHSTOCK_gold);
	Info_AddChoice(DIA_Maleth_GEHSTOCK,"Fajn, tak mluv.",DIA_Maleth_GEHSTOCK_ok);
};

func void DIA_Maleth_GEHSTOCK_ok()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_ok_15_00");	//Fajn, tak mluv.
	B_GiveInvItems(other,self,ItMw_MalethsGehstock_MIS,1);
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_01");	//Fajn. Jdi odsud na západ do lesa. Najdeš tam strž.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_02");	//V tý jeskyni určitě něco bude.
	B_LogEntry(TOPIC_MalethsGehstock,"Maleth mi vyprávěl, že v lesích západně od Lobartova statku se nachází tábor banditů.");
	CreateInvItems(BDT_1024_MalethsBandit,ItMi_MalethsBanditGold,1);
	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
	AI_StopProcessInfos(self);
};

func void DIA_Maleth_GEHSTOCK_gold()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_gold_15_00");	//Promiň, ale to mě nezajímá. Chci zlato.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_gold_08_01");	//Tady je všechno, co mám. Mělo by to stačit.
	CreateInvItems(self,ItMi_Gold,35);
	B_GiveInvItems(self,other,ItMi_Gold,35);
	B_GiveInvItems(other,self,ItMw_MalethsGehstock_MIS,1);
	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
};


instance DIA_Maleth_PERM3(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 33;
	condition = DIA_Maleth_PERM3_Condition;
	information = DIA_Maleth_PERM3_Info;
	permanent = TRUE;
	description = "Nenech se vůbec rušit.";
};


func int DIA_Maleth_PERM3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Maleth_PROBLEME) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Maleth_PERM3_Info()
{
	AI_Output(other,self,"DIA_Maleth_PERM3_15_00");	//Nenech se vůbec rušit.
	AI_Output(self,other,"DIA_Maleth_PERM3_08_01");	//(rozčileně) Zmizni.
	AI_StopProcessInfos(self);
};


instance DIA_Maleth_KAP4_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_KAP4_EXIT_Condition;
	information = DIA_Maleth_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Maleth_KAP5_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_KAP5_EXIT_Condition;
	information = DIA_Maleth_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Maleth_KAP6_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_KAP6_EXIT_Condition;
	information = DIA_Maleth_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Maleth_PICKPOCKET(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 900;
	condition = DIA_Maleth_PICKPOCKET_Condition;
	information = DIA_Maleth_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Maleth_PICKPOCKET_Condition()
{
	return C_Beklauen(10,10);
};

func void DIA_Maleth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Maleth_PICKPOCKET);
	Info_AddChoice(DIA_Maleth_PICKPOCKET,Dialog_Back,DIA_Maleth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Maleth_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Maleth_PICKPOCKET_DoIt);
};

func void DIA_Maleth_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Maleth_PICKPOCKET);
};

func void DIA_Maleth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Maleth_PICKPOCKET);
};

