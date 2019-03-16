
instance DIA_Addon_Franco_EXIT(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 999;
	condition = DIA_Addon_Franco_EXIT_Condition;
	information = DIA_Addon_Franco_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Franco_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_EXIT_Info()
{
	if((Franco_Exit == FALSE) && (MIS_HlpLogan == LOG_Running))
	{
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");	//Nezůstávej pozadu nebo skončíš jako krmení pro žraloky.
		Franco_Exit = TRUE;
	};
	AI_StopProcessInfos(self);
};

instance DIA_Franco_PICKPOCKET(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 900;
	condition = DIA_Franco_PICKPOCKET_Condition;
	information = DIA_Franco_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Ukrást tento amulet bude riskantní.)";
};

func int DIA_Franco_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItAm_Addon_Franco) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Franco_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Franco_PICKPOCKET);
	Info_AddChoice(DIA_Franco_PICKPOCKET,Dialog_Back,DIA_Franco_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Franco_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Franco_PICKPOCKET_DoIt);
};

func void DIA_Franco_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		B_GiveInvItems(self,other,ItAm_Addon_Franco,1);
		B_GivePlayerXP(XP_Ambient);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		Info_ClearChoices(DIA_Franco_PICKPOCKET);
	}
	else
	{
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Franco_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Franco_PICKPOCKET);
};


instance DIA_Addon_Franco_HI(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 1;
	condition = DIA_Addon_Franco_HI_Condition;
	information = DIA_Addon_Franco_HI_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Franco_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_HI_Info()
{
	Log_CreateTopic(Topic_Addon_Franco,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Franco,LOG_Running);
	B_LogEntry(Topic_Addon_Franco,"Jestli budu dělat dobře práci od Franca, pustí mě do tábora.");
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_00");	//Hej, co hledáš? Chceš se dostat do tábora?
	AI_Output(other,self,"DIA_Addon_Franco_HI_15_01");	//Jo, to chci...
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_02");	//Nezajímá mě, kdo jsi. Já jsem Franco, vedu to tady.
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_03");	//Když se budeš venku snažit, tak tě vezmu do tábora.
	if(Ramon_News == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Franco_HI_08_04");	//Ramon, strážce brány, ti řekne, jestli potřebuje nové lidi v táboře. Promluv si s ním.
		B_LogEntry(Topic_Addon_Franco,"Mám se zaptat Ramona, strážce brány, jestli nepotřebuje nové lidi.");
	};
};


instance DIA_Addon_Franco_Hai(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 2;
	condition = DIA_Addon_Franco_Hai_Condition;
	information = DIA_Addon_Franco_Hai_Info;
	permanent = FALSE;
	description = "Thorus potřebuje nové lidi.";
};


func int DIA_Addon_Franco_Hai_Condition()
{
	if(Ramon_News == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Franco_Hai_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_00");	//Thorus potřebuje nové lidi.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_01");	//Dobře. Postarám se o to.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_02");	//Moment, a co já?
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_03");	//Ještě jsi ničeho nedosáhl.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_04");	//Potřebuji hodně dobrých lidí a ty o té práci nevíš nic.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_05");	//Ok, chceš šanci? Dostaneš ji. Hlas se u Logana. Ti močáloví žraloci ho fakt štvou.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_06");	//Pomoz mu je vyřídit, potom budeš pro tábor dobrý.
	B_LogEntry(Topic_Addon_Franco,"Franco chce, abych pomohl Loganovi. Pak mě pustí do tábora.");
};


instance DIA_Addon_Franco_Wo(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 3;
	condition = DIA_Addon_Franco_Wo_Condition;
	information = DIA_Addon_Franco_Wo_Info;
	permanent = FALSE;
	description = "Kde najdu Logana?";
};


func int DIA_Addon_Franco_Wo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_Hai) && !Npc_IsDead(Logan) && (MIS_HlpLogan == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Franco_Wo_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Wo_15_00");	//Kde najdu Logana?
	AI_Output(self,other,"DIA_Addon_Franco_Wo_08_01");	//Když stojíš před vstupem do tábora, jdi doleva podél skály. Tam na něho narazíš.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Franco_tot(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 5;
	condition = DIA_Addon_Franco_tot_Condition;
	information = DIA_Addon_Franco_tot_Info;
	permanent = FALSE;
	description = "Logan je mrtvý.";
};


func int DIA_Addon_Franco_tot_Condition()
{
	if((MIS_HlpLogan != LOG_SUCCESS) && Npc_IsDead(Logan) && Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Franco_tot_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_tot_15_00");	//Logan je mrtvý.
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_01");	//Kruci. Byl to ten nejlepší lovec, kterého jsme venku měli. K sakru s tím.
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_02");	//Ok, bojoval jsi s močálovými žraloky - můžeš být užitečný - dokonce víc než většina lidí tady.
	if(MIS_HlpLogan == LOG_Running)
	{
		MIS_HlpLogan = LOG_OBSOLETE;
	};
};


instance DIA_Addon_Franco_HaiSuccess(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 6;
	condition = DIA_Addon_Franco_HaiSuccess_Condition;
	information = DIA_Addon_Franco_HaiSuccess_Info;
	permanent = FALSE;
	description = "Pomohl jsem Loganovi.";
};


func int DIA_Addon_Franco_HaiSuccess_Condition()
{
	if((MIS_HlpLogan == LOG_SUCCESS) && Npc_KnowsInfo(other,DIA_Addon_Franco_Hai))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Franco_HaiSuccess_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_00");	//Pomohl jsem Loganovi.
	if(Npc_IsDead(Logan))
	{
		AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_01");	//Ale on to nepřežil.
	};
	AI_Output(self,other,"DIA_Addon_Franco_HaiSuccess_08_02");	//DOBRÁ, bojoval jsi proti močálovým žralokům - mohl bys být užitečný - přinejmenším víc, než většina zdejších chlapů.
	B_GivePlayerXP(XP_Addon_HlpLogan);
	B_LogEntry(Topic_Addon_Franco,"Pomoc Loganovi Francovi nestačila k tomu, aby mě pustil do tábora.");
};


instance DIA_Addon_Franco_Mis2(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 7;
	condition = DIA_Addon_Franco_Mis2_Condition;
	information = DIA_Addon_Franco_Mis2_Info;
	permanent = FALSE;
	description = "Můžu teď do tábora?";
};


func int DIA_Addon_Franco_Mis2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess) || Npc_KnowsInfo(other,DIA_Addon_Franco_tot))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Franco_Mis2_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_MIS2_15_00");	//Můžu teď do tábora?
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_01");	//Poslouchej - je tu ještě jedna věc, jestli chceš.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_02");	//Před několika dny jsem poslal Edgora do močálu.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_03");	//Měl pro mě získat starou kamennou tabulku - ale od té doby ho nikdo neviděl.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_04");	//Zjisti co dělá, a přines mi tu zatracenou kamennou tabulku!
	MIS_HlpEdgor = LOG_Running;
	Log_CreateTopic(Topic_Addon_Stoneplate,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Stoneplate,LOG_Running);
	B_LogEntry(Topic_Addon_Stoneplate,"Franco chce kamennou tabulku, kterou mu měl donést Edgor. Teď je to na mě.");
	B_LogEntry(Topic_Addon_Franco,"Franco chce, abych nejprve pomohl Edgorovi, než mě pustí do tábora.");
};


instance DIA_Addon_Franco_While(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 8;
	condition = DIA_Addon_Franco_While_Condition;
	information = DIA_Addon_Franco_While_Info;
	permanent = FALSE;
	description = "Jak to vypadá se zlatem?";
};


func int DIA_Addon_Franco_While_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_HaiSuccess))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Franco_While_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_While_15_00");	//Jak to vypadá se zlatem?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_01");	//Co?
	AI_Output(other,self,"DIA_Addon_Franco_While_15_02");	//Dostanu za svoji práci v močálu zaplaceno?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_03");	//(extrémně přátelsky) Tak ty chceš zlato? Jasně, řekni si, kolik? Padesát nugetů? Sto? Dám ti kolik jen uneseš...
	AI_Output(self,other,"DIA_Addon_Franco_While_08_04");	//(řve) Kdo si sakra myslíš, že jsi? Děláš si ze mě srandu?!
	AI_Output(self,other,"DIA_Addon_Franco_While_08_05");	//Teď pohni tím svým zadkem a začni něco dělat! Jinak nedostaneš ani malou střepinu zlata!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Franco_WOEDGOR(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 9;
	condition = DIA_Addon_Franco_WOEDGOR_Condition;
	information = DIA_Addon_Franco_WOEDGOR_Info;
	permanent = TRUE;
	description = "No, tak kde najdu Edgora?";
};


func int DIA_Addon_Franco_WOEDGOR_Condition()
{
	if((MIS_HlpEdgor == LOG_Running) && (Npc_HasItems(other,ItMi_Addon_Stone_04) < 1))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Franco_WOEDGOR_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_15_00");	//(vzdychne) No, tak kde najdu Edgora?
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_08_01");	//Chceš lehkou nebo rychlou cestu?
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice(DIA_Addon_Franco_WOEDGOR,"Tu rychlou.",DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice(DIA_Addon_Franco_WOEDGOR,"Řekni jen tu cestu.",DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output(self,other,"DIA_Addon_Franco_There_08_00");	//Všude okolo jsou ruiny. Někde tam bude.
	AI_Output(self,other,"DIA_Addon_Franco_There_08_01");	//Myslím, že bude dost chytrý na to, aby si udělal oheň. To by ti mohlo pomoct.
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00");	//Řekni jen tu cestu.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01");	//Jdi po té lávce až k přední bráně. Tam bude Sancho.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02");	//Tam jdi doleva a zase po lávce.
	B_Addon_Franco_There();
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00");	//Tu rychlou.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01");	//Ok. Jdi tedy odtud úhlopříčně doleva a přejdi lávku do močálu.
	B_Addon_Franco_There();
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
};


instance DIA_Addon_Franco_tafel(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 10;
	condition = DIA_Addon_Franco_tafel_Condition;
	information = DIA_Addon_Franco_tafel_Info;
	permanent = FALSE;
	description = "Tady je ta tabulka.";
};


func int DIA_Addon_Franco_tafel_Condition()
{
	if((Npc_HasItems(other,ItMi_Addon_Stone_04) >= 1) && (MIS_HlpEdgor == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Franco_tafel_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_tafel_15_00");	//Tady je ta tabulka.
	B_GiveInvItems(other,self,ItMi_Addon_Stone_04,1);
	AI_Output(self,other,"DIA_Addon_Franco_tafel_08_01");	//Ok, velmi dobře. Ravena to určitě potěší.
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_HlpEdgor);
	B_LogEntry(Topic_Addon_Franco,"Donesl jsem Francovi tu tabulku, co chtěl.");
};


instance DIA_Addon_Franco_JemandAnderen(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 11;
	condition = DIA_Addon_Franco_JemandAnderen_Condition;
	information = DIA_Addon_Franco_JemandAnderen_Info;
	permanent = FALSE;
	description = "A co s táborem? Můžu už konečně vstoupit?";
};


func int DIA_Addon_Franco_JemandAnderen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_tafel))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Franco_JemandAnderen_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_JemandAnderen_15_00");	//A co s táborem? Můžu už konečně vstoupit?
	if(!Npc_IsDead(Logan))
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_01");	//Ne, poslal jsem Logana. Byl na mém seznamu výše.
		Logan_Inside = TRUE;
		AI_Teleport(Logan,"BL_INN_CORNER_02");
		B_StartOtherRoutine(Logan,"LAGER");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_02");	//Ne, už jsem poslal někoho jiného.
	};
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_03");	//A za další, oni v táboře nikoho nepotřebují.
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_04");	//Ale já tě tady využiju dobře, (šklebí se) Teď, když už tu Logan není.
	B_LogEntry(Topic_Addon_Franco,"Franco mě nepustí do tábora. Myslím, že se s tímhle problémem vypořádám jinak...");
};


instance DIA_Addon_Franco_Fight(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 12;
	condition = DIA_Addon_Franco_Fight_Condition;
	information = DIA_Addon_Franco_Fight_Info;
	permanent = TRUE;
	description = "OKAMŽITĚ mě pusť dovnitř!";
};


func int DIA_Addon_Franco_Fight_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_Fight_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_15_00");	//OKAMŽITĚ mě pusť dovnitř!
	AI_Output(self,other,"DIA_Addon_Franco_Fight_08_01");	//(výhružně) A co když ne?
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	Info_AddChoice(DIA_Addon_Franco_Fight,"Potom budu čekat o chvíli déle...",DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice(DIA_Addon_Franco_Fight,"Pak toho budeš litovat.",DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Duel_15_00");	//Pak toho budeš litovat.
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Duel_08_01");	//Chceš mi vyhrožovat? TY? Chceš vyhrožovat MĚ? - měl bys dostat lekci...
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Nothing_15_00");	//Potom budu čekat o chvíli déle...
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Nothing_08_01");	//(posmívá se) Jasně.
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Franco_Pig(C_Info)
{
	npc = BDT_1093_Addon_Franco;
	nr = 13;
	condition = DIA_Addon_Franco_Pig_Condition;
	information = DIA_Addon_Franco_Pig_Info;
	permanent = TRUE;
	description = "Ty svině! Teď si to s tebou vyřídím!";
};


func int DIA_Addon_Franco_Pig_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Franco_JemandAnderen))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Franco_Pig_Info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Pig_15_00");	//Ty svině! Teď si to s tebou vyřídím!
	AI_Output(self,other,"DIA_Addon_Franco_Pig_08_01");	//(zahořkle) Takový malý trpaslík se se mnou chce měřit? Jak chceš!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

