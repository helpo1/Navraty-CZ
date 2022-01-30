/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void DIA_Babo_Kap3_HaveYourDocs_HereTheyAre - opravena chybějící odměna

*/




instance DIA_Babo_Kap1_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap1_EXIT_Condition;
	information = DIA_Babo_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap1_EXIT_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Hello(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Hello_Condition;
	information = DIA_Babo_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Babo_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_Hello_Info()
{
	AI_Output(self,other,"DIA_Babo_Hello_03_00");	//Ahoj, jsi tu nový, že?
	AI_Output(other,self,"DIA_Babo_Hello_15_01");	//Ano, ty už tu jsi déle?
	AI_Output(self,other,"DIA_Babo_Hello_03_02");	//Čtyři týdny. Už ti dali zbraň?
	AI_Output(other,self,"DIA_Babo_Hello_15_03");	//Ještě ne.
	AI_Output(self,other,"DIA_Babo_Hello_03_04");	//Na, vem si tuhle. Každý novic by měl mít hůl, aby se sám ubránil. Umíš bojovat?
	B_GiveInvItems(self,other,ItMw_1h_Nov_Mace,1);
	AI_EquipBestMeleeWeapon(self);
	AI_Output(other,self,"DIA_Babo_Hello_15_05");	//No, párkrát jsem to dělal...
	AI_Output(self,other,"DIA_Babo_Hello_03_06");	//Jestli chceš, můžu ti něco ukázat, ale měl bych prosbu...
};


instance DIA_Babo_Anliegen(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Anliegen_Condition;
	information = DIA_Babo_Anliegen_Info;
	permanent = FALSE;
	description = "Co za prosbu?";
};


func int DIA_Babo_Anliegen_Condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,DIA_Babo_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Anliegen_Info()
{
	AI_Output(other,self,"DIA_Babo_Anliegen_15_00");	//Co za prosbu?
	AI_Output(self,other,"DIA_Babo_Anliegen_03_01");	//V klášteře je teď jeden paladin, jmenuje se Sergio.
	AI_Output(self,other,"DIA_Babo_Anliegen_03_02");	//Jestli ho přesvědčíš, aby mi pár věcí ukázal, ukážu já pár věcí tobě.
	AI_Output(other,self,"DIA_Babo_Anliegen_15_03");	//Uvidím, co se dá dělat.
	Log_CreateTopic(Topic_BaboTrain,LOG_MISSION);
	Log_SetTopicStatus(Topic_BaboTrain,LOG_Running);
	B_LogEntry(Topic_BaboTrain,"Jestli se mi podaří přesvědčit paladina Sergia, aby si zatrénoval s Babem, Babo mě za odměnu naučí něco o boji s holí.");
};


instance DIA_Babo_Sergio(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Sergio_Condition;
	information = DIA_Babo_Sergio_Info;
	permanent = FALSE;
	description = "Mluvil jsem se Sergiem.";
};


func int DIA_Babo_Sergio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sergio_Babo) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_Sergio_Info()
{
	AI_Output(other,self,"DIA_Babo_Sergio_15_00");	//Mluvil jsem se Sergiem. Každé ráno v pět si na tebe udělá dvě hodiny čas.
	AI_Output(self,other,"DIA_Babo_Sergio_03_01");	//Díky, je to pro mě čest!
	AI_Output(self,other,"DIA_Babo_Sergio_03_02");	//Jestli chceš, teď budu trénovat já tebe.
	Babo_TeachPlayer = TRUE;
	Babo_Training = TRUE;
	B_GivePlayerXP(XP_Ambient * 2);
	Log_CreateTopic(Topic_KlosterTeacher,LOG_NOTE);
	Npc_ExchangeRoutine(Babo,"Train");
	B_LogEntry(Topic_KlosterTeacher,"Babo mě odteď může naučit něco o obouručním boji.");
};


instance DIA_Babo_Teach(C_Info)
{
	npc = NOV_612_Babo;
	nr = 100;
	condition = DIA_Babo_Teach_Condition;
	information = DIA_Babo_Teach_Info;
	permanent = TRUE;
	description = "Jsem připravený učit se.";
};


var int DIA_Babo_Teach_permanent;
var int Babo_Labercount;

func int DIA_Babo_Teach_Condition()
{
	if(((Babo_TeachPlayer == TRUE) && (DIA_Babo_Teach_permanent == FALSE)) || (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int babo_merk2h;

func void DIA_Babo_Teach_Info()
{
	babo_merk2h = other.HitChance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Babo_Teach_15_00");	//Jsem připravený učit se.
	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach,Dialog_Back,DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Babo_Teach_2H_5);
};

func void DIA_Babo_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] >= 75)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_Back_03_00");	//Už umíš všechno, co jsem tě mohl naučit.
		DIA_Babo_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Babo_Teach);
};

func void DIA_Babo_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,75);
	if(other.HitChance[NPC_TALENT_2H] > babo_merk2h)
	{
		if(Babo_Labercount == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_00");	//Bojuj za nevinné. Víra v Innose ti dá sílu.
		};
		if(Babo_Labercount == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_01");	//Innosův služebník nikdy neprovokuje nepřítele, on ho překvapí!
		};
		if(Babo_Labercount == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_02");	//Kamkoli jdeš, hůl měj vždy při sobě.
		};
		if(Babo_Labercount == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_03");	//Innosův služebník je vždy připraven k boji. Jestli nemáš po ruce magii, musíš mít po ruce hůl.
		};
		Babo_Labercount = Babo_Labercount + 1;
		if(Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;
		};
	};
	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach,Dialog_Back,DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Babo_Teach_2H_5);
};

func void DIA_Babo_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,75);
	if(other.HitChance[NPC_TALENT_2H] > babo_merk2h)
	{
		if(Babo_Labercount == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_00");	//Innosův služebník bojuje srdcem, ne jen pažemi.
		};
		if(Babo_Labercount == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_01");	//Musíš pamatovat, kam až můžeš jít.
		};
		if(Babo_Labercount == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_02");	//Musíš ovládat nepřítele. Nebudeš dobře bojovat, když bude on ovládat tebe.
		};
		if(Babo_Labercount == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_03");	//Když se do boje vrhneš neunáhleně, prohraješ ho.
		};
		Babo_Labercount = Babo_Labercount + 1;
		if(Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;
		};
	};
	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach,Dialog_Back,DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Babo_Teach_2H_5);
};

instance DIA_Babo_Wurst(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Wurst_Condition;
	information = DIA_Babo_Wurst_Info;
	permanent = FALSE;
	description = "Tady, mám pro tebe klobásu.";
};

func int DIA_Babo_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Babo_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Babo_Wurst_15_00");	//Tady, mám pro tebe klobásu.
	AI_Output(self,other,"DIA_Babo_Wurst_03_01");	//Jehněčí klobása, super! Nemáš ještě jednu?
	AI_Output(other,self,"DIA_Babo_Wurst_15_02");	//Nezbylo by na ostatní.
	AI_Output(self,other,"DIA_Babo_Wurst_03_03");	//Stále máš jednu pro sebe. Jsme kamarádi... No?
	AI_Output(self,other,"DIA_Babo_Wurst_03_04");	//Dám ti za ni svitek ohnivého šípu.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
	Info_ClearChoices(DIA_Babo_Wurst);
	Info_AddChoice(DIA_Babo_Wurst,"No dobře, tady máš.",DIA_Babo_Wurst_JA);
	Info_AddChoice(DIA_Babo_Wurst,"Ne, to nepůjde.",DIA_Babo_Wurst_NEIN);
};

func void DIA_Babo_Wurst_JA()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Babo_Wurst_JA_15_00");	//No dobře, tady máš.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	AI_Output(self,other,"DIA_Babo_Wurst_JA_03_01");	//Výborně, tady je svitek.
	B_GiveInvItems(self,other,ItSc_Firebolt,1);
	Info_ClearChoices(DIA_Babo_Wurst);
};

func void DIA_Babo_Wurst_NEIN()
{
	AI_Output(other,self,"DIA_Babo_Wurst_NEIN_15_00");	//Ne, to nepůjde.
	AI_Output(self,other,"DIA_Babo_Wurst_NEIN_03_01");	//Poslouchej, víš jaká jsi citlivka?
	Info_ClearChoices(DIA_Babo_Wurst);
};


instance DIA_Babo_YouAndAgon(C_Info)
{
	npc = NOV_612_Babo;
	nr = 3;
	condition = DIA_Babo_YouAndAgon_Condition;
	information = DIA_Babo_YouAndAgon_Info;
	permanent = FALSE;
	description = "Co máš za problém s Agonem?";
};


func int DIA_Babo_YouAndAgon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Opolos_Monastery) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_YouAndAgon_Info()
{
	AI_Output(other,self,"DIA_Babo_YouAndAgon_15_00");	//Co máš za problém s Agonem?
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_01");	//Pohádali jsme se o to, jak správně pečovat o ohnivé kopřivy.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_02");	//Agon je přelívá tak, že jim hnijí kořeny.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_03");	//A když shnily úplně, hodil to na mě.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_04");	//A teď za trest zametám.
};


instance DIA_Babo_WhyDidAgon(C_Info)
{
	npc = NOV_612_Babo;
	nr = 4;
	condition = DIA_Babo_WhyDidAgon_Condition;
	information = DIA_Babo_WhyDidAgon_Info;
	permanent = FALSE;
	description = "Proč to Agon udělal?";
};


func int DIA_Babo_WhyDidAgon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_YouAndAgon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_WhyDidAgon_Info()
{
	AI_Output(other,self,"DIA_Babo_WhyDidAgon_15_00");	//Proč to Agon udělal?
	AI_Output(self,other,"DIA_Babo_WhyDidAgon_03_01");	//Zeptej se ho sám, kdo ti to řekne líp než on...
};


instance DIA_Babo_PlantLore(C_Info)
{
	npc = NOV_612_Babo;
	nr = 5;
	condition = DIA_Babo_PlantLore_Condition;
	information = DIA_Babo_PlantLore_Info;
	permanent = FALSE;
	description = "Ty se v rostlinách vyznáš dobře?";
};


func int DIA_Babo_PlantLore_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_YouAndAgon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_PlantLore_Info()
{
	AI_Output(other,self,"DIA_Babo_PlantLore_15_00");	//Ty se v rostlinách vyznáš dobře?
	AI_Output(self,other,"DIA_Babo_PlantLore_03_01");	//Naše rodina měla zahradu, kde se dalo pěstovat dost věcí, tak jsem se něco naučil od mého děda.
	AI_Output(self,other,"DIA_Babo_PlantLore_03_02");	//Rád bych ještě někdy pracoval na zahradě.
	MIS_HelpBabo = LOG_Running;
	Log_CreateTopic(Topic_BaboGaertner,LOG_MISSION);
	Log_SetTopicStatus(Topic_BaboGaertner,LOG_Running);
	B_LogEntry(Topic_BaboGaertner,"Babo by raději pečoval o zahradu než zametal dvůr.");
};


instance DIA_Babo_Fegen(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = DIA_Babo_Fegen_Condition;
	information = DIA_Babo_Fegen_Info;
	permanent = FALSE;
	description = "Musím zamést pokoje noviců.";
};


func int DIA_Babo_Fegen_Condition()
{
	if(MIS_ParlanFegen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Babo_Fegen_Info()
{
	AI_Output(other,self,"DIA_Babo_Fegen_15_00");	//Musím zamést pokoje noviců.
	AI_Output(self,other,"DIA_Babo_Fegen_03_01");	//To je na jednoho až moc. Víš co, já ti pomůžu.
	AI_Output(self,other,"DIA_Babo_Fegen_03_02");	//Ale opravdu potřebuji svitek větrné pěsti. Víš, měl jsem štěstí a něco si o něm přečetl, chtěl bych to zkusit.
	AI_Output(self,other,"DIA_Babo_Fegen_03_03");	//Jestli mi to kouzlo seženeš, pomůžu ti s tím metením.
	B_LogEntry(Topic_ParlanFegen,"Babo mi pomůže zamést pokoje noviců, pokud mu seženu svitek větrné pěsti.");
	Wld_InsertItem(ItSc_Windfist,"NW_PATH_TO_MONASTER_AREA_07");
};


instance DIA_Babo_Windfaust(C_Info)
{
	npc = NOV_612_Babo;
	nr = 3;
	condition = DIA_Babo_Windfaust_Condition;
	information = DIA_Babo_Windfaust_Info;
	permanent = TRUE;
	description = "O tom svitku...";
};


var int DIA_Babo_Windfaust_permanent;

func int DIA_Babo_Windfaust_Condition()
{
	if((MIS_ParlanFegen == LOG_Running) && Npc_KnowsInfo(other,DIA_Babo_Fegen) && (DIA_Babo_Windfaust_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Babo_Windfaust_Info()
{
	AI_Output(other,self,"DIA_Babo_Windfaust_15_00");	//O tom svitku...
	AI_Output(self,other,"DIA_Babo_Windfaust_03_01");	//Máš pro mě větrnou pěst?
	if(B_GiveInvItems(other,self,ItSc_Windfist,1))
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_02");	//Tady.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_03");	//Výborně, jdu zametat.
		NOV_Helfer = NOV_Helfer + 1;
		DIA_Babo_Windfaust_permanent = TRUE;
		B_GivePlayerXP(XP_Feger);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FEGEN");
		B_LogEntry(Topic_ParlanFegen,"Babo mi pomůže se zametáním.");
	}
	else
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_04");	//Ještě ne.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_05");	//Neboj, počkám.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Life(C_Info)
{
	npc = NOV_612_Babo;
	nr = 10;
	condition = DIA_Babo_Life_Condition;
	information = DIA_Babo_Life_Info;
	permanent = TRUE;
	description = "Jak jde život v klášteře?";
};


func int DIA_Babo_Life_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Babo_Life_Info()
{
	AI_Output(other,self,"DIA_Babo_Life_15_00");	//Jak jde život v klášteře?
	AI_Output(self,other,"DIA_Babo_Life_03_01");	//Nechci si stěžovat, ale jsou tu přísná pravidla. Porušíš je a jsi potrestán.
	AI_Output(self,other,"DIA_Babo_Life_03_02");	//A samozřejmě spousta noviců se chce stát mágem, takže stále studují v knihovně a chystají se na zkoušku.
	AI_Output(self,other,"DIA_Babo_Life_03_03");	//Já si myslím, že nejlepší příprava na to stát se mágem, je dobře dělat svou práci.
	if(Npc_KnowsInfo(other,DIA_Igaranz_Choosen) == FALSE)
	{
		AI_Output(other,self,"DIA_Babo_Life_15_04");	//CO je to za zkoušku?
		AI_Output(self,other,"DIA_Babo_Life_03_05");	//Zeptej se Igaraze, řekne ti víc.
	};
};


instance DIA_Babo_HowIsIt(C_Info)
{
	npc = NOV_612_Babo;
	nr = 1;
	condition = DIA_Babo_HowIsIt_Condition;
	information = DIA_Babo_HowIsIt_Info;
	permanent = TRUE;
	description = "Tak jak je?";
};


func int DIA_Babo_HowIsIt_Condition()
{
	if((hero.guild == GIL_KDF) && (Kapitel < 3))
	{
		return TRUE;
	};
};


var int Babo_XPgiven;

func void DIA_Babo_HowIsIt_Info()
{
	AI_Output(other,self,"DIA_Babo_HowIsIt_15_00");	//Tak jak je?
	if(MIS_HelpBabo == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_01");	//Děkuji, mágu, za otázání.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_02");	//Líbí se mi práce na zahradě a doufám, že jsou se mnou mágové spokojeni.
		if(Babo_XPgiven == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			Babo_XPgiven = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_03");	//No... No... Dobře, mistře.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_04");	//Tvrdě pracuji a snažím se nezklamat mágy.
	};
	AI_StopProcessInfos(self);
};


var int babomageplantday;

instance DIA_BABO_KDF_HAVEDOCS(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = dia_babo_kdf_havedocs_condition;
	information = dia_babo_kdf_havedocs_info;
	permanent = FALSE;
	description = "Nevíš, co je tohle za dokumenty?";
};


func int dia_babo_kdf_havedocs_condition()
{
	if(((other.guild == GIL_KDF) || (other.guild == GIL_NOV)) && ((Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1) || ((Npc_HasItems(other,ItWr_BabosPinUp_MIS) >= 1) && (Npc_HasItems(other,ItWr_BabosLetter_MIS) >= 1))))
	{
		return TRUE;
	};
};

func void dia_babo_kdf_havedocs_info()
{
	AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_00");	//Nevíš, co je tohle za dokumenty?
	AI_Output(self,other,"DIA_Babo_KDF_HaveDocs_03_01");	//(strach) Já... Já...
	AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_02");	//Uklidni se.

	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_03");	//Novici by si měli pomáhat.
		AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_04");	//Ten dopis je adresován tobě.
		AI_Output(self,other,"DIA_Babo_KDF_HaveDocs_03_05");	//Neřekneš nic mágům?
		AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_06");	//Ne, samozřejmě, že ne.
	}
	else
	{
		AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_07");	//Neřeknu to Parlanovi.
		AI_Output(self,other,"DIA_Babo_KDF_HaveDocs_03_08");	//Eh...
		AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_09");	//Ale ty mi slib, že za dva dny nasbíráš 10 ohnivých kopřiv.
		AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_10");	//A hned ten dopis zničíš.
		AI_Output(other,self,"DIA_Babo_KDF_HaveDocs_15_11");	//Obrázek zničím já.
		AI_Output(self,other,"DIA_Babo_KDF_HaveDocs_03_12");	//Děkuji, slibuji ti to.
		BABOMAGEPLANTDAY = Wld_GetDay() + 2;
	};
	if(Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)
	{
		Npc_RemoveInvItems(other,ItWr_BabosDocs_MIS,1);
		CreateInvItems(other,ItWr_BabosPinUp_MIS,1);
		CreateInvItems(other,ItWr_BabosLetter_MIS,1);
	};
	B_GiveInvItems(other,self,ItWr_BabosLetter_MIS,1);
	Npc_RemoveInvItems(self,ItWr_BabosLetter_MIS,1);
	B_GivePlayerXP(XP_BabosDocs);
};


instance DIA_BABO_KDF_PLANTS(C_Info)
{
	npc = NOV_612_Babo;
	nr = 2;
	condition = dia_babo_kdf_plants_condition;
	information = dia_babo_kdf_plants_info;
	permanent = FALSE;
	description = "Splnil jsi slib?";
};


func int dia_babo_kdf_plants_condition()
{
	if((other.guild == GIL_KDF) && (BABOMAGEPLANTDAY <= Wld_GetDay()) && (BABOMAGEPLANTDAY != 0))
	{
		return TRUE;
	};
};

func void dia_babo_kdf_plants_info()
{
	AI_Output(other,self,"DIA_Babo_KDF_Plants_15_00");	//Splnil jsi slib?
	AI_Output(self,other,"DIA_Babo_KDF_Plants_03_01");	//Samozřejmě, mistře.
	CreateInvItems(self,ItPl_Mana_Herb_01,10);
	Info_ClearChoices(dia_babo_kdf_plants);
	Info_AddChoice(dia_babo_kdf_plants,"Vezmu si ty kopřivy.",dia_babo_kdf_plants_takeall);
	Info_AddChoice(dia_babo_kdf_plants,"Nech si pět těch kopřiv...",dia_babo_kdf_plants_takehalf);
};

func void dia_babo_kdf_plants_takehalf()
{
	AI_Output(other,self,"DIA_Babo_KDF_Plants_15_02");	//Nech si pět těch kopřiv a jdi za mistrem Neorasem procvičovat své alchymistické dovednosti.
	AI_Output(self,other,"DIA_Babo_KDF_Plants_03_02");	//Ano, mistře.
	B_GivePlayerXP(XP_Ambient * 2);
	Npc_ExchangeRoutine(self,"ALCHEMY");
	B_GiveInvItems(self,other,ItPl_Mana_Herb_01,5);
	Info_ClearChoices(dia_babo_kdf_plants);
};

func void dia_babo_kdf_plants_takeall()
{
	AI_Output(other,self,"DIA_Babo_KDF_Plants_15_02");	//Vezmu si ty kopřivy.
	AI_Output(self,other,"DIA_Babo_KDF_Plants_03_03");	//Ano, mistře.
	B_GiveInvItems(self,other,ItPl_Mana_Herb_01,10);
	Info_ClearChoices(dia_babo_kdf_plants);
};


instance DIA_Babo_Kap2_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap2_EXIT_Condition;
	information = DIA_Babo_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap3_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap3_EXIT_Condition;
	information = DIA_Babo_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap3_Hello(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_Hello_Condition;
	information = DIA_Babo_Kap3_Hello_Info;
	permanent = FALSE;
	description = "Co tu děláš?";
};


func int DIA_Babo_Kap3_Hello_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Hello_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Hello_15_00");	//Co tu děláš?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_01");	//Snažím se plnit své povinnosti ke spokojenosti mágů.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_02");	//Neměl bych s tebou mluvit. Jsi tady cizí.
	};
};


instance DIA_Babo_Kap3_KeepTheFaith(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_KeepTheFaith_Condition;
	information = DIA_Babo_Kap3_KeepTheFaith_Info;
	permanent = FALSE;
	description = "Nesmíš ztrácet víru.";
};


func int DIA_Babo_Kap3_KeepTheFaith_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_KeepTheFaith_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_00");	//Nesmíš ztrácet víru.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_01");	//Přísahám, že se to nebude opakovat!
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_02");	//Všichni jsme si museli něčím projít.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_03");	//Ano, mistře. Budu si to pamatovat. Děkuji.
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Babo_Kap3_Unhappy(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_Unhappy_Condition;
	information = DIA_Babo_Kap3_Unhappy_Info;
	permanent = FALSE;
	description = "Nevypadáš vesele.";
};

func int DIA_Babo_Kap3_Unhappy_Condition()
{
	if((Kapitel > 2) && Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Unhappy_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_15_00");	//Nevypadáš vesele.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_01");	//Uh... (zaskočen) Je mi fajn, díky. Opravdu.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_02");	//Jen... Eh, ale nic, nechci si stěžovat.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Tak přestaň fňukat.",DIA_Babo_Kap3_Unhappy_Lament);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"No tak, jestli je něco špatně, vyklop to.",DIA_Babo_Kap3_Unhappy_TellMe);
};

func void DIA_Babo_Kap3_Unhappy_Lament()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_00");	//Tak přestaň fňukat.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01");	//Já... (strach) Neříkej to mágům.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02");	//Nechci být potrestán.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_03");	//Budu o tom přemýšlet.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_TellMe()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_00");	//No tak, jestli je něco špatně, vyklop to.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01");	//Neřekneš to mágům?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_02");	//Vypadám jako někdo, kdo jde hned žalovat?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03");	//No dobře. Mám problém s jedním novicem. Vydírá mě.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_04");	//No tak, ven s tím.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05");	//Igaraz, novic, našel moji osobní korespondenci.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06");	//Vyhrožuje, že jestli nebudu dělat co chce, řekne to mágům.
	MIS_BabosDocs = LOG_Running;
	Log_CreateTopic(Topic_BabosDocs,LOG_MISSION);
	Log_SetTopicStatus(Topic_BabosDocs,LOG_Running);
	B_LogEntry(Topic_BabosDocs,"Igaraz vydírá Baba pomocí nějakých dokumentů.");
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Myslím, že bych se do toho neměl plést.",DIA_Babo_Kap3_Unhappy_Privat);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Co po tobě chce?",DIA_Babo_Kap3_Unhappy_ShouldDo);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Jaké dokumenty to jsou?",DIA_Babo_Kap3_Unhappy_Documents);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Myslíš, že ti s tím můžu pomoci?",DIA_Babo_Kap3_Unhappy_CanHelpYou);
};

func void DIA_Babo_Kap3_Unhappy_Privat()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_00");	//Myslím, že bych se do toho neměl plést.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01");	//Chápu, že nechceš problémy. 
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_02");	//To nějak zvládneš.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_ShouldDo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00");	//Co po tobě chce?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01");	//No, to se docela stydím říct, není to nic nevinného.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02");	//Ani nechci pomyslet na to, co by se stalo, kdyby to prasklo.
};

func void DIA_Babo_Kap3_Unhappy_Documents()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_00");	//Jaké dokumenty to jsou?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01");	//(nejistě) Nikomu do toho nic není, moje osobní věci.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_02");	//No tak, říkej.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03");	//Prostě... Prostě normální korespondence, nic zvláštního.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_04");	//Nebudu se ptát. 
};

func void DIA_Babo_Kap3_Unhappy_CanHelpYou()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00");	//Myslíš, že ti s tím můžu pomoci?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01");	//Udělal bys to?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02");	//No... Možná.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03");	//(spěšně) Samozřejmě, že zaplatím.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04");	//Kolik?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05");	//Nemám moc peněz, ale můžu ti dát magický svitek.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Raději bych s tím nechtěl nic mít.",DIA_Babo_Kap3_Unhappy_No);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy,"Pokusím se s tím něco udělat.",DIA_Babo_Kap3_Unhappy_Yes);
};

func void DIA_Babo_Kap3_Unhappy_No()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_No_15_00");	//Raději bych s tím nechtěl nic mít.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_No_03_01");	//Pak nemám na výběr, musím to vyřešit sám.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_Yes()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_00");	//Pokusím se s tím něco udělat.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01");	//Opravdu? To dokážeš, věřím ti!
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02");	//Jedině musíš zjistit, kde Igaraz schovává své věci. Pak mu je vezmi a vše bude v pořádku.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_03");	//Tak pokračuj v práci a já se o to postarám.
	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

instance DIA_Babo_Kap3_HaveYourDocs(C_Info)
{
	npc = NOV_612_Babo;
	nr = 31;
	condition = DIA_Babo_Kap3_HaveYourDocs_Condition;
	information = DIA_Babo_Kap3_HaveYourDocs_Info;
	permanent = FALSE;
	description = "Mám ty dokumenty.";
};


func int DIA_Babo_Kap3_HaveYourDocs_Condition()
{
	if(((MIS_BabosDocs == LOG_Running) && (Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)) || ((Npc_HasItems(other,ItWr_BabosPinUp_MIS) >= 1) && (Npc_HasItems(other,ItWr_BabosLetter_MIS) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_HaveYourDocs_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_00");	//Mám ty dokumenty.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_01");	//Opravdu? Zachránil jsi mě, ani nevím, jak ti poděkovat.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_02");	//Ano, jasně, jen se uklidni.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_03");	//Jsou to opravdu ty moje? (nervózně) Fakt?! Ukaž mi je.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Zatím si je ponechám.",DIA_Babo_Kap3_HaveYourDocs_KeepThem);

	if(BabosDocsOpen == TRUE)
	{
		Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"No, cena teď trochu narostla.",DIA_Babo_Kap3_HaveYourDocs_IWantMore);
	};

	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Tady máš.",DIA_Babo_Kap3_HaveYourDocs_HereTheyAre);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00");	//Zatím si je ponechám.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01");	//Cože? Co tím myslíš?
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Dělám si srandu.",DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Je to moje!",DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00");	//Dělám si srandu.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01");	//Haha, vtipné. Kde jsou?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02");	//Tady.

	if(Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItWr_BabosDocs_MIS,1);
		Npc_RemoveInvItems(self,ItWr_BabosDocs_MIS,1);
	}
	else
	{
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItWr_BabosPinUp_MIS,1);
		Npc_RemoveInvItems(other,ItWr_BabosLetter_MIS,1);
	};

	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03");	//Nechci tě urazit, ale bál jsem se.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04");	//V pořádku. Užij si je.
	MIS_BabosDocs = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_BabosDocs,LOG_SUCCESS);
	B_LogEntry(Topic_BabosDocs,"Dal jsem dokumenty Babovi.");
	B_GivePlayerXP(XP_BabosDocs);
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00");	//Je to moje!
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01");	//Cože? Patří mě, nemáš žádné právo!
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00");	//Drž jazyk za zuby!
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01");	//Dobře, ale toho budeš litovat.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02");	//Uvidíme.
	MIS_BabosDocs = LOG_FAILED;
	B_LogEntry_Failed(Topic_BabosDocs);
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00");	//No, cena teď trochu narostla.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01");	//Nejsi o nic lepší než ostatní. Co chceš?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02");	//Co máš?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03");	//Mám sto zlatých, je to vše, co mám.
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"To je málo!",DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs,"Platí!",DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00");	//To je málo!
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01");	//Víc nemám, kdybych měl, už nejsem v klášteře.
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough()
{
	B_GivePlayerXP(XP_BabosDocs);
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00");	//Platí!
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01");	//Tady jsou.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");	//Tady máš.

	if(Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItWr_BabosDocs_MIS,1);
		Npc_RemoveInvItems(self,ItWr_BabosDocs_MIS,1);
	}
	else
	{
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItWr_BabosPinUp_MIS,1);
		Npc_RemoveInvItems(other,ItWr_BabosLetter_MIS,1);
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01");	//Ano, vše je na svém místě.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");	//Díval ses do nich?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03");	//Záleží na tom?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04");	//Když je mám u sebe, tak už ne.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");	//Teď už můžu zase klidně spát.
	MIS_BabosDocs = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_BabosDocs,LOG_SUCCESS);
	B_LogEntry(Topic_BabosDocs,"Dal jsem dokumenty Babovi.");
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_HereTheyAre()
{
	B_GivePlayerXP(XP_BabosDocs);
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");	//Tu máš.

	if(Npc_HasItems(other,ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItWr_BabosDocs_MIS,1);
		Npc_RemoveInvItems(self,ItWr_BabosDocs_MIS,1);
	}
	else
	{
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItWr_BabosPinUp_MIS,1);
		Npc_RemoveInvItems(other,ItWr_BabosLetter_MIS,1);
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01");	//Ano, vše je na svém místě.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");	//Díval ses do nich?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03");	//Záleží na tom?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04");	//Když je mám u sebe, tak už ne.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");	//Teď už můžu zase klidně spát.
	B_GiveInvItems(self,other,ItSc_Firestorm,1);
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 2;
	MIS_BabosDocs = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_BabosDocs,LOG_SUCCESS);
	B_LogEntry(Topic_BabosDocs,"Dal jsem dokumenty Babovi.");
	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

instance DIA_Babo_Kap3_Perm(C_Info)
{
	npc = NOV_612_Babo;
	nr = 39;
	condition = DIA_Babo_Kap3_Perm_Condition;
	information = DIA_Babo_Kap3_Perm_Info;
	permanent = TRUE;
	description = "Jak jsi spokojený s prací?";
};

func int DIA_Babo_Kap3_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Perm_Info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_00");	//Jak jsi spokojený s prací?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_01");	//Víra v Innose mi dává sílu.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_02");	//Nechci být hrubý, ale mám hodně práce.
		AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_03");	//Pokračuj.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_04");	//(s úlevou) Díky.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_05");	//Všechno je v pořádku, ale musím zpátky do práce.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_06");	//Jestli nechci být potrestán, musím vše stihnout do půlnoci.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap4_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap4_EXIT_Condition;
	information = DIA_Babo_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_Kap5_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = DIA_Babo_Kap5_EXIT_Condition;
	information = DIA_Babo_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babo_Kap5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babo_PICKPOCKET(C_Info)
{
	npc = NOV_612_Babo;
	nr = 900;
	condition = DIA_Babo_PICKPOCKET_Condition;
	information = DIA_Babo_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_20;
};


func int DIA_Babo_PICKPOCKET_Condition()
{
	return C_Beklauen(17,25);
};

func void DIA_Babo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Babo_PICKPOCKET);
	Info_AddChoice(DIA_Babo_PICKPOCKET,Dialog_Back,DIA_Babo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Babo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Babo_PICKPOCKET_DoIt);
};

func void DIA_Babo_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,20);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Babo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Babo_PICKPOCKET);
};


instance DIA_BABO_KAP6_EXIT(C_Info)
{
	npc = NOV_612_Babo;
	nr = 999;
	condition = dia_babo_kap6_exit_condition;
	information = dia_babo_kap6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_babo_kap6_exit_condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void dia_babo_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

