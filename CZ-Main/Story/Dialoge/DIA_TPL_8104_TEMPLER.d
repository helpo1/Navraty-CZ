instance DIA_TPL_8104_TEMPLER_EXIT(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 999;
	condition = DIA_TPL_8104_TEMPLER_exit_condition;
	information = DIA_TPL_8104_TEMPLER_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_TPL_8104_TEMPLER_exit_condition()
{
	return TRUE;
};

func void DIA_TPL_8104_TEMPLER_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TPL_8104_TEMPLER_NOFOREVER(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_noforever_condition;
	information = DIA_TPL_8104_TEMPLER_noforever_info;
	permanent = FALSE;
	description = "Ty velíš tomudle oddílu templářů?";
};

func int DIA_TPL_8104_TEMPLER_noforever_condition()
{
	return TRUE;
};

func void DIA_TPL_8104_TEMPLER_noforever_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_NoForever_01_00");	//Jak jsem pochopil, tak ty velíš tomudle oddílu templářů?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_NoForever_01_01");	//Ano, to velím. 
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_NoForever_01_02");	//Gor Na Toth mě osobně dal rozkaz abych se sem přesunul, v zájmu ochrany sběračů od možného útoku.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_NoForever_01_03");	//A to ti neobjasnil, čemu tady budeš čelit?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_NoForever_01_04");	//Ne to mě neřek. 
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_NoForever_01_05");	//Ale to není důležité. (klidně) Jsem připraven plnit rozkazy i za cenu svého života!
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_NoForever_01_06");	//Jestli je to tak, tak to jsem v klidu.
};

instance DIA_TPL_8104_TEMPLER_AboutMe(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_AboutMe_condition;
	information = DIA_TPL_8104_TEMPLER_AboutMe_info;
	permanent = FALSE;
	description = "Jak ses stal templářem?";
};

func int DIA_TPL_8104_TEMPLER_AboutMe_condition()
{
	if(Npc_KnowsInfo(other,DIA_TPL_8104_TEMPLER_noforever))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_AboutMe_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_AboutMe_01_00");	//Jak ses stal templářem?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_01");	//Velmi jednoduše. Když se naše Bratrstvo usadilo zde v Khorinisu...
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_02");	//... bylo potřeba lidí, kteří uměli zacházet se zbraněmi, aby mohli chránit tábor, novice i samotné Guru. 
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_03");	//Byl jsem jedním z těch, které Gor Na Toth vybral jako nové kandidáty na templáře.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_04");	//Později se sám postaral o můj výcvik. A nyní jsem jedním z nich!
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_05");	//A proč se ptáš?
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_AboutMe_01_06");	//Prostě si nepamatuju, že bych tě viděl v bejvalém táboře Bratrstva Spáče.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_07");	//Přirozeně! Nemůžeš si na mě pamatovat... (smích) Ve starém táboře jsem byl jenom novic co pomáhal Guru zpracovávat trávu z bažin. 
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_08");	//Ale já si tě pamatuju dobře. Ty jsi ten, co přinesl Cor Kalomovi výměšek z důlních červů. Nebo ne?
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_AboutMe_01_09");	//Ano, tak to bylo.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_10");	//Takže se nepletu... (smích) mám výbornou paměť na lidi! Obzvlášť když šlo o naše Bratrstvo.
};

instance DIA_TPL_8104_TEMPLER_WhatDo(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_WhatDo_condition;
	information = DIA_TPL_8104_TEMPLER_WhatDo_info;
	permanent = FALSE;
	description = "Není tady celkem nuda?";
};

func int DIA_TPL_8104_TEMPLER_WhatDo_condition()
{
	if(Npc_KnowsInfo(other,DIA_TPL_8104_TEMPLER_noforever))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_WhatDo_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_WhatDo_01_00");	//Není tady celkem nuda?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_WhatDo_01_01");	//Je to tak, kamaráde... (smutně) zde, tady na té samotě, je těžké se něčím zabavit.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_WhatDo_01_02");	//Nicméně, nemůžem polevit v pozornosti, je zde příliš nebezpečných věcí. 
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_WhatDo_01_03");	//Jakákoliv nepozornost by nás mohla stát příliš!
};

instance DIA_TPL_8104_TEMPLER_HowReady(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_HowReady_condition;
	information = DIA_TPL_8104_TEMPLER_HowReady_info;
	permanent = FALSE;
	description = "Myslíš si, že tvoji lidé jsou dobře připraveni?";
};

func int DIA_TPL_8104_TEMPLER_HowReady_condition()
{
	if(Npc_KnowsInfo(other,DIA_TPL_8104_TEMPLER_noforever))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_HowReady_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_HowReady_01_00");	//Myslíš si, že tvoji lidé jsou dobře připraveni?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_HowReady_01_01");	//Hmmm... (arogantně) Pokud je mě známo, Gor Na Toth osobně vybral ty, kteří sem byli posláni.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_HowReady_01_02");	//Doufám, že nebudeš pochybovat o schopnostech našich učitelů.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_HowReady_01_03");	//Není v tom nic osobního. Nicméně, když se budem muset vypořádat s útokem tak chci mít jistotu, že tvoji lidé jsou na to připraveni.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_HowReady_01_05");	//Jsou připraveni... (klidně) Možná nejsou excelentní v zacházení se zbraní, ale jejich odhodlání a morálka to hravě nahradí.
};


instance DIA_TPL_8104_TEMPLER_LetsTrain(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_LetsTrain_condition;
	information = DIA_TPL_8104_TEMPLER_LetsTrain_info;
	permanent = FALSE;
	description = "A co taklhle, malé cvičení s mečem?";
};

func int DIA_TPL_8104_TEMPLER_LetsTrain_condition()
{
	if(Npc_KnowsInfo(other,DIA_TPL_8104_TEMPLER_HowReady))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_LetsTrain_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_LetsTrain_01_00");	//A co taklhle, malé cvičení s mečem?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_01_01");	//Co máš na mysli?
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_LetsTrain_01_02");	//Myslím, že tvým vojákům by neškodilo trochu tréningu ve volné chvíli.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_01_03");	//Hmmm... (zamyšleně) To skutečně není špatnej nápad! Myslím, že by ses jich měl zeptat sám.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_01_04");	//Otázkou však zůstává - kdo se bude věnovat jejich tréningu?
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_LetsTrain_01_05");	//A co ty?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_01_06");	//No... (zmateně) Jsem celkem dobrej s obouručním mečem, ale jako učitel nemám žádné zkušenosti.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_LetsTrain_01_07");	//A co tvůj názor na Gor Na Totha?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_01_08");	//Můj učitel? Pokud vím, tak prohlásil, že mě chybí soustředění v boji.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_01_09");	//Ale lepší bude, když s ním promluvíš sám.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_01_10");	//Možná když on bude souhlasit, tak jsem připravenej se toho výcviku ujmout.
	Log_CreateTopic(TOPIC_TrainInCamp,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TrainInCamp,LOG_Running);
	B_LogEntry(TOPIC_TrainInCamp,"Nabídl jsem Tiraksovi, aby vedl výcvik v táboře sběračů drogy. Ale nejdřív si musím promluvit s jeho učitelem Gor Na Tothem, aby dal svůj souhlas.");
	MIS_TrainInCamp = LOG_Running;
};

instance DIA_TPL_8104_TEMPLER_LetsTrain_Done(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_LetsTrain_Done_condition;
	information = DIA_TPL_8104_TEMPLER_LetsTrain_Done_info;
	permanent = FALSE;
	description = "Gor Na Toth souhlasil, že můžeš trénovat.";
};

func int DIA_TPL_8104_TEMPLER_LetsTrain_Done_condition()
{
	if((GorNaTotAgreeTiraks == TRUE) && (MIS_TrainInCamp == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_LetsTrain_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_00");	//Gor Na Toth souhlasil, že můžeš trénovat.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_01");	//Hmm... (překvapeně) Znamená to, že si cení mých bojových dovedností.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_02");	//Dobře, tak zítra můžem začít.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_03");	//Tady, vezmi si tenhle svitek jako poděkování za tvoje úsilí. 
	B_GiveInvItems(self,other,ITSC_TRFMEATBUG,1);
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_04");	//Mně jako válečníkovi k ničemu není, ale ty ho možná využiješ!
	B_LogEntry(TOPIC_TrainInCamp,"Předal jsem Tiraksovi zprávu od Gor Na Totha, a od zítřka bude trénovat templáře.");
	Log_CreateTopic(TOPIC_TrainInCamp,LOG_SUCCESS);
	MIS_TrainInCamp = LOG_SUCCESS;
	CampTrainingTimer = Wld_GetDay();
};


instance DIA_TPL_8104_TEMPLER_TrainDay(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_TrainDay_condition;
	information = DIA_TPL_8104_TEMPLER_TrainDay_info;
	permanent = FALSE;
	description = "Jak jde výuka?";
};

func int DIA_TPL_8104_TEMPLER_TrainDay_condition()
{
	var int Daynow;

	Daynow = Wld_GetDay();

	if((CampTrainingTimer < Daynow) && (MIS_TrainInCamp == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_TrainDay_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_TrainDay_01_00");	//Jak jde výuka?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_TrainDay_01_01");	//Jak vidíš... (usmívá se) Jednoduše, neztrácíme čas.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_TrainDay_01_02");	//Rozumím, A proč netrénují všichni?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_TrainDay_01_03");	//No, někdo taky musí chránit sběrače trávy.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_TrainDay_01_04");	//Takže ti co mají volno trénují a ostatní hlídaj tábor.
};

instance DIA_TPL_8104_TEMPLER_Relax(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_Relax_condition;
	information = DIA_TPL_8104_TEMPLER_Relax_info;
	permanent = FALSE;
	description = "Vypadáš trochu unaveně.";
};

func int DIA_TPL_8104_TEMPLER_Relax_condition()
{
	if((MIS_TrainInCamp == LOG_SUCCESS) && (Wld_IsTime(23,59,7,59)))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_Relax_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_Relax_01_00");	//Vypadáš trochu unaveně.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_01_01");	//(zachmuřeně) Vážně? Možná máš pravdu.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_01_02");	//Právě ta zatracená nejistota strašně vyčerpává. A nervy už máme taky na pochodu.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_Relax_01_03");	//Potřebuješ si jen trochu odpočinout.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_01_04");	//Ach člověče... to by bylo řešení, ale jak to udělat? 
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_Relax_01_05");	//A včem je problém?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_01_06");	//Rozumíš, kdybych teď byl v táboře Bratrstva, Tak bych si zašel za Talasem. 
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_01_07");	//Pár pávů toho matroše co on dává novicům, by mě určitě postavilo na nohy.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_01_08");	//No řekni mě, kde v tédle poušti seženu aspoň jeden kousek trávy z bažin?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_01_09");	//Tak, jak to tak vypadá, s odpočinkem budu muset počkat.
	Log_CreateTopic(TOPIC_TiraksRelax,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TiraksRelax,LOG_Running);
	B_LogEntry(TOPIC_TiraksRelax,"Tiraks potřebuje pár špeků k uvolnění nahromaděného napětí.");
	MIS_TiraksRelax = LOG_Running;
};

instance DIA_TPL_8104_TEMPLER_Relax_Done(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_Relax_Done_condition;
	information = DIA_TPL_8104_TEMPLER_Relax_Done_info;
	permanent = FALSE;
	description = "Něco tu pro tebe mám.";
};

func int DIA_TPL_8104_TEMPLER_Relax_Done_condition()
{
	if((MIS_TiraksRelax == LOG_Running) && (Npc_HasItems(hero,ItMi_Joint) >= 1))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_Relax_Done_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_Relax_Done_01_00");	//Něco tu pro tebe mám.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_Done_01_01");	//O čem to mluvíš?
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_Relax_Done_01_02");	//To ti pomůže se trochu uvolnit. Tady.

	if(Npc_HasItems(other,ItMi_Joint) >= 3)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(other,self,ItMi_Joint,3);
		B_LogEntry(TOPIC_TiraksRelax,"Tiraks byl v sedmém nebi, když jsem mu přines pár špeků trávy z bažin.");
	}
	else if(Npc_HasItems(other,ItMi_Joint) >= 2)
	{
		B_GivePlayerXP(200);
		B_GiveInvItems(other,self,ItMi_Joint,2);
		B_LogEntry(TOPIC_TiraksRelax,"Tiraks byl v sedmém nebi, když jsem mu přines pár špeků trávy z bažin.");
	}
	else
	{
		B_GivePlayerXP(100);
		B_GiveInvItems(other,self,ItMi_Joint,1);
		B_LogEntry(TOPIC_TiraksRelax,"Tiraks byl v sedmém nebi, když jsem mu přines pár špeků trávy z bažin.");
	};

	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_Done_01_03");	//Nevěřím svým očím ty jsi sehnal trávu.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_Relax_Done_01_04");	//Jak vidíš.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_Done_01_05");	//Vážně jsi mě zachránil, příteli. To ti nezapomenu!
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_Done_01_06");	//... Hmmm
	Log_CreateTopic(TOPIC_TiraksRelax,LOG_SUCCESS);
	MIS_TiraksRelax = LOG_SUCCESS;
};

instance DIA_TPL_8104_TEMPLER_GetFurs(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_GetFurs_condition;
	information = DIA_TPL_8104_TEMPLER_GetFurs_info;
	permanent = FALSE;
	description = "Můžu vám ještě s něčím pomoct?";
};

func int DIA_TPL_8104_TEMPLER_GetFurs_condition()
{
	if((MIS_BalamProviant == LOG_SUCCESS) && (kapitel < 6) && (!Npc_IsDead(BAU_982_Grimbald)))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_GetFurs_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_01_00");	//Můžu vám ještě s něčím pomoct?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_01_01");	//Hmmm... (zamyšleně) Domnívám se, že bys nám mohl sehnat pár ovčích kůží.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_01_02");	//A to proč?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_01_03");	//No v noci je tu celkem chladno, když musíš spát na zemi.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_01_04");	//Pár ovčích kožešin by jim ulevilo, při už tak skromném odpočinku.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_01_05");	//A kde je sehnat, není tu v okolí žádná farma.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_01_06");	//To je pravda, ale co vím tak je tu jeden lovec co obchoduje s kožešinama.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_01_07");	//Viděl jsem ho před několika dny, když jsem šel na náhorní plošinu.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_01_08");	//Tak možná bude mít co potřebujem.
	Log_CreateTopic(TOPIC_TiraksFur,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TiraksFur,LOG_Running);
	B_LogEntry(TOPIC_TiraksFur,"Tiraks mě požádal jestli bych nesehnal pár ovčích kůží, aby jemu a jeho mužům nebylo v noci zima.");
	MIS_TiraksFur = LOG_Running;
};


instance DIA_TPL_8104_TEMPLER_GetFurs_Done(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_GetFurs_Done_condition;
	information = DIA_TPL_8104_TEMPLER_GetFurs_Done_info;
	permanent = TRUE;
	description = "Co se týče těch kůží...";
};

func int DIA_TPL_8104_TEMPLER_GetFurs_Done_condition()
{
	if(MIS_TiraksFur == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_GetFurs_Done_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_00");	//Co se týče těch kůží...
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_01");	//Ano? Co říkáš? Podařilo se ti je sehnat pro nás?

	if((Npc_HasItems(other,ItAt_ShadowFur) >= 2) && ((GrimbaldTellSellFur == TRUE) || (GrimbaldSellFur == TRUE) || (GrimbaldSellFurAll == TRUE)))
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_02");	//Tady je pár kůží stínovky. Doufám že to bude stačit?
		B_GiveInvItems(other,self,ItAt_ShadowFur,2);
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_03");	//Hmmm... (překvapeně) Pro mě jsou to jen kůže, až na to, že jsou výborně dílensky zpracované!
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_04");	//Teď aspoň moji muži nebudou v noci mrznout.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_05");	//Zajímalo by mě, kde jsi je získal? Byl jsi na lovu těchto zvířat?!
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_06");	//Já ne, to ten lovec, kterého jste viděli v blízkosti tábora. On loví v těchto krajích.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_08");	//Rozumím. A předpokládám, že jsi za ně musel zaplatit velkou kupu zlata.
		Info_ClearChoices(DIA_TPL_8104_TEMPLER_GetFurs_Done);

		if(GrimbaldTellSellFur == TRUE)
		{
			Info_AddChoice(DIA_TPL_8104_TEMPLER_GetFurs_Done,"Dostal jsem je darem.",DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale);
		};

		if(GrimbaldSellFur == TRUE)
		{
			Info_AddChoice(DIA_TPL_8104_TEMPLER_GetFurs_Done,"Zaplatil jsem jen za jednu.",DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale);
		};

		if(GrimbaldSellFurAll == TRUE)
		{
			Info_AddChoice(DIA_TPL_8104_TEMPLER_GetFurs_Done,"Máš pravdu! Přišli mě draho.",DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale);
		};
	}
	else if(Npc_HasItems(other,ItAt_SheepFur) >= 2)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_09");	//Tady je pár ovčích kůží, doufám že to bude stačit?
		B_GiveInvItems(other,self,ItAt_SheepFur,2);
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_10");	//Samozřejmě, příteli... (spokojeně) Teď aspoň moji muži nebudou v noci mrznout.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_11");	//Vezmi si tohle zlato jako projev vděčnosti. Promiň, ale víc toho nemáme.
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_12");	//Díky.
		B_GiveInvItems(self,other,ItMi_Gold,200);
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_13");	//Je to mnohem víc než by ti za ně dal jakýkoliv obchodník. Věř mi!
		B_LogEntry(TOPIC_TiraksFur,"Získal jsem ovčí kůže pro Tirakse.");
		Log_CreateTopic(TOPIC_TiraksFur,LOG_SUCCESS);
		MIS_TiraksFur = LOG_SUCCESS;
	}
	else
	{
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_14");	//Ještě ne.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_15");	//Dobře, když nemáš tak nemáš. Hlavní je že jsi na nás nezapomněl.
	}; 
};


func void DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale()
{
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_00");	//Dostal jsem je darem.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_01");	//No, pokud ano... (zamyšleně) Potom jako poděkování, ti dám pár vzácných magických elixírů.
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_02");	//To je od tebe velkorysé.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_03");	//Ty jsi nám pomohl a to se cení mnohem víc.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_04");	//Tady, vem si ty magické nápoje. Doufám, že ti přijdou vhod.
		B_GiveInvItemsManyThings(self,other);
		CreateInvItems(other,ItPo_Perm_Health,1);
		CreateInvItems(other,ItPo_Perm_Mana,1);
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_05");	//Děkuju.
		B_LogEntry(TOPIC_TiraksFur,"Dal jsem Tiraksovi kůže stínovky.");
		Log_CreateTopic(TOPIC_TiraksFur,LOG_SUCCESS);
		MIS_TiraksFur = LOG_SUCCESS;
		Info_ClearChoices(DIA_TPL_8104_TEMPLER_GetFurs_Done);
};


func void DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale()
{
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_00");	//Zaplatil jsem jen za jednu.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_01");	//No, pokud je to tak... (zamyšleně) Tak jako kompenzaci tvých nákladů ti dám několik magických elixírů.
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_02");	//To je od tebe štědré!
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_03");	//Ty jsi nám pomohl a to se cení mnohem víc. Kolik stojí ta kůže?
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_04");	//Dvěstě zlatých.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_05");	//Dobře. Tady vem si svoje zlato a tyto megické elixíry.
		B_GiveInvItemsManyThings(self,other);
		CreateInvItems(other,ItMi_Gold,200);
		CreateInvItems(other,ItPo_Health_02,5);
		CreateInvItems(other,ItPo_Mana_02,5);
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_06");	//Doufám, že je to dostatečná odměna.
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_07");	//Naprosto.
		B_LogEntry(TOPIC_TiraksFur,"Dal jsem Tiraksovi kůže stínovky.");
		Log_CreateTopic(TOPIC_TiraksFur,LOG_SUCCESS);
		MIS_TiraksFur = LOG_SUCCESS;
		Info_ClearChoices(DIA_TPL_8104_TEMPLER_GetFurs_Done);
};

func void DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale()
{
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_00");	//Máš pravdu! Přišli mě draho.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_01");	//No, pokud je to tak... (zamyšleně) Tak ti dám dvojnásobek nákladů. Kolik stála každá kůže?
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_02");	//Dvěstě zlatých.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_03");	//Dobrá. Zde - vezmi si to zlato. Domnívám se, že v Khorinisu ti žádný obchodník nenabídne podobnou cenu.
		B_GiveInvItems(self,other,ItMi_Gold,800);
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_04");	//To je od tebe velmi štědré!
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_05");	//Ty jsi nám pomohl a to se cení mnohem víc.
		B_LogEntry(TOPIC_TiraksFur,"Dal jsem Tiraksovi kůže stínovky. Byl velmi spokojený a dal mě za ně hromadu zlata.");
		Log_CreateTopic(TOPIC_TiraksFur,LOG_SUCCESS);
		MIS_TiraksFur = LOG_SUCCESS;
		Info_ClearChoices(DIA_TPL_8104_TEMPLER_GetFurs_Done);
};
