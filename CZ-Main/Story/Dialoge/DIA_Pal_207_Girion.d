
instance DIA_Girion_EXIT(C_Info)
{
	npc = Pal_207_Girion;
	nr = 999;
	condition = DIA_Girion_EXIT_Condition;
	information = DIA_Girion_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Girion_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Girion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Girion_Hallo(C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = DIA_Girion_Hallo_Condition;
	information = DIA_Girion_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Girion_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ShipIsFree == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_Hallo_Info()
{
	AI_Output(self,other,"DIA_Girion_Hallo_08_00");	//Jsem Girion, mistr boje s obouručními zbraněmi a královský paladin. Proč mě rušíš?
};


instance DIA_Girion_CanTeach(C_Info)
{
	npc = Pal_207_Girion;
	nr = 5;
	condition = DIA_Girion_CanTeach_Condition;
	information = DIA_Girion_CanTeach_Info;
	permanent = TRUE;
	description = "Můžeš mě učit?";
};


func int DIA_Girion_CanTeach_Condition()
{
	if(Girion_Teach2H == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Girion_CanTeach_15_00");	//Můžeš mě učit?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_01");	//Dobře činíš, že se chceš zlepšit v nejvznešenějším způsobu vedení boje. Jak se na Innosova válečníka sluší a patří.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_02");	//Budu tě učit. Přijď ke mně, až budeš připraven.
		Girion_Teach2H = TRUE;
		B_LogEntry(TOPIC_CityTeacher,"Paladin Girion mě vycvičí v používání obouručních zbraní.");
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_03");	//Pokud se chceš něco naučit, musíš se obrátit na učitele odjinud než z našeho řádu.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_04");	//Jsem válečník, ne učitel.
	};
};


instance DIA_Girion_Teach(C_Info)
{
	npc = Pal_207_Girion;
	nr = 100;
	condition = DIA_Girion_Teach_Condition;
	information = DIA_Girion_Teach_Info;
	permanent = TRUE;
	description = "Jsem připraven k výcviku.";
};


var int DIA_Girion_Teach_permanent;

func int DIA_Girion_Teach_Condition()
{
	if((Girion_Teach2H == TRUE) && (DIA_Girion_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};


var int girion_merk2h;

func void DIA_Girion_Teach_Info()
{
	girion_merk2h = other.HitChance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Girion_Teach_15_00");	//Jsem připraven k výcviku.
	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach,Dialog_Back,DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_Teach_2H_5);
};

func void DIA_Girion_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_00");	//Tvá výuka samozřejmě neskončila, ale já už ti nemůžu ukázat nic, co bys neznal.
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_01");	//Pokud chceš ještě zvýšit svůje bojové schopnosti, budeš muset vyhledat skutečného mistra meče.
		AI_Output(other,self,"DIA_DIA_Girion_Teach_15_02");	//Kde bych takového člověka mohl najít?
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_03");	//Lord Hagen je mistr meče. Určitě tě něco naučí.
		DIA_Girion_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Girion_Teach);
};

func void DIA_Girion_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90);
	if(other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if(Girion_Labercount == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_00");	//Bojuj čestně. Boj je náš život - a co by byl život beze cti?
		};
		if(Girion_Labercount == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_01");	//V boji buď obezřetný a rychlý. Překvap svého protivníka.
		};
		if(Girion_Labercount == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_02");	//Nikdy nechoď do boje nepřipraven. Nikdy nevíš, jestli náhodou není poslední.
		};
		if(Girion_Labercount == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_03");	//Paladin je vždy připraven na boj. Ale nikdy se nepouští do bitvy, kterou nemůže vyhrát.
		};
		Girion_Labercount = Girion_Labercount + 1;
		if(Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;
		};
	};
	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach,Dialog_Back,DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_Teach_2H_5);
};

func void DIA_Girion_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90);
	if(other.HitChance[NPC_TALENT_2H] > girion_merk2h)
	{
		if(Girion_Labercount == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_00");	//Paladin nebojuje pouze mečem, ale také vlastní myslí.
		};
		if(Girion_Labercount == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_01");	//Vždycky musíš mít v paměti místo, kam se můžeš v případě potřeby stáhnout.
		};
		if(Girion_Labercount == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_02");	//Nezapomeň, že dobře bojuješ v případě, kdy svého protivníka ovládáš a nedáváš mu šanci, aby se ovládal sám.
		};
		if(Girion_Labercount == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_03");	//Prohraješ pouze v případě, když se vzdáš.
		};
		Girion_Labercount = Girion_Labercount + 1;
		if(Girion_Labercount >= 3)
		{
			Girion_Labercount = 0;
		};
	};
	Info_ClearChoices(DIA_Girion_Teach);
	Info_AddChoice(DIA_Girion_Teach,Dialog_Back,DIA_Girion_Teach_Back);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_Teach_2H_1);
	Info_AddChoice(DIA_Girion_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_Teach_2H_5);
};


instance DIA_Girion_CATCHPLAYERSTOLENSHIP(C_Info)
{
	npc = Pal_207_Girion;
	nr = 5;
	condition = DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition;
	information = DIA_Girion_CATCHPLAYERSTOLENSHIP_Info;
	important = TRUE;
};


func int DIA_Girion_CATCHPLAYERSTOLENSHIP_Condition()
{
	if((Kapitel >= 5) && (MIS_ShipIsFree == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25") < 1000) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_Info()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00");	//Hej! Můžeš mi laskavě říct, co to tady děláš?
	Info_ClearChoices(DIA_Girion_CATCHPLAYERSTOLENSHIP);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"Nevím, o čem to mluvíš.",DIA_Girion_CATCHPLAYERSTOLENSHIP_no);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"Jdi mi z cesty, nebo tě budu muset zabít.",DIA_Girion_CATCHPLAYERSTOLENSHIP_weg);
	Info_AddChoice(DIA_Girion_CATCHPLAYERSTOLENSHIP,"Potřebuju tu loď.",DIA_Girion_CATCHPLAYERSTOLENSHIP_ship);
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_no()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00");	//Nevím, o čem to mluvíš.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01");	//Mluvím o tom, co jsi to provedl s lodní stráží. Smrdí mi to na sto honů.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02");	//I když jsi mág, stejně ti nevěřím.
	};
};


var int Girion_WantstoKillSC;

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_weg()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00");	//Jdi mi z cesty, nebo tě budu muset zabít.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01");	//Možná jsi dokázal ošálit stráže, ale brzo zjistíš, že se mnou to budeš mít kapku těžší, přítelíčku.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02");	//I když jsi jeden z nás, neznamená to, že bys měl právo krást královský majetek. Zemři, zrádče.
	};
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Girion_WantstoKillSC = TRUE;
};

func void B_GirionStayOnShip()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09");	//Až s tím skončíme, zase mi tu loď vrátíš, jasné?
};

func void DIA_Girion_CATCHPLAYERSTOLENSHIP_ship()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00");	//Potřebuju tvoji loď. Tak si ji vezmu.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01");	//To nemůžeš. Transport rudy...
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02");	//Jak se opovažuješ, ty smrdutý...
	};
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03");	//Rudy v Hornickém údolí není dost na to, aby s ní byl král spokojený. Byl jsem tam. Už tam není nic, co by se mohlo hodit. Hagenova mise je fraška.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04");	//Skutečná hrozba má své kořeny na ostrově nedaleko odsud. Popluju tam a skoncuju s tím.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05");	//Buď se ke mně připojíš, nebo se budu bez tebe muset obejít. Je to na tobě.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06");	//Hmm. Zdá se, že nemám na výběr.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07");	//Správně.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08");	//No dobrá. Přidám se k tobě, ale jenom pod jednou podmínkou.
	B_GirionStayOnShip();
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10");	//To není nic, s čím bych nemohl žít.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11");	//V tom případě dělej, co musíš. Počkám tady na tebe.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	Crewmember_Count = Crewmember_Count + 1;
	Girion_IsOnBoard = LOG_SUCCESS;
};


instance DIA_Girion_Verrat(C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = DIA_Girion_Verrat_Condition;
	information = DIA_Girion_Verrat_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Girion_Verrat_Condition()
{
	if((Girion_WantstoKillSC == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_Verrat_Info()
{
	AI_Output(self,other,"DIA_Girion_Verrat_08_00");	//Zrádce!
	AI_StopProcessInfos(self);
	self.aivar[AIV_DropDeadAndKill] = TRUE;
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Girion_OnShip(C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = DIA_Girion_OnShip_Condition;
	information = DIA_Girion_OnShip_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Girion_OnShip_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Girion_IsOnBoard == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Girion_OnShip_Info()
{
	B_GirionStayOnShip();
	AI_StopProcessInfos(self);
};


instance DIA_Girion_PICKPOCKET(C_Info)
{
	npc = Pal_207_Girion;
	nr = 900;
	condition = DIA_Girion_PICKPOCKET_Condition;
	information = DIA_Girion_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Girion_PICKPOCKET_Condition()
{
	return C_Beklauen(73,280);
};

func void DIA_Girion_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
	Info_AddChoice(DIA_Girion_PICKPOCKET,Dialog_Back,DIA_Girion_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Girion_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Girion_PICKPOCKET_DoIt);
};

func void DIA_Girion_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
};

func void DIA_Girion_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Girion_PICKPOCKET);
};


instance DIA_GIRION_NW_KAPITELORCATTACK(C_Info)
{
	npc = Pal_207_Girion;
	nr = 1;
	condition = dia_girion_nw_kapitelorcattack_condition;
	information = dia_girion_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Už jsi to slyšel město je zničeno!";
};


func int dia_girion_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (GIRIONBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_girion_nw_kapitelorcattack_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Girion_NW_KapitelOrcAttack_01_00");	//Už jsi to slyšel město je zničeno!
	AI_Output(self,other,"DIA_Girion_NW_KapitelOrcAttack_01_01");	//Bohužel jsem slyšel. A je mi to velmi líto, že jsem nebyl v tuto chvíli vedle svých bratrů.
	AI_Output(self,other,"DIA_Girion_NW_KapitelOrcAttack_01_03");	//Potřebovali mou pomoc! A já jsem tam nebyl abych jim pomohl... (ztraceně)
	AI_Output(self,other,"DIA_Girion_NW_KapitelOrcAttack_01_06");	//S potěšením bych položil život za slávu Innosovu, hlavně, proti těm špinavím skřetům!
	AI_Output(other,self,"DIA_Girion_NW_KapitelOrcAttack_01_07");	//Ještě budeš mít šanci to dokázat.
	AI_Output(self,other,"DIA_Girion_NW_KapitelOrcAttack_01_11");	//Slyšel jsem, že někteří z nás dokázali opustit město a zachránit se. Vyhledám je a připojím se k nim!
	AI_Output(self,other,"DIA_Girion_NW_KapitelOrcAttack_01_12");	//Nakonec je to dobrá příležitost, jak se skřetům pomstít za smrt mých bratrů.
	AI_Output(other,self,"DIA_Girion_NW_KapitelOrcAttack_01_16");	//No tak hodně štěstí Girione. Doufám, že se znovu setkáme.
	B_LogEntry(TOPIC_HELPCREW,"Nepodařilo se mi odradit Giriona od jeho nápadu proplížit se městem a připojit se ke zbývajícím paladinům. Doufám, že ho nezabijí, protože ho bude zapotřebí.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	GIRIONBATTLETHROUGTH = TRUE;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_PAL_207_GIRION_FUCKOFF(C_Info)
{
	npc = Pal_207_Girion;
	nr = 2;
	condition = dia_pal_207_girion_fuckoff_condition;
	information = dia_pal_207_girion_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_207_girion_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GIRIONCAPTURED == TRUE) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_207_girion_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_PAL_207_GIRION_YOURFREE(C_Info)
{
	npc = Pal_207_Girion;
	nr = 1;
	condition = dia_pal_207_girion_yourfree_condition;
	information = dia_pal_207_girion_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_207_girion_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GIRIONCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_207_girion_yourfree_info()
{
	AI_Output(self,other,"DIA_Pal_207_Girion_YourFree_01_08");	//Co tady děláš?!
	AI_Output(other,self,"DIA_Pal_207_Girion_YourFree_01_00");	//Můžeš jít!
	AI_Output(self,other,"DIA_Pal_207_Girion_YourFree_01_01");	//(překvapeně) Takže jsi zabil všechny skřety ve městě?!
	AI_Output(other,self,"DIA_Pal_207_Girion_YourFree_01_02");	//Ano, přesně tak.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other,"DIA_Pal_207_Girion_YourFree_01_03");	//(radostně) Výborně příteli! A to jsme si mysleli, že je s námi konec!
		AI_Output(self,other,"DIA_Pal_207_Girion_YourFree_01_04");	//Jen otevři mříže, abychom mohli odejít.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_207_Girion_YourFree_01_05");	//(radostně) Výborně příteli! A to jsme si mysleli, že je s námi konec!
		AI_Output(self,other,"DIA_Pal_207_Girion_YourFree_01_06");	//Jen otevři mříže, abychom mohli odejít.
	};
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_207_GIRION_OPENGATENOW(C_Info)
{
	npc = Pal_207_Girion;
	nr = 1;
	condition = dia_pal_207_girion_opengatenow_condition;
	information = dia_pal_207_girion_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_207_girion_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GIRIONCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (GIRIONISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_207_girion_opengatenow_info()
{
	AI_Output(self,other,"DIA_Pal_207_Girion_OpenGateNow_01_00");	//(netrpělivě) Pojď už! Otevři mříž!
	AI_StopProcessInfos(self);
};

