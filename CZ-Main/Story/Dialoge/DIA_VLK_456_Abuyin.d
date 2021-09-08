
instance DIA_Abuyin_EXIT(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 999;
	condition = DIA_Abuyin_EXIT_Condition;
	information = DIA_Abuyin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Abuyin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Abuyin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Abuyin_PICKPOCKET(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 900;
	condition = DIA_Abuyin_PICKPOCKET_Condition;
	information = DIA_Abuyin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Abuyin_PICKPOCKET_Condition()
{
	return C_Beklauen(75,200);
};

func void DIA_Abuyin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
	Info_AddChoice(DIA_Abuyin_PICKPOCKET,Dialog_Back,DIA_Abuyin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Abuyin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Abuyin_PICKPOCKET_DoIt);
};

func void DIA_Abuyin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
};

func void DIA_Abuyin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
};


instance DIA_Abuyin_Hallo(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Hallo_Condition;
	information = DIA_Abuyin_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Abuyin_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_00");	//(přemítá) Zvláštní. Připadáš mi povědomý, cizinče...
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_01");	//No... nesmírné jsou tajemství času a vesmíru... Á, omluv mou nezdvořilost, synu trpělivosti. Ještě jsem tě ani nepřivítal...
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_02");	//Vítej, příteli. Sedni si na koberec a vychutnej si vodní dýmku.
};


instance DIA_Abuyin_du(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_du_Condition;
	information = DIA_Abuyin_du_Info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int DIA_Abuyin_du_Condition()
{
	return TRUE;
};

func void DIA_Abuyin_du_Info()
{
	AI_Output(other,self,"DIA_Abuyin_du_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Abuyin_du_13_01");	//Jmenuju se Abú Džín ibn Džadír ibn Omar Chalíd ben Hádží al-Šarídí. Jsem věštcem a prorokem, astrologem a dodavatelem tabáku.
};


instance DIA_Abuyin_Kraut(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Kraut_Condition;
	information = DIA_Abuyin_Kraut_Info;
	permanent = FALSE;
	description = "Jaký druh tabáku nabízíš?";
};


func int DIA_Abuyin_Kraut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Kraut_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Kraut_15_00");	//Jaký druh tabáku nabízíš?
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_01");	//Mé dýmky jsou naplněny pikantním a osvěžujícím jablečným tabákem.
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_02");	//Posluž si, kdykoli budeš chtít, syne dobrodružství.
};


instance DIA_Abuyin_anderen(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_anderen_Condition;
	information = DIA_Abuyin_anderen_Info;
	permanent = FALSE;
	description = "Máš i jiný tabák?";
};


func int DIA_Abuyin_anderen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Kraut))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_anderen_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Abuyin_anderen_15_00");	//Máš i jiný tabák?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_01");	//Nabízím pouze ten nejlepší tabák. Tato jablečná směs má podobné vlastnosti jako tabák z mé domoviny, Jižních ostrovů.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_02");	//Ale samozřejmě se nijak nebráním vyzkoušet jakýkoli jiný druh - pokud tedy někdo dokáže vyrobit opravdu dobrý tabák.
	AI_Output(other,self,"DIA_Abuyin_anderen_15_03");	//Jak se to dělá?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_04");	//Jako základ doporučuju můj jablečný tabák. A pak můžeš vyzkoušet kombinace s dalšími ingrediencemi.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_05");	//Výroba probíhá v alchymistické koloně a vyžaduje základní znalosti alchymie.
	AbuyinTellTabak = TRUE;
	Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAlchemy,"Abuyin mi řekl, jak vytvořit nový druh tabáku. Jako základ musím použít jablečný tabák a na alchymistickém stolu ho smíchat s nějakou další přísadou.");
};


instance DIA_Abuyin_Woher(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Woher_Condition;
	information = DIA_Abuyin_Woher_Info;
	permanent = FALSE;
	description = "Kde se dá sehnat jablečný tabák?";
};


func int DIA_Abuyin_Woher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_anderen))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Woher_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Woher_15_00");	//Kde se dá sehnat jablečný tabák?
	AI_Output(self,other,"DIA_Abuyin_Woher_13_01");	//Dám ti dvě dávky. Je jen na tvé moudrosti, jak s ním naložíš.
	AI_Output(self,other,"DIA_Abuyin_Woher_13_02");	//Pokud budeš chtít další, zajdi přímo za Zuridem, mistrem lektvarů. Dělá si svůj vlastní tabák a také ho samozřejmě prodává.
	B_GiveInvItems(self,other,ItMi_ApfelTabak,2);
};

func void B_TabakProbieren()
{
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_00");	//Nech mě ten tabák vyzkoušet.
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_01");	//Ne, obávám se, že mi tahle směs nebude vyhovovat. Ale možná se ti podaří nalézt někoho jiného, kdo ehm... ocení takovou delikatesu.
};

var int Test_SumpfTabak;
var int Test_PilzTabak;
var int Test_DoppelTabak;
var int Test_Honigtabak;
var int Test_Hasish;

instance DIA_Abuyin_Mischung(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 10;
	condition = DIA_Abuyin_Mischung_Condition;
	information = DIA_Abuyin_Mischung_Info;
	permanent = TRUE;
	description = "Mám novou směs tabáku...";
};

func int DIA_Abuyin_Mischung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_anderen) && (Abuyin_DoneSpiltz == FALSE) && ((Npc_HasItems(other,ItMi_SumpfTabak) >= 1) || (Npc_HasItems(other,ItMi_PilzTabak) >= 1) || (Npc_HasItems(other,ItMi_Hasish) >= 1) || (Npc_HasItems(other,ItMi_DoppelTabak) >= 1) || (Npc_HasItems(other,ItMi_Honigtabak) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Mischung_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Mischung_15_00");	//Mám novou směs tabáku...
	Info_ClearChoices(DIA_Abuyin_Mischung);

	Info_AddChoice(DIA_Abuyin_Mischung,Dialog_Back,DIA_Abuyin_Mischung_BACK);

	if((Npc_HasItems(other,ItMi_SumpfTabak) >= 1) && (Test_SumpfTabak == FALSE))
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_KRAUT,DIA_Abuyin_Mischung_Sumpf);
	};
	if((Npc_HasItems(other,ItMi_PilzTabak) >= 1) && (Test_PilzTabak == FALSE))
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_PILZ,DIA_Abuyin_Mischung_Pilz);
	};
	if((Npc_HasItems(other,ItMi_DoppelTabak) >= 1) && (Test_DoppelTabak == FALSE))
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_DOPPEL,DIA_Abuyin_Mischung_Doppel);
	};
	if((Npc_HasItems(other,ItMi_Honigtabak) >= 1) && (Test_Honigtabak == FALSE))
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_HONIG,DIA_Abuyin_Mischung_Super);
	};
	if((Npc_HasItems(other,ItMi_Hasish) >= 1) && (Test_Hasish == FALSE))
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_GANDJA,DIA_Abuyin_Mischung_MegaSuper);
	};
};

func void DIA_Abuyin_Mischung_BACK()
{
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Sumpf()
{
	B_GiveInvItems(other,self,ItMi_SumpfTabak,1);
	Test_SumpfTabak = TRUE;
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Pilz()
{
	B_GiveInvItems(other,self,ItMi_PilzTabak,1);
	Test_PilzTabak = TRUE;
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Doppel()
{
	B_GiveInvItems(other,self,ItMi_DoppelTabak,1);
	Test_DoppelTabak = TRUE;
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Super()
{
	B_GiveInvItems(other,self,ItMi_Honigtabak,1);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_00");	//Nech mě ten tabák vyzkoušet.
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_01");	//Chutná to přímo neuvěřitelně! Nikdy jsem v celém svém životě nic lepšího nekouřil!
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_02");	//Jak jsi tu směs připravil?
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_03");	//Smíchal jsem tabák s medem.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_04");	//To se ti opravdu povedlo, otče umění mísení. Byl bych potěšen, kdybych směl své nuzné dýmky naplnit tak vzácnou směsí.
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_05");	//Tak je naplň.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_06");	//Díky, synu velkorysosti. Žádná jiná směs nemůže být tak dobrá jako tato. Koupím od tebe veškerou směs tohoto druhu, co mi přineseš.
	Abuyin_Honigtabak = TRUE;
	Test_Honigtabak = TRUE;

	if((Abuyin_Hasish == TRUE) && (Abuyin_Honigtabak == TRUE))
	{
		Abuyin_DoneSpiltz = TRUE;
	};

	B_GivePlayerXP(XP_Ambient * 2);
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_MegaSuper()
{
	AI_Output(self,other,"DIA_Abuyin_Mischung_MegaSuper_13_00");	//Co je to?
	AI_Output(other,self,"DIA_Abuyin_Mischung_MegaSuper_13_01");	//Zkus to! Bude se vám to líbit...
	AI_Output(self,other,"DIA_Abuyin_Mischung_MegaSuper_13_02");	//Dobře, pojď sem.
	B_GiveInvItems(other,self,ItMi_Hasish,1);
	Npc_RemoveInvItems(self,ItMi_Hasish,1);	
	CreateInvItems(self,itmi_specialjoint,1);
	Abuyin_Hasish = TRUE;
	Test_Hasish = TRUE;

	if((Abuyin_Hasish == TRUE) && (Abuyin_Honigtabak == TRUE))
	{
		Abuyin_DoneSpiltz = TRUE;
	};

	AI_StopProcessInfos(self);

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	AI_UseItem(self,itmi_specialjoint);
	Npc_SetRefuseTalk(self,5);
	hero.aivar[AIV_INVINCIBLE] = FALSE;
};

instance DIA_Abuyin_Mischung_MegaSuper_Ok(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Mischung_MegaSuper_Ok_Condition;
	information = DIA_Abuyin_Mischung_MegaSuper_Ok_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Abuyin_Mischung_MegaSuper_Ok_Condition()
{
	if(Abuyin_Hasish == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Mischung_MegaSuper_Ok_Info()
{
	B_GivePlayerXP(XP_Ambient * 5);
	AI_Output(self,other,"DIA_Abuyin_Mischung_MegaSuper_Ok_13_03");	//Och... (přichází k sobě) Co to bylo a jak jsi to připravil.
	AI_Output(other,self,"DIA_Abuyin_Mischung_MegaSuper_Ok_13_04");	//To zůstane mým malým tajemstvím.
	AI_Output(self,other,"DIA_Abuyin_Mischung_MegaSuper_Ok_15_05");	//To byla fantazie, nic takového jsem v životě ještě nezažil!
	AI_Output(other,self,"DIA_Abuyin_Mischung_MegaSuper_Ok_13_06");	//No, tak si ho nech.
	AI_Output(self,other,"DIA_Abuyin_Mischung_MegaSuper_Ok_15_07");	//To se neboj. Hmm... zábavná věc!
	AI_Output(self,other,"DIA_Abuyin_Mischung_MegaSuper_Ok_15_08");	//Podívej, zatím ho nikomu nedávej! Nikdy nevíš...
};

instance DIA_Abuyin_Trade(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Trade_Condition;
	information = DIA_Abuyin_Trade_Info;
	permanent = TRUE;
	description = "Mám pro tebe trochu medového tabáku.";
};

func int DIA_Abuyin_Trade_Condition()
{
	if((Abuyin_Honigtabak == TRUE) && (Npc_HasItems(other,ItMi_Honigtabak) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Trade_Info()
{
	var int TabakExp;

	Abuyin_Score = FALSE;
	Abuyin_Score = Npc_HasItems(other,ItMi_Honigtabak) * VALUE_ItMi_HonigTabak;
	TabakExp = FALSE;
	TabakExp = Npc_HasItems(other,ItMi_Honigtabak);

	B_GivePlayerXP(TabakExp * 50);
	AI_Output(other,self,"DIA_Abuyin_Trade_15_00");	//Mám pro tebe trochu medového tabáku.
	B_GiveInvItems(other,self,ItMi_Honigtabak,Npc_HasItems(other,ItMi_Honigtabak));
	Npc_RemoveInvItems(self,ItMi_Honigtabak,Npc_HasItems(self,ItMi_Honigtabak));	
	AI_Output(self,other,"DIA_Abuyin_Trade_13_01");	//Obchodovat s tebou je mi neskonalým potěšením.
	B_GiveInvItems(self,other,ItMi_Gold,Abuyin_Score);
};

instance DIA_Abuyin_Herb(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Herb_Condition;
	information = DIA_Abuyin_Herb_Info;
	permanent = FALSE;
	description = "Zajímal by tě tenhle balíček drog?";
};

func int DIA_Abuyin_Herb_Condition()
{
	if(Npc_HasItems(other,ItMi_HerbPaket) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Herb_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Herb_15_00");	//Zajímal by tě tenhle balíček drog?
	AI_Output(self,other,"DIA_Abuyin_Herb_13_01");	//Balík bylinek - neříkej, že to je tráva z bažin. Ó, dej to pryč, synu lehkovážnosti.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_02");	//Jestli mě s tím chytí městské stráže, pošlou mě rovnou za mříže - a ty nedopadneš o moc lépe!
	AI_Output(self,other,"DIA_Abuyin_Herb_13_03");	//Pokud chceš tu zásobu prodat, dám ti jednu radu - opusť tohle město.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_04");	//Pokus se toho zbavit někde za hradbami. Všechno, co za to můžeš dostat tady, je spousta trablů.
};

instance DIA_Abuyin_Weissagung(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung_Condition;
	information = DIA_Abuyin_Weissagung_Info;
	permanent = FALSE;
	description = "Dokážeš mi předpovědět budoucnost?";
};


func int DIA_Abuyin_Weissagung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_00");	//Dokážeš mi předpovědět budoucnost?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_01");	//Za menší poplatek jsem ti k službám, ó otče velkorysosti.
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_02");	//Kolik chceš?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_03");	//Za pouhých 25 zlatých budu kvůli tobě riskovat pohled skrze čas.
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_04");	//Ale pamatuj - budoucnost je vždycky nejistá. Vše, co mohu udělat, je zběžně prolétnout několik útržků času.
};


instance DIA_Abuyin_Zukunft(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft_Condition;
	information = DIA_Abuyin_Zukunft_Info;
	permanent = TRUE;
	description = "Předpověz mi budoucnost (zaplatit 25 zlatých).";
};


var int DIA_Abuyin_Zukunft_permanent;

func int DIA_Abuyin_Zukunft_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung) && (DIA_Abuyin_Zukunft_permanent == FALSE) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft_15_00");	//Předpověz mi mou budoucnost.

	if(B_GiveInvItems(other,self,ItMi_Gold,25))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_01");	//Dobrá, hledači vědomostí. Teď se musím dostat do hypnotického stavu. Jsi připraven?
		Info_ClearChoices(DIA_Abuyin_Zukunft);
		Info_AddChoice(DIA_Abuyin_Zukunft,"Jsem připraven.",DIA_Abuyin_Zukunft_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_02");	//Ó, otče mincí, žádám tě o 25 zlatých, za to, že nahlédnu do budoucnosti.
	};
};

func void DIA_Abuyin_Zukunft_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_00");	//(v transu) ... Skřeti... hlídají vstup... stará chodba... Hornické údolí...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_01");	//(v transu) ... Muž v zářivé zbroji... mág... je s ním tvůj přítel... čeká na tebe...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_02");	//(v transu) ... Oheň! Útok... mocná stvoření... plameny... mnoho... jich zemře...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_00");	//(v tranzu) ... co je to... Město... ruiny... Quarhodron v Jharkendaru...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_01");	//(v tranzu) ... nazývá se... Quarhodron v Jharkendaru!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_03");	//... Je mi líto, ale vize je u konce. Už tu není nic, co bych mohl spatřit.
	DIA_Abuyin_Zukunft_permanent = TRUE;
	Abuyin_Zukunft = 1;
	Info_ClearChoices(DIA_Abuyin_Zukunft);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Nochmal(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Nochmal_Condition;
	information = DIA_Abuyin_Nochmal_Info;
	permanent = TRUE;
	description = "Můžeš mi udělat ještě další proroctví?";
};


func int DIA_Abuyin_Nochmal_Condition()
{
	if(Kapitel == Abuyin_Zukunft)
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Nochmal_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Nochmal_15_00");	//Můžeš mi udělat ještě další proroctví?
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_01");	//Ó synu záhadné budoucnosti, není v mé moci poodhalit závoj času.
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_02");	//Pouze pokud mi čas sešle další znamení, budu schopen se do něj podívat znovu.
	if(Abuyin_Erzaehlt == FALSE)
	{
		AI_Output(other,self,"DIA_Abuyin_Nochmal_15_03");	//A kdy to bude?
		AI_Output(self,other,"DIA_Abuyin_Nochmal_13_04");	//Až se budoucnost stane přítomností a ty budeš pokračovat ve své cestě.
		Abuyin_Erzaehlt = TRUE;
	};
};

func void B_Abuyin_Weissagung()
{
	AI_Output(other,self,"B_Abuyin_Weissagung_15_00");	//Můžeš mi předpovědět budoucnost?
	AI_Output(self,other,"B_Abuyin_Weissagung_13_01");	//Ano, čas postoupil a já ti na oplátku za několik mincí sdělím proroctví.
	AI_Output(other,self,"B_Abuyin_Weissagung_15_02");	//Kolik?
};


instance DIA_Abuyin_Weissagung2(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung2_Condition;
	information = DIA_Abuyin_Weissagung2_Info;
	permanent = FALSE;
	description = "Můžeš věštit mou budoucnost?";
};


func int DIA_Abuyin_Weissagung2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung2_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung2_13_00");	//Za pouhých 100 zlatých budu kvůli tobě riskovat pohled skrze čas.
};


instance DIA_Abuyin_Zukunft2(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft2_Condition;
	information = DIA_Abuyin_Zukunft2_Info;
	permanent = TRUE;
	description = "Předpověz mi budoucnost (zaplatit 100 zlatých).";
};


var int DIA_Abuyin_Zukunft2_permanent;

func int DIA_Abuyin_Zukunft2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung2) && (DIA_Abuyin_Zukunft2_permanent == FALSE) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft2_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft2_15_00");	//Předpověz mi mou budoucnost.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_01");	//Dobrá, synu udatnosti. Teď se dostanu do hypnotického stavu. Jsi připraven?
		Info_ClearChoices(DIA_Abuyin_Zukunft2);
		Info_AddChoice(DIA_Abuyin_Zukunft2,"Jsem připraven.",DIA_Abuyin_Zukunft2_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_02");	//Ó otče mincí, žádám tě o 100 zlatých za to, že nahlédnu do budoucnosti.
	};
};

func void DIA_Abuyin_Zukunft2_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_00");	//(v transu) ... Žoldák... bude tě potřebovat... strašná vražda... Oko...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_01");	//(v transu) ... zlověstní stoupenci... přicházejí... hledají tebe... strážce padne...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_02");	//(v transu) ... ale tři se spojí... jedině pak získáš, co ti náleží...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_03");	//To je vše. Není nic, co bych ještě mohl spatřit.
	DIA_Abuyin_Zukunft2_permanent = TRUE;
	Abuyin_Zukunft = 2;
	Info_ClearChoices(DIA_Abuyin_Zukunft2);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Weissagung3(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung3_Condition;
	information = DIA_Abuyin_Weissagung3_Info;
	permanent = FALSE;
	description = "Můžeš věštit mou budoucnost?";
};


func int DIA_Abuyin_Weissagung3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung3_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung3_13_00");	//Za pouhých 250 zlatých budu kvůli tobě riskovat pohled skrze čas.
};


instance DIA_Abuyin_Zukunft3(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft3_Condition;
	information = DIA_Abuyin_Zukunft3_Info;
	permanent = TRUE;
	description = "Předpověz mi budoucnost (zaplatit 250 zlatých).";
};


var int DIA_Abuyin_Zukunft3_permanent;

func int DIA_Abuyin_Zukunft3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung3) && (DIA_Abuyin_Zukunft3_permanent == FALSE) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft3_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft3_15_00");	//Předpověz mi budoucnost.
	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_01");	//Dobrá, synu vědomostí. Teď se dostanu do hypnotického stavu. Jsi připraven?
		Info_ClearChoices(DIA_Abuyin_Zukunft3);
		Info_AddChoice(DIA_Abuyin_Zukunft3,"Jsem připraven.",DIA_Abuyin_Zukunft3_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_02");	//Ó otče mincí, žádám tě o 250 zlatých za to, že nahlédnu do budoucnosti.
	};
};

func void DIA_Abuyin_Zukunft3_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_00");	//(v transu) ... musíš donutit... co není osud nikoho jiného, pouze tvůj...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_01");	//(v transu) ... přes sníh a oheň... přes led a plameny...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_02");	//(v transu) ... Muži v podivné zbroji... bažiny... ještěrani... čekají na tebe...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_03");	//To je vše. Není nic, co bych ještě mohl spatřit.
	DIA_Abuyin_Zukunft3_permanent = TRUE;
	Abuyin_Zukunft = 3;
	Info_ClearChoices(DIA_Abuyin_Zukunft3);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Weissagung4(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung4_Condition;
	information = DIA_Abuyin_Weissagung4_Info;
	permanent = FALSE;
	description = "Můžeš věštit mou budoucnost?";
};


func int DIA_Abuyin_Weissagung4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung4_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung4_13_00");	//Za pouhých 500 zlatých budu kvůli tobě riskovat pohled skrze čas.
};


instance DIA_Abuyin_Zukunft4(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft4_Condition;
	information = DIA_Abuyin_Zukunft4_Info;
	permanent = TRUE;
	description = "Předpověz mi budoucnost (zaplatit 500 zlatých).";
};


var int DIA_Abuyin_Zukunft4_permanent;

func int DIA_Abuyin_Zukunft4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung4) && (DIA_Abuyin_Zukunft4_permanent == FALSE) && (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft4_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft4_15_00");	//Předpověz mi mou budoucnost.
	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_01");	//Dobrá, synu vědomostí. Teď se dostanu do hypnotického stavu. Jsi připraven?
		Info_ClearChoices(DIA_Abuyin_Zukunft4);
		Info_AddChoice(DIA_Abuyin_Zukunft4,"Jsem připraven.",DIA_Abuyin_Zukunft4_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_02");	//Ó otče mincí, žádám tě o 500 zlatých za to, že nahlédnu do budoucnosti.
	};
};

func void DIA_Abuyin_Zukunft4_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_00");	//(v transu) ... místo vědomostí... jiná země... temné místo široko daleko...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_01");	//(v transu) ... udatní společníci... musíš zvolit...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_02");	//(v transu) ... chrám... leží osamocen v Adanově říši... skrytý v mlze...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_03");	//To je vše. Není nic, co bych ještě mohl spatřit.
	DIA_Abuyin_Zukunft4_permanent = TRUE;
	Abuyin_Zukunft = 4;
	Info_ClearChoices(DIA_Abuyin_Zukunft4);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Weissagung5(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung5_Condition;
	information = DIA_Abuyin_Weissagung5_Info;
	permanent = FALSE;
	description = "Můžeš věštit mou budoucnost?";
};


func int DIA_Abuyin_Weissagung5_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung5_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung5_13_00");	//Za pouhých 1000 zlatých budu kvůli tobě riskovat pohled skrze čas.
};


instance DIA_Abuyin_Zukunft5(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft5_Condition;
	information = DIA_Abuyin_Zukunft5_Info;
	permanent = TRUE;
	description = "Předpověz mi budoucnost (zaplatit 1000 zlatých).";
};


var int DIA_Abuyin_Zukunft5_permanent;

func int DIA_Abuyin_Zukunft5_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung5) && (DIA_Abuyin_Zukunft5_permanent == FALSE) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft5_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft5_15_00");	//Předpověz mi mou budoucnost.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_01");	//Dobrá, synu vědomostí. Teď se dostanu do hypnotického stavu. Jsi připraven?
		Info_ClearChoices(DIA_Abuyin_Zukunft5);
		Info_AddChoice(DIA_Abuyin_Zukunft5,"Jsem připraven.",DIA_Abuyin_Zukunft5_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_02");	//Ó, otče mincí, žádám tě o 1000 zlatých za to, že nahlédnu do budoucnosti!
	};
};

func void DIA_Abuyin_Zukunft5_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_00");	//(v transu) ... Temnota pohltí zemi... zlo zvítězí...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_01");	//(v transu) ... král prohraje válku se skřety...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_02");	//(v transu) ... vrátíš se, ale nenalezneš klidu...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_03");	//To je vše. Není nic, co bych ještě mohl spatřit.
	DIA_Abuyin_Zukunft5_permanent = TRUE;
	Abuyin_Zukunft = 5;
	Info_ClearChoices(DIA_Abuyin_Zukunft5);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_ABUYIN_TELLGUARDIANS(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = dia_abuyin_tellguardians_condition;
	information = dia_abuyin_tellguardians_info;
	permanent = FALSE;
	description = "Mám otázku.";
};


func int dia_abuyin_tellguardians_condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (GUARDIAN_WAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_abuyin_tellguardians_info()
{
	AI_Output(other,self,"DIA_Abuyin_TellGuardians_01_02");	//Něco divného se děje kolem mě, a nemohu pochopit co to je.
	AI_Output(self,other,"DIA_Abuyin_TellGuardians_01_03");	//Hmmm... (pozorně sleduje) To je zajímavé! I já kolem tebe cítím auru tajemství.
	AI_Output(other,self,"DIA_Abuyin_TellGuardians_01_05");	//Může mi pomoci tvůj dar vidět budoucnost?
	AI_Output(self,other,"DIA_Abuyin_TellGuardians_01_06");	//Nó... (nejistý) Můžu to zkusit.
	AI_Output(self,other,"DIA_Abuyin_TellGuardians_01_07");	//Nicméně jak jsi pochopil - nemůžu úplně odpovědět na tvé otázky.
	ABUYIN_TELLGUARDIANS = TRUE;
};


instance DIA_ABUYIN_FINDMEGUARDIANS(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = dia_abuyin_findmeguardians_condition;
	information = dia_abuyin_findmeguardians_info;
	permanent = TRUE;
	description = "Řekni mi co víš.";
};


func int dia_abuyin_findmeguardians_condition()
{
	if((ABUYIN_TELLGUARDIANS == TRUE) && (TELLABOUTALL == FALSE))
	{
		return TRUE;
	};
};

func void dia_abuyin_findmeguardians_info()
{
	AI_Output(other,self,"DIA_Abuyin_FindMeGuardians_01_00");	//Řekni mi co víš.
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_01_01");	//Dobrá. Připraven?!
	Info_ClearChoices(dia_abuyin_findmeguardians);
	if(MIS_DAGOTTEST == FALSE)
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Připraven.",dia_abuyin_findmeguardians_dagot);
	}
	else if((DAGOT_AGREE == TRUE) && (MIS_MORIUSTEST == FALSE))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Připraven.",dia_abuyin_findmeguardians_morius);
	}
	else if((MORIUS_AGREE == TRUE) && (MIS_TEGONTEST == FALSE))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Připraven.",dia_abuyin_findmeguardians_tegon);
	}
	else if((TEGON_AGREE == TRUE) && (MIS_KELIOSTEST == FALSE) && (Kapitel >= 3))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Připraven.",dia_abuyin_findmeguardians_kelios);
	}
	else if((KELIOS_AGREE == TRUE) && (MIS_DEMOSTEST == FALSE) && (Kapitel >= 3))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Připraven.",dia_abuyin_findmeguardians_demos);
	}
	else if((DEMOS_AGREE == TRUE) && (MIS_FARIONTEST == FALSE) && (Kapitel >= 3))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Připraven.",dia_abuyin_findmeguardians_farion);
	}
	else if((FARION_AGREE == TRUE) && (MIS_GADERTEST == FALSE) && (Kapitel >= 4))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Připraven.",dia_abuyin_findmeguardians_gader);
	}
	else if((GADER_AGREE == TRUE) && (MIS_NARUSTEST == FALSE) && (Kapitel >= 4))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Připraven.",dia_abuyin_findmeguardians_narus);
	}
	else if((NARUS_AGREE == TRUE) && (MIS_WAKONTEST == FALSE) && (Kapitel >= 4))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Připraven.",dia_abuyin_findmeguardians_wakon);
	}
	else if((WAKON_AGREE == TRUE) && (MIS_STONNOSTEST == FALSE) && (Kapitel >= 4))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Připraven.",dia_abuyin_findmeguardians_stonnos);
	}
	else
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Připraven.",dia_abuyin_findmeguardians_noone);
	};
};

func void dia_abuyin_findmeguardians_dagot()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Dagot_01_00");	//... (snaží se soustředit) ... Poslouchej mě, poutníku!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Dagot_01_01");	//... Jdi dlouhou cestu a tam se pomodli k Innosovi - Jedině tak najdeš to, co hledáš...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Dagot_01_02");	//To je vše! Doufám, že to bude stačit k tomu, abys pochopil co dělat.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_morius()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Morius_01_00");	//... (snaží se soustředit) ... Poslouchej mě, poutníku!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Morius_01_01");	//... Kamenná pevnost od nikud, ti zjeví klíč k porozumění...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Morius_01_02");	//To je vše! Doufám, že to bude stačit k tomu, abys pochopil co dělat.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_tegon()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Tegon_01_00");	//... (snaží se soustředit) ... Poslouchej mě, poutníku!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Tegon_01_01");	//... Po cestě přes temný les, kudy bys šel s přítelem, po horské cestě kolem podivného tábora. Cíl tvé cesty leží na náhorní plošině vysoko v horách.
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Tegon_01_02");	//To je vše! Doufám, že to bude stačit k tomu, abys pochopil co dělat.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_kelios()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Kelios_01_00");	//... (snaží se soustředit) ... Poslouchej mě, poutníku!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Kelios_01_01");	//... Občas jen z výšky můžeš spatřit město...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Kelios_01_02");	//To je vše! Doufám, že to bude stačit k tomu, abys pochopil co dělat.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_demos()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Demos_01_00");	//... (snaží se soustředit) ... Poslouchej mě, poutníku!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Demos_01_01");	//... Řeka... Vodopád... Most... Vrata... A pak strach a smrt...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Demos_01_02");	//To je vše! Doufám, že to bude stačit k tomu, abys pochopil co dělat.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_farion()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Farion_01_00");	//... (snaží se soustředit) ... Poslouchej mě, poutníku!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Farion_01_01");	//... Hledej zdroje záchrany - a budeš oceněn...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Farion_01_02");	//To je vše! Doufám, že to bude stačit k tomu, abys pochopil co dělat.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_gader()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Gader_01_00");	//... (snaží se soustředit) ... Poslouchej mě, poutníku!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Gader_01_01");	//... Dlouhá cesta k magickému kruhu hluboko v horách...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Gader_01_02");	//To je vše! Doufám, že to bude stačit k tomu, abys pochopil co dělat.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_narus()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Narus_01_00");	//... (snaží se soustředit) ... Poslouchej mě, poutníku!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Narus_01_01");	//... Náhorní plošina... Farma... Voda... Hodně vody, padající dolů...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Narus_01_02");	//To je vše! Doufám, že to bude stačit k tomu, abys pochopil co dělat.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_wakon()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Wakon_01_00");	//... (snaží se soustředit) ... Poslouchej mě, poutníku!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Wakon_01_01");	//... V polích na křižovatce dvou cest, najdeš co hledáš...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Wakon_01_02");	//To je vše! Doufám, že to bude stačit k tomu, abys pochopil co dělat.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_stonnos()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Stonnos_01_00");	//... (snaží se soustředit) ... Poslouchej mě, poutníku!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Stonnos_01_01");	//... Kruh z magických kamenů tě volá, synu hledej a objevuj...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Stonnos_01_02");	//To je vše! Doufám, že to bude stačit k tomu, abys pochopil co dělat.
	TELLABOUTALL = TRUE;
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_noone()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_NoOne_01_00");	//... (snaží se soustředit) ... Ne...
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_NoOne_01_01");	//... To je nemožné!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_NoOne_01_02");	//Odpusť... (lítostivě) Ale mé vize jsou plné mlhy!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_NoOne_01_03");	//Nemůžu ti sdělit nic nového.
	AI_Output(other,self,"DIA_Abuyin_FindMeGuardians_NoOne_01_04");	//Chápu.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

