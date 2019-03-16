
instance DIA_Pablo_EXIT(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 999;
	condition = DIA_Pablo_EXIT_Condition;
	information = DIA_Pablo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pablo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pablo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Pablo_PICKPOCKET(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 900;
	condition = DIA_Pablo_PICKPOCKET_Condition;
	information = DIA_Pablo_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(zkusit ukrást tento klíč)";
};

func int DIA_Pablo_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pablo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pablo_PICKPOCKET);
	Info_AddChoice(DIA_Pablo_PICKPOCKET,Dialog_Back,DIA_Pablo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pablo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pablo_PICKPOCKET_DoIt);
};

func void DIA_Pablo_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItKe_City_Tower_01,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Pablo_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Pablo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pablo_PICKPOCKET);
};


var int Pablo_belogen;

instance DIA_Pablo_WANTED(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 1;
	condition = DIA_Pablo_WANTED_Condition;
	information = DIA_Pablo_WANTED_Info;
	important = TRUE;
};


func int DIA_Pablo_WANTED_Condition()
{
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pablo_WANTED_Info()
{
	AI_Output(self,other,"DIA_Pablo_WANTED_12_00");	//Hej, počkej - jsi mi nějaký povědomý.
	AI_Output(other,self,"DIA_Pablo_WANTED_15_01");	//Co chceš?
	AI_Output(self,other,"DIA_Pablo_WANTED_12_02");	//Tvůj obličej jsem už někde viděl... ano - už vím!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Pablo_WANTED_12_03");	//Tady - tenhle obrázek u sebe měla skupina banditů, kterou jsme sbalili před pár dny. Vypadá vážně jako ty.
	B_GiveInvItems(self,other,ItWr_Poster_MIS,1);
	AI_Output(self,other,"DIA_Pablo_WANTED_12_04");	//Zdá se, že tě ti chlapíci hledali.
	Info_ClearChoices(DIA_Pablo_WANTED);
	Info_AddChoice(DIA_Pablo_WANTED,"Ne, musel ses splést.",DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice(DIA_Pablo_WANTED,"Božínku, něco takového by mě samotného nikdy nenapadlo.",DIA_Pablo_WANTED_IRONY);
};

func void DIA_Pablo_WANTED_NOTHING()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_NOTHING_15_00");	//Ne, musel ses splést. To musel být někdo jiný.
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_01");	//Jak myslíš, cizinče.
	AI_Output(self,other,"DIA_Pablo_Add_12_00");	//Ale jestli se nakonec ukáže, žes na tom obrázku přece jenom byl TY - a pokud budeš mít nějaké potíže - snaž se je netahat s sebou do města. Už takhle to tady není žádný med.
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_03");	//A cizinci, kteří s sebou přinášejí potíže, tady moc dlouho většinou nezůstanou - doufám, že jsem se vyjádřil jasně.
	Pablo_belogen = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Pablo_WANTED_IRONY()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_00");	//Božínku, něco takového by mě samotného nikdy nenapadlo.
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_01");	//Vážně legrace... co od tebe ti chlapíci chtěli?
	AI_Output(other,self,"DIA_Pablo_Add_15_01");	//Zeptej se jich sám. Máte je přece v bezpečí pod zámkem, ne?
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_03");	//Ne - jsou mrtví.
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_04");	//Tak mám dojem, že se to už nikdy nedozvíme.
	AI_Output(self,other,"DIA_Pablo_Add_12_02");	//V případě, že bys měl nějaké problémy, promluv si s lordem Andrem. Možná by byl schopný ti pomoci. Najdeš ho v kasárnách.
	AI_StopProcessInfos(self);
};

instance DIA_PABLO_RUPERT(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 1;
	condition = DIA_PABLO_RUPERT_condition;
	information = DIA_PABLO_RUPERT_info;
	permanent = FALSE;
	description = "Posílá mě Rupert.";
};

func int DIA_PABLO_RUPERT_condition()
{
	if((CanTeachTownMaster == FALSE) && (RupertSendPablo == TRUE))
	{
		return TRUE;
	};
};

func void DIA_PABLO_RUPERT_info()
{
	AI_Output(other,self,"DIA_PABLO_RUPERT_01_01");	//Posílá mě Rupert.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_02");	//(otráveně) No a?
	AI_Output(other,self,"DIA_PABLO_RUPERT_01_03");	//Říkal, že bys mi mohl pomoci získat přízeň mistrů v téhle čtvrti.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_04");	//Nikdo z nich s tebou nechce mluvit, co?
	AI_Output(other,self,"DIA_PABLO_RUPERT_01_05");	//Všichni mě považují za nějakého žebráka.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_06");	//To není nic překvapujícího. Opravdu vypadáš jako nějaký podezřelý pobuda - a oni z toho nejsou nadšeni.
	AI_PlayAni(self,"T_SEARCH");

	if((ComeThrowSea == FALSE) && (LotarTrueCome == TRUE))
	{
		AI_Output(self,other,"DIA_PABLO_RUPERT_01_07");	//Něco ti řeknu. Pokud bych na vlastní oči neviděl, že tě stráž pustila do města...
		AI_Output(self,other,"DIA_PABLO_RUPERT_01_08");	//... a žes mluvil s paladinem Lotharem, osobně bych tě nechal zadržet a vyslechnout v kasárnách domobrany.
		AI_Output(other,self,"DIA_PABLO_RUPERT_01_09");	//No, teď máš šanci.
	};

	AI_Output(self,other,"DIA_PABLO_RUPERT_01_10");	//Ale choď... (směje se) Neurážej se! Už vidím, že jsi pořádný chlap.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_11");	//Už jsem na odhadování lidí téměř vycvičen, to mi věř.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_12");	//Takže ti pomůžu. (vážně) Ale nejdříve si musíš sehnat nějaký pořádný oděv.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_13");	//Tyhle hadry stačit nebudou!
	AI_Output(other,self,"DIA_PABLO_RUPERT_01_14");	//Kde ho mám sehnat?
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_15");	//Jdi za Hannou, majitelkou hotelu naproti kasárnám domobrany. Řekni jí, že tě posílám.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_16");	//Prodá ti nějaký slušný a čistý oblek.
	AI_Output(self,other,"DIA_PABLO_RUPERT_01_17");	//Pak si promluvíme o tom ostatním. Tak běž.
	MIS_PathFromDown = LOG_Running;
	Log_CreateTopic(Topic_PathFromDown,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PathFromDown,LOG_Running);
	B_LogEntry(TOPIC_PathFromDown,"Pablo souhlasil, že mi pomůže. Nejdříve bych si ale měl sehnat měšťanský oděv. S tím by mi měla pomoct Hanna, majitelka hotelu v Khorinisu.");
};

instance DIA_Pablo_PathFromDown(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 1;
	condition = DIA_Pablo_PathFromDown_condition;
	information = DIA_Pablo_PathFromDown_info;
	permanent = TRUE;
	description = "Jak se ti líbí můj nový oděv?";
};

func int DIA_Pablo_PathFromDown_condition()
{
	if((CanTeachTownMaster == FALSE) && (MIS_PathFromDown == LOG_Running) && (Hanna_LeatherBought == TRUE) && (PabloQuestsUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pablo_PathFromDown_info()
{
	AI_Output(other,self,"DIA_Pablo_PathFromDown_01_01");	//Jak se ti líbí můj nový oděv?

	if(VlkL_ArmorUp == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_02");	//Jo, už je to o moc lepší. Teď už vypadáš jako běžný občan města.
		AI_Output(other,self,"DIA_Pablo_PathFromDown_01_03");	//Takže co teď?
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_04");	//Teď by ses měl postarat o svou pověst. Bez ní tady ničeho nedosáhneš.
		AI_Output(other,self,"DIA_Pablo_PathFromDown_01_05");	//Jak to mám udělat?
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_06");	//No, pro lidi jako ty je tady jen jedna cesta.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_07");	//A ta vede přes přístavní čtvrť.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_08");	//I když se tam většinou sdružuje jenom chátra...
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_09");	//... žiji tam i já sám a hodně jiných lidí, kterých názor v téhle čtvrti něco zaváží.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_10");	//Zkus si získat jejich respekt!
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_11");	//Pak se já sám postarám, aby ti mistři začali důvěřovat.
		AI_Output(other,self,"DIA_Pablo_PathFromDown_01_12");	//A kdo patří mezi tyhle lidi?
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_13");	//Jedním z nich je Kardif, vede v přístavu krčmu. Dalším je Carl - přístavní kovář.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_14");	//Pak jsou tady Brahim, Garvell, Edda a Halvor. S nimi by sis měl raději taky promluvit.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_15");	//A samozřejmě ještě lichvář Lehmar! Kde bychom byli bez něj.
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_16");	//Podle mého názoru je to nejmocnější člověk ve městě.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_17");	//(váhavě) Pokud tedy mluvíme neoficiálně, samozřejmě.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_18");	//Promluv si s nimi, udělej na ně dojem, snaž se jim pomoct.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_19");	//Pak najednou uvidíš, že už máš ve čtvrti mistrů docela dobré postavení.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_20");	//Zapamatoval sis všechno?
		AI_Output(other,self,"DIA_Pablo_PathFromDown_01_21");	//Jo. Mám jenom jeden dotaz.
		AI_Output(other,self,"DIA_Pablo_PathFromDown_01_22");	//Neexistuje nějaká rychlejší cesta?
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_23");	//No, proč ne? Existuje!
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_24");	//Pokud se připojíš k nějaké z významnějších frakcí tady na ostrově, mistři řemeslníci si s tebou určitě neodmítnou promluvit.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_25");	//To se ale celkem zapotíš. Dokonce ani domobrana nepřijímá hned tak někoho!
		AI_Output(other,self,"DIA_Pablo_PathFromDown_01_26");	//Rozumím.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_27");	//Když tedy rozumíš, dej se do práce.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_28");	//Zase tady jednou jenom stojím a tlachám s tebou.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_29");	//Pořád mě akorát rozptyluješ od mých povinností... (zaneprázdněně) Vždyť sám vidíš.
		PabloQuestsUp = TRUE;
		B_LogEntry(TOPIC_PathFromDown,"Teď si musím získat respekt v přístavní čtvrti města, hlavně u lidí jako Kardif, Lehmar nebo Carl. Pak bude Pablo moci ovlivnit mistry řemeslníky, aby mi začali věřit.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_30");	//(sarkasticky) Nějak ho na tobě nevidím. Pořád vypadáš jako vandrák.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_01_31");	//Dej na sebe něco pořádného a pak se vrať.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Pablo_PathFromDown_Rumors(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 1;
	condition = DIA_Pablo_PathFromDown_Rumors_condition;
	information = DIA_Pablo_PathFromDown_Rumors_info;
	permanent = TRUE;
	description = "Co se o mně říká ve městě?";
};

func int DIA_Pablo_PathFromDown_Rumors_condition()
{
	if((CanTeachTownMaster == FALSE) && (MIS_PathFromDown == LOG_Running) && (PabloQuestsUp == TRUE) && (PabloSpeakUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pablo_PathFromDown_Rumors_info()
{
	var int CountXPS;
	var int CountXPALL;

	CountXPS = 0;

	AI_Output(other,self,"DIA_Pablo_PathFromDown_Rumors_01_01");	//Co se o mně říká ve městě?
	AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_02");	//Hmm. No, podívejme.

	if((MIS_MOEBORED == LOG_SUCCESS) && (MOEBORED == FALSE))
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_03");	//Kardif říká, žes mu pomohl vyřídit si to s Moem.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_04");	//Teď už ten parchant nebude odrazovat jeho návštěvníky.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		MOEBORED = TRUE;
	};
	if((MIS_EddaStatue == LOG_SUCCESS) && (EddaStatue == FALSE))
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_05");	//Edda mluvila o tom, žes jí vrátil její sošku Innose.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_06");	//To bylo od tebe velmi šlechetné.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		EddaStatue = TRUE;
	};
	if((MIS_CarlCoal == LOG_SUCCESS) && (CarlCoal == FALSE))
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_07");	//Kovář Carl o tobě mluvil hodně lichotivě.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_08");	//Nevím, proč tak najednou, ale, koneckonců - je na tvojí straně.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		CarlCoal = TRUE;
	};
	if((MIS_GarvellTools == LOG_SUCCESS) && (GarvellTools == FALSE))
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_09");	//Pomohl jsi Garvellovi se stavbou jeho lodi.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_10");	//Podle mne je to blázen! Ale stejně, pomoc je pomoc.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		GarvellTools = TRUE;
	};
	if((MIS_BrahimWax == LOG_SUCCESS) && (BrahimWax == FALSE))
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_11");	//Brahimovi jsi prý pomohl s něčím velmi důležitým.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_12");	//Teď je ti zavázán. To není špatné.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		BrahimWax = TRUE;
	};
	if((MIS_HalvorShells == LOG_SUCCESS) && (HalvorShells == FALSE))
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_13");	//Halvor říkal, žes pro něj něco dělal a prý byl velice spokojený.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_14");	//I když je to jen prodavač ryb, ve skutečnosti je jedním z nejvlivnějších lidí v přístavní čtvrti.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_15");	//Mít jeho doporučení je pro tebe velikou výhodou.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		HalvorShells = TRUE;
	};
	if((MIS_LehmarDebt == LOG_SUCCESS) && (LehmarDebt == FALSE))
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_16");	//Lehmar. No, nemyslím, že by se ti kdy povedlo udělat na něj dojem.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_17");	//Rozhodně si ale myslí, že jsi celkem rozumný chlap.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_18");	//To je hodně důležité, protože téměř každý ve městě naslouchá jeho názorům.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		LehmarDebt = TRUE;
	};
	if(CountXPS >= 1)
	{
		CountXPALL = CountXPS * 100;
		B_GivePlayerXP(CountXPALL);
		CountXPS = 0;
	};
	if(CountRumors >= 6)
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_19");	//Ano, získal sis respekt mnoha důležitých lidí!
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_20");	//Myslím, že už budu schopen přesvědčit mistry, aby ti důvěřovali.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_21");	//No, nebo si s tebou alespoň promluvili.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_22");	//To však zabere nějaký čas. Rozumíš, že takové záležitosti se nedají vyřešit jen tak za pár minut.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_23");	//Tak jdi. A zítra ráno si s nimi můžeš zkusit promluvit.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_24");	//Kapišto?
		AI_Output(other,self,"DIA_Pablo_PathFromDown_Rumors_01_25");	//Jistě.
		PabloSpeakUp = TRUE;
		PabloSpeakUpDay = Wld_GetDay();
		B_LogEntry(TOPIC_PathFromDown,"Pablo věří, že jsem si už u lidí získal dostatečný respekt, takže si může popovídat s řemeslníky. Říkal, že zítra si s nimi mám zkusit promluvit.");
		AI_StopProcessInfos(self);
	}
	else if(CountRumors == FALSE)
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_26");	//Ani raději nic neříkej! Nikomu jsi zatím nepomohl a už se ptáš.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_27");	//Takže bys měl raději zmizet a začít něco dělat než mě rozptylovat zbytečnými dotazy.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_28");	//Všeho všudy celkem dobře.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_29");	//Zatím to ale nestačí na ovlivnění mistrů.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_30");	//Zkus si promluvit s dalšími lidmi.
		AI_Output(self,other,"DIA_Pablo_PathFromDown_Rumors_01_31");	//Jsem si jistý, že jim dovedeš ukázat své lepší stránky.
		AI_Output(other,self,"DIA_Pablo_PathFromDown_Rumors_01_32");	//Pokusím se.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Pablo_Banditen(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 3;
	condition = DIA_Pablo_Banditen_Condition;
	information = DIA_Pablo_Banditen_Info;
	permanent = FALSE;
	description = "Co víš o banditech?";
};

func int DIA_Pablo_Banditen_Condition()
{
	return TRUE;
};

func void DIA_Pablo_Banditen_Info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_03");	//Co víš o banditech?
	AI_Output(self,other,"DIA_Pablo_Add_12_04");	//Všichni pocházejí z té zatracené trestanecké kolonie. Pak se ale rozdělili na několik skupin.
	AI_Output(self,other,"DIA_Pablo_Add_12_05");	//Někteří se zašili v horách a další se spojili s Onarem, velkostatkářem.
	AI_Output(self,other,"DIA_Pablo_Add_12_06");	//Nejvíc potíží ale způsobují banditi, kteří se zdržují kolem města.
	AI_Output(self,other,"DIA_Pablo_Add_12_07");	//To kvůli nim se teď žádný obchodník neodváží vyrazit za městské brány.
};

instance DIA_PABLO_BANDITEN_IGN(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 5;
	condition = dia_pablo_banditen_ign_condition;
	information = dia_pablo_banditen_ign_info;
	permanent = FALSE;
	description = "Všiml sis něčeho podezřelého?";
};

func int dia_pablo_banditen_ign_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && (READORTEGO == FALSE) && (HELPKILLIGNAZ == TRUE))
	{
		return TRUE;
	};
};

func void dia_pablo_banditen_ign_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_Ign_15_03");	//Všiml sis něčeho podezřelého?
	AI_Output(self,other,"DIA_Pablo_Add_Ign_12_04");	//Říká se, že někdo zavraždil Ignaze.
	AI_Output(self,other,"DIA_Pablo_Add_Ign_12_05");	//Já osobně jsem nikoho neviděl, ale kluci mluvili o nějakém podezřelém chlápkovi.
	AI_Output(self,other,"DIA_Pablo_Add_Ign_12_06");	//Zeptej se měšťanů nebo stráží při severní bráně, prý ho naposled viděli tam.
};

instance DIA_Pablo_HakonBandits(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 3;
	condition = DIA_Pablo_HakonBandits_Condition;
	information = DIA_Pablo_HakonBandits_Info;
	permanent = FALSE;
	description = "Nevíš něco o banditech, kteří okradli obchodníka Hakona?";
};

func int DIA_Pablo_HakonBandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hakon_Miliz) && Npc_KnowsInfo(other,DIA_Pablo_Banditen))
	{
		return TRUE;
	};
};

func void DIA_Pablo_HakonBandits_Info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_20");	//Nevíš něco o banditech, kteří okradli obchodníka Hakona?
	AI_Output(self,other,"DIA_Pablo_Add_12_21");	//Jo TOHLE. Ani mi to nepřipomínej.
	AI_Output(self,other,"DIA_Pablo_Add_12_22");	//Co víme, tak mají na svědomí už pěknou řádku útoků na různé kupce.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_01");	//Ty krysy zalezly do svých děr a neodvažují se ani vystrčit nos.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_02");	//Kdysi se nám je podařilo vystopovat a sledovat. V lese za městem jsme ale museli s pronásledováním přestat.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_03");	//Kolem se potuluje spousta šelem, je to moc nebezpečné.
	B_LogEntry(TOPIC_HakonBanditen,"Banditi, kteří okradli Hakona, se skrývají kdesi v lesích poblíž města.");
	if(Pablo_AndreMelden == FALSE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_23");	//Ale je tady ještě jedna věc...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_04");	//V Khorinisu se objevila část uloupeného zboží.
		AI_Output(other,self,"DIA_Pablo_Banditen_15_05");	//To znamená, že vědí, jak lup propašovat do města a pak ho tady prodat...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_06");	//Jo, máme podezření, že mají tady někde ve městě překupníka. Zatím se nám ale toho chlápka nepodařilo chytit.
		AI_Output(self,other,"DIA_Pablo_Banditen_12_07");	//Pokud by se ti podařilo na něco přijít, tak měj na paměti, že lord Andre vypsal na toho pašeráka odměnu.
		B_LogEntry(TOPIC_HakonBanditen,"Banditi mají ve městě nejspíš nějakou spojku. Lord Andre nechal na tohoto jejich spojence vypsat odměnu.");
	};
};

instance DIA_Pablo_MyBandits(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 4;
	condition = DIA_Pablo_MyBandits_Condition;
	information = DIA_Pablo_MyBandits_Info;
	permanent = FALSE;
	description = "Odkud byli ti banditi, kteří měli ten můj obrázek?";
};

func int DIA_Pablo_MyBandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pablo_Banditen) && Npc_KnowsInfo(other,DIA_Pablo_WANTED))
	{
		return TRUE;
	};
};

func void DIA_Pablo_MyBandits_Info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_08");	//Odkud byli ti banditi, kteří měli ten můj obrázek?

	if(Pablo_belogen == TRUE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_09");	//AHÁ! Takže to nakonec BYL tvůj obličej. Proč jsi to nepřiznal hned, co?
		AI_Output(self,other,"DIA_Pablo_Add_12_10");	//(naléhavě) Proč po tobě jdou?
		AI_Output(other,self,"DIA_Pablo_Add_15_11");	//Já nevím - vážně!
		AI_Output(self,other,"DIA_Pablo_Add_12_12");	//Jasně, jasně. Chápu. Něco ti řeknu. Kdybych si myslel, že jsi s těmi bandity jedna ruka, už bys pěkně bručel v chládku. Kapišto?
		AI_Output(self,other,"DIA_Pablo_Add_12_13");	//I tak bych to ale asi měl nahlásit lordu Andremu.
		Pablo_AndreMelden = TRUE;
		AI_Output(self,other,"DIA_Pablo_Add_12_14");	//Ale co se týče té tvé otázky...
	};
	AI_Output(self,other,"DIA_Pablo_Add_12_15");	//Sebrali jsme je poblíž statkářova sídla.
	AI_Output(self,other,"DIA_Pablo_Add_12_16");	//Rozhodně ale nevypadají jako Onarovi lidé.
	AI_Output(self,other,"DIA_Pablo_Add_12_17");	//Řekl bych, že to byla část menší skupinky, která se ukrývá v horách poblíž Onarovy farmy.
	AI_Output(self,other,"DIA_Pablo_Add_12_18");	//Jestli bys ale měl v plánu se tam vydat, musím tě varovat. Tihle hrdlořezové provedou s každým krátký proces!
	AI_Output(other,self,"DIA_Pablo_Add_15_19");	//Budu to mít na paměti.
};


instance DIA_Pablo_Perm(C_Info)
{
	npc = MIL_319_Pablo;
	nr = 1;
	condition = DIA_Pablo_Perm_Condition;
	information = DIA_Pablo_Perm_Info;
	permanent = TRUE;
	description = "Jak to vypadá?";
};

func int DIA_Pablo_Perm_Condition()
{
	return TRUE;
};

func void DIA_Pablo_Perm_Info()
{
	AI_Output(other,self,"DIA_Pablo_Perm_15_00");	//Jak to vypadá?

	if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_01");	//Vždycky jsem říkal, že se těm žoldákům nedá věřit.
				AI_Output(self,other,"DIA_Pablo_Perm_12_02");	//Je na čase, abychom těm neřádům uštědřili lekci. Tohle nevymyslel Bennet sám o sobě.
			}
			else if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_03");	//Jsem hluboce otřesen vraždou ctihodného paladina Lothara.
				AI_Output(self,other,"DIA_Pablo_Perm_12_04");	//Ale věřím, že církev viníky spravedlivě potrestá.
			}
			else if((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_04A");	//Proč se tady poflakuješ, sektáři? Hm?!
			}
			else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_05");	//Co že se tady potuluješ po okolí? Jestli máš v plánu osvobodit svého žoldáckého přítelíčka, tak na to rovnou zapomeň.
			}
			else
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_05A");	//Prosím tě, neruš mě v mé službě. Mám toho hodně na práci.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Pablo_Perm_12_06");	//To je k pláči. Teď se nás snaží poštvat proti sobě navzájem.
			AI_Output(self,other,"DIA_Pablo_Perm_12_07");	//Jestli jste nedokázali najít pravého vraha, skřeti nebudou muset ani hnout prstem.
		};
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_08");	//Dělá mi starosti, co se stane, když teď paladinové odejdou.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_09");	//Na nás se můžeš spolehnout. Použijeme všechny dostupné prostředky, aby tohle město nezabředlo do bahna bezpráví.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_10");	//Měj se na pozoru. Darebáky jako ty nespouštíme jen tak z očí.
	}
	else
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_11");	//Teď je docela klid. Problémy nám dělají jen banditi za okrajem města.
	};
};