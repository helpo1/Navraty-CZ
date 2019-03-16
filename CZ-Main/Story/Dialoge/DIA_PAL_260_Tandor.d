
instance DIA_Tandor_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_EXIT_Condition;
	information = DIA_Tandor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Tandor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_Hallo(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 2;
	condition = DIA_Tandor_Hallo_Condition;
	information = DIA_Tandor_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Tandor_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Tandor_Hallo_Info()
{
	AI_Output(self,other,"DIA_Tandor_Hallo_08_00");	//Ty jsi prošel průsmykem? Dobrá práce. Ztratili jsme team mnoho dobrých chlapů.
	AI_Output(self,other,"DIA_Tandor_Hallo_08_01");	//Vím jaké to je. Doprovázel jsem průzkumnou jednotku.
	AI_Output(self,other,"DIA_Tandor_Hallo_08_02");	//Máš dobrou zbraň? Jestli ne, jsem tvůj člověk - pár jich tu mám.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"Tandor prodává zbraně na hradě.");
};


instance DIA_Tandor_Trupp(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 2;
	condition = DIA_Tandor_Trupp_Condition;
	information = DIA_Tandor_Trupp_Info;
	permanent = FALSE;
	description = "Co se stalo s tvou jednotkou?";
};


func int DIA_Tandor_Trupp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_Trupp_Info()
{
	AI_Output(other,self,"DIA_Tandor_Trupp_15_00");	//Co se stalo s tvou jednotkou?
	AI_Output(self,other,"DIA_Tandor_Trupp_08_01");	//Hledali jsme cesty kolem pobřeží a rozbili tábor v jeskyni.
	AI_Output(self,other,"DIA_Tandor_Trupp_08_02");	//Bylo pozdě v noci, když přišli skřeti. Vstoupily s loučemy do jeskyně a objevily nás.
	AI_Output(self,other,"DIA_Tandor_Trupp_08_03");	//Snažili jsme se utéci, ale mě jedinému se to podařilo...
	AI_Output(self,other,"DIA_Tandor_Trupp_08_04");	//Brzy po té skřeti vztyčili palisádu.
};


instance DIA_TANDOR_TRUPPFINDED(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 2;
	condition = dia_tandor_truppfinded_condition;
	information = dia_tandor_truppfinded_info;
	permanent = FALSE;
	description = "Našel jsem tvoji jednotku!";
};


func int dia_tandor_truppfinded_condition()
{
	if(SAYTOTANDORABOUTGROUP == TRUE)
	{
		return TRUE;
	};
};

func void dia_tandor_truppfinded_info()
{
	AI_Output(other,self,"DIA_Tandor_TruppFinded_15_00");	//Našel jsem tvoji jednotku. Jsou naživu! Albert tě pozdravuje.
	AI_Output(self,other,"DIA_Tandor_TruppFinded_08_01");	//Díky Innosovi! Znamená to, že přežili! Jaké šťastné zprávy!
	AI_Output(self,other,"DIA_Tandor_TruppFinded_08_02");	//Kde jsou teď?
	AI_Output(other,self,"DIA_Tandor_TruppFinded_15_03");	//Za skřetí palisádou v jeskyni.
	AI_Output(other,self,"DIA_Tandor_TruppFinded_15_04");	//Jsou v bezpečí, ale cesta na hrad by bezpečná nebyla.
	AI_Output(self,other,"DIA_Tandor_TruppFinded_08_05");	//No, alespoň, že jsou v pořádku. Mam ještě šanci, že se znova shledáme.
	AI_Output(self,other,"DIA_Tandor_TruppFinded_08_06");	//Děkuji ti, moc to pro mě znamená.
	B_GivePlayerXP(XP_Ambient * 2);
};


instance DIA_Tandor_Trade(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 900;
	condition = DIA_Tandor_Trade_Condition;
	information = DIA_Tandor_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Tandor_Trade_Condition()
{
	return TRUE;
};

func void DIA_Tandor_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Tandor_Trade_15_00");	//Ukaž mi své zboží.
	B_GiveTradeInv(self);
};


instance DIA_Tandor_Equipment(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 3;
	condition = DIA_Tandor_Equipment_Condition;
	information = DIA_Tandor_Equipment_Info;
	description = "Posílá mě Garond - potřebuji zbraň.";
};


func int DIA_Tandor_Equipment_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Garond_Equipment) && (other.guild == GIL_MIL) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Tandor_Equipment_Info()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_15_00");	//Posílá mě Garond - potřebuji zbraň. 
	AI_Output(self,other,"DIA_Tandor_Equipment_08_01");	//Boj na blízko, nebo na dálku?
	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment,"Na blízko.",DIA_Tandor_Equipment_Nah);
	Info_AddChoice(DIA_Tandor_Equipment,"Na dálku.",DIA_Tandor_Equipment_Fern);
};

func void DIA_Tandor_Equipment_Nah()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Nah_15_00");	//Boj na blízko.
	AI_Output(self,other,"DIA_Tandor_Equipment_Nah_08_01");	//Jednoruční, nebo obouruční?
	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment,"Jednoruční.",DIA_Tandor_Equipment_Ein);
	Info_AddChoice(DIA_Tandor_Equipment,"Obouruční.",DIA_Tandor_Equipment_Zwei);
};

func void DIA_Tandor_Equipment_Fern()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Fern_15_00");	//Boj na dálku.
	AI_Output(self,other,"DIA_Tandor_Equipment_Fern_08_01");	//Luk nebo kuše?
	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment,"Luk.",DIA_Tandor_Equipment_Bow);
	Info_AddChoice(DIA_Tandor_Equipment,"Kuše.",DIA_Tandor_Equipment_Crossbow);
};

func void DIA_Tandor_Equipment_Ein()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Ein_15_00");	//Jednoruční.
	AI_Output(self,other,"DIA_Tandor_Equipment_Ein_08_01");	//Tady máš. Je to velmi dobrá zbraň.
	B_GiveInvItems(self,other,ItMw_Steinbrecher,1);
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Zwei()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Zwei_15_00");	//Obouruční.
	AI_Output(self,other,"DIA_Tandor_Equipment_Zwei_08_01");	//Tenhle obouručák se ti bude líbit.
	B_GiveInvItems(self,other,ItMw_Zweihaender1,1);
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Bow()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Bow_15_00");	//Luk.
	AI_Output(self,other,"DIA_Tandor_Equipment_Bow_08_01");	//Tenhle luk je přesně pro tebe. Dám ti i nějaké šípy.
	B_GiveInvItems(self,other,ItRw_Bow_L_03,1);
	B_GiveInvItems(self,other,ItRw_Arrow,50);
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Crossbow()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Crossbow_15_00");	//Kuši.
	AI_Output(self,other,"DIA_Tandor_Equipment_Crossbow_08_01");	//Tak si vem tuto lehkou kuši. Šipky jsou součástí.
	B_GiveInvItems(self,other,ItRw_Crossbow_L_02,1);
	B_GiveInvItems(self,other,ItRw_Bolt,10);
	Info_ClearChoices(DIA_Tandor_Equipment);
};


instance DIA_Tandor_KAP3_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP3_EXIT_Condition;
	information = DIA_Tandor_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_KAP4_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP4_EXIT_Condition;
	information = DIA_Tandor_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_News(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 40;
	condition = DIA_Tandor_News_Condition;
	information = DIA_Tandor_News_Info;
	permanent = TRUE;
	description = "Nějaké novinky?";
};


func int DIA_Tandor_News_Condition()
{
	if((Kapitel == 4) && Npc_KnowsInfo(hero,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_News_Info()
{
	AI_Output(other,self,"DIA_Tandor_News_15_00");	//Nějaké novinky?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Tandor_News_08_01");	//Jediná zajímavá věc je, že sem přitáhli drakobijci...
	}
	else
	{
		AI_Output(self,other,"DIA_Tandor_News_08_02");	//Drakobijci už přišli i na hrad.
		AI_Output(self,other,"DIA_Tandor_News_08_03");	//Vypadá to, že to jsou silní bastardi. Doufám, že to je pravda, jinak nemají šanci přežít.
	};
};


instance DIA_Tandor_KAP5_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP5_EXIT_Condition;
	information = DIA_Tandor_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_WASISTLOS(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 51;
	condition = DIA_Tandor_WASISTLOS_Condition;
	information = DIA_Tandor_WASISTLOS_Info;
	permanent = TRUE;
	description = "Co tě trápí?";
};


func int DIA_Tandor_WASISTLOS_Condition()
{
	if((Kapitel == 5) && Npc_KnowsInfo(hero,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_WASISTLOS_Info()
{
	AI_Output(other,self,"DIA_Tandor_WASISTLOS_15_00");	//Co tě trápí?
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Tandor_WASISTLOS_08_01");	//Až přijdou skřeti všechny nás zabijí.
	}
	else
	{
		AI_Output(self,other,"DIA_Tandor_WASISTLOS_08_02");	//Potravinové zásoby docházejí. Hladovíme.
	};
};


instance DIA_Tandor_KAP6_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP6_EXIT_Condition;
	information = DIA_Tandor_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_PICKPOCKET(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 900;
	condition = DIA_Tandor_PICKPOCKET_Condition;
	information = DIA_Tandor_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Tandor_PICKPOCKET_Condition()
{
	return C_Beklauen(47,90);
};

func void DIA_Tandor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
	Info_AddChoice(DIA_Tandor_PICKPOCKET,Dialog_Back,DIA_Tandor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Tandor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Tandor_PICKPOCKET_DoIt);
};

func void DIA_Tandor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
};

func void DIA_Tandor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
};

