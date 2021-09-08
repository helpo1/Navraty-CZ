
instance DIA_Addon_Ramon_EXIT(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 999;
	condition = DIA_Addon_Ramon_EXIT_Condition;
	information = DIA_Addon_Ramon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Ramon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string BDT_1071_Checkpoint = "BL_UP_CHECK";

instance DIA_Addon_Ramon_FirstWarn(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 1;
	condition = DIA_Addon_Ramon_FirstWarn_Condition;
	information = DIA_Addon_Ramon_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,BDT_1071_Checkpoint) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};

	return FALSE;
};

func void DIA_Addon_Ramon_FirstWarn_Info()
{
	if(Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_00");	//Hej, co se tam stalo?
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_01");	//Zabil jsem Franca.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_02");	//A? Teď je to TVOJE práce ujistit se, že ti líní psi budou dělat svou práci.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_03");	//Hej, nejsem tady od toho zaneprázdňovat se s lovci. Chci jít do tábora.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_04");	//Na to zapomeň. Zabil jsi Franca - teď jsi velitel. Tak dělej svou práci.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_05");	//Pokud jsem velitel, tak rozhodnu, kdo je další na řadě.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_06");	//A rozhodl jsem, že JÁ jsem další.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_07");	//(směšně) Není to tak jednoduché. NIKOHO jsem se neptal, takže NIKDO nevstoupí.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_08");	//Thorus může poslat nového vůdce lovcům, potom pro mě bude volno uvnitř.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_09");	//(směšně) Ty se nevzdáš, co? Ok, tak pohni zadkem a pojď dovnitř.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_10");	//Thorus zajistí, aby lovci nebyli bez vůdce.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_11");	//Na co čekáš? A nezapomeň na krumpáč.
		self.aivar[AIV_PASSGATE] = TRUE;
		Player_HasTalkedToBanditCamp = TRUE;
		B_GivePlayerXP(XP_Addon_Hinein);
		AI_StopProcessInfos(self);
		AI_Teleport(Carlos,"BL_WAIT_FINN");
		B_StartOtherRoutine(Carlos,"START");
		B_StartOtherRoutine(Finn,"START");
	}
	else if(Ramon_News == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_12");	//Hej! Co chceš? Nezdá se mi, že máš povolení pro vstup do tábora.
		if(Npc_KnowsInfo(other,DIA_Addon_Franco_HI))
		{
			AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_13");	//Franco mě poslal. Chce vědět, jestli je někdo potřeba do tábora.
		};
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_14");	//Ano, někoho potřebujem. Včera chcípl další chlap.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_15");	//Ten idiot se zapletl s Estebanem.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_16");	//Kdo je Esteban?
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_17");	//Velitel dolní části tábora. Rozhoduje, kdo se dostane do dolu.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_18");	//Tak řekni Francovi, že Thorus chce nového muže. Chápeš?
		Log_CreateTopic(Topic_Addon_Franco,LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Franco,LOG_Running);
		B_LogEntry(Topic_Addon_Franco,"Thorus žádá nového člověka do tábora. To bude Franca zajímat.");
		Info_ClearChoices(DIA_Addon_Ramon_FirstWarn);
		Info_AddChoice(DIA_Addon_Ramon_FirstWarn,"Thorus? TEN Thorus?",DIA_Addon_Ramon_FirstWarn_YES);
		Info_AddChoice(DIA_Addon_Ramon_FirstWarn,"Thorus? Nikdy jsem o něm neslyšel...",DIA_Addon_Ramon_FirstWarn_NO);
		Ramon_News = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_19");	//Hej, zpomal! Sem se nedostaneš - tak vypadni!
		AI_StopProcessInfos(self);
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

func void DIA_Addon_Ramon_FirstWarn_YES()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_YES_15_00");	//Thorus? TEN Thorus?
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_01");	//Ano. TEN Thorus. TEN, který shání nové lidi.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_02");	//Muž, který rozhoduje jestli může nový chlap jít z bažin do tábora.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_03");	//Nesnažíš se mi říct, že ho znáš z dřívějška?
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_YES_15_04");	//No... ano...
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_05");	//Poslouchej - KAŽDÝ zná Thoruse.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_06");	//Nicméně, to ti nepomůže ke vstupu. A já tu nejsem na předávání jakýchkoliv zpráv!
	Info_ClearChoices(DIA_Addon_Ramon_FirstWarn);
};

func void DIA_Addon_Ramon_FirstWarn_NO()
{
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_NO_15_00");	//Thorus? Nikdy jsem o něm neslyšel...
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_01");	//Chlape ty ho neznáš? Byl velitelem stráží ve Starém táboře.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_02");	//Je to muž, kterému každý věří.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_03");	//Posílá pro nové lidi a rozhoduje, kdo může jít do tábora.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_04");	//Pokud přežiješ dost dlouho, tak ho poznáš.
	Info_ClearChoices(DIA_Addon_Ramon_FirstWarn);
};


instance DIA_Addon_Ramon_SecondWarn(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 2;
	condition = DIA_Addon_Ramon_SecondWarn_Condition;
	information = DIA_Addon_Ramon_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Ramon_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1071_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Addon_Ramon_SecondWarn_07_00");	//Ještě jeden krok a bude to tvůj poslední!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Ramon_Attack(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 3;
	condition = DIA_Addon_Ramon_Attack_Condition;
	information = DIA_Addon_Ramon_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Ramon_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1071_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Ramon_Attack_07_00");	//Někteří lidé se nikdy nepoučí...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Addon_Ramon_News(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 10;
	condition = DIA_Addon_Ramon_News_Condition;
	information = DIA_Addon_Ramon_News_Info;
	permanent = FALSE;
	description = "Jsem tady nový.";
};


func int DIA_Addon_Ramon_News_Condition()
{
	if(!Npc_IsDead(Franco))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Ramon_News_Info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_News_15_00");	//Jsem tady nový.
	AI_Output(self,other,"DIA_Addon_Ramon_News_07_01");	//Hej, nedělej ze mě blázna. Franco je ten, kdo rozhoduje, kdo z vás se dostane do tábora.
};


instance DIA_Addon_Ramon_Lie(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 10;
	condition = DIA_Addon_Ramon_Lie_Condition;
	information = DIA_Addon_Ramon_Lie_Info;
	permanent = FALSE;
	description = "Franco mě poslal...";
};


func int DIA_Addon_Ramon_Lie_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Ramon_News) && !Npc_IsDead(Franco))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Ramon_Lie_Info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_Lie_15_00");	//Franco mě poslal...
	AI_Output(self,other,"DIA_Addon_Ramon_Lie_07_01");	//Neposlal. Tak vypadni nebo ti zlámu kosti...
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Ramon_Perm(C_Info)
{
	npc = BDT_1071_Addon_Ramon;
	nr = 99;
	condition = DIA_Addon_Ramon_Perm_Condition;
	information = DIA_Addon_Ramon_Perm_Info;
	permanent = TRUE;
	description = "Všechno v pořádku?";
};


func int DIA_Addon_Ramon_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Ramon_News) && !Npc_IsDead(Franco))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Ramon_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_Perm_15_00");	//Všechno v pořádku?
	AI_Output(self,other,"DIA_Addon_Ramon_Perm_07_01");	//Ano všechno, pokud se nebude snažit dostat dovnitř ten, kdo NEMÁ.
	AI_StopProcessInfos(self);
};

