/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

CZ_SkillCheckCondition - přidáno zobrazování skill checků

*/



instance DIA_Bromor_EXIT(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 999;
	condition = DIA_Bromor_EXIT_Condition;
	information = DIA_Bromor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bromor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bromor_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

var int BromorFirstMeet;

instance DIA_Bromor_GIRLS(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_GIRLS_Condition;
	information = DIA_Bromor_GIRLS_Info;
	permanent = TRUE;
	description = "To je tvůj kšeft?";
};

func int DIA_Bromor_GIRLS_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE)	 && (BromorFirstMeet == FALSE))

	{
		return TRUE;
	};
};

func void DIA_Bromor_GIRLS_Info()
{
	if(Wld_IsTime(13,0,16,0) == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Bromor_GIRLS_15_00");	//To je tvůj kšeft?
		AI_Output(self,other,"DIA_Bromor_GIRLS_07_02");	//Jsem Bromor. Tohle je můj dům a tohle jsou moje holky. Mám je rád.
		AI_Output(self,other,"DIA_Bromor_GIRLS_07_03");	//A jestli se líbí i tobě, pak za to musíš zaplatit - 50 zlatých.
		AI_Output(self,other,"DIA_Bromor_GIRLS_07_04");	//A ať tě ani nenapadne dělat tu nějaký bordel.
		BromorFirstMeet = TRUE;
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	};
};


instance DIA_Addon_Bromor_MissingPeople(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Addon_Bromor_MissingPeople_Condition;
	information = DIA_Addon_Bromor_MissingPeople_Info;
	description = "Jsou holky vpořádku?";
};


func int DIA_Addon_Bromor_MissingPeople_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE) && (SC_HearedAboutMissingPeople == TRUE) && (BromorFirstMeet == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_00");	//Jsou holky vpořádku?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_01");	//Samozřejmě! Myslíš, že bych chtěl být ve vězení za takovou blbost?
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_02");	//Hm... Nezmiňuji jejich věk. Možná některá z nich chybí?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_03");	//Ach tak. Právě jedna z mých dívek zmizela - její jméno je Lucia.
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_04");	//Oznámil jsem to i domobraně, ale nebyli schopni sledovat její stopu příliš dlouho.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Jedna z holek z Červené lucerny v přístavu se ztratila.");
};


instance DIA_Addon_Bromor_Lucia(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 5;
	condition = DIA_Addon_Bromor_Lucia_Condition;
	information = DIA_Addon_Bromor_Lucia_Info;
	description = "Jak dlouho už ji postrádáš?";
};


func int DIA_Addon_Bromor_Lucia_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE) && (SC_HearedAboutMissingPeople == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Bromor_MissingPeople))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_Lucia_Info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_Lucia_15_00");	//Jak dlouho už ji postrádáš?
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_01");	//Musí to být jen pár dnů. Nevím to ale přesně.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_02");	//Hádám, že utekla s jedním se svých nápadníků.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_03");	//A ta štětka taky utekla s mou cennou zlatou mísou.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_04");	//Kdybych ji chytil, pěkně by za to zaplatila!
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_05");	//Přijde ti něco na té věci směšného?
	Log_CreateTopic(TOPIC_Addon_BromorsGold,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold,LOG_Running);
	B_LogEntry(TOPIC_Addon_BromorsGold,"Jedna z holek jménem Lucia ukradla svému šéfovi zlatou mísu. Bromor ji chce zpět.");
	MIS_Bromor_LuciaStoleGold = LOG_Running;
};


instance DIA_Addon_Bromor_LuciaGold(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 5;
	condition = DIA_Addon_Bromor_LuciaGold_Condition;
	information = DIA_Addon_Bromor_LuciaGold_Info;
	permanent = TRUE;
	description = "Našel jsem tu mísu, co ti Lucia vzala.";
};


func int DIA_Addon_Bromor_LuciaGold_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE) && (MIS_Bromor_LuciaStoleGold == LOG_Running) && Npc_HasItems(other,ItMi_BromorsGeld_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_LuciaGold_Info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_15_00");	//Našel jsem tu mísu, co ti Lucia vzala.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_07_01");	//Skvělé!
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	if(Bromor_Hausverbot == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"A co nějaká odměna?",DIA_Addon_Bromor_LuciaGold_lohn);
	};
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Tady je tvá mísa.",DIA_Addon_Bromor_LuciaGold_einfachgeben);
	if(DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Nechceš vědět, kde Lucia je?",DIA_Addon_Bromor_LuciaGold_lucia);
	};
};

func void DIA_Addon_Bromor_LuciaGold_einfachgeben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00");	//Tady je tvá mísa.
	B_GiveInvItems(other,self,ItMi_BromorsGeld_Addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01");	//Díky, je to od tebe hezké. Chtěl bys něco dalšího?
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP(XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
};


var int DIA_Addon_Bromor_LuciaGold_lucia_OneTime;

func void DIA_Addon_Bromor_LuciaGold_lucia()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lucia_15_00");	//Nechceš vědět, kde Lucia je?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_01");	//Ne, proč? Mísa je zpět.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_02");	//Obchod běží a já se obejdu i bez ní. Přece ji nebudu nutit.
	DIA_Addon_Bromor_LuciaGold_lucia_OneTime = TRUE;
};

func void DIA_Addon_Bromor_LuciaGold_lohn()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lohn_15_00");	//A co nějaká odměna?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lohn_07_01");	//Můžeš mít jednu moji holku zadarmo. Souhlasíš?
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	if(DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Nechceš vědět, kde Lucia je?",DIA_Addon_Bromor_LuciaGold_lucia);
	};
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Tak to ne.",DIA_Addon_Bromor_LuciaGold_mehr);
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Dohodnuto, tady je tvá mísa.",DIA_Addon_Bromor_LuciaGold_geben);
};

func void DIA_Addon_Bromor_LuciaGold_mehr()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_mehr_15_00");	//Tak to ne.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_mehr_07_01");	//Můžeš to přijmout nebo se sem už nevracej.
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Zapomeň na to.",DIA_Addon_Bromor_LuciaGold_nein);
};

func void DIA_Addon_Bromor_LuciaGold_nein()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_nein_15_00");	//Zapomeň na to.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_01");	//Pak vypadni z mého obchodu, ty kriminálníku.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_02");	//Neočekávej, že tě tu někdy obsloužím.
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	Bromor_Hausverbot = TRUE;
	Bromor_Pay = 0;
};

func void DIA_Addon_Bromor_LuciaGold_geben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_geben_15_00");	//Dohodnuto, tady je tvá mísa.
	B_GiveInvItems(other,self,ItMi_BromorsGeld_Addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_geben_07_01");	//Díky, běž za Nadjou. Zajde s tebou nahoru...
	Bromor_Pay = TRUE;
	NadjaIsUp = FALSE;
	Nadja_Nacht = FALSE;
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP(XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
};


instance DIA_Bromor_Pay(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_Pay_Condition;
	information = DIA_Bromor_Pay_Info;
	permanent = TRUE;
	description = "Chci se trochu pobavit. (zaplatit 50 zlatých)";
};

func int DIA_Bromor_Pay_Condition()
{
	if((Bromor_Pay == FALSE) && (Bromor_Hausverbot == FALSE) && (BromorFirstMeet == TRUE) && (NpcObsessedByDMT_Bromor == FALSE) && (Npc_IsDead(Nadja) == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Bromor_Pay_OneTime;

func void DIA_Bromor_Pay_Info()
{
	AI_Output(other,self,"DIA_Bromor_Pay_15_00");	//Chci se trochu pobavit.

	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_01");	//Fajn. (zašklebí se) Na následujících pár hodin nejspíš nikdy v životě nezapomeneš.
		AI_Output(self,other,"DIA_Bromor_Pay_07_02");	//Vyjdi s Nadjou po schodech nahoru a užij si to!

		if(DIA_Bromor_Pay_OneTime == FALSE)
		{
			DIA_Bromor_Pay_OneTime = TRUE;
		};

		Bromor_Pay = TRUE;
		NadjaIsUp = FALSE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Nesnáším, když si ze mě někdo dělá dobrý den. Jestli nemáš na zaplacení, tak odsud vymajzni.
	};

	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_DOPE(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 3;
	condition = DIA_Bromor_DOPE_Condition;
	information = DIA_Bromor_DOPE_Info;
	permanent = FALSE;
	description = "Můžu tu dostat i nějaké 'zvláštní' zboží?";
};

func int DIA_Bromor_DOPE_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (NpcObsessedByDMT_Bromor == FALSE) && (Bromor_Hausverbot == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bromor_DOPE_Info()
{
	AI_Output(other,self,"DIA_Bromor_DOPE_15_00");	//Můžu tu dostat i nějaké 'zvláštní' zboží?
	AI_Output(self,other,"DIA_Bromor_DOPE_07_01");	//Jasně, všechny holky jsou zvláštní. (zašklebí se)
	AI_Output(self,other,"DIA_Bromor_DOPE_07_02");	//Jestli máš dost zlata, můžeš jít s Nadjou nahoru.
};

instance DIA_Bromor_Obsession(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 30;
	condition = DIA_Bromor_Obsession_Condition;
	information = DIA_Bromor_Obsession_Info;
	description = "Jsi v pořádku?";
};


func int DIA_Bromor_Obsession_Condition()
{
	if((Kapitel >= 3) && (NpcObsessedByDMT_Bromor == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

var int DIA_Bromor_Obsession_GotMoney;

func void DIA_Bromor_Obsession_Info()
{
	B_NpcObsessedByDMT(self);
};


instance DIA_Bromor_Heilung(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 55;
	condition = DIA_Bromor_Heilung_Condition;
	information = DIA_Bromor_Heilung_Info;
	permanent = TRUE;
	description = "Ty jsi posedlý.";
};


func int DIA_Bromor_Heilung_Condition()
{
	if((NpcObsessedByDMT_Bromor == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Bromor_Heilung_Info()
{
	AI_Output(other,self,"DIA_Bromor_Heilung_15_00");	//Ty jsi posedlý.
	AI_Output(self,other,"DIA_Bromor_Heilung_07_01");	//Cože? O čem to mluvíš? Vypadni odsud.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_PICKPOCKET(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 900;
	condition = DIA_Bromor_PICKPOCKET_Condition;
	information = DIA_Bromor_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Krádež tohoto klíče by byla dosti riskantní.)";
};

func int DIA_Bromor_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_Bromor) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Bromor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
	Info_AddChoice(DIA_Bromor_PICKPOCKET,Dialog_Back,DIA_Bromor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bromor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bromor_PICKPOCKET_DoIt);
};

func void DIA_Bromor_PICKPOCKET_DoIt()
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
		B_GiveInvItems(self,other,ItKe_Bromor,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Bromor_PICKPOCKET);
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

func void DIA_Bromor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
};

instance DIA_Bromor_AskForWoman(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_AskForWoman_Condition;
	information = DIA_Bromor_AskForWoman_Info;
	permanent = FALSE;
	description = "Mám zvláštní objednávku!";
};

func int DIA_Bromor_AskForWoman_Condition()
{
	if((MIS_WomanForSkip == LOG_Running)  && (BromorFirstMeet == TRUE) && (NpcObsessedByDMT_Bromor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bromor_AskForWoman_Info()
{
	AI_Output(other,self,"DIA_Bromor_AskForWoman_01_01");	//Mám zvláštní objednávku!

	if(Npc_IsDead(VLK_436_Sonja) == FALSE)
	{
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_02");	//Ty chceš dvě? (ušklíbá se) Nebo snad tři?!
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_03");	//Bohužel, nemám tolik volných holek.
		AI_Output(other,self,"DIA_Bromor_AskForWoman_01_04");	//Ne, stačí mě jedna, ale na tři dny.
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_05");	//Žádný problém! (ušklíbá se) Když týden nevylezeš z mého bordelu! Budu jen rád.
		AI_Output(other,self,"DIA_Bromor_AskForWoman_01_06");	//No vlastně si chci vzít jednu z tvých holek sebou.
		AI_Output(other,self,"DIA_Bromor_AskForWoman_01_07");	//Slibuju, že ji přivedu zpět celou a v pořádku!
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_08");	//(udiveně) Ano, tvůj požadavek je neobvyklý! Nicméně s tím nemám problém.
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_09");	//Chápeš, že to bude něco stát!
		AI_Output(other,self,"DIA_Bromor_AskForWoman_01_10");	//Kolik chceš?
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_11");	//Počkej popřemýšlím. Tři dny po padesáti zlatých... To dělá 150 zlatých.
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_12");	//Za práci mimo můj podnik beru dvojitou sazbu, tak to máme 300 zlatých.
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_13");	//A za riziko, že se dívce něco stane nebo že se nevrátí, je příplatek 700 zlatých.
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_14");	//Takže to dělá dva tisíce zlatých a můžem si plácnout!
		Info_ClearChoices(DIA_Bromor_AskForWoman);

		// if(RhetorikSkillValue[1] >= 20)
		// {
			Info_AddChoice(DIA_Bromor_AskForWoman,
				ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 20, TRUE), "Máš velmi zvláštní počty!"),
				// "Máš velmi zvláštní počty!",
				DIA_Bromor_AskForWoman_Yes);
		// };

		Info_AddChoice(DIA_Bromor_AskForWoman,"Není to moc?",DIA_Bromor_AskForWoman_No);
	}
	else
	{
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_15");	//Promiň. Jedna z mých dívek je mrtvá.
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_16");	//Takže neberu speciální objednávky.
		SonyaNoGoWithMe = TRUE;
	};
};



func void DIA_Bromor_AskForWoman_Yes()
{
	AI_Output(other,self,"DIA_Bromor_AskForWoman_Yes_01_01");	//Máš velmi zvláštní počty!
	AI_Output(self,other,"DIA_Bromor_AskForWoman_Yes_01_02");	//(nechápavě) Vážně?
	AI_Output(other,self,"DIA_Bromor_AskForWoman_Yes_01_03");	//Já jsem napočítal 1000 zlatých.
	AI_Output(self,other,"DIA_Bromor_AskForWoman_Yes_01_04");	//Ach, ano... (nevinně) Úplně jsem zapomněl zmínit malou daň pro stráže.
	AI_Output(self,other,"DIA_Bromor_AskForWoman_Yes_01_05");	//Nikdy nevíš, můžou se vyskytnout nějaký problémy.
	AI_Output(other,self,"DIA_Bromor_AskForWoman_Yes_01_06");	//Se strážema si to vyřiď sám. Mě obírat nebudou.
	AI_Output(other,self,"DIA_Bromor_AskForWoman_Yes_01_07");	//Tak co, dám ti přesně 1000 zlatých a dívka půjde se mnou.
	AI_Output(self,other,"DIA_Bromor_AskForWoman_Yes_01_08");	//Och... (sklamaně) Dobře, ruku na to. Ale zaplať předem!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	B_LogEntry(TOPIC_WomanForSkip,"Bromor mě pronajmul jednu ze svých dívek za 1000 zlatých.");
	BromorDisCount_01 = TRUE;
};

func void DIA_Bromor_AskForWoman_No()
{
	AI_Output(other,self,"DIA_Bromor_AskForWoman_No_01_01");	//Není to moc?
	AI_Output(self,other,"DIA_Bromor_AskForWoman_No_01_02");	//Takový jsou podmínky! Jestli nechceš nemusíš platit.
	AI_Output(self,other,"DIA_Bromor_AskForWoman_No_01_03");	//Jde tady o moji holku, na to nezapomínej.
	B_LogEntry(TOPIC_WomanForSkip,"Bromor mě pronajmul jednu ze svých dívek za 2000 zlatých.");
	BromorDisCount_02 = TRUE;
};

instance DIA_Bromor_AskForWoman_Pay(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_AskForWoman_Pay_Condition;
	information = DIA_Bromor_AskForWoman_Pay_Info;
	permanent = TRUE;
	description = "Tady je tvoje zlato.";
};

func int DIA_Bromor_AskForWoman_Pay_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaGoWithMe == FALSE) && (SonyaNoGoWithMe == FALSE) && ((BromorDisCount_01 == TRUE) || (BromorDisCount_02 == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bromor_AskForWoman_Pay_Info()
{
	AI_Output(other,self,"DIA_Bromor_AskForWoman_Pay_01_01");	//Tady je tvoje zlato.
	
	if(Npc_IsDead(VLK_436_Sonja) == TRUE)
	{
		AI_Output(self,other,"DIA_Bromor_AskForWoman_Pay_01_02");	//Jedna z mých dívek je mrtvá! Takže dohoda padá.
		B_LogEntry(TOPIC_WomanForSkip,"Bromor odmítl dohodu, protože jedna z jeho dívek je mrtvá.");
		SonyaNoGoWithMe = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		if(BromorDisCount_01 == TRUE)
		{
			if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
			{
				B_GivePlayerXP(100);
				B_GiveInvItems(other,self,ItMi_Gold,1000);
				Npc_RemoveInvItems(self,ItMi_Gold,1000);
				AI_Output(self,other,"DIA_Bromor_AskForWoman_Pay_01_03");	//Výborně! Sonja může jít s tebou.
				AI_Output(self,other,"DIA_Bromor_AskForWoman_Pay_01_04");	//Nezapomeň, vrať mě ji v pořádku a včas! Jinak zalarmuju stráže.
				B_LogEntry(TOPIC_WomanForSkip,"Teď může jít Sonja se mnou. Nesmím zapomenout ji vrátit Bromorovi včas.");	
				SonyaGoWithMe = TRUE;
				SonyaGoWithMeDay = Wld_GetDay();
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Print(Print_NotEnoughGold);
				AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Nesnáším, když se mě někdo snaží podvést, vypadni jestli nemůžeš platit.
				AI_StopProcessInfos(self);
			};
		}
		else if(BromorDisCount_02 == TRUE)
		{
			if(Npc_HasItems(hero,ItMi_Gold) >= 2000)
			{
				B_GivePlayerXP(100);
				B_GiveInvItems(other,self,ItMi_Gold,2000);
				Npc_RemoveInvItems(self,ItMi_Gold,2000);
				AI_Output(self,other,"DIA_Bromor_AskForWoman_Pay_01_03");	//Výborně! Sonja může jít s tebou.
				AI_Output(self,other,"DIA_Bromor_AskForWoman_Pay_01_04");	//Nezapomeň, vrať mě ji v pořádku a včas! Jinak zalarmuju stráže.
				B_LogEntry(TOPIC_WomanForSkip,"Teď může jít Sonja se mnou. Nesmím zapomenout ji vrátit Bromorovi včas.");	
				SonyaGoWithMe = TRUE;
				SonyaGoWithMeDay = Wld_GetDay();
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Print(Print_NotEnoughGold);
				AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Nesnáším, když se mě někdo snaží podvést, vypadni jestli nemůžeš platit.
				AI_StopProcessInfos(self);
			};
		}
		else
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Nesnáším, když se mě někdo snaží podvést, vypadni jestli nemůžeš platit.
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Bromor_AskForWoman_Back(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_AskForWoman_Back_Condition;
	information = DIA_Bromor_AskForWoman_Back_Info;
	permanent = FALSE;
	description = "Vracím ti Sonju.";
};

func int DIA_Bromor_AskForWoman_Back_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaBackOk == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bromor_AskForWoman_Back_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Bromor_AskForWoman_Back_01_01");	//Vracím ti Sonju.
	AI_Output(self,other,"DIA_Bromor_AskForWoman_Back_01_02");	//Dobře! Jestli budeš v budoucnu něco potřebovat, dej vědět.
	MIS_WomanForSkip = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_WomanForSkip,LOG_SUCCESS);
	B_LogEntry(TOPIC_WomanForSkip,"Přivedl jsem Sonju zpět do bordelu.");
};

instance DIA_Bromor_AskForWoman_BadBack(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_AskForWoman_BadBack_Condition;
	information = DIA_Bromor_AskForWoman_BadBack_Info;
	permanent = FALSE;
	description = "Vracím ti Sonju.";
};

func int DIA_Bromor_AskForWoman_BadBack_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaBackOkNot == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bromor_AskForWoman_BadBack_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Bromor_AskForWoman_BadBack_01_01");	//Vracím ti Sonju.
	AI_Output(self,other,"DIA_Bromor_AskForWoman_BadBack_01_02");	//Počkej! Mluvili jsme o třech dnech.
	AI_Output(self,other,"DIA_Bromor_AskForWoman_BadBack_01_03");	//A to bylo podstatně víc!
	AI_Output(other,self,"DIA_Bromor_AskForWoman_BadBack_01_04");	//A co s tím?
	AI_Output(self,other,"DIA_Bromor_AskForWoman_BadBack_01_05");	//A teď co...
	MIS_WomanForSkip = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_WomanForSkip);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};
