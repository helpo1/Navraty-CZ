
instance DIA_Agon_EXIT(C_Info)
{
	npc = NOV_603_Agon;
	nr = 999;
	condition = DIA_Agon_EXIT_Condition;
	information = DIA_Agon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Agon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Agon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Agon_Hello(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Hello_Condition;
	information = DIA_Agon_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Agon_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_Hello_Info()
{
	AI_Output(self,other,"DIA_Agon_Hello_07_00");	//Co potřebuješ?
};


instance DIA_Agon_Wurst(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Wurst_Condition;
	information = DIA_Agon_Wurst_Info;
	permanent = FALSE;
	description = "Mám tu pro tebe jehněčí klobásu.";
};

func int DIA_Agon_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Agon_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Agon_Wurst_15_00");	//Mám tu pro tebe jehněčí klobásu.
	AI_Output(self,other,"DIA_Agon_Wurst_07_01");	//Ovčí klobása, ovčí sýr... I ovčí mléko. Už je mi zle ze všech ovcí.
	AI_Output(other,self,"DIA_Agon_Wurst_15_02");	//Chceš ji nebo ne?
	AI_Output(self,other,"DIA_Agon_Wurst_07_03");	//Jasně, dej to sem!
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};

instance DIA_Agon_New(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_New_Condition;
	information = DIA_Agon_New_Info;
	permanent = FALSE;
	description = "Jsem tu nový.";
};

func int DIA_Agon_New_Condition()
{
	if((MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_New_Info()
{
	AI_Output(other,self,"DIA_Agon_New_15_00");	//Jsem tu nový.
	AI_Output(self,other,"DIA_Agon_New_07_01");	//Vidím.
	AI_Output(self,other,"DIA_Agon_New_07_02");	//Pokud ještě nemáš žádnou práci, zajdi za Parlanem. Něco ti přidělí.
};


instance DIA_Agon_YouAndBabo(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_YouAndBabo_Condition;
	information = DIA_Agon_YouAndBabo_Info;
	permanent = FALSE;
	description = "Co máš za problém s Babem?";
};


func int DIA_Agon_YouAndBabo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Agon_YouAndBabo_Info()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_15_00");	//Co máš za problém s Babem?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_01");	//Neměl bys věřit všemu, co slyšíš.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_02");	//Pojďme si něco ujasnit: Budu dělat to, co uznám za vhodné. Tak, jak mi předurčil Innos.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_03");	//Nechci nikomu stát v cestě. Už vůbec ne tomu prosťáčkovi.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
	Info_AddChoice(DIA_Agon_YouAndBabo,"Neměli by novicové stát při sobě?",DIA_Agon_YouAndBabo_AllTogether);
	Info_AddChoice(DIA_Agon_YouAndBabo,"Jen Innos ví, jakou cestou bychom měli jít.",DIA_Agon_YouAndBabo_InnosWay);
	Info_AddChoice(DIA_Agon_YouAndBabo,"Myslím, že spolu budeme vycházet.",DIA_Agon_YouAndBabo_Understand);
};

func void DIA_Agon_YouAndBabo_AllTogether()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_AllTogether_15_00");	//Neměli by novicové stát při sobě?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_01");	//Vy, ostatní, si stůjte při sobě jak chcete.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_02");	//Ale neplýtvejte mým časem a nelezte mi do cesty.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

func void DIA_Agon_YouAndBabo_InnosWay()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_InnosWay_15_00");	//Jen Innos ví, jakou cestou bychom měli jít.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_InnosWay_07_01");	//Má rodina se vždy těšila Innosově přízni a na tom se nic nezmění.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};

func void DIA_Agon_YouAndBabo_Understand()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_Understand_15_00");	//Myslím, že spolu budeme vycházet.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_Understand_07_01");	//Snad. Až se stanu mágem, utrousím za tebe slovo.
	Info_ClearChoices(DIA_Agon_YouAndBabo);
};


instance DIA_Agon_GetHerb(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GetHerb_Condition;
	information = DIA_Agon_GetHerb_Info;
	permanent = TRUE;
	description = "Co tu pěstujete?";
};


func int DIA_Agon_GetHerb_Condition()
{
	if(MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Agon_GetHerb_Info()
{
	AI_Output(other,self,"DIA_Agon_GetHerb_15_00");	//Co tu pěstujete?
	AI_Output(self,other,"DIA_Agon_GetHerb_07_01");	//Snažíme se pěstovat bylinky, aby mohl mistr Neoras připravovat lektvary.
};

instance DIA_Agon_GolemDead(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GolemDead_Condition;
	information = DIA_Agon_GolemDead_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Agon_GolemDead_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (Npc_IsDead(Magic_Golem) == TRUE) && (Npc_GetDistToWP(self,"NW_MAGECAVE_RUNE") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Agon_GolemDead_Info()
{
	AI_Output(self,other,"DIA_Agon_GolemDead_07_00");	//Jdeš pozdě!
	AI_Output(self,other,"DIA_Agon_GolemDead_07_01");	//Byl jsem tu první, vyhrál jsem!
	Info_ClearChoices(DIA_Agon_GolemDead);
	Info_AddChoice(DIA_Agon_GolemDead,"Pouze tehdy, jestli odsud odejdeš živý.",DIA_Agon_GolemDead_NoWay);
	Info_AddChoice(DIA_Agon_GolemDead,"Mlč!",DIA_Agon_GolemDead_ShutUp);
	Info_AddChoice(DIA_Agon_GolemDead,"Gratuluji, opravdu si to zasloužíš!",DIA_Agon_GolemDead_Congrat);
};

func void DIA_Agon_GolemDead_NoWay()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_NoWay_15_00");	//Pouze tehdy, jestli odsud odejdeš živý.
	AI_Output(self,other,"DIA_Agon_GolemDead_NoWay_07_01");	//Ty mě chceš zabít? Ty jsi to nepochopil.
	AI_StopProcessInfos(self);
	AgonCanFight = TRUE;
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Agon_GolemDead_ShutUp()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_15_00");	//Mlč!
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_01");	//Nemá to smysl, prohrál jsi! Smiř se s tím.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_02");	//Mě jedinému bylo souzeno, abych se stal mágem.
	Info_ClearChoices(DIA_Agon_GolemDead);
	Info_AddChoice(DIA_Agon_GolemDead,"Jdi k čertu!",DIA_Agon_GolemDead_ShutUp_MyChest);
	Info_AddChoice(DIA_Agon_GolemDead,"Vyhrál jsi.",DIA_Agon_GolemDead_ShutUp_YouWin);
};

func void DIA_Agon_GolemDead_ShutUp_MyChest()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_MyChest_15_00");	//Mlč, tohle je moje.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_MyChest_07_01");	//Ne, tohle nedělej, já tě zabiju!
	AI_StopProcessInfos(self);
	AgonCanFight = TRUE;
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Agon_GolemDead_ShutUp_YouWin()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00");	//Vyhrál jsi.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_01");	//Ne, ty mě nepřevezeš, snažíš se mě zbavit.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_02");	//To nedovolím!
	AI_StopProcessInfos(self);
	AgonCanFight = TRUE;
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Agon_GolemDead_Congrat()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_00");	//Gratuluji, opravdu si to zasloužíš.
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_01");	//Co tím myslíš? Co máš za lubem?
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_02");	//Co?
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_03");	//Chceš zpochybnit mé prvenství, chceš mě zabít a získat všechno pro sebe!
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_04");	//To se nestane!
	AI_StopProcessInfos(self);
	AgonCanFight = TRUE;
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Agon_GolemLives(C_Info)
{
	npc = NOV_603_Agon;
	nr = 1;
	condition = DIA_Agon_GolemLives_Condition;
	information = DIA_Agon_GolemLives_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Agon_GolemLives_Condition()
{
	if((MIS_SCHNITZELJAGD == LOG_Running) && (Npc_IsDead(Magic_Golem) == FALSE) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_02") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Agon_GolemLives_Info()
{
	AI_Output(self,other,"DIA_Agon_GolemLives_07_00");	//Ty jsi to našel přede mnou, to snad není pravda...
	AI_Output(self,other,"DIA_Agon_GolemLives_07_01");	//To není pravda, to nedovolím...
	AI_Output(self,other,"DIA_Agon_GolemLives_07_02");	//Tvé tělo nikdo nikdy nenajde.
	AI_StopProcessInfos(self);
	AgonCanFight = TRUE;
	B_Attack(self,other,AR_NONE,0);
};

instance DIA_Agon_Perm(C_Info)
{
	npc = NOV_603_Agon;
	nr = 2;
	condition = DIA_Agon_Perm_Condition;
	information = DIA_Agon_Perm_Info;
	permanent = TRUE;
	description = "Jak je?";
};

func int DIA_Agon_Perm_Condition()
{
	if((Kapitel >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Agon_Perm_Info()
{
	AI_Output(other,self,"DIA_Agon_Perm_15_00");	//Jak je?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_01");	//Och, díky za tvůj zájem, paladine. Jsem si jistý, že brzy budu mágem.
	}
	else
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_02");	//Jsi v klášteře Innose hostem. Chovej se podle toho a neruš mě při práci.
	};
};


instance DIA_Agon_PICKPOCKET(C_Info)
{
	npc = NOV_603_Agon;
	nr = 900;
	condition = DIA_Agon_PICKPOCKET_Condition;
	information = DIA_Agon_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Agon_PICKPOCKET_Condition()
{
	return C_Beklauen(23,12);
};

func void DIA_Agon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
	Info_AddChoice(DIA_Agon_PICKPOCKET,Dialog_Back,DIA_Agon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Agon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Agon_PICKPOCKET_DoIt);
};

func void DIA_Agon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
};

func void DIA_Agon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Agon_PICKPOCKET);
};

