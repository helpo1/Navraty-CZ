
instance DIA_Keroloth_EXIT(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 999;
	condition = DIA_Keroloth_EXIT_Condition;
	information = DIA_Keroloth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Keroloth_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Keroloth_HELLO(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 2;
	condition = DIA_Keroloth_HELLO_Condition;
	information = DIA_Keroloth_HELLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Keroloth_HELLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_HELLO_Info()
{
	AI_Output(other,self,"DIA_Keroloth_HELLO_15_00");	//Ty trénuješ lidi?
	AI_Output(self,other,"DIA_Keroloth_HELLO_07_01");	//Ano. Když nás skřeti, nebo ještě hůře, draci, znovu napadnou, budeme potřebovat každý meč.
};


instance DIA_Keroloth_WantTeach(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 3;
	condition = DIA_Keroloth_WantTeach_Condition;
	information = DIA_Keroloth_WantTeach_Info;
	permanent = FALSE;
	description = "Můžeš cvičit i mě?";
};

func int DIA_Keroloth_WantTeach_Condition()
{
	if(Keroloths_BeutelLeer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_WantTeach_Info()
{
	AI_Output(other,self,"DIA_Keroloth_WantTeach_15_00");	//Můžeš cvičit i mě?
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_01");	//Samozřejmě, trénuji všechny.
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_02");	//Ale také budeš potřebovat dobrou zbraň, jestli tady chceš přežít.
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_03");	//Zeptej se rytíře Tandora. Postará se o tebe.
	Keroloth_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher_OC,"Paladin Keroloth na hradě cvičí muže se zbraní.");
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_Trader_OC,"Paladin Tandor prodává na hradě zbraně.");
};

var int DIA_Keroloth_Teach_permanent;

instance DIA_Keroloth_Teacher(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 6;
	condition = DIA_Keroloth_Teacher_Condition;
	information = DIA_Keroloth_Teacher_Info;
	permanent = TRUE;
	description = "Chci trénovat!";
};

func int DIA_Keroloth_Teacher_Condition()
{
	if((Keroloth_TeachPlayer == TRUE) && (Keroloths_BeutelLeer == FALSE) && (DIA_Keroloth_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_Teacher_Info()
{
	AI_Output(other,self,"DIA_Keroloth_Teacher_15_00");	//Chci trénovat!
	Info_ClearChoices(DIA_Keroloth_Teacher);
	Info_AddChoice(DIA_Keroloth_Teacher,Dialog_Back,DIA_Keroloth_Teacher_Back);
	Info_AddChoice(DIA_Keroloth_Teacher,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Keroloth_Teacher_1H_1);
	Info_AddChoice(DIA_Keroloth_Teacher,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Keroloth_Teacher_1H_5);
};

func void DIA_Keroloth_Teacher_Back()
{
	Info_ClearChoices(DIA_Keroloth_Teacher);
};

func void DIA_Keroloth_Teacher_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60);

	if(other.HitChance[NPC_TALENT_1H] >= 60)
	{
		AI_Output(self,other,"B_Keroloth_TeachNoMore1_07_00");	//Jsi velmi dobrej, není nic, co bych tě naučil.
		AI_Output(self,other,"B_Keroloth_TeachNoMore2_07_00");	//Jen velmi zručný šermíř tě nyní může trénovat.
		DIA_Keroloth_Teach_permanent = TRUE;
		Info_ClearChoices(DIA_Keroloth_Teacher);
	}
	else
	{
		Info_ClearChoices(DIA_Keroloth_Teacher);
		Info_AddChoice(DIA_Keroloth_Teacher,Dialog_Back,DIA_Keroloth_Teacher_Back);
		Info_AddChoice(DIA_Keroloth_Teacher,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Keroloth_Teacher_1H_1);
		Info_AddChoice(DIA_Keroloth_Teacher,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Keroloth_Teacher_1H_5);
	};
};

func void DIA_Keroloth_Teacher_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60);

	if(other.HitChance[NPC_TALENT_1H] >= 60)
	{
		AI_Output(self,other,"B_Keroloth_TeachNoMore1_07_00");	//Jsi velmi dobrej, není co bych tě naučil.
		AI_Output(self,other,"B_Keroloth_TeachNoMore2_07_00");	//Jen velmi zručný šermíř tě nyní může trénovat.
		DIA_Keroloth_Teach_permanent = TRUE;
		Info_ClearChoices(DIA_Keroloth_Teacher);
	}
	else
	{
		Info_ClearChoices(DIA_Keroloth_Teacher);
		Info_AddChoice(DIA_Keroloth_Teacher,Dialog_Back,DIA_Keroloth_Teacher_Back);
		Info_AddChoice(DIA_Keroloth_Teacher,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Keroloth_Teacher_1H_1);
		Info_AddChoice(DIA_Keroloth_Teacher,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Keroloth_Teacher_1H_5);
	};
};

instance DIA_Keroloth_Udar(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 4;
	condition = DIA_Keroloth_Udar_Condition;
	information = DIA_Keroloth_Udar_Info;
	permanent = FALSE;
	description = "Co takhle boj na dálku?";
};

func int DIA_Keroloth_Udar_Condition()
{
	if((Keroloth_TeachPlayer == TRUE) && (Keroloths_BeutelLeer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_Udar_Info()
{
	AI_Output(other,self,"DIA_Keroloth_Udar_15_00");	//Co takhle boj na dálku?
	AI_Output(self,other,"DIA_Keroloth_Udar_07_01");	//Co je s ním?
	AI_Output(other,self,"DIA_Keroloth_Udar_15_02");	//Můžeš mě ho naučit?
	AI_Output(self,other,"DIA_Keroloth_Udar_07_03");	//Ne, no můžeš požádat Udara. On je dobrý - ne, on je nejlepší střelec z kuše, co já vím.
	Log_CreateTopic(TOPIC_Teacher_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher_OC,"Udar z hradu v Hornickém údolí, ví všechno o kuších.");
};


instance DIA_Keroloth_KAP3_EXIT(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 999;
	condition = DIA_Keroloth_KAP3_EXIT_Condition;
	information = DIA_Keroloth_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Keroloth_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Keroloth_KAP4_EXIT(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 999;
	condition = DIA_Keroloth_KAP4_EXIT_Condition;
	information = DIA_Keroloth_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Keroloth_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Keroloth_KAP4_HELLO(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 40;
	condition = DIA_Keroloth_KAP4_HELLO_Condition;
	information = DIA_Keroloth_KAP4_HELLO_Info;
	description = "Vypadáš frustrovaně.";
};


func int DIA_Keroloth_KAP4_HELLO_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_HELLO_Info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_15_00");	//Vypadáš frustrovaně.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_07_01");	//(rozhořčeně) Ať už se propadnu. Radím ti: dávej si pozor na své věci.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_07_02");	//Stačí otočit zády, a všechny věci jsou fuč. Ten neřád!
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO,Dialog_Back,DIA_Keroloth_KAP4_HELLO_ende);
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO,"Paladin by neměl tak lehce ztrácet trpělivost.",DIA_Keroloth_KAP4_HELLO_ruhig);
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO,"Co ti sebrali?",DIA_Keroloth_KAP4_HELLO_bestohlen);
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO,"Co je to za špínu?",DIA_Keroloth_KAP4_HELLO_pack);
};

func void DIA_Keroloth_KAP4_HELLO_ende()
{
	Info_ClearChoices(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_bestohlen()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_15_00");	//Co ti sebrali?
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_07_01");	//Ne. Dali mě 20 zlatých do kapsy. Samozřejmě, že jsem byl okraden, ty idiote!
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_07_02");	//Neboj se, dopadnu toho parchanta...
	Info_AddChoice(DIA_Keroloth_KAP4_HELLO,"Tak co se ti ztratilo?",DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt);
};

func void DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_00");	//Tak co se ti ztratilo?
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_01");	//Můj měšec, se všema mýma úsporama.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_02");	//Ukradli ho!
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_03");	//On se objeví někde jinde.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_04");	//Musel to být někdo z těch drakobijců, až ho najdu...!
	Log_CreateTopic(TOPIC_KerolothsGeldbeutel,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KerolothsGeldbeutel,LOG_Running);
	B_LogEntry(TOPIC_KerolothsGeldbeutel,"Paladin Keroloth ztratil měšec. Tvrdí, že mu ho ukradli drakobijci.");
	Info_ClearChoices(DIA_Keroloth_KAP4_HELLO);
};

func void DIA_Keroloth_KAP4_HELLO_pack()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_pack_15_00");	//Jaká špína?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_01");	//Drakobijci. Kdo jiný?
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_02");	//Tuhle chátru, která si říká lovci draků, samozřejmě. Koho jinýho myslíš, že můžu mít na mysli?
	};
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_03");	//(polohlasem) Musíš být bdělí, to ti řeknu.
};

func void DIA_Keroloth_KAP4_HELLO_ruhig()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_ruhig_15_00");	//Uklidni se, paladin by měl být klidný.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_ruhig_07_01");	//Ale já se nechci uklidnit, byly to všechny moje úspory.
};


instance DIA_Keroloth_KAP4_GELDGEFUNDEN(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 42;
	condition = DIA_Keroloth_KAP4_GELDGEFUNDEN_Condition;
	information = DIA_Keroloth_KAP4_GELDGEFUNDEN_Info;
	description = "Našel jsem měšec není tvůj?";
};


func int DIA_Keroloth_KAP4_GELDGEFUNDEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Keroloth_KAP4_HELLO) && (Npc_HasItems(other,ItMi_KerolothsGeldbeutel_MIS) || Npc_HasItems(other,ItMi_KerolothsGeldbeutelLeer_MIS)))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_15_00");	//Našel jsem měšec není tvůj?
	TOPIC_END_KerolothsGeldbeutel = TRUE;
	B_GivePlayerXP(XP_KerolothsGeldbeutel);
	if(B_GiveInvItems(other,self,ItMi_KerolothsGeldbeutelLeer_MIS,1))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_07_01");	//Je prázdný, jaká svině!
		Keroloths_BeutelLeer = TRUE;
	};
	if(B_GiveInvItems(other,self,ItMi_KerolothsGeldbeutel_MIS,1))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_07_02");	//Jak, kde, kdo ho vybral?!
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN,"Jasně. A co odměna?",DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn);
	};
	Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN,"Ležel v kovárně.",DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede);
	Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN,"Myslím, že to byl jeden z drakobijců.",DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG);
	Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN,"Jak to mám vědět?",DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung);
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_15_00");	//Jak to mám vědět?

	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_01");	//Děláš si legraci? Určitě jsi to byl ty!
		Info_ClearChoices(DIA_Keroloth_KAP4_GELDGEFUNDEN);
		Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN,"Myslím, že to byl jeden z drakobijců.",DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG);
		Info_AddChoice(DIA_Keroloth_KAP4_GELDGEFUNDEN,"Polib mi prdel!",DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_kannstmich);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_02");	//Musím to zjistit.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_kannstmich()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_kannstmich_15_00");	//Polib mi prdel!
	AI_Output(self,other,"DIA_Keroloth_KAP4_kannstmich_07_01");	//Já ti dám, okrádat poctivé lidi!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_15_00");	//Myslím, že to byl jeden z drakobijců.
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_01");	//Já to věděl!
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_02");	//Neměli jsme je pouštět do hradu.
	AI_StopProcessInfos(self);
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_15_00");	//Byl v kovárně.
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_07_01");	//V kovárně? Tak to vypadl někomu z drakobijců! A neříkej mě že to tak není.
};

func void DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_15_00");	//Počkej chvilku. A co odměna.

	if(Keroloths_BeutelLeer == TRUE)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_01");	//Tak to byla poslední kapka. Zdá se, že potřebuješ pár přes hubu.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_02");	//Arrh... Dobrá. Tady je pár mincí. A teď mi řekni, kdo to byl?
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
		Keroloth_HasPayed = TRUE;
	};
};


instance DIA_Keroloth_KAP4_BELOHNUNG(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 43;
	condition = DIA_Keroloth_KAP4_BELOHNUNG_Condition;
	information = DIA_Keroloth_KAP4_BELOHNUNG_Info;
	permanent = FALSE;
	description = "Chci svoje nálezné.";
};

func int DIA_Keroloth_KAP4_BELOHNUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Keroloth_KAP4_GELDGEFUNDEN) && (Keroloth_HasPayed == FALSE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_BELOHNUNG_Info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_BELOHNUNG_15_00");	//Chci svoje nálezné.

	if((Keroloths_BeutelLeer == TRUE) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_BELOHNUNG_07_01");	//Ano, ale riskuješ přeraženou čelist!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_BELOHNUNG_07_02");	//To je vše co dostaneš, pár mincí a teď povídej, kdo to byl.
		CreateInvItems(self,ItMi_Gold,50);
		B_GiveInvItems(self,other,ItMi_Gold,50);
		Keroloth_HasPayed = TRUE;
	};
};

instance DIA_Keroloth_KAP4_ENTSPANNDICH(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 44;
	condition = DIA_Keroloth_KAP4_ENTSPANNDICH_Condition;
	information = DIA_Keroloth_KAP4_ENTSPANNDICH_Info;
	permanent = FALSE;
	description = "Klídek.";
};

func int DIA_Keroloth_KAP4_ENTSPANNDICH_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Keroloth_KAP4_GELDGEFUNDEN) && (Kapitel >= 4)) || (MIS_OCGateOpen == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP4_ENTSPANNDICH_Info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_ENTSPANNDICH_15_00");	//Klídek.

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_01");	//Ano, pane! Pokusím se.
	}
	else if((MIS_OCGateOpen == TRUE) && (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_02");	//Nemůžu to dokázat, ale myslím si, že ten zrádce, který otevřel bránu, jsi ty.
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_03");	//Teď za to zaplatíš!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Keroloth_KAP4_ENTSPANNDICH_15_04");	//Dostal jsi měšec zpátky, nebo ne.
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_05");	//Neprovokuj mě... vypadni!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Keroloth_KAP5_EXIT(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 999;
	condition = DIA_Keroloth_KAP5_EXIT_Condition;
	information = DIA_Keroloth_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Keroloth_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Keroloth_KAP6_EXIT(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 999;
	condition = DIA_Keroloth_KAP6_EXIT_Condition;
	information = DIA_Keroloth_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Keroloth_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Keroloth_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Keroloth_PICKPOCKET(C_Info)
{
	npc = PAL_258_Keroloth;
	nr = 900;
	condition = DIA_Keroloth_PICKPOCKET_Condition;
	information = DIA_Keroloth_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Keroloth_PICKPOCKET_Condition()
{
	return C_Beklauen(25,45);
};

func void DIA_Keroloth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Keroloth_PICKPOCKET);
	Info_AddChoice(DIA_Keroloth_PICKPOCKET,Dialog_Back,DIA_Keroloth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Keroloth_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Keroloth_PICKPOCKET_DoIt);
};

func void DIA_Keroloth_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Keroloth_PICKPOCKET);
};

func void DIA_Keroloth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Keroloth_PICKPOCKET);
};

