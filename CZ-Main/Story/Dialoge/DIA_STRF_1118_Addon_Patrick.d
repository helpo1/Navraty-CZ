
instance DIA_Addon_Patrick_EXIT(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 999;
	condition = DIA_Addon_Patrick_EXIT_Condition;
	information = DIA_Addon_Patrick_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Patrick_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Patrick_Hi(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Hi_Condition;
	information = DIA_Addon_Patrick_Hi_Info;
	permanent = FALSE;
	description = "Jsem zde na rozkaz mágů Vody a všechny vás osvobodím.";
};


func int DIA_Addon_Patrick_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_00");	//Jsem zde na rozkaz mágů Vody a všechny vás osvobodím.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_01");	//(podezřívavě) Opravdu? Proč bych ti měl věřit?
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_02");	//Tak chcete odsud vypadnout nebo ne?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_03");	//Samozřejmě, že chci - ale...
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_04");	//Vatras mě poslal. Jestli se vám to nezdá dobré, pak můžete hnít v této díře, o což se postarám.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_05");	//(rychle) V pořádku, věřím ti.
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_06");	//(zaraženě) Opravdu? Bylo to jednodušší, než jsem očekával. OK, vše, co nyní potřebujeme, je plán.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_07");	//Pokusit se o útěk je příliš riskantní. William to zkoušel a koupil si farmu.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_08");	//Vězni jsou rolníci a dělníci - věří mi, ale nebudou riskovat nebezpečí.
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
	Info_AddChoice(DIA_Addon_Patrick_Hi,"Očekáváte mne, abych dostal pro vás od Ravena milost?",DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice(DIA_Addon_Patrick_Hi,"To musím zabít všechny bandity, abyste si pohli?",DIA_Addon_Patrick_Hi_Kill);
};

func void B_Say_Patrick_Plan()
{
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_00");	//Ale to není plán.
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_01");	//Jen nás ujisti, že stráže na nás nezaútočí, a my půjdeme odsud pryč.
	AI_Output(other,self,"DIA_Addon_Patrick_Plan_15_02");	//Dobrá, postarám se o to. Řekni ostatním, aby se připravili.
	B_LogEntry(TOPIC_Addon_Sklaven,"Otroci se nepokusí o útěk. Musím najít způsob, aby odešli bez námitek.");
};

func void DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Raven_15_00");	//Očekáváte ode mne, že pro vás dostanu od Ravena milost?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Raven_07_01");	//(usměvavě) To by nebylo tak špatné.
	B_Say_Patrick_Plan();
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
};

func void DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Kill_15_00");	//To musím zabít všechny bandity, abyste se pohli?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Kill_07_01");	//(překvapeně) To by bylo šílenství!
	B_Say_Patrick_Plan();
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
};


instance DIA_Addon_Patrick_ready(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_ready_Condition;
	information = DIA_Addon_Patrick_ready_Info;
	permanent = FALSE;
	description = "Vše v pohodě, můžete jít.";
};


func int DIA_Addon_Patrick_ready_Condition()
{
	if(((Ready_Togo == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi)) || (Npc_IsDead(PrisonGuard) && Npc_IsDead(Bloodwyn) && Npc_KnowsInfo(other,DIA_Addon_Thorus_Answer)) || (Npc_IsDead(Thorus) && Npc_IsDead(Bloodwyn) && Npc_IsDead(PrisonGuard)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Patrick_ready_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_00");	//Vše v pohodě, můžete jít.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_01");	//Dobře, znám jeskyni v bažinách. Shromáždíme se tam, ale co budeme dělat pak?
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_02");	//Dejte se močálem přímo k jihozápadu. Mágové Vody si tam v ruinách založili tábor.
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_03");	//Ukážou vám cestu z tohohle údolí.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_04");	//Děkuji ti, děkuji ti moc. (formálně) Jsme ti hluboce zavázáni...
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_05");	//Nechte to tak.
	Sklaven_Flucht = TRUE;
	B_GivePlayerXP(XP_Addon_Flucht);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLUCHT");
	B_StartOtherRoutine(Telbor,"FLUCHT");
	B_StartOtherRoutine(Tonak,"FLUCHT");
	B_StartOtherRoutine(Pardos,"FLUCHT");
	B_StartOtherRoutine(Monty,"FLUCHT");
	B_StartOtherRoutine(Buddler_1,"WORK");
	B_StartOtherRoutine(Buddler_2,"WORK");
	B_StartOtherRoutine(Buddler_3,"WORK");
};


instance DIA_Addon_Patrick_Killer(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Killer_Condition;
	information = DIA_Addon_Patrick_Killer_Info;
	permanent = FALSE;
	description = "Stráže jsou vyřízeny, můžete jít.";
};


func int DIA_Addon_Patrick_Killer_Condition()
{
	if(Npc_IsDead(PrisonGuard) && (Ready_Togo == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Patrick_Hi))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Patrick_Killer_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Killer_15_00");	//Stráže jsou vyřízeny, můžete jít.
	AI_Output(self,other,"DIA_Addon_Patrick_Killer_07_01");	//A co se stane, když opustíme důl? Ostatní stráže nás zabijí, kdekoliv si stoupneme. Nikdy. Příliš riskantní.
};


instance DIA_Addon_Patrick_Hoehle(C_Info)
{
	npc = STRF_1118_Addon_Patrick;
	nr = 2;
	condition = DIA_Addon_Patrick_Hoehle_Condition;
	information = DIA_Addon_Patrick_Hoehle_Info;
	permanent = TRUE;
	description = "Nechcete odejít?";
};


func int DIA_Addon_Patrick_Hoehle_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_BL_HOEHLE_04") <= 1000)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Patrick_Hoehle_Info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hoehle_15_00");	//Nechcete odejít?
	AI_Output(self,other,"DIA_Addon_Patrick_Hoehle_07_01");	//Samozřejmě, že chceme. Pouze čekáme na vhodou příležitost.
};

