
var int Morgan_Perm_Counter;

instance DIA_Addon_Morgan_EXIT(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 999;
	condition = DIA_Addon_Morgan_EXIT_Condition;
	information = DIA_Addon_Morgan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Morgan_EXIT_Condition()
{
	return TRUE;
};

func int DIA_Addon_Morgan_EXIT_Info()
{
	if(GregIsBack == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Morgan_Perm_15_00");	//Nebudu tě déle rušit.
		if(Morgan_Perm_Counter == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_01");	//(zívá) Bezvadný nápad.
			Morgan_Perm_Counter = 1;
		}
		else if(Morgan_Perm_Counter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_02");	//(ospale) Tak tedy dobrou noc.
			Morgan_Perm_Counter = 2;
		}
		else if(Morgan_Perm_Counter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_03");	//(unaveně) Nic, radši to udělám.
			Morgan_Perm_Counter = 3;
		}
		else if(Morgan_Perm_Counter == 3)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_04");	//Vzbuď mě, jestli se něco přihodí.
			Morgan_Perm_Counter = 0;
		};
	};
	AI_StopProcessInfos(self);
	return TRUE;
};


instance DIA_Addon_Morgan_PICKPOCKET(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 900;
	condition = DIA_Addon_Morgan_PICKPOCKET_Condition;
	information = DIA_Addon_Morgan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Morgan_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void DIA_Addon_Morgan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Morgan_PICKPOCKET,Dialog_Back,DIA_Addon_Morgan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Morgan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Morgan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Morgan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
};

func void DIA_Addon_Morgan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Morgan_PICKPOCKET);
};


instance DIA_Addon_Morgan_Anheuern(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 1;
	condition = DIA_Addon_Morgan_Anheuern_Condition;
	information = DIA_Addon_Morgan_Anheuern_Info;
	important = TRUE;
};


func int DIA_Addon_Morgan_Anheuern_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GregIsBack == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func int DIA_Addon_Morgan_Anheuern_Info()
{
	AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_00");	//Skvěle! Teď mě Greg poslal řezat klády!
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_01");	//(sarkasticky) Užij si pobíjení monster!
	};
	return TRUE;
};


instance DIA_Addon_Morgan_Hello(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 1;
	condition = DIA_Addon_Morgan_Hello_Condition;
	information = DIA_Addon_Morgan_Hello_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Morgan_Hello_Condition()
{
	if((MIS_AlligatorJack_BringMeat == FALSE) && Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(AlligatorJack) == FALSE) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Morgan_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Hello_15_00");	//Hej ty!
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_01");	//(ospale) Huh? Co chceš?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_02");	//(ospale) Je Alligator Jack už zpátky?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_03");	//(ospale) Ne? Dobrá, asi se vrátí později. Dobrou noc.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Morgan_Meat(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 2;
	condition = DIA_Addon_Morgan_Meat_Condition;
	information = DIA_Addon_Morgan_Meat_Info;
	description = "Přinesl jsem zásilku masa.";
};


func int DIA_Addon_Morgan_Meat_Condition()
{
	if((MIS_AlligatorJack_BringMeat == LOG_Running) && (Npc_HasItems(other,ItFoMuttonRaw) >= 1))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Morgan_Meat_Info()
{
	var int GivenMeat;
	AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_00");	//Přinesl jsem zásilku masa.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_01");	//(vzbuzený) Uah. Nejdřív potřebuju doušek na probuzení.
		CreateInvItems(self,ItFo_Booze,3);
		B_UseItem(self,ItFo_Booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_02");	//Á, to je lepší. Dobrá, znova. Co chceš?
		AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_03");	//Přinesl jsem ti tuhle zásilku masa. Od Alligatora Jacka.
	};
	AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_04");	//Už si vzpomínám. Ano, přesně, maso. Dej mi to!
	GivenMeat = Npc_HasItems(other,ItFoMuttonRaw);
	if(GivenMeat > 10)
	{
		GivenMeat = 10;
	};
	B_GiveInvItems(other,self,ItFoMuttonRaw,GivenMeat);
	if(GivenMeat < 10)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_05");	//Co, to je vše? Sežvejkal si všechno ostatní? Ach, nevadí...
	};
	B_LogEntry(TOPIC_Addon_BringMeat,"Dal jsem Moranovi maso.");
	MIS_AlligatorJack_BringMeat = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_AlligatorJAck_BringMeat);
};


instance DIA_Addon_Morgan_Job(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 3;
	condition = DIA_Addon_Morgan_Job_Condition;
	information = DIA_Addon_Morgan_Job_Info;
	description = "Co tady děláš?";
};


func int DIA_Addon_Morgan_Job_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Meat))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Morgan_Job_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Job_15_01");	//Co tady děláš?
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_01");	//Greg mi dal velení jedné hraniční skupiny.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_02");	//Jsem zodpovědný za proviant v táboře - Alligator Jack se o to pro mě stará.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_03");	//Jsem také zodpovědný za potvory, které jsou příliš blízko tábora.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_04");	//Mí chlapci se o to starají za mě.
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Job_07_05");	//Řekl jsem jim, nechci tady vidět jedinou potvoru (zívá) Když se Greg vrátí.
	};
};


instance DIA_Addon_Morgan_Sleep(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 4;
	condition = DIA_Addon_Morgan_Sleep_Condition;
	information = DIA_Addon_Morgan_Sleep_Info;
	description = "Děláš teď něco?";
};


func int DIA_Addon_Morgan_Sleep_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Job))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Morgan_Sleep_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Sleep_15_00");	//Děláš teď něco?
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_01");	//Hej, koukej!
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_02");	//Mám nejdůležitější úkol ze všech.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_03");	//Starám se o trénování našich lidí.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_04");	//Dělám z nich nejlepší a nejvíce obávané piráty, kteří kdy křižovaly tyhle vody.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_05");	//Není nic, co by chlapy donutilo, aby se vrátili ke své práci.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_06");	//Dostali za to pěkný váček se zlatem.
};


instance DIA_Addon_Morgan_JoinMorgan(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_JoinMorgan_Condition;
	information = DIA_Addon_Morgan_JoinMorgan_Info;
	description = "Chci se připojit k tvé skupině.";
};


func int DIA_Addon_Morgan_JoinMorgan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Sleep) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Morgan_JoinMorgan_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_JoinMorgan_15_00");	//Chci se připojit k tvé skupině.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_01");	//(směje se) Moje Skupina? Moje skupina se povaluje okolo na pláži.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_03");	//Chlapy nezvednou ani prst dokud se kapitán nevrátí. Můžu ti naslíbovat hodně.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_04");	//Ale jestli nám chceš ukázat, co jsi vlastně zač, postaráš se o pláž na severu.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_05");	//Je plná číhavců a kdo ví čeho ještě.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_06");	//Odstraň je sám a získáš respekt (zívá) od chlapců...
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_07");	//Vítej v mé skupině. Ha! Jsem zpět na lehátkové službě...
	Log_CreateTopic(TOPIC_Addon_MorganBeach,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MorganBeach,LOG_Running);
	B_LogEntry(TOPIC_Addon_MorganBeach,"Teď, když jsem v Morganově skupině, chce abych vyčistil severní pláž od potvor.");
	MIS_Addon_MorganLurker = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Morgan_LurkerPlatt(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 6;
	condition = DIA_Addon_Morgan_LurkerPlatt_Condition;
	information = DIA_Addon_Morgan_LurkerPlatt_Info;
	permanent = TRUE;
	description = "Severní pláž je čístá.";
};


func int DIA_Addon_Morgan_LurkerPlatt_Condition()
{
	if(Npc_IsDead(BeachLurker1) && Npc_IsDead(BeachLurker2) && Npc_IsDead(BeachLurker3) && Npc_IsDead(BeachWaran1) && Npc_IsDead(BeachWaran2) && (MIS_Addon_MorganLurker == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Morgan_LurkerPlatt_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_00");	//Severní pláž je čístá.
	AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_01");	//A co jeskyně. Šel jsi tam taky?
	if(Npc_IsDead(BeachShadowbeast1))
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_02");	//Jasně.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_03");	//Třída. Jsi dobrý chlap.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_04");	//Tady je tvoje odměna.
		CreateInvItems(self,ItMi_Gold,150);
		B_GiveInvItems(self,other,ItMi_Gold,150);
		B_LogEntry(TOPIC_Addon_MorganBeach,"Pláž je vyčištěna. Všichni tvorové jsou mrtví.");
		MIS_Addon_MorganLurker = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_05");	//Au...
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_06");	//To je část práce. Přijď zpět, až se postaráš i o to.
		B_LogEntry(TOPIC_Addon_MorganBeach,"Morgan také chce, abych se postaral o jeskyni.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Morgan_Auftrag2(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 99;
	condition = DIA_Addon_Morgan_Auftrag2_Condition;
	information = DIA_Addon_Morgan_Auftrag2_Info;
	permanent = TRUE;
	description = "Je tady něco, co můžu udělat?";
};


func int DIA_Addon_Morgan_Auftrag2_Condition()
{
	if(MIS_Addon_MorganLurker == LOG_SUCCESS)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Morgan_Auftrag2_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Auftrag2_15_00");	//Je tady něco, co můžu udělat?
	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_01");	//Teď zrovna ne.
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_02");	//Zajisti si lůžko a dej si pěknou láhev rumu!
		CreateInvItems(self,ItFo_Booze,3);
		B_UseItem(self,ItFo_Booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_03");	//Aaah. To je dobrá věc.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_04");	//Nejlépe, když se na to zeptáš kapitána.
	};
	AI_StopProcessInfos(self);
};


var int Morgan_AngusStory;

instance DIA_Addon_Morgan_FOUNDTHEM(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 7;
	condition = DIA_Addon_Morgan_FOUNDTHEM_Condition;
	information = DIA_Addon_Morgan_FOUNDTHEM_Info;
	permanent = TRUE;
	description = "O Angusovi a Hankovi...";
};


func int DIA_Addon_Morgan_FOUNDTHEM_Condition()
{
	if((MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Skip_AngusHank))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Morgan_FOUNDTHEM_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_00");	//O Angusovi a Hankovi...
	if(Morgan_AngusStory == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_01");	//Nezačínej s TÍM příběhem.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_02");	//Pravděpodobně byli zabiti bandity.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_03");	//A Angus měl u sebe můj prsten.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_04");	//Dobře, vlastně to byl JEHO prsten. Vyhrál ho v kostkách.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_05");	//Ale chtěl jsem ho vyhrát nazpět, ale teď je PRYČ!
		Morgan_AngusStory = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	if(Npc_HasItems(other,ItRi_Addon_MorgansRing_Mission) > 0)
	{
		Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM,"Našel jsem je.",DIA_Addon_Morgan_FOUNDTHEM_Now);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_06");	//Jestli najdeš můj prsten, přines mi ho. Nebude to za nic, slibuju!
	};
};

func void DIA_Addon_Morgan_FOUNDTHEM_Now()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_01");	//Našel jsem je.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_07");	//Mám ti zaplatit každé slovo? Kde jsou?
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_03");	//Jsou mrtví.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_08");	//Prsten. Kde je prsten?
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM,"Tady to je.",DIA_Addon_Morgan_FOUNDTHEM_GiveRing);
	Info_AddChoice(DIA_Addon_Morgan_FOUNDTHEM,"Neměli to u sebe.",DIA_Addon_Morgan_FOUNDTHEM_NoRing);
};

func void DIA_Addon_Morgan_FOUNDTHEM_NoRing()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00");	//Neměli to u sebe.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01");	//(zděšeně) Co? Jdi zpět a podívej se znova. Musejí ho mít.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02");	//Je to malý prsten s mnoha ornamenty.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03");	//MUSÍŠ ho najít. MUSÍŠ!
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
};

func void DIA_Addon_Morgan_FOUNDTHEM_GiveRing()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00");	//Tady je.
	B_GiveInvItems(other,self,ItRi_Addon_MorgansRing_Mission,1);
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01");	//(šťastný jak blázen) Ano, to je ono. Hodný chlapec!
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02");	//Tady, vem si tuhle kamennou tabulku. Vypadá jako starý odpad, ale Garett ti za ni dobře zaplatí.
	MIS_Addon_Morgan_SeekTraitor = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_MorgansRing);
	Info_ClearChoices(DIA_Addon_Morgan_FOUNDTHEM);
	B_GiveInvItems(self,other,ItWr_StonePlateCommon_Addon,1);
};


instance DIA_Addon_Morgan_Francis(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_Francis_Condition;
	information = DIA_Addon_Morgan_Francis_Info;
	description = "Co si myslíš o Francisovi?";
};


func int DIA_Addon_Morgan_Francis_Condition()
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

func void DIA_Addon_Morgan_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_00");	//Co si myslíš o Francisovi?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_01");	//Nestarám se, (nebezpečně) tak dlouho dokud mě nechá na pokoji!
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_02");	//Není tady šéfem?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_03");	//(drsně se směje) On si MYSLÍ, že je tady šéfem.
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_04");	//(radostně) Ale jen co se Greg vrátí, bude Francis znovu a velmi pilně řezat klády.
};


instance DIA_Addon_Morgan_TRAIN(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 5;
	condition = DIA_Addon_Morgan_TRAIN_Condition;
	information = DIA_Addon_Morgan_TRAIN_Info;
	description = "Můžeš mě taky trénovat?";
};


func int DIA_Addon_Morgan_TRAIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Morgan_Sleep))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Morgan_TRAIN_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_TRAIN_15_00");	//Můžeš mě taky trénovat?
	AI_Output(self,other,"DIA_Addon_Morgan_TRAIN_07_01");	//Jasně, můžu ti ukázat, jak bojovat s jednoručními zbraněmi.
	Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher,Log_Text_Addon_MorganTeach);
	Morgan_Addon_TeachPlayer = TRUE;
};


var int Morgan_merke1h;
var int Morgan_Labercount;

instance DIA_Addon_Morgan_Teach(C_Info)
{
	npc = PIR_1353_Addon_Morgan;
	nr = 99;
	condition = DIA_Addon_Morgan_Teach_Condition;
	information = DIA_Addon_Morgan_Teach_Info;
	permanent = TRUE;
	description = "Trénuj mě!";
};


func int DIA_Addon_Morgan_Teach_Condition()
{
	if(Morgan_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Morgan_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Teach_15_00");	//Trénuj mě!
	Morgan_merke1h = other.HitChance[NPC_TALENT_1H];
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

func void DIA_Addon_Morgan_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_1H] > Morgan_merke1h)
	{
		if(Morgan_Labercount == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_00");	//Měj jednu věc na paměti. Všechna řeč o slávě je ztráta času. Buď ty zabiješ jeho, nebo on zabije tebe.
			Morgan_Labercount = 1;
		}
		else if(Morgan_Labercount == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_01");	//V budoucnu se budeš muset naučit, jak do svých úderů dát více síly.
			Morgan_Labercount = 2;
		}
		else if(Morgan_Labercount == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_02");	//Hahaha, nakonec ses naučil, jak držet meč.
			Morgan_Labercount = 0;
		};
	}
	else if(other.HitChance[NPC_TALENT_1H] >= 75)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Teach_Back_07_00");	//Jestli budeš chtít být lepší, budeš si muset najít někoho jiného.
	};
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
};

func void DIA_Addon_Morgan_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,75);
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

func void DIA_Addon_Morgan_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,75);
	Info_ClearChoices(DIA_Addon_Morgan_Teach);
	Info_AddChoice(DIA_Addon_Morgan_Teach,Dialog_Back,DIA_Addon_Morgan_Teach_Back);
	Info_AddChoice(DIA_Addon_Morgan_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Addon_Morgan_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Morgan_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,1) * 5),DIA_Addon_Morgan_Teach_1H_5);
};

