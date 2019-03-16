
instance DIA_Addon_Bones_EXIT(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 999;
	condition = DIA_Addon_Bones_EXIT_Condition;
	information = DIA_Addon_Bones_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bones_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Bones_PICKPOCKET(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 900;
	condition = DIA_Addon_Bones_PICKPOCKET_Condition;
	information = DIA_Addon_Bones_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Bones_PICKPOCKET_Condition()
{
	return C_Beklauen(75,104);
};

func void DIA_Addon_Bones_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Bones_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Bones_PICKPOCKET,Dialog_Back,DIA_Addon_Bones_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Bones_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Bones_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bones_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Bones_PICKPOCKET);
};

func void DIA_Addon_Bones_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Bones_PICKPOCKET);
};

func void B_Addon_Bones_KeineZeit()
{
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_01");	//Je mi líto, ale nemám čas.
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_02");	//Musím trénovat.
};


instance DIA_Addon_Bones_Anheuern(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 1;
	condition = DIA_Addon_Bones_Anheuern_Condition;
	information = DIA_Addon_Bones_Anheuern_Info;
	description = "Kaňon čeká.";
};


func int DIA_Addon_Bones_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Bones_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Anheuern_15_01");	//Kaňon čeká.
	B_Addon_Bones_KeineZeit();
};


instance DIA_Addon_Bones_Hello(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Hello_Condition;
	information = DIA_Addon_Bones_Hello_Info;
	permanent = FALSE;
	description = "Jak to jde?";
};


func int DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bones_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Hello_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Bones_Hello_01_01");	//V pohodě. Je to trochu nuda, ale aspoň nemusím pracovat.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_01");	//Právě se připravuji na další úkol, který mi Greg dá.
	AI_Output(other,self,"DIA_Addon_Bones_Work_15_02");	//Jaký úkol?
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_03");	//To ti nemůžu říct.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_04");	//Bez urážky kámo, pracoval jsem dlouho a nechci tuto práci ztratit.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Bones_Train(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Train_Condition;
	information = DIA_Addon_Bones_Train_Info;
	permanent = FALSE;
	description = "Můžeš mě něco naučit?";
};


func int DIA_Addon_Bones_Train_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bones_Hello) == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Bones_Train_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Train_15_00");	//Můžeš mě něco naučit?
	B_Addon_Bones_KeineZeit();
};


instance DIA_Addon_Bones_Teacher(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 5;
	condition = DIA_Addon_Bones_Teacher_Condition;
	information = DIA_Addon_Bones_Teacher_Info;
	permanent = FALSE;
	description = "Kdo mě tu může něco naučit?";
};


func int DIA_Addon_Bones_Teacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bones_Train) == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Bones_Teacher_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_00");	//Kdo mě tu může něco naučit?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_04");	//Henry a Morgan řídí stravování našich lidí.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_05");	//Ti tě mohou naučit, jak lépe bojovat.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_07");	//Všichni Henryho lidé umí zacházet s obouručními zbraněmi.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_08");	//Morgan dává přednost rychlejším jednoručním zbraním.
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_09");	//Kdo dál?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_10");	//Nemám páru, já se o toto nezajímám.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_11");	//Nicméně jsem si jistý, že Alligator Jack nebo Samuel by ti mohli nějaký trik ukázat.
	Knows_HenrysEntertrupp = TRUE;
	Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_HenryTeach);
	B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);
};


instance DIA_Addon_Bones_Francis(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 3;
	condition = DIA_Addon_Bones_Francis_Condition;
	information = DIA_Addon_Bones_Francis_Info;
	permanent = FALSE;
	description = "Co mi můžeš říct o Francisovi?";
};


func int DIA_Addon_Bones_Francis_Condition()
{
	if(Francis_ausgeschissen == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void DIA_Addon_Bones_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Francis_15_00");	//Co mi můžeš říct o Francisovi?
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_03");	//Jen se rozhlédni kolem. Jediní lidé, co něco dělají, jsou Henry a jeho chlapi.
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_04");	//Morgan stráví celý den v posteli nebo chlastá.
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_05");	//Nedělá vůbec nic. A kdo se neřídí podle něj, má problém!
};


instance DIA_Addon_Bones_WantArmor(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 2;
	condition = DIA_Addon_Bones_WantArmor_Condition;
	information = DIA_Addon_Bones_WantArmor_Info;
	permanent = TRUE;
	description = "Dej mi banditskou zbroj.";
};


func int DIA_Addon_Bones_WantArmor_Condition()
{
	if((Greg_GaveArmorToBones == TRUE) && (MIS_Greg_ScoutBandits == 0))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Bones_WantArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_WantArmor_15_00");	//Dej mi banditskou zbroj.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_01");	//Nejsem blázen, Greg by mi utrhl hlavu.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_02");	//Říkál, že bez jeho rozkazu nemůžu nikomu dát tu zbroj.

	if(GregIsBack == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_03");	//Nemůžu ti ho dát. Aspoň dokud není zpět.
	};
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Bones mi nechce dát zbroj banditů bez Gregova svolení.");
};


instance DIA_Addon_Bones_GiveArmor(C_Info)
{
	npc = PIR_1362_Addon_Bones;
	nr = 2;
	condition = DIA_Addon_Bones_GiveArmor_Condition;
	information = DIA_Addon_Bones_GiveArmor_Info;
	permanent = FALSE;
	description = "Gregův rozkaz je, že mi máš dát zbroj.";
};


func int DIA_Addon_Bones_GiveArmor_Condition()
{
	if(MIS_Greg_ScoutBandits == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Bones_GiveArmor_Info()
{
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_00");	//Gregův rozkaz je, že mi máš dát zbroj.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_01");	//Gregův příkaz? Puh, a myslím, že bych pak musel jít sám.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_02");	//Být špionem v tom táboře je holá sebevražda.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_03");	//Raději strpím Gregovo vězení, než aby mě zabili banditi...
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_04");	//(podrážděně) Zbroj.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_05");	//Tady to máš.
	B_GiveInvItems(self,other,ItAr_BDT_M,1);
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_06");	//Ale nezahrávej si s těma chlápkama.
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;
	PlayerGetBDTArmor = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung,LOG_SUCCESS);
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Zdá se, že Gregův rozkaz může dělat zázraky. Mám zbroj banditů!");
	B_GivePlayerXP(XP_Bones_GetBDTArmor);
};