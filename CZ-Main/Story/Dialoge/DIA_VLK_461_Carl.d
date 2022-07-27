
instance DIA_Carl_EXIT(C_Info)
{
	npc = VLK_461_Carl;
	nr = 999;
	condition = DIA_Carl_EXIT_Condition;
	information = DIA_Carl_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Carl_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Carl_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};

func void B_CarlSayHallo()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_00");	//Vypadá to, že tu ve městě máme pár zlodějů, co okrádají boháče.
	AI_Output(self,other,"DIA_Carl_Hallo_05_01");	//Městská stráž nedávno obrátila přístavní čtvrť vzhůru nohama, ale nenašli vůbec nic.
};


instance DIA_Carl_PICKPOCKET(C_Info)
{
	npc = VLK_461_Carl;
	nr = 900;
	condition = DIA_Carl_PICKPOCKET_Condition;
	information = DIA_Carl_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Carl_PICKPOCKET_Condition()
{
	return C_Beklauen(34,40);
};

func void DIA_Carl_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
	Info_AddChoice(DIA_Carl_PICKPOCKET,Dialog_Back,DIA_Carl_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Carl_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Carl_PICKPOCKET_DoIt);
};

func void DIA_Carl_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
};

func void DIA_Carl_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
};


instance DIA_Carl_Hallo(C_Info)
{
	npc = VLK_461_Carl;
	nr = 2;
	condition = DIA_Carl_Hallo_Condition;
	information = DIA_Carl_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Carl_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Carl_Hallo_Info()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_02");	//Co děláš v týhle ubohý špinavý díře? Co tady hledáš?
	Info_ClearChoices(DIA_Carl_Hallo);
	Info_AddChoice(DIA_Carl_Hallo,"Zabloudil jsem.",DIA_Carl_Hallo_verlaufen);
	Info_AddChoice(DIA_Carl_Hallo,"Sešel jsem z cesty.",DIA_Carl_Hallo_umsehen);
};

func void DIA_Carl_Hallo_verlaufen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_verlaufen_15_00");	//Zabloudil jsem.
	AI_Output(self,other,"DIA_Carl_Hallo_verlaufen_05_01");	//Tak si dávej pozor, aby tě nikdo neokradl.
	B_CarlSayHallo();
	Info_ClearChoices(DIA_Carl_Hallo);
};

func void DIA_Carl_Hallo_umsehen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_umsehen_15_00");	//Sešel jsem z cesty.
	AI_Output(self,other,"DIA_Carl_Hallo_umsehen_05_01");	//Tak si dávej pozor, aby tě nikdo neokradl.
	B_CarlSayHallo();
	Info_ClearChoices(DIA_Carl_Hallo);
};

instance DIA_Carl_HelpPath(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_HelpPath_Condition;
	information = DIA_Carl_HelpPath_Info;
	permanent = FALSE;
	description = "Můžu pro tebe něco udělat?";
};

func int DIA_Carl_HelpPath_Condition()
{
	if((CanTeachTownMaster == FALSE) && (MIS_PathFromDown == LOG_Running) && (PabloQuestsUp == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Carl_HelpPath_Info()
{
	AI_Output(other,self,"DIA_Carl_HelpPath_01_00");	//Můžu pro tebe něco udělat?
	AI_Output(self,other,"DIA_Carl_HelpPath_01_01");	//(překvapeně) A jak jsi přišel na to, že potřebuju tvoji pomoc?
	AI_Output(other,self,"DIA_Carl_HelpPath_01_02");	//Chci se zapsat do učení u některého z řemeslníků a potřebuju udělat na místní dobrý dojem. 
	AI_Output(self,other,"DIA_Carl_HelpPath_01_03");	//(s úsměvem) Teď to chápu. Bohužel už mám učedníka!
	AI_Output(self,other,"DIA_Carl_HelpPath_01_04");	//Ale můžeš na mě udělat dojem, pokud se ti podaří sehnat mě materiál na kování.
	AI_Output(other,self,"DIA_Carl_HelpPath_01_05");	//Co konkrétně? 
	AI_Output(self,other,"DIA_Carl_HelpPath_01_06");	//Potřebuju uhlí, aspoň pět kusů!
	AI_Output(self,other,"DIA_Carl_HelpPath_01_07");	//Získej ho a máš můj souhlas v kapse.
	AI_Output(other,self,"DIA_Carl_HelpPath_01_08");	//A kde se dá nalézt?
	AI_Output(self,other,"DIA_Carl_HelpPath_01_09");	//Uhlí můžeš nalézt ve vypálených domech, koupit od prodejců nebo těžit v dole.
	AI_Output(other,self,"DIA_Carl_HelpPath_01_10");	//Dobrá, pokusím se ho sehnat.
	MIS_CarlCoal = LOG_Running;
	Log_CreateTopic(TOPIC_CarlCoal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CarlCoal,LOG_Running);
	B_LogEntry(TOPIC_CarlCoal,"Kovář Carl mě požádal abych pro něj sehnal pět kusů uhlí. Pak se za mě přimluví.");
};

instance DIA_Carl_HelpPath_Done(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_HelpPath_Done_Condition;
	information = DIA_Carl_HelpPath_Done_Info;
	permanent = FALSE;
	description = "Přinesl jsem uhlí.";
};

func int DIA_Carl_HelpPath_Done_Condition()
{
	if((MIS_CarlCoal == LOG_Running) && (Npc_HasItems(other,ItMi_Coal) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Carl_HelpPath_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Carl_HelpPath_Done_01_00");	//Přinesl jsem uhlí.
	AI_Output(self,other,"DIA_Carl_HelpPath_Done_01_01");	//Výborně. (spokojeně) Dej to sem. Moje zásoby jsou téměř u konce.
	AI_Output(other,self,"DIA_Carl_HelpPath_Done_01_02");	//Samozřejmě, tady. A co moje doporučení?
	B_GiveInvItems(other,self,ItMi_Coal,5);
	Npc_RemoveInvItems(self,ItMi_Coal,5);
	AI_Output(self,other,"DIA_Carl_HelpPath_Done_01_03");	//Nemusíš mít strach... (usmívá se) jak jsme se dohodli!
	AI_Output(self,other,"DIA_Carl_HelpPath_Done_01_04");	//Jestli se mě na tebe někdo zeptá, tak uslyší jen samou chválu.
	MIS_CarlCoal = LOG_Success;
	Log_SetTopicStatus(TOPIC_CarlCoal,LOG_Success);
	B_LogEntry(TOPIC_CarlCoal,"Přinesl jsem Carlovi uhlí jak chtěl, teď se za mě přimluví v cechu řemeslníků.");
};

instance DIA_Carl_Diebe(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Diebe_Condition;
	information = DIA_Carl_Diebe_Info;
	permanent = FALSE;
	description = "Co víš o zlodějích?";
};

func int DIA_Carl_Diebe_Condition()
{
	return TRUE;
};

func void DIA_Carl_Diebe_Info()
{
	AI_Output(other,self,"DIA_Carl_Diebe_15_00");	//Co víš o zlodějích?
	AI_Output(self,other,"DIA_Carl_Diebe_05_01");	//Nic. Ale většina lidí ve městě je ustrašená a podezřívavá - hlavně k cizincům.
	AI_Output(self,other,"DIA_Carl_Diebe_05_02");	//Dej si pozor ať tě nechytí v cizím domě. Nevidíme rádi, když nám tady někdo šmejdí.
	AI_Output(self,other,"DIA_Carl_Diebe_05_03");	//Ano, taky se budeš muset bránit před zloději. Obušek by měl být ideální.
};


instance DIA_Carl_Lernen(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Lernen_Condition;
	information = DIA_Carl_Lernen_Info;
	permanent = FALSE;
	description = "Můžu se u tebe něčemu přiučit?";
};


func int DIA_Carl_Lernen_Condition()
{
	return TRUE;
};

func void DIA_Carl_Lernen_Info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//Můžu se u tebe něčemu přiučit?
	AI_Output(self,other,"DIA_Carl_Lernen_05_01");	//No, vyrobil jsem několik klik a něco hřebíků a opravuju kovové součástky.
	AI_Output(self,other,"DIA_Carl_Lernen_05_02");	//Ale o kování zbraní toho nevím tolik, abych tě mohl učit.
	AI_Output(self,other,"DIA_Carl_Lernen_05_02A");	//I když samozřejmě tě můžu naučit, jak takový jednoduchý meč ukovat.
	AI_Output(self,other,"DIA_Carl_Lernen_05_03");	//Jestli se chceš něco naučit, zajdi za Haradem. On určitě ví, jak se vyrábějí zbraně!
	AI_Output(self,other,"DIA_Carl_Lernen_05_04");	//Ale jestli si chceš trochu vypracovat svaly, tak s tím ti můžu pomoct.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	CARL_TEACHSMITH = TRUE;
	B_LogEntry(TOPIC_CityTeacher,"S pomocí kováře Carla z přístavní čtvrti se mohu stát silnějším. Také mě naučí kovat.");
};


instance DIA_Carl_Wieviel(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Wieviel_Condition;
	information = DIA_Carl_Wieviel_Info;
	permanent = FALSE;
	description = "Kolik si necháváš platit za výcvik?";
};

func int DIA_Carl_Wieviel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Carl_Lernen))
	{
		return TRUE;
	};
};

func void DIA_Carl_Wieviel_Info()
{
	AI_Output(other,self,"DIA_Carl_Wieviel_15_00");	//Kolik si necháváš platit za výcvik?

	if(Npc_KnowsInfo(other,DIA_Edda_Statue))
	{
		B_GivePlayerXP(50);
		AI_Output(self,other,"DIA_Carl_Wieviel_05_01");	//Slyšel jsem, žes pracoval pro Eddu. Budu tě cvičit zadarmo.
		Carl_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_02");	//50 zlatých a já ti dopomůžu k větší síle.
	};
};

instance DIA_Carl_bezahlen(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_bezahlen_Condition;
	information = DIA_Carl_bezahlen_Info;
	permanent = TRUE;
	description = "Rád bych se u tebe nechal vycvičit. (zaplatit 50 zlatých)";
};

func int DIA_Carl_bezahlen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Carl_Wieviel) && (Carl_TeachSTR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Carl_bezahlen_Info()
{
	AI_Output(other,self,"DIA_Carl_bezahlen_15_00");	//Chtěl bych s tebou cvičit.

	if(Npc_KnowsInfo(other,DIA_Edda_Statue))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_01");	//Slyšel jsem, žes pracoval pro Eddu. Budu tě cvičit zadarmo.
		Carl_TeachSTR = TRUE;
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_02");	//Dobře, můžeme začít hned, jak budeš připraven.
		Carl_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_03");	//Dej mi zlato a pak tě budu trénovat.
	};
};

instance DIA_Carl_Teach(C_Info)
{
	npc = VLK_461_Carl;
	nr = 7;
	condition = DIA_Carl_Teach_Condition;
	information = DIA_Carl_Teach_Info;
	permanent = TRUE;
	description = "Chtěl bych se stát silnějším.";
};

func int DIA_Carl_Teach_Condition()
{
	if(Carl_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Carl_Teach_Info()
{
	AI_Output(other,self,"DIA_Carl_Teach_15_00");	//Chtěl bych se stát silnějším.
	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach,Dialog_Back,DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Carl_Teach_STR_5);
};

func void DIA_Carl_Teach_Back()
{
	Info_ClearChoices(DIA_Carl_Teach);
};

func void DIA_Carl_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_HIGH);
	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach,Dialog_Back,DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Carl_Teach_STR_5);
};

func void DIA_Carl_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_HIGH);
	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach,Dialog_Back,DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Carl_Teach_STR_5);
};

func void b_carl_teachsmith()
{
	AI_Output(self,other,"DIA_Carl_TeachCommon_12_01");	//Je to docela jednoduché, chlapče. Vezmi kus surové oceli a drž ho v ohni tak dlouho, než se rozehřeje.
	AI_Output(self,other,"DIA_Carl_TeachCommon_12_02");	//Pak dojdi ke kovadlině a pomocí kladiva ten rozehřátý kus surové oceli vykovej do tvaru čepele.
};

func void b_carlsmithchoices()
{
	Info_ClearChoices(dia_carl_teachsmith);
	Info_AddChoice(dia_carl_teachsmith,Dialog_Back,dia_carl_teachsmith_back);
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(dia_carl_teachsmith,b_buildlearnstringforsmithhunt("Naučit se základy kovářství",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),dia_carl_teachsmith_common);
	};
};


instance DIA_CARL_TEACHSMITH(C_Info)
{
	npc = VLK_461_Carl;
	nr = 50;
	condition = dia_carl_teachsmith_condition;
	information = dia_carl_teachsmith_info;
	permanent = TRUE;
	description = "Nauč mě kovat.";
};


func int dia_carl_teachsmith_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (CARL_TEACHSMITH == TRUE))
	{
		return TRUE;
	};
};

func void dia_carl_teachsmith_info()
{
	AI_Output(other,self,"DIA_Carl_TeachCommon_15_00");	//Nauč mě kovat.
	b_carlsmithchoices();
};

func void dia_carl_teachsmith_back()
{
	Info_ClearChoices(dia_carl_teachsmith);
};

func void dia_carl_teachsmith_common()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		b_carl_teachsmith();
		AI_Output(self,other,"DIA_Carl_TeachCommon_12_03");	//Tvá první čepel určitě nebude mistrovské dílo, ale zbytek se naučíš později.
	};
	b_carlsmithchoices();
};


instance DIA_CARL_ARMORCANTEACH(C_Info)
{
	npc = VLK_461_Carl;
	nr = 5;
	condition = dia_carl_armorcanteach_condition;
	information = dia_carl_armorcanteach_info;
	permanent = TRUE;
	description = "Taky patříš do 'Kruhu Vody'?";
};


func int dia_carl_armorcanteach_condition()
{
	if((CARL_TEACHARMOR == FALSE) && (RANGERCARL == TRUE))
	{
		return TRUE;
	};
};

func void dia_carl_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Carl_ArmorCanTeach_01_00");	//Taky patříš do 'Kruhu Vody'?
	AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_01");	//Do jakého 'Kruhu Vody'? Co tím myslíš, chlape?
	AI_Output(other,self,"DIA_Carl_ArmorCanTeach_01_02");	//No tak, nepředstírej, že nevíš, co se děje. Lares mi o tobě všechno řekl.
	AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_03");	//Aha, když ti to řekl, tak to tak i bude... (směje se sarkasticky)
	AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_04");	//A co ti vlastně o mě pověděl?
	AI_Output(other,self,"DIA_Carl_ArmorCanTeach_01_05");	//Lares mi řekl, že bys pro mě mohl ukovat lepší zbroj, než je tohle... (ukáže zbroj 'Kruhu Vody')
	AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_06");	//Á! Konečně jsem si jistý, že předemnou stojí bratr z 'Kruhu Vody'. K tomu, co řekl Lares...
	AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_07");	//Myslím, že se nechal trochu unést. Ostatní zbroje pro tebe nemám k dispozici. Ale...
	AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_08");	//... Mohl bych ti ukázat, jak vylepšit zbroj, kterou si mi právě ukázal.
	AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_09");	//Pravda, k tomu bys potřeboval alespoň rozumět kovářství.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Carl_ArmorCanTeach_01_10");	//Taky, že tomu rozumím...
		AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_11");	//Pak nemám žádné otázky. Nebudu od tebe chtít peníze za trénink.
		AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_12");	//Dej vědět, až budeš připravený a já tě naučím vše, co vím.
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_13");	///A zřejmě nemáš ani tucha, co to je.
		AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_14");	//Rád tě naučím vše co vím.
	};

	CARL_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Carl mě může naučit, jak vylepšit zbroj 'Kruhu Vody'.");
};

func void b_carl_teacharmor_1()
{
	AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_01");	//Takže, dívej se pozorně, jak se to dělá. Nejdřív potřebuješ pár ocelových polotovarů.

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);

		if(CARLRECRUITEDDT == FALSE)
		{
			AI_GotoWP(self,"NW_CITY_POOR_SMITH_01");
		}
		else
		{
			AI_GotoWP(self,"NW_CASTLEMINE_TOWER_REP_HUT_SMITH");
		};

		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_02");	//... Nejtěžší je vytvořit prvky sítě kroužkové zbroje...
		AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_03");	//... Můžeš je rozdělit zahřátím na deset stejných částí, pak se to odrazí na výsledku, a pomalém pohybu jednotlivých částí...
		AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_04");	//... Můžeš tomu dát stejnou formu kroužku a upevnit je prostrčením.
		AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_05");	//... Tady, koukni, jak to vypadá ode mně... (ukazuje) Můžeš upevnit kroužky pro montáž na mřížku zbroje.
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_06");	//... To je vše!
		AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_07");	//Zkus to sám. Myslím, že bys s tím neměl mít velké problémy.
	};
};

func void b_carlarmorchoices()
{
	Info_ClearChoices(dia_carl_armorteach);
	Info_AddChoice(dia_carl_armorteach,Dialog_Back,dia_carl_armorteach_back);

	if(PLAYER_TALENT_SMITH[32] == FALSE)
	{
		Info_AddChoice(dia_carl_armorteach,"Zbroj 'Kruhu Vody' (cena: 500 zlatých)",dia_carl_armorteach_itar_ranger_addon_v1);
	};
};


instance DIA_CARL_ARMORTEACH(C_Info)
{
	npc = VLK_461_Carl;
	nr = 5;
	condition = dia_carl_armorteach_condition;
	information = dia_carl_armorteach_info;
	permanent = TRUE;
	description = "Nauč mě, jak vylepšit zbroj.";
};

func int dia_carl_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (CARL_TEACHARMOR == TRUE) && (RANGERCARL == TRUE))
	{
		if(PLAYER_TALENT_SMITH[32] == FALSE)
		{
			return TRUE;
		};
	};
};

func void dia_carl_armorteach_info()
{
	AI_Output(other,self,"DIA_Carl_ArmorTeach_01_00");	//Nauč mě, jak vylepšit zbroj.

	if(Wld_IsTime(6,10,20,0))
	{
		AI_Output(self,other,"DIA_Carl_ArmorTeach_01_01");	//Bratr z kruhu je vždy připraven ti pomoci...
		b_carlarmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_ArmorTeach_01_02");	//Jak jsem se na tebe teď díval, myslím, že tě můžu trénovat! Nebo to můžeš zkusit sám tady na kovadlině... (směje se)
		AI_Output(self,other,"DIA_Carl_ArmorTeach_01_03");	//Přijď zítra k ránu. Pak si promluvíme.
	};
};

func void dia_carl_armorteach_back()
{
	Info_ClearChoices(dia_carl_armorteach);
};

func void dia_carl_armorteach_itar_ranger_addon_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_RANGER_ADDON_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,500);
			b_carl_teacharmor_1();
		};

		b_carlarmorchoices();
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Carl_bezahlen_05_03");	//Přines peníze a můžem začít s učením.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Carl_PrioratBlade(C_Info)
{
	npc = VLK_461_Carl;
	nr = 1;
	condition = DIA_Carl_PrioratBlade_condition;
	information = DIA_Carl_PrioratBlade_info;
	permanent = FALSE;
	description = "Potřebuji tvoji pomoc.";
};


func int DIA_Carl_PrioratBlade_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Carl_PrioratBlade_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Carl_PrioratBlade_01_01");	//Potřebuji tvoji pomoc
	AI_Output(self,other,"DIA_Carl_PrioratBlade_01_02");	//A v čem je problém?
	AI_Output(other,self,"DIA_Carl_PrioratBlade_01_03");	//Mám sebou velmi neobvyklou čepel.
	AI_Output(other,self,"DIA_Carl_PrioratBlade_01_04");	//A potřebuji vědět - odkud je a kdo ji vykoval.
	AI_Output(self,other,"DIA_Carl_PrioratBlade_01_05");	//(se zájmem) Tak ukaž! Podívám se na to.
	AI_Output(other,self,"DIA_Carl_PrioratBlade_01_06");	//Tady je.
	CreateInvItems(other,ItMw_1H_AssBlade_View,1);
	B_GiveInvItems(other,self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"DIA_Carl_PrioratBlade_01_07");	//(překvapeně) Něco takového jsem ještě ve svých rukou nedržel!
	AI_Output(self,other,"DIA_Carl_PrioratBlade_01_08");	//Vezmi si ho, obávám se že ti nemohu pomoci.
	B_LogEntry(TOPIC_PrioratStart,"Kovář Carl mě nedokázal o tajemném meči nic říci.");
};

instance DIA_Carl_FatherNews(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_FatherNews_Condition;
	information = DIA_Carl_FatherNews_Info;
	permanent = FALSE;
	description = "Mám pro tebe novinky od Morigana.";
};

func int DIA_Carl_FatherNews_Condition()
{
	if(MIS_FatherNews == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Carl_FatherNews_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Carl_FatherNews_01_00");	//Mám pro tebe novinky od Morigana.
	AI_Output(self,other,"DIA_Carl_FatherNews_01_01");	//(zaraženě) Od koho?
	AI_Output(other,self,"DIA_Carl_FatherNews_01_02");	//Od Morigana, tvého syna!
	AI_PlayAni(self,"T_STAND_2_SIT");
	AI_Output(self,other,"DIA_Carl_FatherNews_01_03");	//Ó, Innosi! (jako opařený) Vyslyšel jsi mé modlitby?
	AI_PlayAni(self,"T_SIT_2_STAND");
	AI_Output(self,other,"DIA_Carl_FatherNews_01_04");	//Co je s ním, všechno mě pověz!
	AI_Output(other,self,"DIA_Carl_FatherNews_01_05");	//Je stále na živu, ale drží ho v zajetí skřeti.
	AI_Output(self,other,"DIA_Carl_FatherNews_01_06");	//Proklatě... (naštvaně) a to má být dobrá zpráva.
	AI_Output(self,other,"DIA_Carl_FatherNews_01_07");	//No, aspoň je ještě naděje, že se opět shledáme.
	AI_Output(self,other,"DIA_Carl_FatherNews_01_08");	//Teď se budu modlit každý den, ať ho Innos ochrání.
	AI_Output(self,other,"DIA_Carl_FatherNews_01_09");	//Děkuji ti z celého srdce! Potěšil jsi staříka...
	AI_Output(other,self,"DIA_Carl_FatherNews_01_10");	//Nemáš zač.
	RT_Respect = RT_Respect + 1;
	MIS_FatherNews = LOG_Success;
	Log_SetTopicStatus(TOPIC_FatherNews,LOG_Success);
	B_LogEntry(TOPIC_FatherNews,"Předal jsem zprávu otci Morigana. Stařík byl potěšený, když se dozvěděl, že jeho syn je naživu.");
};

instance DIA_Carl_DoCrossBow(C_Info)
{
	npc = VLK_461_Carl;
	nr = 1;
	condition = DIA_Carl_DoCrossBow_condition;
	information = DIA_Carl_DoCrossBow_info;
	permanent = FALSE;
	description = "Umíš dělat kuše?";
};

func int DIA_Carl_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Carl_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Carl_DoCrossBow_01_01");	//Umíš dělat kuše?
	AI_Output(self,other,"DIA_Carl_DoCrossBow_01_02");	//Kuše? (udiveně) Co, jsi... ne, samozřejmě.
	AI_Output(self,other,"DIA_Carl_DoCrossBow_01_03");	//Potřebuješ dobrého tesaře nebo truhláře!
	AI_Output(self,other,"DIA_Carl_DoCrossBow_01_04");	//Ten ti možná pomůže.
	AI_Output(other,self,"DIA_Carl_DoCrossBow_01_05");	//Rozumím.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Výrobu kuší mě může naučit tesař nebo truhlář. Ale kde ho najít?");
};

instance DIA_Carl_MySmith(C_Info)
{
	npc = VLK_461_Carl;
	nr = 6;
	condition = DIA_Carl_MySmith_condition;
	information = DIA_Carl_MySmith_info;
	permanent = FALSE;
	description = "Potřebuji kováře.";
};

func int DIA_Carl_MySmith_condition()
{
	if((HURRAYICANHIRE == TRUE) && (MIS_CarlCoal == LOG_Success) && (CarlNeed == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Carl_MySmith_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Carl_MySmith_01_00");	//Potřebuji kováře.
	AI_Output(self,other,"DIA_Carl_MySmith_01_01");	//A kdo podle tebe jsem?
	AI_Output(other,self,"DIA_Carl_MySmith_01_02");	//Ty mi nerozumíš. Potřebuji kováře do svého tábora.
	AI_Output(self,other,"DIA_Carl_MySmith_01_03");	//Ty máš tábor?!
	AI_Output(other,self,"DIA_Carl_MySmith_01_04");	//Jo, poblíž Onarovy farmy, ve staré věži.
	AI_Output(self,other,"DIA_Carl_MySmith_01_05");	//Hmm... To není špatné na někoho, kdo teprve nedávno za mnou běhal za prací.
	AI_Output(self,other,"DIA_Carl_MySmith_01_06");	//Návrh je samozřejmě atraktivní. Ale co z toho?
	AI_Output(other,self,"DIA_Carl_MySmith_01_07");	//No, posuď sám. Jaké jsou zde tvé vyhlídky? Práce máš málo, peněz taky.
	AI_Output(other,self,"DIA_Carl_MySmith_01_08");	//Když vezmeš v úvahu že městské kovařině vládne Harad, pak nemáš žádnou šanci zabodovat.
	AI_Output(other,self,"DIA_Carl_MySmith_01_09");	//Říkal jsem že ti nabídnu přístřeší, jídlo a stabilní příjem.
	AI_Output(self,other,"DIA_Carl_MySmith_01_10");	//Tady máš pravdu. Ve zlatě se zrovna nemyju, a život utíká.
	AI_Output(self,other,"DIA_Carl_MySmith_01_11");	//No, nakonec to nebude o nic horší. Pokud se mi náhle něco nebude líbit - vrátím se zpět do města.
	AI_Output(self,other,"DIA_Carl_MySmith_01_12");	//Kolik jsi ochoten mi za spolupráci zaplatit?
	AI_Output(other,self,"DIA_Carl_MySmith_01_13");	//Například osmdesát zlatých mincí denně. Jsem si jistý že zde jsi neměl ani polovinu.
	AI_Output(self,other,"DIA_Carl_MySmith_01_14");	//Jaká to od tebe velkorysá nábídka. Myslím že právě máš v táboře kováře. Dej mi nějaký čas na příchod.
	AI_Output(other,self,"DIA_Carl_MySmith_01_15");	//Pak se uvidíme v táboře. Jo a mimochodem - heslo pro vstup je 'dračí poklad'.
	AI_Output(self,other,"DIA_Carl_MySmith_01_16");	//Dobře, budu si to pamatovat. Sbohem!
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Carl bude nyní pracovat v mé kovárně.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	CARLRECRUITEDDT = TRUE;
	CarlDayHire = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_Carl_InTower(C_Info)
{
	npc = VLK_461_Carl;
	nr = 22;
	condition = DIA_Carl_InTower_condition;
	information = DIA_Carl_InTower_info;
	permanent = TRUE;
	description = "Jak to jde?";
};

func int DIA_Carl_InTower_condition()
{
	if((CARLRECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_Carl_InTower_info()
{
	AI_Output(other,self,"DIA_Carl_InTower_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Carl_InTower_01_01");	//Vynikající! Není si nač stěžovat.
};

instance DIA_Carl_SharpKnife(C_Info)
{
	npc = VLK_461_Carl;
	nr = 1;
	condition = DIA_Carl_SharpKnife_Condition;
	information = DIA_Carl_SharpKnife_Info;
	permanent = TRUE;
	description = "Potřebuju abys mi nabrousil nůž.";
};

func int DIA_Carl_SharpKnife_Condition()
{
	if((MIS_Hilda_SharpKnife == LOG_Running) && Wld_IsTime(6,10,19,55) && (HildaSharpKnife == FALSE) && (Npc_HasItems(other,ItMi_HildaKnife) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Carl_SharpKnife_Info()
{
	AI_Output(other,self,"DIA_Carl_SharpKnife_15_00");	//Potřebuju abys mi nabrousil nůž.
	AI_Output(self,other,"DIA_Carl_SharpKnife_04_01");	//Jistě. Ale bude tě to stát pět zlatých.
	Info_ClearChoices(DIA_Carl_SharpKnife);

	if(Npc_HasItems(other,ItMi_Gold) >= 5)
	{
		Info_AddChoice(DIA_Carl_SharpKnife,"Tady je zlato.",DIA_Carl_SharpKnife_Ok);
	};

	Info_AddChoice(DIA_Carl_SharpKnife,"Nemám tolik peněz.",DIA_Carl_SharpKnife_No);

};

func void DIA_Carl_SharpKnife_Ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Carl_SharpKnife_Ok_15_00");	//Tady je zlato.
	B_GiveInvItems(other,self,ItMi_Gold,5);
	Npc_RemoveInvItems(self,ItMi_Gold,5);
	AI_Output(self,other,"DIA_Carl_SharpKnife_Ok_04_01");	//Dobrý! Počkej chvilku...
	AI_Output(self,other,"DIA_Carl_SharpKnife_Ok_04_02");	//... nu, to je všechno. Nyní je ten nůž ostřejší než břitva.
	HildaSharpKnife = TRUE;
	B_LogEntry(TOPIC_Hilda_SharpKnife,"Kovář Carl mi může nabrousit nůž pro Hildu.");
	Info_ClearChoices(DIA_Carl_SharpKnife);
};

func void DIA_Carl_SharpKnife_No()
{
	AI_Output(other,self,"DIA_Carl_SharpKnife_No_15_00");	//Nemám tolik peněz.
	AI_Output(self,other,"DIA_Carl_SharpKnife_No_04_01");	//Promiň za to že ti nemůžu pomoct.
	Info_ClearChoices(DIA_Carl_SharpKnife);
};
