
instance DIA_GornNW_nach_DJG_KAP5_EXIT(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 999;
	condition = DIA_GornNW_nach_DJG_KAP5_EXIT_Condition;
	information = DIA_GornNW_nach_DJG_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornNW_nach_DJG_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornNW_nach_DJG_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornNW_nach_DJG_AllDragonsDead(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 59;
	condition = DIA_GornNW_nach_DJG_AllDragonsDead_Condition;
	information = DIA_GornNW_nach_DJG_AllDragonsDead_Info;
	permanent = TRUE;
	description = "Odpočinul sis?";
};


func int DIA_GornNW_nach_DJG_AllDragonsDead_Condition()
{
	if((Gorn_IsOnBoard != LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_00");	//Odpočinul sis?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_01");	//Jasně, proč ne? Draci jsou mrtví ne?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_02");	//Je to trochu složitější.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_03");	//(směje se) No. Jako vždy. Řekni mi, až budeš potřebovat mou sekeru.
};


instance DIA_GornNW_nach_DJG_KnowWhereEnemy(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition;
	information = DIA_GornNW_nach_DJG_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Možná se mi budeš hodit ty i tvá sekera.";
};


func int DIA_GornNW_nach_DJG_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Gorn_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00");	//Možná se mi budeš hodit ty i tvá sekera.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01");	//Dobrá. Nepřekvapuje mě to. Co pro tebe můžu udělat?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02");	//Plavil by ses se mnou na ostrov a nakopal pár nepřátelských zadků?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03");	//(směje se) Jasně. Hned teď. Jen mi řekni, co mám dělat.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Gorn se velmi zajímal, když jsem mu řekl o ostrovu. Pokud se mi bude hodit dobrá sekera, měl bych ho vzít sebou.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04");	//Teď mám plnou posádku, ale budu myslet na to vzít tě taky na palubu.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05");	//Pokud kvůli mě budeš muset někoho vyhodit, tak zvol toho nejslabšího.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06");	//V těchto drsných časech potřebuješ každou ruku.
	}
	else
	{
		Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy,"Pokud se něco naskytne, tak ti o tom řeknu.",DIA_GornNW_nach_DJG_KnowWhereEnemy_No);
		Info_AddChoice(DIA_GornNW_nach_DJG_KnowWhereEnemy,"Popluj se mnou. Počkej na mě v přístavu.",DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes);
	};
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00");	//Popluj se mnou, počkej na mě v přístavu.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01");	//Loď? Ha! Řeknu ti jedno. Nikdy s tebou není nuda. Uvidíme se později.
	B_GivePlayerXP(XP_Crewmember_Success);
	Gorn_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
};

func void DIA_GornNW_nach_DJG_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00");	//Oznámím ti, až bude čas.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01");	//Dobře.
	Gorn_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_GornNW_nach_DJG_KnowWhereEnemy);
};


instance DIA_GornNW_nach_DJG_LeaveMyShip(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_LeaveMyShip_Condition;
	information = DIA_GornNW_nach_DJG_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Možná bude lepší, když zůstaneš tady.";
};


func int DIA_GornNW_nach_DJG_LeaveMyShip_Condition()
{
	if((Gorn_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_LeaveMyShip_15_00");	//Možná bude lepší, když zůstaneš tady.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_LeaveMyShip_12_01");	//To tě mám nechat jít samotného? Mmh. Není to pro mě jednoduché, ale je to tvůj boj. Pokud bys mě přece jen chtěl, tak přijď.
	Gorn_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GornNW_nach_DJG_StillNeedYou(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 55;
	condition = DIA_GornNW_nach_DJG_StillNeedYou_Condition;
	information = DIA_GornNW_nach_DJG_StillNeedYou_Info;
	permanent = TRUE;
	description = "Vrať se. Potřebuji tě!";
};


func int DIA_GornNW_nach_DJG_StillNeedYou_Condition()
{
	if((Gorn_IsOnBoard == LOG_OBSOLETE) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornNW_nach_DJG_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_StillNeedYou_15_00");	//Vrať se. Potřebuji tě!
	AI_Output(self,other,"DIA_GornNW_nach_DJG_StillNeedYou_12_01");	//Tady jsi. A já si myslel, že mě tady necháš zhnít, zatímco ty si budeš užívat. Uvidíme se později.
	Gorn_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Fighter_nach_DJG_PICKPOCKET(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 900;
	condition = DIA_Fighter_nach_DJG_PICKPOCKET_Condition;
	information = DIA_Fighter_nach_DJG_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Fighter_nach_DJG_PICKPOCKET_Condition()
{
	return C_Beklauen(10,25);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_nach_DJG_PICKPOCKET,Dialog_Back,DIA_Fighter_nach_DJG_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_nach_DJG_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fighter_nach_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
};

func void DIA_Fighter_nach_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_nach_DJG_PICKPOCKET);
};


instance DIA_FIGHTER_NACH_DJG_NW_KAPITELORCATTACK(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_kapitelorcattack_condition;
	information = dia_fighter_nach_djg_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Pořád bojuješ?";
};


func int dia_fighter_nach_djg_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (FIGHTERBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_kapitelorcattack_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_00");	//Pořád bojuješ?
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_01");	//Samozřejmě!... (udiveně) ty jsi o tom pochyboval?!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_04");	//A bez toho by má sekera za chvílí zrezla...
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_05");	//Ale už mám unavené a poškrábané ruce! Potřebuji trochu vydechnout a pak jim zas ukážu, s kým se dali do křížku.
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_10");	//No výborně! Věřím tvým schopnostem. Uvidíme se později!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_KapitelOrcAttack_01_11");	//Jistě příteli.
	B_LogEntry(TOPIC_HELPCREW,"Jak jsem předpokládal Gorn se připojí k těm, kteří se pokusí prorazit městem. Abych řekl pravdu, doufám, že se z toho dostane živý.");
	FIGHTERBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_FIGHTER_NACH_DJG_NW_ESCAPE(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_escape_condition;
	information = dia_fighter_nach_djg_nw_escape_info;
	permanent = FALSE;
	description = "Jsem rád, že tě vidím zdravého a v pořádku!";
};


func int dia_fighter_nach_djg_nw_escape_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (REPLACEPLACESCREW == TRUE) && (Gorn_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_escape_info()
{
	var int countsuv;
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_Escape_01_01");	//Jsem rád, že tě vidím zdravého a v pořádku!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_Escape_01_02");	//Abych řekl pravdu... (směje se) tak já taky!
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_Escape_01_03");	//Znamená to, že je možné se probít přes město?!
	if((COUNTCAPTURED > 0) || (COUNTKILLERS > 0))
	{
		countsuv = COUNTSURVIVERS * 100;
		B_GivePlayerXP(countsuv);
		AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_Escape_01_04");	//Jak pro mě, tak pro tebe je to možné! Každopádně ne všichni to dokázali.
		if((COUNTCAPTURED > 0) && (COUNTKILLERS == 0))
		{
			AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_Escape_01_05");	//Mnoho z našich padlo do zajetí. (smutně) Co s nimi teď skřeti udělají to ví jen Innos!
			B_LogEntry(TOPIC_HELPCREW,"Na Onarově farmě jsem potkal Gorna zdravého a v pořádku, to jsou dobré zprávy!");
			Log_AddEntry(TOPIC_HELPCREW,"Pravdy nebylo dosaženo bez následků! Řekl mi, že hodně mužů bylo zajato skřety při pokusu prorazit přes město. Doufám, že jsou stále naživu!");
		}
		else if((COUNTCAPTURED > 0) && (COUNTKILLERS > 0))
		{
			AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_Escape_01_06");	//Počet skřetů se velmi zvýšil... Smutné je, že hodně našich se z bitvy už nikdy nevrátí!
			B_LogEntry(TOPIC_HELPCREW,"Na Onarově farmě jsem potkal Gorna zdravého a v pořádku, to jsou dobré zprávy!");
			Log_AddEntry(TOPIC_HELPCREW,"Pravdy nebylo dosaženo bez následků! Řekl mi, že hodně mužů bylo zajato skřety při pokusu prorazit přes město. Doufám, že jsou stále naživu. Jsou taky i ti o které jsme přišli.");
		};
		AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_Escape_01_07");	//Ano to nejsou moc dobré zprávy.
		AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_Escape_01_08");	//To je očividné! Ale s tím už nic nezmůžem.
		AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_Escape_01_09");	//To vidím.
	}
	else if(COUNTSURVIVERS > 0)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_Escape_01_10");	//Jak vidíš a podle toho, co vím, podařilo se to všem, kteří byli na lodi.
		AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_Escape_01_11");	//Ano to jsou skvělé zrávy!
		AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_Escape_01_12");	//Souhlasím... (směje se) Doteď nevím, komu děkovat za tak spásnou záchranu!
		B_LogEntry(TOPIC_HELPCREW,"Na Onarově farmě jsem znovu potkal Gorna, zdravého a v pořádku. To jsou dobré zprávy! A i ostatní se dostali přes město.");
	};
	MIS_HELPCREW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_SUCCESS);
};


instance DIA_FIGHTER_NACH_DJG_NW_SOONBATTLE(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_soonbattle_condition;
	information = dia_fighter_nach_djg_nw_soonbattle_info;
	permanent = FALSE;
	description = "Skřeti nenechají tuto farmu na pokoji!";
};


func int dia_fighter_nach_djg_nw_soonbattle_condition()
{
	if((MIS_HELPCREW == LOG_SUCCESS) && (STOPBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_soonbattle_info()
{
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_SoonBattle_01_00");	//Skřeti nenechají tuto farmu na pokoji! Za chvíli s nimi budeme bojovat.
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_SoonBattle_01_01");	//V to taky doufám! Má sekera byla unavena z čekání, než jich může pár dodělat.
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_SoonBattle_01_02");	//Ty se nezměníš! Líbí se mi tvá nálada.
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_SoonBattle_01_03");	//Ha, ha, ha... Vždyť mě znáš příteli!
};


instance DIA_FIGHTER_NACH_DJG_NW_SOONBATTLENOW(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_soonbattlenow_condition;
	information = dia_fighter_nach_djg_nw_soonbattlenow_info;
	permanent = FALSE;
	description = "Jak to jde před bojem?";
};


func int dia_fighter_nach_djg_nw_soonbattlenow_condition()
{
	if((STOPBIGBATTLE == FALSE) && (MOVEFORCESCOMPLETE_01 == TRUE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_soonbattlenow_info()
{
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_SoonBattleNow_01_00");	//Jak to jde před bojem?
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_SoonBattleNow_01_01");	//Neměj strach, jsem připraven! Hlavně, aby si skřeti útok nerozmysleli.
};


instance DIA_FIGHTER_NACH_DJG_NW_BATTLEWIN(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_battlewin_condition;
	information = dia_fighter_nach_djg_nw_battlewin_info;
	permanent = FALSE;
	description = "Zvítězily jsme!";
};


func int dia_fighter_nach_djg_nw_battlewin_condition()
{
	if((STOPBIGBATTLE == TRUE) && (HUMANSWINSBB == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_battlewin_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_BattleWin_01_00");	//Zvítězili jsme!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_BattleWin_01_01");	//Ano, příteli... byl to pěkný boj! Dlouho jsem si tak nezacvičil se sekerou.
	if(HORINISISFREE == FALSE)
	{
		AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_BattleWin_01_02");	//Ale neradujme se brzy. Co vím, tak skřeti zatím mají město pod kontrolou.
		AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_BattleWin_01_03");	//Každopádně. Teď se s nimi vypořádáme.
		AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_BattleWin_01_04");	//Jasně... Pokud budeš ještě potřebovat mé služby, tak mi dej vědět!
	};
};


instance DIA_FIGHTER_NACH_DJG_NW_GOONORKSHUNT(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_goonorkshunt_condition;
	information = dia_fighter_nach_djg_nw_goonorkshunt_info;
	permanent = FALSE;
	description = "Nechtěl bys se mnou lovit skřety?";
};


func int dia_fighter_nach_djg_nw_goonorkshunt_condition()
{
	if((HAGENGIVEHELP == TRUE) && (ALLGREATVICTORY == FALSE) && (GORNTOBIGLAND == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && Npc_KnowsInfo(hero,dia_fighter_nach_djg_nw_battlewin))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_GoOnOrksHunt_01_00");	//Nechtěl bys se mnou lovit skřety?
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_GoOnOrksHunt_01_01");	//To jsou otázky?!... (udiveně) Samozřejmě chci!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_GoOnOrksHunt_01_02");	//Ještě jsem ti neřekl, že moje sekera vždy dychtí po těchto hovadech.
	GORNJOINMEHUNT = TRUE;
};


instance DIA_FIGHTER_NACH_DJG_NW_FOLLOWME(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_followme_condition;
	information = dia_fighter_nach_djg_nw_followme_info;
	permanent = TRUE;
	description = "Pojď se mnou!";
};


func int dia_fighter_nach_djg_nw_followme_condition()
{
	if((GORNJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && (GORNTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_followme_info()
{
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_FollowMe_01_00");	//Pojď se mnou!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_FollowMe_01_01");	//Kupředu příteli.
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_FIGHTER_NACH_DJG_NW_STOPHERE(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_stophere_condition;
	information = dia_fighter_nach_djg_nw_stophere_info;
	permanent = TRUE;
	description = "Počkej tady!";
};


func int dia_fighter_nach_djg_nw_stophere_condition()
{
	if((GORNJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (ALLDISMISSFROMHUNT == FALSE) && (GORNTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_stophere_info()
{
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_StopHere_01_00");	//Počkej tady!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_StopHere_01_01");	//Ale teprve jsme začali... nechci tady zahálet!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_StopHere_01_03");	//Dobře, jak říkáš.
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_FIGHTER_NACH_DJG_NW_ALLGREATVICTORY(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_allgreatvictory_condition;
	information = dia_fighter_nach_djg_nw_allgreatvictory_info;
	permanent = FALSE;
	description = "Věřím, že mě budeš za chvíli potřebovat.";
};


func int dia_fighter_nach_djg_nw_allgreatvictory_condition()
{
	if((ALLGREATVICTORY == TRUE) && (GORNTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_allgreatvictory_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_00");	//Věřím, že mě budeš za chvíli potřebovat.
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_01");	//Proč myslíš?
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_02");	//Jednoduše, protože v této části ostrova není už jediný skřet!
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_03");	//V tom nevidím problém... Hornické údolí je jich plné.
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_AllGreatVictory_01_06");	//Bude nezbytné se tam porozhlédnout...
};


instance DIA_FIGHTER_NACH_DJG_NW_WHATDONOW(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_whatdonow_condition;
	information = dia_fighter_nach_djg_nw_whatdonow_info;
	permanent = FALSE;
	description = "Jaké jsou plány?";
};


func int dia_fighter_nach_djg_nw_whatdonow_condition()
{
	if((ALLGREATVICTORY == TRUE) && (GORNTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_whatdonow_info()
{
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_WhatDoNow_01_00");	//Jaké jsou plány?
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_WhatDoNow_01_01");	//Potom všem... (jistě) Stejně nemám místo, kam bych šel.
};


instance DIA_FIGHTER_NACH_DJG_NW_TRAVELONBIGLAND(C_Info)
{
	npc = PC_Fighter_NW_nach_DJG;
	nr = 1;
	condition = dia_fighter_nach_djg_nw_travelonbigland_condition;
	information = dia_fighter_nach_djg_nw_travelonbigland_info;
	permanent = FALSE;
	description = "Pluji na pevninu, jdeš se mnou?";
};


func int dia_fighter_nach_djg_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_fighter_nach_djg_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_00");	//Pluji na pevninu. Jdeš se mnou?
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_01");	//(směje se) Samozřejmě... a už se neptej!
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_02");	//Tvrdí se, že je to tam teď zaplavené skřety.
	AI_Output(self,other,"DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_03");	//A co je pro mě rozhodující... že tady bych se stejně jen nudil!
	AI_Output(other,self,"DIA_Fighter_nach_DJG_NW_TravelOnBigLand_01_04");	//Dobře, tak pojď na loď.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	GORNTOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Předpokládám, že Gorn popluje se mnou.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

