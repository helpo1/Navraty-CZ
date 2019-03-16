
instance DIA_CAMPER01_EXIT(C_Info)
{
	npc = xbs_7501_camper;
	nr = 999;
	condition = dia_camper01_exit_condition;
	information = dia_camper01_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_camper01_exit_condition()
{
	return TRUE;
};

func void dia_camper01_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CAMPER01_PICKPOCKET(C_Info)
{
	npc = xbs_7501_camper;
	nr = 900;
	condition = dia_camper01_pickpocket_condition;
	information = dia_camper01_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_camper01_pickpocket_condition()
{
	return C_Beklauen(25,30);
};

func void dia_camper01_pickpocket_info()
{
	Info_ClearChoices(dia_camper01_pickpocket);
	Info_AddChoice(dia_camper01_pickpocket,Dialog_Back,dia_camper01_pickpocket_back);
	Info_AddChoice(dia_camper01_pickpocket,DIALOG_PICKPOCKET,dia_camper01_pickpocket_doit);
};

func void dia_camper01_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_camper01_pickpocket);
};

func void dia_camper01_pickpocket_back()
{
	Info_ClearChoices(dia_camper01_pickpocket);
};


instance DIA_CAMPER01_HALLO(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_hallo_condition;
	information = dia_camper01_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_camper01_hallo_condition()
{
	if((Npc_GetDistToWP(self,"WP_COAST_WAY05") < 1000) && (Npc_RefuseTalk(self) == FALSE) && (CAMPER_7501_TALK == FALSE))
	{
		return TRUE;
	};
};

func void dia_camper01_hallo_info()
{
	AI_Output(self,other,"DIA_Camper01_Hallo_01_00");	//Chlape, míříš do bažin?!
	AI_Output(other,self,"DIA_Camper01_Hallo_01_01");	//Možná, proč?!
	AI_Output(self,other,"DIA_Camper01_Hallo_01_02");	//Tam bys teď chodit neměl, je to tam nebezpečné.
	AI_Output(self,other,"DIA_Camper01_Hallo_01_04");	//Divní lidé v temných hávech... (nervózně) Měl bys se od nich držet daleko, jsou cítit smrtí!
	AI_Output(self,other,"DIA_Camper01_Hallo_01_05");	//Bažiny jsou teď místem jen pro ně a ještěry.
	AI_Output(other,self,"DIA_Camper01_Hallo_01_07");	//A co se stalo s obyvately tábora?
	AI_Output(self,other,"DIA_Camper01_Hallo_01_08");	//Eh... Hodně se jich ztratilo a pomátlo!
	AI_Output(self,other,"DIA_Camper01_Hallo_01_09");	//Nicméně jsem slyšel, že hodně se jich dostalo z údolí a jsou naživu.
	AI_Output(self,other,"DIA_Camper01_Hallo_01_10");	//No, ale všichni neměli to štěstí a ostatní, jako já, jsme museli zůstat na jiném místě.
	AI_Output(self,other,"DIA_Camper01_Hallo_01_12");	//Nyní je naším novým útočištěm ruina jednoho starého kláštera!
	AI_Output(other,self,"DIA_Camper01_Hallo_01_14");	//Kdo je váš vůdce?
	AI_Output(self,other,"DIA_Camper01_Hallo_01_15");	//Netbek - nyní je Guru Bratrstva.
	AI_Output(other,self,"DIA_Camper01_Hallo_01_16");	//Počkej, to je ten chlap, co mluví se stromy?!
	AI_Output(self,other,"DIA_Camper01_Hallo_01_17");	//Ano, to je on, odkud ho znáš?
	AI_Output(other,self,"DIA_Camper01_Hallo_01_18");	//No, kdysi jsem ho potkal...
	AI_Output(self,other,"DIA_Camper01_Hallo_01_19");	//Snad tě nesledovali skřeti!... (vážně)
	AI_Output(self,other,"DIA_Camper01_Hallo_01_21");	//Pokud ano, bylo by to pro nás těžké.
	AI_Output(self,other,"DIA_Camper01_Hallo_01_22");	//Pomocí magie odsud Netbek vyhnal skřety a nechal vyrůst stromy!
	AI_Output(other,self,"DIA_Camper01_Hallo_01_23");	//Cože? Opravdu tu nejsou ta zelenokožá stvoření?!
	AI_Output(self,other,"DIA_Camper01_Hallo_01_24");	//Je jich spousta, ale do lesa se bojí!
	AI_Output(self,other,"DIA_Camper01_Hallo_01_25");	//Takže zatím je tu klid!
	AI_Output(self,other,"DIA_Camper01_Hallo_01_26");	//Mimochodem, pokud chceš - můžu ti ukázat cestu do tábora.
	Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
	B_LogEntry(TOPIC_XBS,"Část Bratrstva Spáče přebývá nyní v ruinách starého kláštera.");
	Info_ClearChoices(dia_camper01_hallo);
	Info_AddChoice(dia_camper01_hallo,"Jasně, jdeme.",dia_camper01_hallo_gobase);
	Info_AddChoice(dia_camper01_hallo,"To není nutné! Já to nějak najdu.",dia_camper01_hallo_nobase);
};

func void dia_camper01_hallo_nobase()
{
	AI_Output(other,self,"DIA_Camper01_Hallo_NoBase_15_01");	//To není nutné! Já to nějak najdu.
	AI_Output(self,other,"DIA_Camper01_Hallo_NoBase_01_01");	//Dobrá.
	AI_StopProcessInfos(self);
	CAMPER_7501_TALK = TRUE;
};

func void dia_camper01_hallo_gobase()
{
	AI_Output(other,self,"DIA_Camper01_Hallo_GoBase_15_01");	//Jasně, jdeme.
	AI_Output(self,other,"DIA_Camper01_Hallo_GoBase_01_01");	//Drž se u mě.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDETOCAMP");
	CAMPER_7501_TALK = FALSE;
};


instance DIA_CAMPER01_ARRIVEDBASE(C_Info)
{
	npc = xbs_7501_camper;
	nr = 1;
	condition = dia_camper01_arrivedbase_condition;
	information = dia_camper01_arrivedbase_info;
	important = TRUE;
};


func int dia_camper01_arrivedbase_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_COAST_BASE_04") && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_camper01_arrivedbase_info()
{
	AI_Output(self,other,"DIA_Camper01_ArrivedBase_01_00");	//A jsme tu!
	AI_Output(self,other,"DIA_Camper01_ArrivedBase_01_01");	//Zde se můžeš cítit bezpečně.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.flags = 0;
	Npc_ExchangeRoutine(self,"STAYINCAMP");
	b_heroknowforestbase();
	Wld_InsertNpc(DragonSnapper,"WP_COAST_FOREST_106");
};


instance DIA_CAMPER01_HALLO2(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_hallo2_condition;
	information = dia_camper01_hallo2_info;
	permanent = TRUE;
	description = "Chci pryč z tábora.";
};


func int dia_camper01_hallo2_condition()
{
	if((Hlp_StrCmp(Npc_GetNearestWP(self),"WP_COAST_WAY05") == TRUE) && (CAMPER_7501_TALK == TRUE))
	{
		return TRUE;
	};
};

func void dia_camper01_hallo2_info()
{
	AI_Output(other,self,"DIA_Camper01_Hallo2_01_00");	//Chci pryč z tábora.
	AI_Output(self,other,"DIA_Camper01_Hallo2_01_01");	//Jsi si jistý?
	Info_ClearChoices(dia_camper01_hallo2);
	Info_AddChoice(dia_camper01_hallo2,"Ale ne.",dia_camper01_hallo_nobase);
	Info_AddChoice(dia_camper01_hallo2,"Ano, jdeme.",dia_camper01_hallo_gobase);
};


var int camper01aboutcook;

instance DIA_CAMPER01_BASERUMORS_RUMORS(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_baserumors_rumors_condition;
	information = dia_camper01_baserumors_rumors_info;
	permanent = TRUE;
	description = "Co nového v táboře?";
};


func int dia_camper01_baserumors_rumors_condition()
{
	if(Npc_GetDistToWP(self,"WP_COAST_BASE_23") <= 3000)
	{
		return TRUE;
	};
};

func void dia_camper01_baserumors_rumors_info()
{
	b_heroknowforestbase();
	AI_Output(other,self,"DIA_Camper01_BaseRumors_Rumors_01_00");	//Co nového v táboře?

	if((MIS_OCCOOKFLEE == LOG_SUCCESS) && (CAMPER01ABOUTCOOK == FALSE))
	{
		CAMPER01ABOUTCOOK = TRUE;
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_01");	//Hlavní novinka - nový člověk v táboře!
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_02");	//Jinak je vše jako obvykle.
	};
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_03");	//Bylo zajímavé pozorovat draky útočící na hrad.
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_04");	//Je jasné, že příště padne...
		COAST_WASINKAPITEL1 = TRUE;
	}
	else if(Kapitel == 2)
	{
		if(COAST_WASINKAPITEL1 == TRUE)
		{
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_05");	//Pokračujeme v pozorování draků.
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_06");	//Jeden zkoušel podpálit les, ale uletěl.
		}
		else
		{
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_07");	//Bylo zajímavé pozorovat draky útočící na hrad.
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_08");	//Je jasné, že příště padne.
		};
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_09");	//Na pobřeží a v lesích byli spatřeni muži v černých hávech.
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_10");	//Jen tak stojí a sledují okolí - kdysi prý byli členy Bratrstva...
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_11");	//Ale z nějakého důvodu se pomátli.
	}
	else if(Kapitel == 4)
	{
		if(MIS_AllDragonsDead == TRUE)
		{
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_12");	//Stále se mluví o dracích!
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_13");	//Chlapi jsou velmi rádi, že už je neohrožujou.
		}
		else if(MIS_KilledDragons > 0)
		{
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_14");	//Říká se, že to ty jsi zabil draky!
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_15");	//Ale někdo jiný zase tvrdí něco jiného.
		}
		else
		{
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_16");	//Říká se, že ke hradu míří další skřeti.
			AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_17");	//Cítím, že rozpoutají bouři!
		};
	}
	else if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_18");	//Skřeti ovládli hrad - nějaký debil jim otevřel bránu.
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_19");	//Nemáme paladiny v lásce, ale bojovali za dobrou věc!
	}
	else
	{
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_20");	//Nic nového, stejně jako dřív.
		AI_Output(self,other,"DIA_Camper01_BaseRumors_Rumors_01_21");	//Když tu létali draci, bylo to něco jiného.
	};
};


instance DIA_CAMPER01_ABOUTTRADE(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_abouttrade_condition;
	information = dia_camper01_abouttrade_info;
	permanent = FALSE;
	description = "Dá se někde v táboře obchodovat?";
};

func int dia_camper01_abouttrade_condition()
{
	if(Npc_GetDistToWP(self,"WP_COAST_BASE_23") <= 3000)
	{
		return TRUE;
	};
};

func void dia_camper01_abouttrade_info()
{
	AI_Output(other,self,"DIA_Camper01_AboutTRADE_15_00");	//Dá se někde v táboře obchodovat?
	AI_Output(self,other,"DIA_Camper01_AboutTRADE_01_01");	//Jasně! V lese jsem našel hodně věcí.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"V Netbekovým táboře se dá i obchodovat.");
};


instance DIA_CAMPER01_TRADE(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_trade_condition;
	information = dia_camper01_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};

func int dia_camper01_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_camper01_abouttrade) && Wld_IsTime(6,50,22,0))
	{
		return TRUE;
	};
};

func void dia_camper01_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Camper01_TRADE_15_00");	//Ukaž mi své zboží.
	AI_Output(self,other,"DIA_Camper01_TRADE_01_01");	//Vyber si.
	B_GiveTradeInv(self);
};


instance DIA_CAMPER01_DRAKAR(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_drakar_condition;
	information = dia_camper01_drakar_info;
	permanent = FALSE;
	description = "Co je to za loď na pobřeží?!";
};


func int dia_camper01_drakar_condition()
{
	if(Npc_GetDistToWP(self,"WP_COAST_BASE_23") <= 3000)
	{
		return TRUE;
	};
};

func void dia_camper01_drakar_info()
{
	AI_Output(other,self,"DIA_Camper01_Drakar_01_00");	//Co je to za loď na pobřeží?!
	AI_Output(self,other,"DIA_Camper01_Drakar_01_01");	//Bojový drakar skřetů, to jsi nevěděl?!
	AI_Output(self,other,"DIA_Camper01_Drakar_01_07");	//Pravidelně připlouvají z dalších jejich osad.
	AI_Output(other,self,"DIA_Camper01_Drakar_01_10");	//Jak často připlouvají nové skupiny?
	AI_Output(self,other,"DIA_Camper01_Drakar_01_11");	//To přesně nevím, ale jednou za čas loď zmizí a pak přiveze další skřety.
	AI_Output(self,other,"DIA_Camper01_Drakar_01_12");	//Doufám, že se nerozhodnou zničit náš tábor.
};


instance DIA_CAMPER01_DRAKAREXT(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_drakarext_condition;
	information = dia_camper01_drakarext_info;
	permanent = FALSE;
	description = "Proč tu nejsou královské lodě?";
};


func int dia_camper01_drakarext_condition()
{
	if(Npc_KnowsInfo(hero,dia_camper01_drakar))
	{
		return TRUE;
	};
};

func void dia_camper01_drakarext_info()
{
	AI_Output(other,self,"DIA_Camper01_DrakarExt_01_00");	//Proč tu nejsou královské lodě?
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_01");	//Nevím, tahle je tu už pěkně dlouho a blokuje jim cestu.
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_02");	//Jinak bychom už byli pryč.
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_03");	//Ale na nás by se stejně vykašlali.
	AI_Output(other,self,"DIA_Camper01_DrakarExt_01_04");	//Proč si jejich loď nevezmete?!
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_05");	//To ses zbláznil? Nikdo se tam ani nepřiblíží!
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_06");	//To místo je plné skřetů, snad si nemyslíš, že se dokážeme prosekat, nebo že tam tu loď nechají?
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_08");	//Ano, ale jejich řev z paluby je slyšet každou noc.
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_09");	//Určitě tu budou dlouho!
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_16");	//Ve srovnání s galérami paladinů jsou to obři schopni pojmout stovky skřetů!
	AI_Output(self,other,"DIA_Camper01_DrakarExt_01_18");	//Myšlenka ovládnout jejich loď je bláznivá.
};

