
instance DIA_Pepe_EXIT(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 999;
	condition = DIA_Pepe_EXIT_Condition;
	information = DIA_Pepe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pepe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pepe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pepe_Hallo(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 1;
	condition = DIA_Pepe_Hallo_Condition;
	information = DIA_Pepe_Hallo_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Pepe_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Pepe_Hallo_Info()
{
	AI_Output(other,self,"DIA_Pepe_Hallo_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Pepe_Hallo_03_01");	//(otráveně) Hlídám ovce! (vzdychá) A pokud je to možné, vyhýbám se problémům.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pepe_Hallo_15_02");	//Moc to nefunguje, co?
		AI_Output(self,other,"DIA_Pepe_Hallo_03_03");	//Pff, zvlášť s těmi žoldáky. Jsem opravdu rád, že můžu být tady na pastvině. I když to může být nebezpečné tak jako tak.
	};
};


instance DIA_Pepe_Danger(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 2;
	condition = DIA_Pepe_Danger_Condition;
	information = DIA_Pepe_Danger_Info;
	permanent = FALSE;
	description = "Co je tady tak nebezpečného?";
};


func int DIA_Pepe_Danger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_Danger_Info()
{
	AI_Output(other,self,"DIA_Pepe_Danger_15_00");	//Co je tady tak nebezpečného?
	AI_Output(self,other,"DIA_Pepe_Danger_03_01");	//Po okolí se tu potuluje smečka vlků. Poslední dobou sem ty zatracený bestie přichází sežrat některou z mých ovcí skoro každý den.
	AI_Output(self,other,"DIA_Pepe_Danger_03_02");	//Ještě před pár dny jsem jich měl dvakrát tolik! Nechci ani pomyslet na to, co se mnou Onar udělá, až na to přijde.
};


instance DIA_Pepe_WhyNotSLD(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 3;
	condition = DIA_Pepe_WhyNotSLD_Condition;
	information = DIA_Pepe_WhyNotSLD_Info;
	permanent = FALSE;
	description = "Proč jsi o těch vlcích neřekl žoldákům? Měl jsem dojem, že pro vás pracují.";
};


func int DIA_Pepe_WhyNotSLD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Danger) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Pepe_WhyNotSLD_Info()
{
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_00");	//Proč jsi o těch vlcích neřekl žoldákům? Měl jsem dojem, že pro vás pracují.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_01");	//Jo, já vím. Měl jsem to udělat. Ale nestalo se...
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_02");	//A teď, když je tolik ovcí pryč, mám strach o tom někomu cokoliv říct.
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_03");	//Ale právě jsi to řekl MNĚ.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_04");	//(zlostně) Už toho taky lituju.
};


instance DIA_Pepe_KillWolves(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 4;
	condition = DIA_Pepe_KillWolves_Condition;
	information = DIA_Pepe_KillWolves_Info;
	permanent = FALSE;
	description = "Co když ty vlky zabiju?";
};


func int DIA_Pepe_KillWolves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Danger))
	{
		return TRUE;
	};
};

func void DIA_Pepe_KillWolves_Info()
{
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_00");	//Co když ty vlky zabiju?
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_01");	//(posměšně) Ty? A sám? Ha ha. Tomu nevěřím. To dřív uvěřím tomu, že to udělá můj chlebodárce.
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_02");	//Zapomeň na to. Byl to jen návrh. Zajdu za chlapama a uvidím, co tomu řeknou oni...
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_03");	//(vyděšeně) Počkej chvilku. Fajn, fajn! Ehm... Jsi největší ze všech největších a klidně zvládneš sto vlků najednou. Žádný problém!
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_04");	//Nejčastěji se skrývají mezi stromy poblíž pastviny. (stranou) Mám dojem, že jsou jen čtyři.
	AI_StopProcessInfos(self);
	Wld_InsertNpc(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01");
	Wld_InsertNpc(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02");
	Wld_InsertNpc(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03");
	Wld_InsertNpc(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04");
	MIS_Pepe_KillWolves = LOG_Running;
	Log_CreateTopic(TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PepeWolves,LOG_Running);
	B_LogEntry(TOPIC_PepeWolves,"Pepeho ovce ohrožují čtyři vlci. Měl bych je zahnat.");
};


instance DIA_Pepe_KilledWolves(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 5;
	condition = DIA_Pepe_KilledWolves_Condition;
	information = DIA_Pepe_KilledWolves_Info;
	permanent = TRUE;
	description = "Oddělal jsem ty vlky.";
};


func int DIA_Pepe_KilledWolves_Condition()
{
	if(MIS_Pepe_KillWolves == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Pepe_KilledWolves_Info()
{
	AI_Output(other,self,"DIA_Pepe_KilledWolves_15_00");	//Oddělal jsem ty vlky.
	if(Npc_IsDead(PEPES_YWolf1) && Npc_IsDead(PEPES_YWolf2) && Npc_IsDead(PEPES_YWolf3) && Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_01");	//(užasle) Dokázals to! Díky Innosovi!
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_02");	//Ale ještě pořád nevím, jak říct Onarovi, že přišel o tolik ovcí.
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_03");	//(pro sebe) Všechno je to chyba toho zatraceného Bullca!
		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP(XP_PepeWolves);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_04");	//Nedělej si ze mě blázny. Ty bestie ještě nejsou všechny mrtvé.
	};
};


instance DIA_Pepe_Bullco(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 5;
	condition = DIA_Pepe_Bullco_Condition;
	information = DIA_Pepe_Bullco_Info;
	permanent = FALSE;
	description = "Cos to říkal o tom Bullcovi?";
};


func int DIA_Pepe_Bullco_Condition()
{
	if((MIS_Pepe_KillWolves == LOG_SUCCESS) && !Npc_IsDead(Bullco) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Pepe_Bullco_Info()
{
	AI_Output(other,self,"DIA_Pepe_Bullco_15_00");	//Cos to říkal o tom Bullcovi?
	AI_Output(self,other,"DIA_Pepe_Bullco_03_01");	//Je to jeden ze žoldáků. Je to vlastně jeho práce, hlídat pastviny.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_02");	//Ale místo toho se se svým kámošem Sylviem jen celý dny flákají kolem Thekly v kuchyni.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_03");	//Je to chyba těch bastardů, že kvůli těm ovcím nedostanu týdenní mzdu.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_04");	//Kdybych mu za to alespoň mohl dát do zubů. Ale proti němu nikdo nemá žádnou šanci. Ten chlap je zabiják.
	MIS_Pepe_KickBullco = LOG_Running;
	Log_CreateTopic(TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KickBullco,LOG_Running);
	B_LogEntry(TOPIC_KickBullco,"Bullco se měl o Pepeho ovce líp starat. Pepe teď chce někomu dát pořádně za vyučenou.");
};


instance DIA_Pepe_BullcoDefeated(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 5;
	condition = DIA_Pepe_BullcoDefeated_Condition;
	information = DIA_Pepe_BullcoDefeated_Info;
	permanent = FALSE;
	description = "Bullco dostal, co si zasloužil. Postaral jsem se o to.";
};


func int DIA_Pepe_BullcoDefeated_Condition()
{
	if(MIS_Pepe_KickBullco == LOG_Running)
	{
		if((Bullco.aivar[AIV_DefeatedByPlayer] == TRUE) || (DJG_Bullco.aivar[AIV_DefeatedByPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Pepe_BullcoDefeated_Info()
{
	AI_Output(other,self,"DIA_Pepe_BullcoDefeated_15_00");	//Bullco dostal, co si zasloužil. Postaral jsem se o to.
	AI_Output(self,other,"DIA_Pepe_BullcoDefeated_03_01");	//Zasloužil si to.
	MIS_Pepe_KickBullco = LOG_SUCCESS;
	B_GivePlayerXP(XP_KickBullco);
};


instance DIA_Pepe_PERM(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 6;
	condition = DIA_Pepe_PERM_Condition;
	information = DIA_Pepe_PERM_Info;
	permanent = TRUE;
	description = "Jak se máš? A co tvoje ovce?";
};


func int DIA_Pepe_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_PERM_Info()
{
	AI_Output(other,self,"DIA_Pepe_PERM_15_00");	//Jak se máš? A co tvoje ovce?
	if(Kapitel <= 1)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_01");	//V pohodě. A stejně tak ovce. Ty, co tu pořád ještě jsou, se mají dobře.
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_02");	//Fajn. Ale ti vlci se jednou vrátí. A asi jich bude ještě víc!
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_03");	//Slyšel jsem hodně divné věci. Nějaké hrozivě vypadající postavy otravují u Sekoba. Obklíčily jeho dům.
	};
	if(Kapitel >= 4)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_04");	//Slyšel jsem, že se na Lobartově farmě rozvalují nějací žoldáci. Někdo by jim nejspíš měl pomoct.
	};
};


instance DIA_Pepe_Liesel(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 7;
	condition = DIA_Pepe_Liesel_Condition;
	information = DIA_Pepe_Liesel_Info;
	permanent = FALSE;
	description = "Můžu si koupit ovci?";
};


func int DIA_Pepe_Liesel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_Liesel_Info()
{
	AI_Output(other,self,"DIA_Pepe_Liesel_15_00");	//Můžu si koupit ovci?
	AI_Output(self,other,"DIA_Pepe_Liesel_03_01");	//Kdykoli, když za ni dáš dost peněz. Jedna ovce stojí 100 zlatých.
	AI_Output(self,other,"DIA_Pepe_Liesel_03_02");	//Když zaplatíš, můžeš si ovci vzít. Ale musíš se o ni dobře starat.
};


var int Pepe_SchafGekauft;

instance DIA_Pepe_BuyLiesel(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 8;
	condition = DIA_Pepe_BuyLiesel_Condition;
	information = DIA_Pepe_BuyLiesel_Info;
	permanent = TRUE;
	description = "Tady je 100 zlatých. Tak mi dej ovci.";
};

func int DIA_Pepe_BuyLiesel_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Pepe_Liesel) == TRUE) && (Pepe_SchafGekauft < 2))
	{
		return TRUE;
	};
};

func void DIA_Pepe_BuyLiesel_Info()
{
	AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_00");	//Tady je 100 zlatých. Tak mi dej ovci.

	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		if(Pepe_SchafGekauft == 0)
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_01");	//Fajn. Tak si vezmi Betsy - najdeš ji na pastvině.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_02");	//Prostě řekni, ať jde za tebou. Na ovci je docela chytrá. Starej se o ni dobře!
		}
		else
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_03");	//Zase? Fajn. Vezmi si Betsy.
			AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_04");	//Betsy? Ale už ta minulá ovce se jmenovala Betsy.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_05");	//Všechny ovce se jmenují Betsy.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_06");	//Samozřejmě kromě beranů.
			AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_07");	//A jak se jmenují oni?
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_08");	//Bruce.
		};

		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;
		AI_StopProcessInfos(self);
		Wld_InsertNpc(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_09");	//Nemáš dost zlata. Nemůžu ti tu ovci dát levněji.
	};
};

instance DIA_Pepe_PICKPOCKET(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 900;
	condition = DIA_Pepe_PICKPOCKET_Condition;
	information = DIA_Pepe_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Pepe_PICKPOCKET_Condition()
{
	return C_Beklauen(15,25);
};

func void DIA_Pepe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
	Info_AddChoice(DIA_Pepe_PICKPOCKET,Dialog_Back,DIA_Pepe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pepe_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pepe_PICKPOCKET_DoIt);
};

func void DIA_Pepe_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
};

func void DIA_Pepe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
};

instance DIA_PEPE_OGRIOB(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 10;
	condition = dia_pepe_ogriob_condition;
	information = dia_pepe_ogriob_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pepe_ogriob_condition()
{
	if((MIS_Pepe_KillWolves == LOG_SUCCESS) && (MIS_Pepe_KickBullco == LOG_SUCCESS) && (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void dia_pepe_ogriob_info()
{
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_01");	//Hej, kámo... (zaváhá) Počkej minutku.
	AI_Output(other,self,"DIA_Bau_912_Pepe_OGRIOB_01_02");	//Co je?
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_03");	//Poslouchej, mám takový malý problém. Jestli na to Onar přijde, tak mi srazí hlavu.
	AI_Output(other,self,"DIA_Bau_912_Pepe_OGRIOB_01_04");	//Tobě zase vlci zabili ovci?
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_05");	//Hmm... taky se to tak dá říct. Někdo mi zase sebral ovci!
	AI_Output(other,self,"DIA_Bau_912_Pepe_OGRIOB_01_06");	//A jak se to stalo?
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_07");	//Jenom jsem šel do lesa, abych si ulevil, když najednou něco zašustilo.
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_08");	//Pak už jen cítím... bolest! Jako by mi Bennetova kovadlina spadla na nohu.
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_09");	//Vypadá to, že mi přes nohu někdo pěkně přetáhnul.
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_10");	//Abych to zjednodušil, z té strašné bolesti jsem hned omdlel a když jsem přišel k sobě, ovce už byla pryč.
	AI_Output(other,self,"DIA_Bau_912_Pepe_OGRIOB_01_11");	//Kdo to mohl udělat?
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_12");	//Bohužel, nepodařilo se mi nic zjistit a věř mi, nic bych si nepřál víc.
	AI_Output(other,self,"DIA_Bau_912_Pepe_OGRIOB_01_13");	//A co bys chtěl po mně?
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_14");	//Prosím tě, pomoz mi najít tu ovci! Nebo aspoň najít toho, co mi ji ukradl.
	AI_Output(other,self,"DIA_Bau_912_Pepe_OGRIOB_01_15");	//Dobře, zkusím to.
	AI_Output(self,other,"DIA_Bau_912_Pepe_OGRIOB_01_16");	//Ale buď opatrný, to zvíře je děsně silné!
	MIS_GRIMGASH = LOG_Running;
	Log_CreateTopic(TOPIC_GRIMGASH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GRIMGASH,LOG_Running);
	B_LogEntry(TOPIC_GRIMGASH,"Někdo zmrzačil Pepemu nohu a ukradl jednu z jeho ovcí. Pepe neviděl, kdo to byl, ale zřejmě je velmi silný a chytrý. Je potřeba se s ním vypořádat a vrátit Pepemu ovci.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"brokenleg");
	Wld_InsertNpc(gobbo_grandwarrior_uniq,"FP_ROAM_NW_BIGFARMFORESTCAVE_02");
};

instance DIA_BAU_912_PEPE_GRIMGASH(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 1;
	condition = dia_bau_912_pepe_grimgash_condition;
	information = dia_bau_912_pepe_grimgash_info;
	permanent = FALSE;
	description = "Našel jsem tvoji ovci.";
};

func int dia_bau_912_pepe_grimgash_condition()
{
	if((MIS_GRIMGASH == LOG_Running) && Npc_IsDead(gobbo_grandwarrior_uniq) && (Npc_HasItems(other,itat_sheepgrimgash) >= 1))
	{
		return TRUE;
	};
};

func void dia_bau_912_pepe_grimgash_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Bau_912_Pepe_GRIMGASH_01_01");	//Našel jsem tvoji ovci. Nebo spíš to, co z ní zůstalo.
	B_GiveInvItems(other,self,itat_sheepgrimgash,1);
	Npc_RemoveInvItems(self,itat_sheepgrimgash,1);
	AI_Output(self,other,"DIA_Bau_912_Pepe_GRIMGASH_01_02");	//Sakra... Vypadá to že Onar má o jednu ovci méně. A co ten zloděj?
	AI_Output(other,self,"DIA_Bau_912_Pepe_GRIMGASH_01_03");	//Byl to velký černý goblin. To on ti dolámal nohu.
	AI_Output(self,other,"DIA_Bau_912_Pepe_GRIMGASH_01_04");	//Ó Innosi, jde to od desíti k pěti. A co, zabil jsi ho?
	AI_Output(other,self,"DIA_Bau_912_Pepe_GRIMGASH_01_05");	//Samozřejmě, odkud myslíš, že mám tu ovčí kůži?
	AI_Output(self,other,"DIA_Bau_912_Pepe_GRIMGASH_01_06");	//Dobře, alespoň nebude napadat mě ani moje ovce.
	AI_Output(self,other,"DIA_Bau_912_Pepe_GRIMGASH_01_07");	//Na, tady máš ovčí sýr a kozí mléko. 
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(hero,ItFo_Cheese,3);
	CreateInvItems(hero,ItFo_Milk,3);
	AI_Output(self,other,"DIA_Bau_912_Pepe_GRIMGASH_01_08");	//Promiň, ale to je vše, co mám.
	MIS_GRIMGASH = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GRIMGASH,LOG_SUCCESS);
	B_LogEntry(TOPIC_GRIMGASH,"Řekl jsem Pepemu o goblinovi, který mu ukradl ovci. Z vděčnosti mi dal ovčí sýr a kozí mléko. Co jiného se dá čekat od pasáčka ovcí.");
};

instance DIA_PEPE_LECHENIE(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 1;
	condition = dia_pepe_lechenie_condition;
	information = dia_pepe_lechenie_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pepe_lechenie_condition()
{
	if((Kapitel >= 2) && (MIS_GRIMGASH == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_pepe_lechenie_info()
{
	AI_Output(self,other,"DIA_Pepe_Lechenie_01_01");	//Hej, počkej...
	AI_Output(other,self,"DIA_Pepe_Lechenie_01_02");	//Co, ještě?
	AI_Output(self,other,"DIA_Pepe_Lechenie_01_03");	//Poslouchej, ten špinavý goblin mi tak dolámal nohu, že se nemůžu vůbec hýbat.
	AI_Output(self,other,"DIA_Pepe_Lechenie_01_04");	//Podívej, mám nohu úplně modrou... (plačtivě) Každým dnem je to horší a horší.
	AI_Output(self,other,"DIA_Pepe_Lechenie_01_05");	//Jestli to tak půjde dál, tak o tu nohu přijdu.
	AI_Output(self,other,"DIA_Pepe_Lechenie_01_06");	//Když to Onar zjistí, tak mě z farmy vyhodí. 
	AI_Output(other,self,"DIA_Pepe_Lechenie_01_07");	//Ty jen potřebuješ dobrý lék.
	AI_Output(self,other,"DIA_Pepe_Lechenie_01_08");	//Bohužel normální léčivé lektvary mi nepomáhají, potřebuju něco speciálního.
	AI_Output(self,other,"DIA_Pepe_Lechenie_01_09");	//Prosím, pomoz mi... nemám nikoho jiného, koho bych požádal.
	Info_ClearChoices(dia_pepe_lechenie);
	Info_AddChoice(dia_pepe_lechenie,"Dobře, porozhlédnu se po léku.",dia_pepe_lechenie_yes);
	Info_AddChoice(dia_pepe_lechenie,"Sám se starej, tvoje noha není můj problém!",dia_pepe_lechenie_no);
};

func void dia_pepe_lechenie_yes()
{
	AI_Output(other,self,"DIA_Pepe_Lechenie_yes_01_00");	//Dobře, porozhlédnu se po léku.
	AI_Output(self,other,"DIA_Pepe_Lechenie_yes_01_01");	//Děkuji mnohokrát. Počkám tady na tebe.
	MIS_LECHENIEPEPE = LOG_Running;
	Log_CreateTopic(TOPIC_LECHENIEPEPE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LECHENIEPEPE,LOG_Running);
	B_LogEntry(TOPIC_LECHENIEPEPE,"Pepe má problém se svou nohou. Prosí mě, abych pro něj našel lék.");
	AI_StopProcessInfos(self);

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(Warg,"FP_ROAM_NW_SAGITTA_MOREMONSTER_01");
		Wld_InsertNpc(Warg,"FP_ROAM_NW_SAGITTA_MOREMONSTER_03");
		Wld_InsertNpc(Warg,"FP_ROAM_NW_WOOD_MONSTER_05_01");
		Wld_InsertNpc(Warg,"FP_ROAM_NW_WOOD_MONSTER_05_03");
		Wld_InsertNpc(Shadowbeast,"FP_STAND_DEMENTOR_KDF_05");
	};
};

func void dia_pepe_lechenie_no()
{
	AI_Output(other,self,"DIA_Pepe_Lechenie_no_01_00");	//Sám se starej, tvoje noha není můj problém!
	AI_Output(self,other,"DIA_Pepe_Lechenie_no_01_01");	//(zničeně) Dobře, je mi líto, že jsem tě obtěžoval.
	AI_StopProcessInfos(self);
};

instance DIA_PEPE_PLACEBO(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 1;
	condition = dia_pepe_placebo_condition;
	information = dia_pepe_placebo_info;
	permanent = FALSE;
	description = "Přinesl jsem ti lék.";
};

func int dia_pepe_placebo_condition()
{
	if((MIS_LECHENIEPEPE == LOG_Running) && (Npc_KnowsInfo(hero,dia_sagitta_placebo)) && (Npc_HasItems(hero,ItPo_Health_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_pepe_placebo_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Pepe_Placebo_01_01");	//Přinesl jsem ti lék.
	AI_Output(self,other,"DIA_Pepe_Placebo_01_02");	//Hmmm... Kde jsi ho sehnal?
	AI_Output(other,self,"DIA_Pepe_Placebo_01_03");	//Ten elixír uvařila Sagitta přímo pro tebe.
	AI_Output(other,self,"DIA_Pepe_Placebo_01_04");	//Nejsilnější lektvar, schopný probudit i starého trola. Dej si ho na nohu a budeš mít po starostech.
	AI_Output(self,other,"DIA_Pepe_Placebo_01_06");	//Hmm... lektvar od Sagitty. To by mohlo pomoct.
	AI_Output(self,other,"DIA_Pepe_Placebo_01_07");	//Dej mi ho hned! Ať už mě ta noha přestane bolet.
	AI_Output(other,self,"DIA_Pepe_Placebo_01_08");	//Tady máš.
	B_GiveInvItems(other,self,ItPo_Health_01,1);
	B_UseItem(self,ItPo_Health_01);
	AI_Output(self,other,"DIA_Pepe_Placebo_01_09");	//Hmm... už cítím, jak ta bolest přechází.
	AI_Output(self,other,"DIA_Pepe_Placebo_01_10");	//Děkuji, opravdu jsi mi pomohl.
	AI_Output(other,self,"DIA_Pepe_Placebo_01_11");	//Prostě jsem tě nemohl nechat umřít! 
	AI_Output(self,other,"DIA_Pepe_Placebo_01_12");	//Ale ať už... Tady, vem si trochu zlata.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Pepe_Placebo_01_13");	//Opravdu, je to vše, co mám.
	MIS_LECHENIEPEPE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LECHENIEPEPE,LOG_SUCCESS);
	B_LogEntry(TOPIC_LECHENIEPEPE,"Lék od Sagitty pomohl a Pepe se vyléčil. Někdy to prostě jde...");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};