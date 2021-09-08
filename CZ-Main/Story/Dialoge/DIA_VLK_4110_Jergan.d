
instance DIA_Jergan_EXIT(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 999;
	condition = DIA_Jergan_EXIT_Condition;
	information = DIA_Jergan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jergan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jergan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JERGAN_STOP(C_Info)
{
	npc = VLK_4110_Jergan;
	condition = dia_jergan_stop_condition;
	information = dia_jergan_stop_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jergan_stop_condition()
{
	if(Npc_GetDistToWP(self,"OW_NEWMINE_04") > 1000)
	{
		return TRUE;
	};
};

func void dia_jergan_stop_info()
{
	AI_Output(self,other,"DIA_Jergan_STOP_01_01");	//Hej, ty!
	AI_Output(other,self,"DIA_Jergan_STOP_01_02");	//Kdo? Já?
	AI_Output(self,other,"DIA_Jergan_STOP_01_03");	//Ne, tvoje babička... Nebo je tu snad někdo jiný, komu bych to říkal?!
	AI_Output(self,other,"DIA_Jergan_STOP_01_04");	//Na tvém místě bych tam nechodil!
	AI_Output(other,self,"DIA_Jergan_STOP_01_05");	//Proč ne?
	AI_Output(self,other,"DIA_Jergan_STOP_01_06");	//Je vidět, že tu nejsi dlouho.
	AI_Output(self,other,"DIA_Jergan_STOP_01_07");	//Chlape, tahle stezka vede přímo na území skřetů...
	AI_Output(self,other,"DIA_Jergan_STOP_01_08");	//Ti tě s potěšením stáhnou zaživa z kůže!
	AI_Output(other,self,"DIA_Jergan_STOP_01_09");	//Budu na to myslet.
	AI_Output(self,other,"DIA_Jergan_STOP_01_10");	//To bych ti radil!
};


instance DIA_Jergan_Hallo(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 2;
	condition = DIA_Jergan_Hallo_Condition;
	information = DIA_Jergan_Hallo_Info;
	permanent = FALSE;
	description = "Co tady pohledáváš?";
};


func int DIA_Jergan_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Jergan_Hallo_Info()
{
	AI_Output(other,self,"DIA_Jergan_Hallo_15_00");	//Co tady pohledáváš?
	AI_Output(self,other,"DIA_Jergan_Hallo_13_01");	//Přicházím z hradu. Poslali mě, abych našel pohřešované a zkontroloval tuhle oblast.
};


instance DIA_Jergan_Vermisste(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 2;
	condition = DIA_Jergan_Vermisste_Condition;
	information = DIA_Jergan_Vermisste_Info;
	permanent = FALSE;
	description = "Pohřešované?";
};


func int DIA_Jergan_Vermisste_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Vermisste_Info()
{
	AI_Output(other,self,"DIA_Jergan_Vermisste_15_00");	//Pohřešované?
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_01");	//Někomu se podařilo uniknout, když zaútočili draci. Většina z nich to nestihla - a není divu!
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_02");	//Ale pokud někdo přežil, vezmu ho s sebou zpátky.
};


instance DIA_Jergan_Burg(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Burg_Condition;
	information = DIA_Jergan_Burg_Info;
	permanent = FALSE;
	description = "Mužeš mi pomoct dostat se do hradu?";
};


func int DIA_Jergan_Burg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Hallo) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Burg_Info()
{
	AI_Output(other,self,"DIA_Jergan_Burg_15_00");	//Mužeš mi pomoct dostat se do hradu?
	AI_Output(self,other,"DIA_Jergan_Burg_13_01");	//Jasně, ale musíš mi prokázat laskavost.
	AI_Output(self,other,"DIA_Jergan_Burg_13_02");	//Jestli se ti podaří dostat se do hradu, promluv si s paladinem Oricem. Vyřiď mu, že jeho bratr bohužel zemřel.
	Log_CreateTopic(Topic_OricBruder,LOG_MISSION);
	Log_SetTopicStatus(Topic_OricBruder,LOG_Running);
	B_LogEntry(Topic_OricBruder,"Až se dostanu do hradu, musím Oricovi vyřídit, že je jeho bratr po smrti.");
};


instance DIA_Jergan_Gegend(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Gegend_Condition;
	information = DIA_Jergan_Gegend_Info;
	permanent = TRUE;
	description = "Co bych měl vědět o této oblasti?";
};


func int DIA_Jergan_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Hallo))
	{
		return TRUE;
	};
};


var int Jergan_Tell;

func void DIA_Jergan_Gegend_Info()
{
	AI_Output(other,self,"DIA_Jergan_Gegend_15_00");	//Co bych měl vědět o této oblasti?

	if(Jergan_Tell == FALSE)
	{
		AI_Output(self,other,"DIA_Jergan_Gegend_13_01");	//Jestli chceš prežít, utíkej od všeho co uvidíš.
		AI_Output(self,other,"DIA_Jergan_Gegend_13_02");	//Skřeti obléhají hrad už týdny - a někde se tu ukrývají draci.
	};
	AI_Output(self,other,"DIA_Jergan_Gegend_13_03");	//Celé Hornické údolí se hemží skřety - ať máš namířeno kamkoliv, nebude to procházka růžovým sadem.
	Jergan_Tell = TRUE;
};


instance DIA_Jergan_Hilfe(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Hilfe_Condition;
	information = DIA_Jergan_Hilfe_Info;
	permanent = FALSE;
	description = "Jak se dostanu do hradu?";
};


func int DIA_Jergan_Hilfe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jergan_Burg) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Hilfe_Info()
{
	AI_Output(other,self,"DIA_Jergan_Hilfe_15_00");	//Jak se dostanu do hradu?
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_01");	//Na přímou cestu rovnou zapomeň. Ale pokud obejdeš hrad, možná se tam dostaneš zezadu.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_02");	//Měl bys zůstat mimo cestu a využít řeku. Nejlepší bude, když poplaveš po proudu. Odtud by to mělo být snazší.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_03");	//Skřeti za hradem postavili beranidlo. Mužeš se dostat dovnitř přes něj. Připlížíš se k těm bastardům, jak jen to bude možné a potom budeš upalovat, co to jen půjde.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_04");	//Pokud budeš dostatečně rychlý, měl bys to zvládnout.
};


instance DIA_Jergan_Mine(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Mine_Condition;
	information = DIA_Jergan_Mine_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Jergan_Mine_Condition()
{
	if(Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Jergan_Mine_Info()
{
	AI_Output(other,self,"DIA_Jergan_Mine_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Jergan_Mine_13_01");	//Jsem zvěd. Toulám se po kraji. Ale všichni ti chňapavci mi to ztěžují.
	AI_Output(self,other,"DIA_Jergan_Mine_13_02");	//Je vhodná doba k získání nějakých trofejí - za předpokladu, že víš, co děláš.
};


instance DIA_Jergan_Claw(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Claw_Condition;
	information = DIA_Jergan_Claw_Info;
	permanent = FALSE;
	description = "Naučíš mě, jak na to?";
};


func int DIA_Jergan_Claw_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,DIA_Jergan_Mine) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Claw_Info()
{
	AI_Output(other,self,"DIA_Jergan_Claw_15_00");	//Naučíš mě, jak na to?
	AI_Output(self,other,"DIA_Jergan_Claw_13_01");	//Mužu ti ukázat, jak z jejich mrtvol vytrhnout drápy.
};


instance DIA_Jergan_Teach(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Teach_Condition;
	information = DIA_Jergan_Teach_Info;
	permanent = TRUE;
	description = "Ukaž mi, jak se trhají drápy.";
};


func int DIA_Jergan_Teach_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,DIA_Jergan_Claw) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Teach_Info()
{
	AI_Output(other,self,"DIA_Jergan_Teach_15_00");	//Ukaž mi, jak se trhají drápy.
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Jergan_Teach_13_01");	//Důležité je odstranit drápy silným škubnutím. Neváhej a pořádně zaber.
		AI_Output(self,other,"DIA_Jergan_Teach_13_02");	//Tímto zpusobem nevytrhneš drápy jenom chňapavcům, ale také ještěrům a stínovým šelmám.
	};
};


instance DIA_Jergan_Diego(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Diego_Condition;
	information = DIA_Jergan_Diego_Info;
	permanent = FALSE;
	description = "Nevíš, kam se poděl Diego?";
};


func int DIA_Jergan_Diego_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && (Npc_KnowsInfo(other,DIA_DiegoOw_Hallo) == FALSE) && Npc_KnowsInfo(other,DIA_Parcival_Diego))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Diego_Info()
{
	AI_Output(other,self,"DIA_Jergan_Diego_15_00");	//Nevíš, kam se poděl Diego?
	AI_Output(self,other,"DIA_Jergan_Diego_13_01");	//Diego? Byl jedním ze Silvestrových kopáču, ale vypařil se.
	AI_Output(self,other,"DIA_Jergan_Diego_13_02");	//Viděl jsem ho nedaleko odtud se dvěma rytíři a několika bednami.
	AI_Output(self,other,"DIA_Jergan_Diego_13_03");	//Vidíš tady tu starou strážní věž? Jdi tím směrem a potom k hradu.
	AI_Output(self,other,"DIA_Jergan_Diego_13_04");	//Cesta vede skálami vpravo. To je ta cesta, kterou šli.
};


instance DIA_Jergan_Leader(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 3;
	condition = DIA_Jergan_Leader_Condition;
	information = DIA_Jergan_Leader_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jergan_Leader_Condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_IsDead(NewMine_LeadSnapper) && Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Leader_Info()
{
	AI_Output(self,other,"DIA_Jergan_Leader_13_00");	//Tak ty jsi ulovil vůdce bandy. A získal jsi z té bestie drápy?
	if(Npc_HasItems(other,ItAt_ClawLeader) >= 1)
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_01");	//Ano.
		AI_Output(self,other,"DIA_Jergan_Leader_13_02");	//Ty musí mít jistě velkou cenu. Je tu několik chlapíků, kteří takové veci sbírají.
		AI_Output(self,other,"DIA_Jergan_Leader_13_03");	//Pokud najdeš správného kupce, dostaneš za to kopec zlata.
	}
	else
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_04");	//Ne.
		AI_Output(self,other,"DIA_Jergan_Leader_13_05");	//Měl bys to udelat. Jsem si jistý, že za ně dostaneš fůru zlata.
	};
};


instance DIA_Jergan_PICKPOCKET(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 900;
	condition = DIA_Jergan_PICKPOCKET_Condition;
	information = DIA_Jergan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jergan_PICKPOCKET_Condition()
{
	return C_Beklauen(84,110);
};

func void DIA_Jergan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
	Info_AddChoice(DIA_Jergan_PICKPOCKET,Dialog_Back,DIA_Jergan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jergan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jergan_PICKPOCKET_DoIt);
};

func void DIA_Jergan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
};

func void DIA_Jergan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jergan_PICKPOCKET);
};

instance DIA_Jergan_Venzel(C_Info)
{
	npc = VLK_4110_Jergan;
	nr = 9;
	condition = DIA_Jergan_Venzel_Condition;
	information = DIA_Jergan_Venzel_Info;
	permanent = FALSE;
	description = "Všiml sis něčeho zajímavého?";
};

func int DIA_Jergan_Venzel_Condition()
{
	if((MIS_LostPaladins == LOG_Running) && (HintVenzelOrcs_01 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jergan_Venzel_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Jergan_Venzel_01_00");	//Všiml sis něčeho zajímavého?
	AI_Output(self,other,"DIA_Jergan_Venzel_01_01");	//Hmm, nemyslím, že by tě něco z toho zajímalo.
	AI_Output(other,self,"DIA_Jergan_Venzel_01_02");	//Vubec nic?
	AI_Output(self,other,"DIA_Jergan_Venzel_01_03");	//No, možná... (poškrábe se na hlavě) Jediná věc, která mě napadá...
	AI_Output(other,self,"DIA_Jergan_Venzel_01_04");	//Co?
	AI_Output(self,other,"DIA_Jergan_Venzel_01_05");	//Behěm své posledné výpravy jsem viděl jak skřeti vedli někam malou skupinu zajatců.
	AI_Output(other,self,"DIA_Jergan_Venzel_01_06");	//Zajímavé. Nebyl mezi nimi paladin?
	AI_Output(self,other,"DIA_Jergan_Venzel_01_07");	//Ne nebyl. Toho bych si všimnul.
	AI_Output(other,self,"DIA_Jergan_Venzel_01_08");	//A kam šli?
	AI_Output(self,other,"DIA_Jergan_Venzel_01_09");	//Vypadalo to, že smerem k té velké hoře. Na severovýchod.
	AI_Output(self,other,"DIA_Jergan_Venzel_01_10");	//Myslím si, že tam mají malý tábor.
	AI_Output(self,other,"DIA_Jergan_Venzel_01_11");	//Ale na tvém místě bych to neoveřoval.
	AI_Output(other,self,"DIA_Jergan_Venzel_01_12");	//(ironicky) A kdo jiný, když ne já?
	HintVenzelOrcs_02 = TRUE;
	B_LogEntry(TOPIC_LostPaladins,"Průzkumník Jergan nedávno videl skřety jak vedou malou skupinu zajatců. Podle Jergana tam paladin nebyl. Také si myslí, že skřeti šli směrem k velké hoře na severovýchod údolí. Myslím, že je čas promluvit si s Garondem.");
};