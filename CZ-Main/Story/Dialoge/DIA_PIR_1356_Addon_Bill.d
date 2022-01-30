
instance DIA_Addon_Bill_EXIT(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 999;
	condition = DIA_Addon_Bill_EXIT_Condition;
	information = DIA_Addon_Bill_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Bill_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bill_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Bill_PICKPOCKET(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 900;
	condition = DIA_Addon_Bill_PICKPOCKET_Condition;
	information = DIA_Addon_Bill_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Bill_PICKPOCKET_Condition()
{
	return C_Beklauen(80,205);
};

func void DIA_Addon_Bill_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Bill_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Bill_PICKPOCKET,Dialog_Back,DIA_Addon_Bill_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Bill_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Bill_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bill_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Bill_PICKPOCKET);
};

func void DIA_Addon_Bill_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Bill_PICKPOCKET);
};


instance DIA_Addon_Bill_Hello(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 1;
	condition = DIA_Addon_Bill_Hello_Condition;
	information = DIA_Addon_Bill_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Bill_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Bill_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Hello_15_00");	//Vše ok?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_01");	//Co je? Henry tě sem poslal?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_02");	//Řekni mu, že dostane svá prkna, jakmile je dodělám.
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_03");	//Jestli se mu to nebude líbit, může si je jít udělat sám.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Bill_Planks(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 2;
	condition = DIA_Addon_Bill_Planks_Condition;
	information = DIA_Addon_Bill_Planks_Info;
	description = "Co děláš s těmi deskami?";
};


func int DIA_Addon_Bill_Planks_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Bill_Planks_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Planks_15_00");	//Co děláš s těmi deskami?
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_01");	//Jsou na palisádu.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_02");	//Greg si myslí, že je dobrý nápad opevnit tábor.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_03");	//Ale když se mě ptáš, stejně si myslím, že je to zbytečné.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_04");	//Jestli na nás chtějí banditi zaútočit, tyto směšné palisády je jistě nezastaví.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_05");	//Nikdy jsme je neměli tolerovat v našem údolí.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_06");	//Kdybych to věděl dřív, zůstal bych v Khorinisu.
};


var int Bill_Perm_Once;

instance DIA_Addon_Bill_Perm(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 4;
	condition = DIA_Addon_Bill_Perm_Condition;
	information = DIA_Addon_Bill_Perm_Info;
	permanent = TRUE;
	description = "Můžu ti pomoct?";
};


func int DIA_Addon_Bill_Perm_Condition()
{
	if((GregIsBack == FALSE) && Npc_WasInState(self,ZS_Saw))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm_15_00");	//Můžu ti pomoct?
	AI_Output(self,other,"DIA_Addon_Bill_Perm_03_01");	//Bez starostí, zvládnu to sám.
	if(Bill_Perm_Once == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm_03_02");	//Přidal jsem sem teprve nedávno a kdybych nechal dělat lidi svou práci, dlouho bych tu nebyl. Chápeš?
		Bill_Perm_Once = TRUE;
	};
};


instance DIA_Addon_Bill_Perm2(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 5;
	condition = DIA_Addon_Bill_Perm2_Condition;
	information = DIA_Addon_Bill_Perm2_Info;
	permanent = TRUE;
	description = "Co děláš?";
};


func int DIA_Addon_Bill_Perm2_Condition()
{
	if(GregIsBack == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Bill_Perm2_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm2_15_00");	//Co děláš?
	AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_01");	//Zaprvé odpočívám.
	if(!Npc_IsDead(Francis))
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_02");	//(radostně) Francis mi dal mou starou práci.
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_03");	//Pro mě, za mě, můžu tu dělat desky, dokud peklo nezamrzne.
	};
};


instance DIA_Addon_Bill_AngusnHank(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 11;
	condition = DIA_Addon_Bill_AngusnHank_Condition;
	information = DIA_Addon_Bill_AngusnHank_Info;
	permanent = FALSE;
	description = "Hledám Anguse a Hanka.";
};


func int DIA_Addon_Bill_AngusnHank_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_AngusHank) && Npc_HasItems(Angus,ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_AngusnHank_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_00");	//Hledám Anguse a Hanka.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_01");	//(povzdechne si) Nemám ani ponětí, kde by mohli být. Hádal bych, že je dostali banditi.
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_02");	//Byli jste přátelé, nebo ne?
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_03");	//Vše, co vím, je, že se chtěli setkat s bandity v nedaleké jeskyni.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_04");	//Mělo by to být někde na východ od tábora.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_05");	//Nevím ale přesně kde. Nikdy jsem tam nebyl.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_06");	//Nejlepší se zeptat Alligatora Jacka. Je vždy někde před táborem.
	B_LogEntry(TOPIC_Addon_SkipsGrog,"Angus a Hank měli jeskyni na východ od tábora. Alligator Jack by mohl vědět víc.");
};


instance DIA_Addon_Bill_FoundFriends(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 12;
	condition = DIA_Addon_Bill_FoundFriends_Condition;
	information = DIA_Addon_Bill_FoundFriends_Info;
	permanent = FALSE;
	description = "Našel jsem tvé přátele.";
};


func int DIA_Addon_Bill_FoundFriends_Condition()
{
	if(!Npc_HasItems(Angus,ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_FoundFriends_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_00");	//Našel jsem tvé přátele.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_01");	//A? Kde jsou?
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_02");	//Jsou mrtví.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_03");	//(naštvaně) To byli ti prokletí banditi!
	if(SC_Knows_JuanMurderedAngus == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_06");	//Možná.
	};
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_04");	//Ti hnusní bastardi. Přeji si, aby odešli do pekla.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_05");	//(k sobě, naštvaně) Rád bych znal jména těch, co to udělali...
	MIS_Addon_Bill_SearchAngusMurder = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_KillJuan,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillJuan,LOG_Running);
	B_LogEntry(TOPIC_Addon_KillJuan,"Bill byl úplně rozrušen, když jsem mu řekl o smrti Anguse a Hanka. Chce znát jména vrahů.");
};


instance DIA_Addon_Bill_JuanMurder(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 13;
	condition = DIA_Addon_Bill_JuanMurder_Condition;
	information = DIA_Addon_Bill_JuanMurder_Info;
	description = "Vím, kdo zabil Anguse a Hanka.";
};


func int DIA_Addon_Bill_JuanMurder_Condition()
{
	if((MIS_Addon_Bill_SearchAngusMurder == LOG_Running) && (SC_Knows_JuanMurderedAngus == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_JuanMurder_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_00");	//Vím, kdo zabil Anguse a Hanka.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_01");	//(rozrušeně) Kdo? Kdo to byl?
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_02");	//Jeho jméno je Juan a je jedním z banditů.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_03");	//Budu ho pronásledovat až do konce, slyšíš mě?
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_04");	//Nesmí se odtud dostat živí!
	B_LogEntry(TOPIC_Addon_KillJuan,"Já zabiju Juana. Pomstím Anguse a Hanka.");
};


instance DIA_Addon_Bill_KilledEsteban(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 14;
	condition = DIA_Addon_Bill_KilledEsteban_Condition;
	information = DIA_Addon_Bill_KilledEsteban_Info;
	description = "O Juana je postaráno.";
};


func int DIA_Addon_Bill_KilledEsteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_JuanMurder) && Npc_IsDead(Juan))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bill_KilledEsteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_00");	//O Juana je postaráno.
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_01");	//(horlivě) A? Trpěl?
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_02");	//Nech to být.
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_03");	//(povzdechne si) Máš pravdu. Konečně je mrtev.
	B_LogEntry(TOPIC_Addon_KillJuan,"Juan je mrtev. Bill je celkem potěšen.");
	MIS_Addon_Bill_SearchAngusMurder = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Bill_KillAngusMurder);
};


instance DIA_Addon_Bill_Khorinis(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 21;
	condition = DIA_Addon_Bill_Khorinis_Condition;
	information = DIA_Addon_Bill_Khorinis_Info;
	description = "Bývávals v Khorinisu?";
};


func int DIA_Addon_Bill_Khorinis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_Planks))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Bill_Khorinis_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Khorinis_15_00");	//Bývávals v Khorinisu?
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_01");	//Ano, býval jsem malým kapesním zlodějem a podvodníkem.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_02");	//Ale když přijíždělo méně a méně lodí, obchod trpěl.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_03");	//A nemohl jsem vědět, jak domobrana prahne po penězích.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_04");	//Tak jsem se přidal k Gregovi. A nyní jsem zde.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_05");	//(povzdechne si) Řežu celý den desky na palisádu, která bude stejně k ničemu.
	};
};


instance DIA_Addon_Bill_TeachPlayer(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 22;
	condition = DIA_Addon_Bill_TeachPlayer_Condition;
	information = DIA_Addon_Bill_TeachPlayer_Info;
	description = "Můžeš mě něco naučit?";
};


func int DIA_Addon_Bill_TeachPlayer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_Khorinis))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Bill_TeachPlayer_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_TeachPlayer_15_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_01");	//Můžu tě naučit, jak vyprázdnit kapsy ostatním, aniž by si toho všimli.
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_02");	//Ale musíš být aspoň trochu obratný, jinak to nemá význam.
	Bill_Addon_TeachPickPocket = TRUE;
};


instance DIA_Addon_Bill_LearnTalent(C_Info)
{
	npc = PIR_1356_Addon_Bill;
	nr = 23;
	condition = DIA_Addon_Bill_LearnTalent_Condition;
	information = DIA_Addon_Bill_LearnTalent_Info;
	permanent = TRUE;
	description = "Ukaž mi, jak vybírat kapsy. (VB: 10)";
};


func int DIA_Addon_Bill_LearnTalent_Condition()
{
	if((Bill_Addon_TeachPickPocket == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Bill_LearnTalent_Info()
{
	AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_00");	//Ukaž mi, jak vybírat kapsy.

	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		if(B_TeachThiefTalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_01");	//Když budeš chtít někoho okrást, ujisti se, že jsi v bezpečí, a že tě nikdo nesleduje.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_02");	//Přijdeš k nim a normálně s nimi promluvíš.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_03");	//Když něco bereš, ujisti si, že si oběť ničeho nevšimla.
			AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_05");	//Něco dalšího?
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_06");	//Ano, zlepšuj se v obratnosti. Čím jsi obratnější, tím lépe ti to půjde.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_07");	//A hlavně se nenech chytit.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_08");	//To je vše, co se týče teorie.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_09");	//Zapomeň na to, jsi příliš nemotorný.
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_10");	//Buď se staň obratnějším nebo si sežeň lepšího učitele.
	};
};

