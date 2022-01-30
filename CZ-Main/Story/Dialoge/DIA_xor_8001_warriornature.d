
var int luzian_betreten;

instance XOR_8001_WARRIORNATURE_EXIT(C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	nr = 999;
	condition = xor_8001_warriornature_exit_condition;
	information = xor_8001_warriornature_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int xor_8001_warriornature_exit_condition()
{
	return TRUE;
};

func void xor_8001_warriornature_exit_info()
{
	AI_StopProcessInfos(self);
};


instance XOR_8001_WARRIORNATURE_FOUND(C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	nr = 1;
	condition = xor_8001_warriornature_found_condition;
	information = xor_8001_warriornature_found_info;
	important = TRUE;
	permanent = FALSE;
};


func int xor_8001_warriornature_found_condition()
{
	if((GUARDIAN_RING == TRUE) && !Npc_IsDead(luzian_demon))
	{
		return TRUE;
	};
};

func void xor_8001_warriornature_found_info()
{
	LUZIAN_BETRETEN = FALSE;
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_01");	//Strážci mi prý poslali někoho na pomoc.
	AI_Output(other,self,"XOR_8001_WarriorNature_Found_02");	//Strážci... Jak o mě víš?!
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_03");	//Říkali, že budeš mít tento prsten... Kdo ti ho dal?
	AI_Output(other,self,"XOR_8001_WarriorNature_Found_04");	//Dagoth.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_05");	//Ano, Strážce. Toto je symbol jejich moci - proto jsem s tebou začal mluvit.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_06");	//Proč ti ho dali?
	AI_Output(other,self,"XOR_8001_WarriorNature_Found_07");	//Mám vyhledat a zabít démona Luciana. Můžeš mi pomoci?
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_08");	//Nech mě myslet.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_09");	//Říkal jsi Lucian? Tak to jsi ho právě našel - je v té jeskyni za mnou.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_10");	//Je dobře, že mě poslali - ten démon by tě rozsekal drápy na kousky!
	AI_Output(other,self,"XOR_8001_WarriorNature_Found_11");	//A jak víš, že je tu?!
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_12");	//Je tu, věř mi. Lovíme ho více než tisíc let.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_13");	//A konečně jsem ho zahnal do pasti. Ale Lucian je silný a jeden na něj nestačí.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_14");	//Tak jsem požádal Strážce o pomoc a oni poslali tebe.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_15");	//Mám jít do jeskyně s tebou.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_16");	//Připraven?
	Info_ClearChoices(xor_8001_warriornature_found);
	B_LogEntry(TOPIC_GUARDIANSTEST,"V údolí pod Xardasovou věží jsem narazil na jednoho válečníka. Shodli jsme se, že jsme tu z jednoho důvodu - zničit démona Luciana, který se schovává v jeskyni.");
	Info_AddChoice(xor_8001_warriornature_found,"Počkej, musím se připravit!",xor_8001_warriornature_found_no);
	Info_AddChoice(xor_8001_warriornature_found,"Pojďme ho zničit!",xor_8001_warriornature_found_yes);
};

func void xor_8001_warriornature_found_no()
{
	AI_Output(other,self,"XOR_8001_WarriorNature_Found_17");	//Počkej, musím se připravit!
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_18");	//Bojíš se? Dobrá, já počkám.
	LUZIAN_BETRETEN = TRUE;
	Info_ClearChoices(xor_8001_warriornature_found);
};

func void xor_8001_warriornature_found_yes()
{
	AI_Output(other,self,"XOR_8001_WarriorNature_Found_19");	//Pojďme ho zničit.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_20");	//Ano, Strážci nás ochrání!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"Guide");
	LUZIAN_BETRETEN = FALSE;
};

instance XOR_8001_WARRIORNATURE_PLATIE(C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	nr = 1;
	condition = xor_8001_warriornature_PLATIE_condition;
	information = xor_8001_warriornature_PLATIE_info;
	permanent = FALSE;
	description = "Co za zbroj to máš na sobě?";
};

func int xor_8001_warriornature_PLATIE_condition()
{
	if(Npc_KnowsInfo(hero,XOR_8001_WarriorNature_Found) == TRUE)
	{
		return TRUE;
	};
};

func void xor_8001_warriornature_PLATIE_info()
{
	AI_Output(other,self,"XOR_8001_WarriorNature_PLATIE_01");	//Co za zbroj to máš na sobě? Vypadá to trošku podivně.
	AI_Output(self,other,"XOR_8001_WarriorNature_PLATIE_02");	//Hmmm...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance XOR_8001_WARRIORNATURE_LUZIAN(C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	nr = 1;
	condition = xor_8001_warriornature_luzian_condition;
	information = xor_8001_warriornature_luzian_info;
	important = FALSE;
	permanent = TRUE;
	description = "Pojďme ho zničit!";
};

func int xor_8001_warriornature_luzian_condition()
{
	if(LUZIAN_BETRETEN == TRUE)
	{
		return TRUE;
	};
};

func void xor_8001_warriornature_luzian_info()
{
	AI_Output(other,self,"XOR_8001_WarriorNature_Found_21");	//Pojďme ho zničit!
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_22");	//Ano, Strážci nás ochrání!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"Guide");
	LUZIAN_BETRETEN = FALSE;
};

instance XOR_8001_WARRIORNATURE_DEMON_DEAD(C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	condition = xor_8001_warriornature_demon_dead_condition;
	information = xor_8001_warriornature_demon_dead_info;
	important = TRUE;
	permanent = FALSE;
};


func int xor_8001_warriornature_demon_dead_condition()
{
	if(Npc_KnowsInfo(hero,xor_8001_warriornature_found) && Npc_IsDead(luzian_demon))
	{
		return TRUE;
	};
};

func void xor_8001_warriornature_demon_dead_info()
{
	AI_Output(self,other,"XOR_8001_WarriorNature_Demon_Dead_01");	//Konečně je po něm... (zadýchaně) Ani jsem nedoufal, že tentokrát ho chytím.
	AI_Output(other,self,"XOR_8001_WarriorNature_Demon_Dead_02");	//Vypadá to, že už ho nikdy neuvidíš!
	AI_Output(self,other,"XOR_8001_WarriorNature_Demon_Dead_03");	//Byl silný, jsem rád, že už je po něm.
	AI_Output(other,self,"XOR_8001_WarriorNature_Demon_Dead_04");	//Na tento boj nezapomenu!
	AI_Output(self,other,"XOR_8001_WarriorNature_Demon_Dead_05");	//Já také ne, díky za pomoc.
	B_LogEntry(TOPIC_GUARDIANSTEST,"Lucian je mrtev. Starověký démon se ukázal být úctyhodným protivníkem a totálně mě vyčerpal. Nyní bych měl jít za Dagothem a dát mu démonovo srdce.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Guard");
};

