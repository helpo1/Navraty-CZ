
instance DIA_Addon_Logan_EXIT(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 999;
	condition = DIA_Addon_Logan_EXIT_Condition;
	information = DIA_Addon_Logan_EXIT_Info;
	permanent = TRUE;
	description = "Vrátím se později...";
};


func int DIA_Addon_Logan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Logan_EXIT_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_EXIT_15_00");	//Vrátím se později...
	if(!((MIS_HlpLogan == LOG_Running) || !(MIS_HlpLogan == LOG_SUCCESS)) && (Logan_Inside == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Logan_EXIT_10_01");	//(zavrčí) Jo, jen si uteč. Já tady zůstanu a zastavím všechno, co se přiblíží.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Logan_PICKPOCKET(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 900;
	condition = DIA_Addon_Logan_PICKPOCKET_Condition;
	information = DIA_Addon_Logan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Logan_PICKPOCKET_Condition()
{
	return C_Beklauen(59,50);
};

func void DIA_Addon_Logan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Logan_PICKPOCKET,Dialog_Back,DIA_Addon_Logan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Logan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Logan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Logan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
};

func void DIA_Addon_Logan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Logan_PICKPOCKET);
};


instance DIA_Addon_BDT_1072_Logan_Mine(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_Mine_Condition;
	information = DIA_Addon_Logan_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Logan_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Logan_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1072_Logan_Mine_10_00");	//Ty jsi to dal, hm... Dobře, že ses na mě nevykašlal.
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Logan_How2(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_How2_Condition;
	information = DIA_Addon_Logan_How2_Info;
	permanent = FALSE;
	description = "Jak to s tebou vypadá?";
};


func int DIA_Addon_Logan_How2_Condition()
{
	if((Logan_Inside == TRUE) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Logan_How2_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_00");	//Jak to s tebou vypadá?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_01");	//Dobře, konečně jsem tady. Lucia pálí zatracenou kořalku.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_02");	//Ale Esteban mě nepustí do dolu. Alespoň ne teď. Dal mi jinou práci.
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_03");	//A? Co po tobě chce?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_04");	//Byl pokus o zabití Estebana. Chce vědět, kdo zatím je.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_05");	//(tiše) Esteban si myslí, že je v tom zapletený Snaf. Mám ho sledovat...
};


instance DIA_Addon_Logan_Attentat(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 9;
	condition = DIA_Addon_Logan_Attentat_Condition;
	information = DIA_Addon_Logan_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Logan_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && (Logan_Inside == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Logan_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_00");	//Hledáš chlapa, který za tím je, že?
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_01");	//Ale já o tom nic nevím. Jak bych mohl? Když se to stalo byl jsem v bažině...
};


instance DIA_Addon_Logan_HI(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_HI_Condition;
	information = DIA_Addon_Logan_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Logan_HI_Condition()
{
	if((Logan_Inside == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Logan_HI_Info()
{
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_00");	//Podívejme, nová tvář.
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_01");	//Budeš tady jen postávat, nebo mi jdeš na pomoc?
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HI))
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_02");	//Posílá mě Franco. Říká, že by ti byla užitečná pomoc. Takže o co jde?
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_03");	//Záleží s čím chceš pomoct?
	};
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_04");	//Močáloví žraloci jsou moc blízko - nejvyšší čas jich pár zabít.
	Log_CreateTopic(Topic_Addon_Logan,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Logan,LOG_Running);
	B_LogEntry(Topic_Addon_Logan,"Logan chce, abych s ním lovil močálové žraloky.");
};


instance DIA_Addon_Logan_Why(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_Why_Condition;
	information = DIA_Addon_Logan_Why_Info;
	permanent = FALSE;
	description = "Co dostanu za moji pomoc?";
};


func int DIA_Addon_Logan_Why_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_HI) && (Logan_Inside == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Logan_Why_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Why_15_00");	//Co dostanu za moji pomoc?
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_01");	//(zavrčí) Franco tě tady nechá zhnít, jestli to neuděláš.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_02");	//Pokud se chceš dostat do tábora, tak musíš přiložit ruku k dílu. Se slovama se dál nedostaneš.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_03");	//Mimochodem můžu ti ukázat, jak vyvrhnout zvířata.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_04");	//Ale nemysli si, že tě Franco hned pošle do tábora jen proto, že jsme si tu trochu zablbli s močálovýma žralokama.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_05");	//Jsou tady lidé, kteří čekají dost dlouho, aby se tam dostali.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_06");	//A další, kdo je na řadě jsem já... (zavrčí) Tak se netrap...
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher,"Logan mě může naučit stahování kůže a vydělávání drápů a zubů.");
};


instance DIA_Addon_Logan_Lager(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 3;
	condition = DIA_Addon_Logan_Lager_Condition;
	information = DIA_Addon_Logan_Lager_Info;
	permanent = FALSE;
	description = "A co je v táboře?";
};


func int DIA_Addon_Logan_Lager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Why) && (Logan_Inside == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Logan_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lager_15_00");	//A co je v táboře?
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_01");	//(zavrčí) Otázka je, co NENÍ v táboře. Nejsou tam močáloví žraloci ANI žádné bláto, DOKONCE žádná BAŽINA.
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_02");	//Místo toho tam mají chlast a zlato. Pokud vím, tak tam mají i baby. Chápeš?
};


instance DIA_Addon_Logan_MIS(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 99;
	condition = DIA_Addon_Logan_MIS_Condition;
	information = DIA_Addon_Logan_MIS_Info;
	permanent = FALSE;
	description = "Zaútočíme na močálové žraloky.";
};


func int DIA_Addon_Logan_MIS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_HI))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Logan_MIS_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_00");	//Zaútočíme na močálové žraloky.
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_01");	//Přišel jsi na to, jak to tady chodí. Jsem potěšený. Psst... slyšel jsi to? Joo, slyším je.
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_02");	//Vidím a co budem dělat?
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_03");	//Přicházejí. Mají chuť zakousnout se do lidského masa. Dobře, uvidíme, kdo tady bude koho žrát... Jdeme!
	Snd_Play("SWA_WARN01");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HlpLogan = LOG_Running;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"JAGD");
	Wld_InsertNpc(MIS_Addon_Swampshark_01,"ADW_SWAMPSHARK_01");
	Wld_InsertNpc(MIS_Addon_Swampshark_02,"ADW_SWAMPSHARK_02");
	Wld_InsertNpc(MIS_Addon_Swampshark_03,"ADW_BANDIT_VP3_06");
};


instance DIA_Addon_Logan_tot(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 2;
	condition = DIA_Addon_Logan_tot_Condition;
	information = DIA_Addon_Logan_tot_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Logan_tot_Condition()
{
	if(Npc_IsDead(MIS_Addon_Swampshark_01) && Npc_IsDead(MIS_Addon_Swampshark_02) && Npc_IsDead(MIS_Addon_Swampshark_03) && Npc_KnowsInfo(other,DIA_Addon_Logan_MIS))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Logan_tot_Info()
{
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_00");	//Jedinej dobrej močálovej žralok je mrtvej močálovej žralok. To by mělo být varování pro ostatní!
	AI_Output(other,self,"DIA_Addon_Logan_tot_15_01");	//Je tady ještě něco na práci? Jinak půjdu...
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_02");	//Běž. Pokud se chceš něco naučit - víš, kde mě najdeš.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HlpLogan = LOG_SUCCESS;
	self.aivar[93] = FALSE;
	B_LogEntry(Topic_Addon_Franco,"Pomohl jsem Loganovi. Měl bych se jít podívat, co na to řekne Franco.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_Logan_Lern(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 100;
	condition = DIA_Addon_Logan_Lern_Condition;
	information = DIA_Addon_Logan_Lern_Info;
	permanent = FALSE;
	description = "Ukaž mi, jak stahovat zvířecí kůže...";
};


func int DIA_Addon_Logan_Lern_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Why))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Logan_Lern_Info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lern_15_00");	//Ukaž mi, jak stahovat zvířecí kůže...
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_01");	//Pokud se chceš naučit něco o krvavých mouchách, tak běž za Edgorem. Ví o nich všechno.
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_02");	//A jestli chceš vědět, jak vyvrhnout močálové žraloky nebo ještěry měl bys prvně umět odstranit jejich kůže a zuby. Můžu ti to ukázat.
};


instance DIA_Addon_Logan_Allg(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 3;
	condition = DIA_Addon_Logan_Allg_Condition;
	information = DIA_Addon_Logan_Allg_Info;
	permanent = TRUE;
	description = "Chci se naučit...";
};


func int DIA_Addon_Logan_Allg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Logan_Lern) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Logan_Allg_Info()
{
	Info_ClearChoices(DIA_Addon_Logan_Allg);
	Info_AddChoice(DIA_Addon_Logan_Allg,Dialog_Back,DIA_Addon_Logan_Allg_BACK);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg,b_buildlearnstringforsmithhunt("Vyjímání zubů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Addon_Logan_Allg_Teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg,b_buildlearnstringforsmithhunt("Vyjímání drápů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Addon_Logan_Allg_Claws);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Logan_Allg,b_buildlearnstringforsmithhunt("Stahování kůží",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Addon_Logan_Allg_Fur);
	};
};

func void DIA_Addon_Logan_Allg_BACK()
{
	Info_ClearChoices(DIA_Addon_Logan_Allg);
};

func void DIA_Addon_Logan_Allg_Teeth()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth);
};

func void DIA_Addon_Logan_Allg_Claws()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws);
};

func void DIA_Addon_Logan_Allg_Fur()
{
	B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur);
};


var int Logan_Lohn;

instance DIA_Addon_Logan_Hacker(C_Info)
{
	npc = BDT_1072_Addon_Logan;
	nr = 9;
	condition = DIA_Addon_Logan_Hacker_Condition;
	information = DIA_Addon_Logan_Hacker_Info;
	permanent = TRUE;
	description = "Co je?";
};


func int DIA_Addon_Logan_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_08") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Logan_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Logan_Hacker_15_00");	//Co je?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_01");	//Hej díky, dostal jsem to. Jsem v dole!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_02");	//Nevím sice moc o kutání zlata, ale to přijde.
	if(Logan_Lohn == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_03");	//Naučil jsem se nejdůležitější věc. Nohy pevně na zemi a vždy udeřit tvrdě!
		Logan_Lohn = TRUE;
	};
};

