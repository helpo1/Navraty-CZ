
instance DIA_Ignaz_EXIT(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 999;
	condition = DIA_Ignaz_EXIT_Condition;
	information = DIA_Ignaz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ignaz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_NO_TALK(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 1;
	condition = dia_ignaz_no_talk_condition;
	information = dia_ignaz_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_ignaz_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_ignaz_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Ignaz_PICKPOCKET(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 900;
	condition = DIA_Ignaz_PICKPOCKET_Condition;
	information = DIA_Ignaz_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Ignaz_PICKPOCKET_Condition()
{
	return C_Beklauen(38,50);
};

func void DIA_Ignaz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
	Info_AddChoice(DIA_Ignaz_PICKPOCKET,Dialog_Back,DIA_Ignaz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ignaz_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ignaz_PICKPOCKET_DoIt);
};

func void DIA_Ignaz_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
};

func void DIA_Ignaz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
};


instance DIA_Ignaz_Hallo(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Hallo_Condition;
	information = DIA_Ignaz_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Ignaz_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Hallo_Info()
{
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_00");	//Á - přišel jsi právě včas. Potřebuju pro své magické pokusy nějakého asistenta.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_01");	//Jsem si jistý, že jsi celý nedočkavý, jak mi ve vědeckém zájmu udělat malou laskavost.
	AI_Output(other,self,"DIA_Ignaz_Hallo_15_02");	//Pomalu, příteli. Nejdřív mi řekni, o co vlastně jde.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_03");	//Vymyslel jsem nové kouzlo. Kouzlo zapomnění.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_04");	//Už jsem úspěšně provedl několik praktických zkoušek, ale na finální pokus se mi nedostává času.
};


instance DIA_Ignaz_Traenke(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 3;
	condition = DIA_Ignaz_Traenke_Condition;
	information = DIA_Ignaz_Traenke_Info;
	permanent = FALSE;
	description = "Co z toho budu mít, když ti pomůžu?";
};


func int DIA_Ignaz_Traenke_Condition()
{
	if(MIS_Ignaz_Charm != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Traenke_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Traenke_15_00");	//Co z toho budu mít, když ti pomůžu?
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_01");	//Můžu tě naučit, jak se připravují lektvary.
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_02");	//Znám recepty na léčivou esenci, esenci many a lektvar rychlosti.
};


instance DIA_Ignaz_Experiment(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 4;
	condition = DIA_Ignaz_Experiment_Condition;
	information = DIA_Ignaz_Experiment_Info;
	permanent = FALSE;
	description = "Řekni mi o tom experimentu a kouzlu víc.";
};


func int DIA_Ignaz_Experiment_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_Experiment_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_00");	//Řekni mi o tom experimentu a kouzlu víc.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_01");	//To kouzlo má za následek, že si určitá osoba nepamatuje různé události.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_02");	//Už se mi podařilo zjistit, že to funguje, pokud je dotyčná osoba naštvaná - například, pokud ji někdo právě dal nakládačku, nebo ji oloupil.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_03");	//Dokonce i když je jen svědkem takové události, tak se jí to pak vymaže z paměti.
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_04");	//To bych jako měl někoho srazit na zem a pak na něj seslat kouzlo?
	AI_Output(other,self,"DIA_Ignaz_Add_15_01");	//(sobě) Neměl bych to zkoušet v přístavu, tam jsou rvačky na denním pořádku. Měl bych najít svou oběť někde jinde...
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_05");	//Ano, mám dojem, žes trefil hřebíček na hlavičku. Ale abys někoho naštval, stačí, abys ho napadl, nemusíš ho srazit k zemi.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_06");	//Takže by sis měl vybrat někoho, kdo je o samotě - pokud kolem budou lidé, jen se dostaneš do potíží s lordem Andrem.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_07");	//Taky nemá žádný smysl sesílat kouzlo na někoho, kdo na tebe právě útočí. Počkej na ten správný okamžik.
};


instance DIA_Ignaz_teilnehmen(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 5;
	condition = DIA_Ignaz_teilnehmen_Condition;
	information = DIA_Ignaz_teilnehmen_Info;
	permanent = FALSE;
	description = "Dobrá, vyzkouším to kouzlo.";
};


func int DIA_Ignaz_teilnehmen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ignaz_Experiment))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_teilnehmen_Info()
{
	AI_Output(other,self,"DIA_Ignaz_teilnehmen_15_00");	//Dobrá, vyzkouším to kouzlo.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_01");	//Tak si vezmi tenhle svitek a vyzkoušej si život pokusné myši.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_02");	//Až to provedeš, tak se vrať o tom poreferovat.
	B_GiveInvItems(self,other,ItSc_Charm,1);
	MIS_Ignaz_Charm = LOG_Running;
	Log_CreateTopic(TOPIC_Ignaz,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Ignaz,LOG_Running);
	B_LogEntry(TOPIC_Ignaz,"Mám vyzkoušet nové Ignazovo kouzlo - kouzlo zapomnění. Když se na mě někdo při bitce nebo z jiného důvodu rozhněvá, určitě se se mnou už nebude chtít bavit. A tehdy nastane pravá chvíle pro použití tohoto zaklínadla.");
	B_LogEntry(TOPIC_Ignaz,"Tohle je ideální příležitost vyzkoušet to kouzlo - pod jeho působením také zapomene ohlásit mimořádnou událost. Nemyslím si, že mi bude někdo bránit, když mu dám ránu.");
	AI_StopProcessInfos(self);
};


instance DIA_Ignaz_Running(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Running_Condition;
	information = DIA_Ignaz_Running_Info;
	permanent = FALSE;
	description = "K tomu experimentu...";
};


func int DIA_Ignaz_Running_Condition()
{
	if((MIS_Ignaz_Charm == LOG_Running) && (Charm_Test == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Running_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Running_15_00");	//K tomu experimentu...
	AI_Output(self,other,"DIA_Ignaz_Running_14_01");	//Tak co, uspěl jsi? Nebo jsi to kouzlo jen tak zbůhdarma vyplýtval? Co?
	AI_Output(self,other,"DIA_Ignaz_Running_14_02");	//Jestli potřebuješ další svitky, tak si je ode mě můžeš koupit.
	CreateInvItems(self,ItSc_Charm,3);
};


instance DIA_Ignaz_Danach(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 6;
	condition = DIA_Ignaz_Danach_Condition;
	information = DIA_Ignaz_Danach_Info;
	permanent = FALSE;
	description = "Použil jsem ten svitek.";
};


func int DIA_Ignaz_Danach_Condition()
{
	if((Charm_Test == TRUE) && (MIS_Ignaz_Charm == LOG_Running) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Danach_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ignaz_Danach_15_00");	//Použil jsem ten svitek.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_01");	//Fajn, fajn. A povedlo se?
	AI_Output(other,self,"DIA_Ignaz_Danach_15_02");	//Ano, funguje to.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_03");	//Výborně. Malý krok pro vědu, ale obrovský pro mě!
	AI_Output(self,other,"DIA_Ignaz_Danach_14_04");	//Teď můžu něco ze svého času využít na to, abych tě zasvětil do tajů alchymie.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_05");	//Taky ti můžu dát několik užitečných věcí, jestli máš zájem.
	MIS_Ignaz_Charm = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Ignaz,LOG_Success);
	Ignaz_TeachAlchemy = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_CityTeacher,"Ignaz z přístavní čtvrti mi může ukázat recepty na výrobu lektvarů.");
	CreateInvItems(self,ItSc_Charm,3);
};


instance DIA_Ignaz_Trade(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 6;
	condition = DIA_Ignaz_Trade_Condition;
	information = DIA_Ignaz_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Ignaz_Trade_Condition()
{
	if(Wld_IsTime(5,0,23,0) && ((MIS_Ignaz_Charm == LOG_SUCCESS) || Npc_KnowsInfo(other,DIA_Ignaz_Running)))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Ignaz_Trade_15_00");	//Ukaž mi své zboží.
	B_GiveTradeInv(self);
};


instance DIA_Ignaz_Teach(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = DIA_Ignaz_Teach_Condition;
	information = DIA_Ignaz_Teach_Info;
	permanent = TRUE;
	description = "Nauč mě něco z alchymie.";
};


var int DIA_Ignaz_Teach_permanent;

func int DIA_Ignaz_Teach_Condition()
{
	if((DIA_Ignaz_Teach_permanent == FALSE) && (Ignaz_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Ignaz_Teach_15_00");	//Nauč mě něco z alchymie.
	Info_ClearChoices(DIA_Ignaz_Teach);
	Info_AddChoice(DIA_Ignaz_Teach,Dialog_Back,DIA_Ignaz_Teach_BACK);
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,b_buildlearnstringforalchemy("Lektvar rychlosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),DIA_Ignaz_Teach_Speed);
		talente = talente + 1;
	}
	else if(PLAYER_TALENT_ALCHEMY[15] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,b_buildlearnstringforalchemy("Dvojitý lektvar rychlosti",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED_02)),dia_ignaz_teach_speed_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,b_buildlearnstringforalchemy("Esence many",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Ignaz_Teach_Mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach,b_buildlearnstringforalchemy("Esence hojivé síly",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Ignaz_Teach_Health);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Speed] == TRUE) && (PLAYER_TALENT_ALCHEMY[15] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		AI_Output(self,other,"DIA_Ignaz_Teach_14_05");	//Už víš všechno, co jsem tě mohl naučit.
		DIA_Ignaz_Teach_permanent = TRUE;
	}
	else if(talente > 0)
	{
		if(Alchemy_Explain != TRUE)
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_01");	//OK přípravě lektvaru s pomocí alchymistické kolony potřebuješ laboratorní baňku.
			AI_Output(self,other,"DIA_Ignaz_Teach_14_02");	//Na každý lektvar budeš taky potřebovat různé rostliny a další ingredience.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_04");	//Co bys rád věděl?
		};
	};
};

func void DIA_Ignaz_Teach_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_Speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void dia_ignaz_teach_speed_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_SPEED_02);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_BACK()
{
	Info_ClearChoices(DIA_Ignaz_Teach);
};


instance DIA_IGNAZ_RECEPTFORTYON(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = dia_ignaz_receptfortyon_condition;
	information = dia_ignaz_receptfortyon_info;
	permanent = FALSE;
	description = "Ještě jedna věc...";
};


func int dia_ignaz_receptfortyon_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (KNOWABOUTRECEPTFORTYON == FALSE) && (Npc_HasItems(other,itwr_tyonrecept) < 1))
	{
		return TRUE;
	};
};

func void dia_ignaz_receptfortyon_info()
{
	AI_Output(other,self,"DIA_Ignaz_ReceptForTyon_01_00");	//Ještě jedna věc...
	AI_Output(self,other,"DIA_Ignaz_ReceptForTyon_01_01");	//Co chceš?
	AI_Output(other,self,"DIA_Ignaz_ReceptForTyon_01_02");	//Slyšel jsi o nějakém lektvaru, který dokáže do jisté míry ovlivnit vnímání osoby?
	AI_Output(self,other,"DIA_Ignaz_ReceptForTyon_01_03");	//Cože?!... (diví se) Nikdy jsem o ničem takovém neslyšel.
	AI_Output(self,other,"DIA_Ignaz_ReceptForTyon_01_05");	//Nikdo mě nenapadá. Promluv si s ostatními alchymisty. Někdo to může znát.
};


instance DIA_IGNAZ_PLANTSFROMTALIASAN(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 2;
	condition = dia_ignaz_plantsfromtaliasan_condition;
	information = dia_ignaz_plantsfromtaliasan_info;
	permanent = FALSE;
	description = "Zdá se mi, že tě něco trápí?";
};


func int dia_ignaz_plantsfromtaliasan_condition()
{
	if((MIS_FERNANDOHELP == LOG_Running) && Npc_KnowsInfo(hero,dia_taliasan_needbook))
	{
		return TRUE;
	};
};

func void dia_ignaz_plantsfromtaliasan_info()
{
	AI_Output(other,self,"DIA_Ignaz_PlantsFromTaliasan_01_00");	//Zdá se mi, že tě něco trápí?
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_01_03");	//Gallahad mi měl včera přinést byliny na mé experimenty.
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_01_04");	//Ale dosud to neudělal! Zřejmě na to jako vždycky zapomněl... (s nadějí)
	AI_Output(other,self,"DIA_Ignaz_PlantsFromTaliasan_01_07");	//A proč si za ním nezajdeš sám, když jsou tak důležité?
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_01_08");	//Šel bych, kdybych měl čas. Ale musím sledovat svoje experimenty!
	Info_ClearChoices(dia_ignaz_plantsfromtaliasan);
	Info_AddChoice(dia_ignaz_plantsfromtaliasan,"Můžu za ním zajít za tebe.",dia_ignaz_plantsfromtaliasan_go);
};

func void dia_ignaz_plantsfromtaliasan_go()
{
	AI_Output(other,self,"DIA_Ignaz_PlantsFromTaliasan_Go_01_00");	//Můžu za ním zajít za tebe.
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_Go_01_01");	//Vážně?!... To by bylo skvělé!
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_Go_01_02");	//Dokonce ti za tvou pomoc trochu zaplatím.
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_Go_01_04");	//Vidíš, předběhl jsem tě. Co takhle 100 zlatých?
	Info_ClearChoices(dia_ignaz_plantsfromtaliasan);
	Info_AddChoice(dia_ignaz_plantsfromtaliasan,"To je málo.",dia_ignaz_plantsfromtaliasan_no);
	Info_AddChoice(dia_ignaz_plantsfromtaliasan,"Dohodnuto!",dia_ignaz_plantsfromtaliasan_yes);
};

func void dia_ignaz_plantsfromtaliasan_no()
{
	AI_Output(other,self,"DIA_Ignaz_PlantsFromTaliasan_No_01_00");	//Příliš málo. Nebudu ztrácet čas nad takovými maličkostmi.
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_No_01_01");	//Promiň, ale nemůžu ti dát víc.
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_No_01_02");	//Dobrá! Seženu si na to někoho jiného.
	Info_ClearChoices(dia_ignaz_plantsfromtaliasan);
	AI_StopProcessInfos(self);
};

func void dia_ignaz_plantsfromtaliasan_yes()
{
	AI_Output(other,self,"DIA_Ignaz_PlantsFromTaliasan_Yes_01_00");	//Dohodnuto!
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_Yes_01_01");	//Skvělé! Tady, vem si - přesně 100 zlatých.
	B_GiveInvItems(self,other,ItSe_GoldPocket100_Ignaz,1);
	AI_Output(self,other,"DIA_Ignaz_PlantsFromTaliasan_Yes_01_02");	//A teď běž za Gallahadem a připomeň mu, že mně ty bylinky má přinést.
	Info_ClearChoices(dia_ignaz_plantsfromtaliasan);
	Log_CreateTopic(TOPIC_IGNAZHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_IGNAZHELP,LOG_Running);
	B_LogEntry(TOPIC_IGNAZHELP,"Ignaz mi dal za úkol zajít za Gallahadem a připomenout mu, že má Ignazovi přinést zásilku bylin pro jeho experimenty.");
	MIS_IGNAZHELP = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_TEACH_FIREARROWS(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 100;
	condition = dia_ignaz_teach_firearrows_condition;
	information = dia_ignaz_teach_firearrows_info;
	permanent = TRUE;
	description = "Nauč mě připravovat ohnivé šípy. (VB: 5, cena: 1500 zlatých)";
};


func int dia_ignaz_teach_firearrows_condition()
{
	if((MIS_WolfAndMan == LOG_Success) && (KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEFIREARROWS == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_firearrows_info()
{
	var int kosten;
	var int money;
	AI_Output(other,self,"DIA_Ignaz_Teach_FireArrows_15_00");	//Nauč mě připravovat ohnivé šípy.
	kosten = 5;
	money = 1500;
	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Ignaz_Teach_FireArrows_03_90");	//Nemáš dostatek zlata! Přijď pozďeji.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Naučeno: Výroba ohnivých šípů");
		KNOWHOWTOMAKEFIREARROWS = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TALENTMAKEARROWS,"Materiály pro výrobu OHNIVÝCH ŠÍPŮ: 50x dřík šípu, 50x hrot šípu a 10x síra.");
	};
};


instance DIA_IGNAZ_TEACH_MAGICARROWS(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 101;
	condition = dia_ignaz_teach_magicarrows_condition;
	information = dia_ignaz_teach_magicarrows_info;
	permanent = TRUE;
	description = "Nauč mě připravovat magické šípy. (VB: 5, cena: 1500 zlatých)";
};

func int dia_ignaz_teach_magicarrows_condition()
{
	if((KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEMAGICARROWS == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_magicarrows_info()
{
	var int kosten;
	var int money;
	AI_Output(other,self,"DIA_Ignaz_Teach_MagicArrows_15_00");	//Nauč mě připravovat magické šípy.
	kosten = 5;
	money = 1500;
	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Ignaz_Teach_MagicArrows_03_90");	//Nemáš dostatek zlata! Přijď pozďeji.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Naučeno: Výroba magických šípů");
		KNOWHOWTOMAKEMAGICARROWS = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TALENTMAKEARROWS,"Materiály pro výrobu MAGICKÝCH ŠÍPŮ: 50x dřík šípu, 50x hrot šípu a 10x křemen.");
	};
};

instance DIA_IGNAZ_TEACH_MAGICBOLT(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 102;
	condition = dia_ignaz_teach_magicbolt_condition;
	information = dia_ignaz_teach_magicbolt_info;
	permanent = TRUE;
	description = "Nauč mě připravovat magické šipky. (VB: 5, cena: 1500 zlatých)";
};


func int dia_ignaz_teach_magicbolt_condition()
{
	if((KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE) && (KNOWHOWTOMAKEMAGICBOLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_magicbolt_info()
{
	var int kosten;
	var int money;
	AI_Output(other,self,"DIA_Ignaz_Teach_MagicBolt_15_00");	//Nauč mě připravovat magické šipky.
	kosten = 5;
	money = 1500;
	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Ignaz_Teach_MagicBolt_03_90");	//Nemáš dostatek zlata! Přijď pozďeji.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Naučeno: Výroba magických šipek");
		KNOWHOWTOMAKEMAGICBOLT = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TALENTMAKEARROWS,"Materiály pro výrobu MAGICKÝCH ŠIPEK: 50x dřík šipky, 50x hrot šipky a 10x křemen.");
	};
};

instance DIA_Ignaz_LOKIPOTION(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 3;
	condition = DIA_Ignaz_LOKIPOTION_Condition;
	information = DIA_Ignaz_LOKIPOTION_Info;
	description = "Vyznáš se dobře v rostlinách?";
};

func int DIA_Ignaz_LOKIPOTION_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (FindCactus == FALSE) && (TradeCactus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_LOKIPOTION_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ignaz_LOKIPOTION_01_00");	//Vyznáš se dobře v rostlinách?
	AI_Output(self,other,"DIA_Ignaz_LOKIPOTION_01_01");	//No, nebudu říkat že vůbec, některé znalosti v této oblasti mám k dispozici.
	AI_Output(self,other,"DIA_Ignaz_LOKIPOTION_01_02");	//Proč tě to zajímá?
	AI_Output(other,self,"DIA_Ignaz_LOKIPOTION_01_03");	//Dívám se na jednu vzácnou rostlinu - květ kaktusu.
	AI_Output(other,self,"DIA_Ignaz_LOKIPOTION_01_04");	//Možná byste mohl vědět kde to získat? 
	AI_Output(self,other,"DIA_Ignaz_LOKIPOTION_01_05");	//Obávám se že vám nemohu pomoci, protože nemám ani zdání o této rostlině.
	AI_Output(self,other,"DIA_Ignaz_LOKIPOTION_01_06");	// Zkus se zeptat někoho v okolí, možná nějaký alchymista bude vědět o tom.
};

instance DIA_Ignaz_Werewolf(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 3;
	condition = DIA_Ignaz_Werewolf_Condition;
	information = DIA_Ignaz_Werewolf_Info;
	permanent = FALSE;
	description = "Máte pro mě nějakou jinou práci?";
};

func int DIA_Ignaz_Werewolf_Condition()
{
	if(MIS_Ignaz_Charm == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Werewolf_Info()
{
	AI_Output(other,self,"DIA_Ignaz_Werewolf_01_00");	//Máte pro mě nějakou jinou práci?
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_01");	//Možná... (vydechujíc) Nicméně, to je velmi nebezpečné.
	AI_Output(other,self,"DIA_Ignaz_Werewolf_01_02");	//Pane co mám dělat?
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_03");	//Mám zájem o sekci alchymie transformování do různých zvířat.
	AI_Output(other,self,"DIA_Ignaz_Werewolf_01_04");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_05");	//Když jsme u toho, myslím zvláštní magické svitky které transformují muže do chňapavců, vlků a dalších zvířat.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_06");	//Účinky těchto kouzel jsou pro člověka zcela neškodné a časem odchází.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_07");	//(zaváhal) Alespoň jsem si to myslel až do nedávné doby.
	AI_Output(other,self,"DIA_Ignaz_Werewolf_01_08");	//Co se stalo?
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_09");	//Jak to bylo hrozné nedorozumění, při mém posledním pokusu.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_10");	//Možná jsem udělal někde chybu ve vzorci. Nebo z nějakého jiného důvodu.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_11");	//Můj asistent použil přeměnu v stínovou šelmu, a nemohl se vrátit do své lidské podoby.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_12");	//Navíc se mi zdálo, že zvířecí instinkty úplně zatemnily jeho mysl!
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_13");	//Obrátil se na mě... (nervózně) Ale díky Innosovi jsme provedli experiment v těsné blízkosti městských bran.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_14");	//Stihl jsem utéct! A můj asistent utekl do lesa.
	AI_Output(other,self,"DIA_Ignaz_Werewolf_01_15");	//Tedy! Fakt pěkný pokusy.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_16");	//Víš, tohle se nikdy předtím nestalo... (povzdechne si) Ale není to nejsmutnější věc!
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_17");	//Nedávno jsem se dozvěděl, že několik lidí bylo napadeno nějakým hrozným monstrem.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_18");	//Zdá se, že dokonce zabil jednoho z nich! Teď nevím, co si mám o tom myslet.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_19");	//V každém případě budu muset nějak napravit svou chybu.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_20");	//To znamená, že budeš muset najít tu bestii a zabít ji!
	AI_Output(other,self,"DIA_Ignaz_Werewolf_01_21");	//A vám nevadí, že ho?
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_22");	//Z toho všeho mám kámen v duši... Ale nevidím žádný jiný způsob, jak tuto situaci napravit.
	AI_Output(other,self,"DIA_Ignaz_Werewolf_01_23");	//Dobře, udělám to. Kde k útoku došlo?
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_24");	//(zamyšleně) Myslím, že někde poblíž východní brány města.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_01_25");	//Zkus se zeptat stráže.
	MIS_WolfAndMan = LOG_Running;
	Log_CreateTopic(TOPIC_WolfAndMan,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WolfAndMan,LOG_Running);
	B_LogEntry(TOPIC_WolfAndMan,"Ignaz mi řekl o neúspěšném pokusu, ve kterém se jeho asistent nevratně proměnil v obrovskou a hroznou bestii. Zdá se, že už stihl někoho i roztrhat! Takže mě Ignaz požádal, abych ho našel a zabil. Řekl že k útoku došlo v blízkosti východní brány města.");
};


instance DIA_Ignaz_Werewolf_Done(C_Info)
{
	npc = VLK_498_Ignaz;
	nr = 1;
	condition = DIA_Ignaz_Werewolf_Done_Condition;
	information = DIA_Ignaz_Werewolf_Done_Info;
	permanent = FALSE;
	description = "Váš asistent žije a je v pořádku.";
};

func int DIA_Ignaz_Werewolf_Done_Condition()
{
	if((MIS_WolfAndMan == LOG_Running) && (WereWolfIsHuman == TRUE) && (Npc_KnowsInfo(hero,DIA_Sagitta_Werewolf_Safe_Done) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Werewolf_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Ignaz_Werewolf_Done_01_00");	//Váš asistent žije a je v pořádku.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_Done_01_01");	//Opravdu?
	AI_Output(other,self,"DIA_Ignaz_Werewolf_Done_01_02");	//Ano, a nyní žije se Sagittou, Lesní paní.
	AI_Output(other,self,"DIA_Ignaz_Werewolf_Done_01_03");	//Vrátila se mu lidská paměť.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_Done_01_04");	//Já ji znám. Je to dobrá žena! Myslím, že bude v pořádku s ní.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_Done_01_05");	//Děkuji ti za pomoc v této situaci.
	AI_Output(self,other,"DIA_Ignaz_Werewolf_Done_01_06");	//Tady, vem si toto kouzlo jako odměnu.
	B_GiveInvItems(self,other,ItSc_Shrink,1);
	AI_Output(self,other,"DIA_Ignaz_Werewolf_Done_01_07");	//Je to docela vzácné, a to nejcennější co mám.
	MIS_WolfAndMan = LOG_Success;
	Log_SetTopicStatus(TOPIC_WolfAndMan,LOG_Success);
	B_LogEntry(TOPIC_WolfAndMan,"Ignaz byl potěšen že jeho asistent žije se Sagittou, byť v masce stínové šelmy...");
};