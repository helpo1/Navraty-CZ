
instance DIA_Addon_Garaz_EXIT(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 999;
	condition = DIA_Addon_Garaz_EXIT_Condition;
	information = DIA_Addon_Garaz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Garaz_PICKPOCKET(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 900;
	condition = DIA_Addon_Garaz_PICKPOCKET_Condition;
	information = DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	return C_Beklauen(66,80);
};

func void DIA_Addon_Garaz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Garaz_PICKPOCKET,Dialog_Back,DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Garaz_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
};

func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
};


instance DIA_Addon_Garaz_Probleme(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 2;
	condition = DIA_Addon_Garaz_Probleme_Condition;
	information = DIA_Addon_Garaz_Probleme_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Probleme_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_00");	//Počkej chvilku.
	AI_Output(other,self,"DIA_Addon_Garaz_Probleme_15_01");	//Něco není v pořádku?
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_02");	//Důlní červi. Spousta důlních červů. Prokopali jsme se k jejich hnízdu.
};


instance DIA_Addon_Garaz_Hi(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Hi_Condition;
	information = DIA_Addon_Garaz_Hi_Info;
	permanent = FALSE;
	description = "Proč na ně nezaútočíme?";
};


func int DIA_Addon_Garaz_Hi_Condition()
{
	if((BLOODWYNISDEAD == FALSE) && (Minecrawler_Killed < 9))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_00");	//Proč na ně nezaútočíme?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_01");	//Taky jsem se ptal. Ale stráže mají prý na práci mnohem 'důležitější věci'.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_02");	//Bloodwyn pověřil me, abych to vyřešil sám.
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_03");	//Předpokládám, že nemáš v plánu červy přepadnout.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_04");	//Proč bych to měl delat? Abychom získali zlato, co je v té jeskyni?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_05");	//Bloodwyn by si většinu z toho vzal stejně pro sebe. A pro tu trošku, co by zbyla, nehodlám riskovat krk.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_06");	//Pokud chceš TY zaútočit na ty červy, nebudu ti v tom bránit. Jenom je sem všechny nepřilákej, jasný?
};


instance DIA_Addon_Garaz_Bloodwyn(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 8;
	condition = DIA_Addon_Garaz_Bloodwyn_Condition;
	information = DIA_Addon_Garaz_Bloodwyn_Info;
	permanent = FALSE;
	description = "Můžeš mi říct ještě neco o Bloodwynovi?";
};


func int DIA_Addon_Garaz_Bloodwyn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Garaz_Hi) && (Minecrawler_Killed < 9) && (BLOODWYNISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_00");	//Můžeš mi říct ještě něco o Bloodwynovi?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_01");	//Jo. Ten bastard prahne po zlatě. Kontroluje každou žílu a každý nuget.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_02");	//Pokud jde o zlato, je schopen zajít jakkoli daleko. Ale zase pro něj nejsme úplný hovna.
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_03");	//A jinak?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_04");	//Myslí si, že je ze všech nejlepší a neunese, když je někdo lepší než on. No, já bych proti nemu stejně asi radši nešel.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_05");	//Prostě mu nestůj v cestě a neprovokuj ho. Pokud ho teda nechceš totálne naštvat, aby se přestal kontrolovat...
	B_LogEntry(Topic_Addon_Tempel,"Bloodwyn určitě vyleze z chrámu, pokud zjistí, že se v dole našla nová zlatá žíla.");
	B_LogEntry(Topic_Addon_Tempel,"Pokud Bloodwyna rozzuřím, ztratí sám nad sebou kontrolu. Toho by šlo využít.");
};


instance DIA_Addon_Garaz_Sieg(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Sieg_Condition;
	information = DIA_Addon_Garaz_Sieg_Info;
	permanent = FALSE;
	description = "Tak a je to. Červi jsou mrtví.";
};


func int DIA_Addon_Garaz_Sieg_Condition()
{
	if((Minecrawler_Killed >= 9) && (BLOODWYNISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Sieg_15_00");	//Tak a je to. Červi jsou mrtví.
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_01");	//Bloodwyn už je na cestě. To jsi přece chtel, že ano?
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_02");	//Chci říct, červy jsi pobil jen kvůli tomu, aby se Bloodwyn přišel. Takže ať máš v plánu cokoliv, udělej to teď!
	B_StartOtherRoutine(Bloodwyn,"GOLD");
};


instance DIA_Addon_Garaz_Blood(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Blood_Condition;
	information = DIA_Addon_Garaz_Blood_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Blood_Condition()
{
	if((BLOODWYNISDEAD == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Blood_Info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_00");	//Sakra, tys tomu parchantovi teda ukázal! Dobrá práce, chlape!
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_01");	//Myslím, že si půjdu prohlédnout tu jeskyni.
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GOLD");
	B_StartOtherRoutine(Thorus,"TALK");
};


instance DIA_Addon_Garaz_Gold(C_Info)
{
	npc = BDT_10024_Addon_Garaz;
	nr = 3;
	condition = DIA_Addon_Garaz_Gold_Condition;
	information = DIA_Addon_Garaz_Gold_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Garaz_Gold_Condition()
{
	if((Npc_GetDistToWP(self,"ADW_MINE_MC_GARAZ") <= 500) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Gold_Info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_00");	//Sakra, chlape, tady je ale zlata!
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_01");	//Ale abychom se dostali k těm hroudám nahoře, potřebovali bychom žebřík.
};