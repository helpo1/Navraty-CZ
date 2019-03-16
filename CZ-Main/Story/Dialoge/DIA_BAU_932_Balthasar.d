
instance DIA_Balthasar_EXIT(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 999;
	condition = DIA_Balthasar_EXIT_Condition;
	information = DIA_Balthasar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Balthasar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Balthasar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Balthasar_HALLO(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 3;
	condition = DIA_Balthasar_HALLO_Condition;
	information = DIA_Balthasar_HALLO_Info;
	description = "Jak to jde?";
};


func int DIA_Balthasar_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Balthasar_HALLO_Info()
{
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_01");	//Á, nová tvář na farmě. Že by mi konečně ten starý skrblík obstaral učně?
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_02");	//Já nejsem učeň.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_03");	//Jasně. Rozumím. No, už nejsem tak mladý jako dřív, víš? Čekám spoustu let na to, až mě někdo nahradí.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_04");	//Nejsi tady proto, že by tě poslali naštvaní sousedi, nebo snad jo?
};


instance DIA_Balthasar_WASMACHSTDU(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 4;
	condition = DIA_Balthasar_WASMACHSTDU_Condition;
	information = DIA_Balthasar_WASMACHSTDU_Info;
	description = "Co tu vlastně děláš?";
};


func int DIA_Balthasar_WASMACHSTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Balthasar_WASMACHSTDU_15_00");	//Co tu vlastně děláš?
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_01");	//Hlídám ovce. Hlídám ovce po celý svůj život.
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_02");	//Ovce jako zvířata jsou velmi poslušné a inteligentní. Pokud se k nim budeš chovat hezky, budou tě následovat kamkoli.
};


instance DIA_Addon_Balthasar_Rangerbandits(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 5;
	condition = DIA_Addon_Balthasar_Rangerbandits_Condition;
	information = DIA_Addon_Balthasar_Rangerbandits_Info;
	description = "Neviděl jsi tu procházet nějaké bandity?";
};


func int DIA_Addon_Balthasar_Rangerbandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_HALLO) && ((MIS_Vatras_FindTheBanditTrader == LOG_Running) || (SC_KnowsLuciaCaughtByBandits == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Balthasar_Rangerbandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Balthasar_Rangerbandits_15_00");	//Neviděl jsi tu procházet nějaké bandity?
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_01");	//Viděl. Prošli okolo Sekobovy farmy a zmizeli někde na severu.
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_02");	//S sebou měli ohromné množství zbraní. Vypadalo to, jakoby chtěli vyhrát válku se skřety.
	};
	if(SC_KnowsLuciaCaughtByBandits == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_03");	//Jestli mě mé oči nešálily, vedli s sebou do lesa nějakou ženu.
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_04");	//Doufám, že jí nic neprovedli.
	};
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_05");	//Díky bohu, že nešli k nám na farmu.
};


instance DIA_Balthasar_AERGERMITNACHBARN(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 5;
	condition = DIA_Balthasar_AERGERMITNACHBARN_Condition;
	information = DIA_Balthasar_AERGERMITNACHBARN_Info;
	description = "Co máš za problémy se sousedy?";
};


func int DIA_Balthasar_AERGERMITNACHBARN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_WASMACHSTDU) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(BalthasarSheep1) == FALSE) || (Npc_IsDead(BalthasarSheep2) == FALSE) || (Npc_IsDead(BalthasarSheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_AERGERMITNACHBARN_Info()
{
	AI_Output(other,self,"DIA_Balthasar_AERGERMITNACHBARN_15_00");	//Co máš za problémy se sousedy?
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_01");	//Tráva na této části velkého pole je stará a chudá. Proto často pasu ovce na jiných velkých pastvinách ostatních farem.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_02");	//Onarovi to nevadí, ale Bengar, majitel farmy položené na náhorní pastvině, prská pokaždé, když tam vidí moje ovce.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_03");	//Říkal, že Sekob bude muset platit, pokud bude chtít pást ovce na jeho pastvinách.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_04");	//Ale Sekob by se radši sám zadávil, než někomu platit, tak už na jeho pastviny nechodím.
};


instance DIA_Balthasar_WOBENGAR(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 10;
	condition = DIA_Balthasar_WOBENGAR_Condition;
	information = DIA_Balthasar_WOBENGAR_Info;
	description = "Jak bych se mohl dostat na Bengarovu farmu?";
};


func int DIA_Balthasar_WOBENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_AERGERMITNACHBARN) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_WOBENGAR_Info()
{
	AI_Output(other,self,"DIA_Balthasar_WOBENGAR_15_00");	//Jak bych se mohl dostat na Bengarovu farmu?
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_01");	//Jdi po této cestě až na křižovatku.
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_02");	//Pak se vydej doprava a uvidíš velkou skálu. Za ní napravo uvidíš pastviny a průsmyk.
};


instance DIA_Balthasar_TALKTOBENGAR(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 6;
	condition = DIA_Balthasar_TALKTOBENGAR_Condition;
	information = DIA_Balthasar_TALKTOBENGAR_Info;
	description = "Možná bych si mohl s Bengarem promluvit.";
};


func int DIA_Balthasar_TALKTOBENGAR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_AERGERMITNACHBARN) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(BalthasarSheep1) == FALSE) || (Npc_IsDead(BalthasarSheep2) == FALSE) || (Npc_IsDead(BalthasarSheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_TALKTOBENGAR_Info()
{
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_00");	//Možná bych si mohl s Bengarem promluvit.
	AI_Output(self,other,"DIA_Balthasar_TALKTOBENGAR_05_01");	//Ty bys to pro mě udělal? Ale cokoli mu řekneš, měj na paměti, nechci žádné potíže, rozumíš?
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_02");	//Uvidíme.
	Log_CreateTopic(TOPIC_BalthasarsSchafe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BalthasarsSchafe,LOG_Running);
	B_LogEntry(TOPIC_BalthasarsSchafe,"Farmář Bengar zakázal pastevci Balthasarovi pást ovce na náhorní pastvině.");
	MIS_Balthasar_BengarsWeide = LOG_Running;
};


instance DIA_Balthasar_BENGARUEBERREDET(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 8;
	condition = DIA_Balthasar_BENGARUEBERREDET_Condition;
	information = DIA_Balthasar_BENGARUEBERREDET_Info;
	description = "Můžeš zase vodit své ovce na Bengarovy pastviny.";
};


func int DIA_Balthasar_BENGARUEBERREDET_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_TALKTOBENGAR) && (MIS_Balthasar_BengarsWeide == LOG_SUCCESS) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(BalthasarSheep1) == FALSE) || (Npc_IsDead(BalthasarSheep2) == FALSE) || (Npc_IsDead(BalthasarSheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_BENGARUEBERREDET_Info()
{
	AI_Output(other,self,"DIA_Balthasar_BENGARUEBERREDET_15_00");	//Můžeš zase vodit své ovce na Bengarovy pastviny. Mluvil jsem s ním.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_01");	//Děkuji. Hned tam vyrazím.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_02");	//Tady, vezmi si tyto ovčí kůže jako projev mé vděčnosti.
	B_GiveInvItems(self,other,ItAt_SheepFur,10);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"BengarsWeide");
	B_GivePlayerXP(XP_Balthasar_BengarsWeide);
	Wld_InsertNpc(Sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(Sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(Hammel,"NW_BIGMILL_FARM3_BALTHASAR");
	BalthasarSheep1 = Hlp_GetNpc(Balthasar_Sheep1);
	if(Hlp_IsValidNpc(BalthasarSheep1) && !Npc_IsDead(BalthasarSheep1))
	{
		AI_StartState(BalthasarSheep1,ZS_MM_Rtn_Follow_Sheep_Balthasar,1,"");
	};
	BalthasarSheep2 = Hlp_GetNpc(Balthasar_Sheep2);
	if(Hlp_IsValidNpc(BalthasarSheep2) && !Npc_IsDead(BalthasarSheep2))
	{
		AI_StartState(BalthasarSheep2,ZS_MM_Rtn_Follow_Sheep_Balthasar,1,"");
	};
	BalthasarSheep3 = Hlp_GetNpc(Balthasar_Sheep3);
	if(Hlp_IsValidNpc(BalthasarSheep3) && !Npc_IsDead(BalthasarSheep3))
	{
		AI_StartState(BalthasarSheep3,ZS_MM_Rtn_Follow_Sheep_Balthasar,1,"");
	};
	BALTHASARGOBENGAR = TRUE;
};

instance DIA_Balthasar_PERMKAP1(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 70;
	condition = DIA_Balthasar_PERMKAP1_Condition;
	information = DIA_Balthasar_PERMKAP1_Info;
	permanent = TRUE;
	description = "Vše v pořádku?";
};

func int DIA_Balthasar_PERMKAP1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Balthasar_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Balthasar_PERMKAP1_Info()
{
	AI_Output(other,self,"DIA_Balthasar_PERMKAP1_15_00");	//Vše v pořádku?
	Npc_PerceiveAll(self);
	if((Wld_DetectNpc(self,Balthasar_Sheep1,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,Balthasar_Sheep2,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,Balthasar_Sheep3,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,Sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,Hammel,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)))
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_01");	//Nemám si na co stěžovat, díky za optání.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_02");	//Zlé časy nastaly. Nemůžu najít svoje ovce!
		if(Npc_IsDead(Sekob) == FALSE)
		{
			AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_03");	//Myslím, že bude lepší když půjdu za Sekobem a přiznám se.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_Balthasar_PICKPOCKET(C_Info)
{
	npc = BAU_932_Balthasar;
	nr = 900;
	condition = DIA_Balthasar_PICKPOCKET_Condition;
	information = DIA_Balthasar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Balthasar_PICKPOCKET_Condition()
{
	return C_Beklauen(10,10);
};

func void DIA_Balthasar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
	Info_AddChoice(DIA_Balthasar_PICKPOCKET,Dialog_Back,DIA_Balthasar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Balthasar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Balthasar_PICKPOCKET_DoIt);
};

func void DIA_Balthasar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
};

func void DIA_Balthasar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Balthasar_PICKPOCKET);
};

