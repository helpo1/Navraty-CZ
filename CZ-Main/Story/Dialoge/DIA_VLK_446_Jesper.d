
instance DIA_Jesper_EXIT(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 999;
	condition = DIA_Jesper_EXIT_Condition;
	information = DIA_Jesper_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jesper_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jesper_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jesper_PICKPOCKET(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 900;
	condition = DIA_Jesper_PICKPOCKET_Condition;
	information = DIA_Jesper_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Jesper_PICKPOCKET_Condition()
{
	return C_Beklauen(80,180);
};

func void DIA_Jesper_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jesper_PICKPOCKET);
	Info_AddChoice(DIA_Jesper_PICKPOCKET,Dialog_Back,DIA_Jesper_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jesper_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jesper_PICKPOCKET_DoIt);
};

func void DIA_Jesper_PICKPOCKET_DoIt()
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
		B_GiveInvItems(self,other,ItMi_Gold,30);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
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

func void DIA_Jesper_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jesper_PICKPOCKET);
};


instance DIA_Jesper_Hallo(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Hallo_Condition;
	information = DIA_Jesper_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jesper_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Jesper_Hallo_Info()
{
	AI_Output(self,other,"DIA_Jesper_Hallo_09_00");	//Hej, co tam dole děláš? Tady není nic pro tebe.
	AI_Output(self,other,"DIA_Jesper_Hallo_09_01");	//Tak ven s tím, co tady děláš?
	Info_ClearChoices(DIA_Jesper_Hallo);
	Info_AddChoice(DIA_Jesper_Hallo,"Přišel jsem tě zabít.",DIA_Jesper_Hallo_Kill);
	Info_AddChoice(DIA_Jesper_Hallo,"Jen jsem se tu chtěl trochu rozhlídnout.",DIA_Jesper_Hallo_NurSo);

	if(Attila_Key == TRUE)
	{
		Info_AddChoice(DIA_Jesper_Hallo,"Attila mi dal klíč...",DIA_Jesper_Hallo_Willkommen);
	}
	else
	{
		Info_AddChoice(DIA_Jesper_Hallo,"Attilu už jsem oddělal...",DIA_Jesper_Hallo_Umgelegt);
	};

	DG_gefunden = TRUE;
};

func void DIA_Jesper_Hallo_Kill()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Kill_15_00");	//Přišel jsem tě zabít.
	AI_Output(self,other,"DIA_Jesper_Hallo_Kill_09_01");	//To je ale skvělý nápad. Na to jsi přišel úplně sám, co? No co. Zkrátíme to.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_494_Attila,"ChiefLair");
	Npc_ExchangeRoutine(self,"START");
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Jesper_Hallo_NurSo()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_NurSo_15_00");	//Jen jsem se tu chtěl trochu rozhlídnout.
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_01");	//Tady není nic k vidění. Šlapeš po moc nebezpečný půdě, rozumíš?
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_02");	//Takže nech svoji zbraň, kde je, a řekni mi, proč jsi tady.
};

func void DIA_Jesper_Hallo_Willkommen()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Willkommen_15_00");	//Attila mi dal klíč. Proto jsem tady. Tak co ode mě chceš?
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_01");	//To bys chtěl vědět? Klídek.
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_02");	//Běž se podívat na Cassiu. Jsi očekáván.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_494_Attila,"ChiefLair");
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Jesper_Hallo_Umgelegt()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Umgelegt_15_00");	//Attilu už jsem oddělal...
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_01");	//(nevěřícně) TY jsi zabil Attilu?! (opovržlivě) No co, stejně to byl jen prašivej pes.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_02");	//Ale něco ti řeknu. Jestli mě napadneš, zabiju tě.
	Info_ClearChoices(DIA_Jesper_Hallo);
	Info_AddChoice(DIA_Jesper_Hallo,"Co děláš v týhle tmavý vlhký díře?",DIA_Jesper_Hallo_Was);
	Info_AddChoice(DIA_Jesper_Hallo,"Vezmi mě ke svému vůdci.",DIA_Jesper_Hallo_Anfuehrer);
};

func void DIA_Jesper_Hallo_Was()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Was_15_00");	//Co děláš v týhle tmavý vlhký díře?
	AI_Output(self,other,"DIA_Jesper_Hallo_Was_09_01");	//(zavrčí) Bydlím tady. Ještě jedna pitomá otázka a nadělám ti z kůže ozdobný třásničky.
};

func void DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Anfuehrer_15_00");	//Vezmi mě ke svému vůdci.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_01");	//(oplzlý smích) HA - můj vůdce? Jsem si jistý, že s tebou Cassia bude chtít mluvit.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_02");	//Pokračuj - a žádný srandičky.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_494_Attila,"ChiefLair");
	Npc_ExchangeRoutine(self,"START");
};

instance DIA_Jesper_Bezahlen(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Bezahlen_Condition;
	information = DIA_Jesper_Bezahlen_Info;
	permanent = FALSE;
	description = "Můžeš mě něčemu naučit?";
};

func int DIA_Jesper_Bezahlen_Condition()
{
	if((IS_LOVCACH == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Bezahlen_Info()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_15_00");	//Můžeš mě něčemu naučit?
	AI_Output(self,other,"DIA_Jesper_Bezahlen_09_01");	//Jasně. Ukážu ti, jak se plížit - pro tebe zadarmo.
	Jesper_TeachSneak = TRUE;
};

instance DIA_Jesper_Schleichen(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Schleichen_Condition;
	information = DIA_Jesper_Schleichen_Info;
	permanent = TRUE;
	description = "Nauč mě umění plížení. (VB: 5)";
};

var int DIA_Jesper_Schleichen_permanent;

func int DIA_Jesper_Schleichen_Condition()
{
	if((Jesper_TeachSneak == TRUE) && (DIA_Jesper_Schleichen_permanent == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Schleichen_Info()
{
	AI_Output(other,self,"DIA_Jesper_Schleichen_15_00");	//Nauč mě umění plížení.

	if(b_teachthieftalentfree(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_01");	//Plížení je pro každého zloděje nepostradatelné. Především když si potřebuješ prohlédnout dům někoho jiného.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_02");	//Prostě tam nemůžeš dupat jak stádo slonů. Většina lidí má velmi lehký spánek.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_03");	//Jedině když se plížíš, tak tě nikdo neuslyší - a můžeš nerušeně pracovat.
		DIA_Jesper_Schleichen_permanent = TRUE;
	};
};

instance DIA_Jesper_Killer(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 2;
	condition = DIA_Jesper_Killer_Condition;
	information = DIA_Jesper_Killer_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Jesper_Killer_Condition()
{
	if(Npc_IsDead(Cassia) || Npc_IsDead(Ramirez))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Killer_Info()
{
	if(Npc_IsDead(Cassia) && Npc_IsDead(Ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_00");	//Zabil jsi mé přátele. Proč jsi to udělal, ty vrahu?
		AI_Output(self,other,"DIA_Jesper_Killer_09_01");	//Pošlu tě přímo na návštěvu za Beliarem.
	}
	else if(Npc_IsDead(Cassia))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_02");	//Zabil jsi Cassiu, ty špinavej vrahu. Ale na mě si nepřijdeš!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	}
	else if(Npc_IsDead(Ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_03");	//Udělal jsem pro Ramireze víc práce a vydělal víc peněz, než ty kdy uvidíš.
		AI_Output(self,other,"DIA_Jesper_Killer_09_04");	//A tys ho jen tak zabil, ty prašivej pse! Je čas vyrovnat účty!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	};
};

instance DIA_Jesper_Bogen(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Bogen_Condition;
	information = DIA_Jesper_Bogen_Info;
	permanent = FALSE;
	description = "Hele, co víš o Bosperově luku?";
};

func int DIA_Jesper_Bogen_Condition()
{
	if((Npc_HasItems(other,ItRw_Bow_L_03_MIS) < 1) && (MIS_Bosper_Bogen == LOG_Running) && (IS_LOVCACH == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Bogen_Info()
{
	AI_Output(other,self,"DIA_Jesper_Bogen_15_00");	//Hele, co víš o Bosperově luku?
	AI_Output(self,other,"DIA_Jesper_Bogen_09_01");	//Myslíš ten luk od šípaře? Jo, mám ho někde zahrabanej nahoře v truhle.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_02");	//Ale pobíhá tam kolem spousta krys. Můžeš si pro něj dojít, jestli ti ty potvory nevaděj.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_03");	//Ó, samozřejmě je ta truhla zamčená. Musíš se do ní vloupat. (chechtá se) S trochou štěstí ti budou tvoje paklíče stačit.
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_01");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_02");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_03");
};

instance DIA_Jesper_Tuer(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Tuer_Condition;
	information = DIA_Jesper_Tuer_Info;
	permanent = FALSE;
	description = "Co je za těmi zamčenými dveřmi?";
};

func int DIA_Jesper_Tuer_Condition()
{
	if((IS_LOVCACH == TRUE) && (Kapitel >= 1))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Tuer_Info()
{
	AI_Output(other,self,"DIA_Jesper_Tuer_15_00");	//Co je za těmi zamčenými dveřmi?
	AI_Output(self,other,"DIA_Jesper_Tuer_09_01");	//(chechtá se) Je za nima TA truhla - truhla mistra zámečníka.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_02");	//Opatřil ji tak neuvěřitelně složitým zámkem, že ji ještě nikdo nedokázal otevřít.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_03");	//Bohužel byl zatčen - hodili ho skrz bariéru, kde asi vypustil duši.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_04");	//Ale jestli se chceš pokusit tu truhlu otevřít, tady je klíč od pokoje.
	B_GiveInvItems(self,other,ItKe_Fingers,1);
};

instance DIA_Jesper_Truhe(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Truhe_Condition;
	information = DIA_Jesper_Truhe_Info;
	permanent = FALSE;
	description = "Podařilo se mi tu truhlu otevřít.";
};

func int DIA_Jesper_Truhe_Condition()
{
	if((Mob_HasItems("MOB_FINGERS",ItMi_Gold) < 30) || (Mob_HasItems("MOB_FINGERS",ItMi_SilverCup) < 5) || (Mob_HasItems("MOB_FINGERS",ItMi_CupGold) < 1) || (Mob_HasItems("MOB_FINGERS",ItAm_Strg_01) < 1) || (Mob_HasItems("MOB_FINGERS",ItPo_Perm_DEX) < 1))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Truhe_Info()
{
	B_GivePlayerXP(XP_JesperTruhe);
	AI_Output(other,self,"DIA_Jesper_Truhe_15_00");	//Podařilo se mi tu truhlu otevřít.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_01");	//To není možné! Tak se zdá, že máme nového mistra zámečníka.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_02");	//K takovému výkonu ti musím pogratulovat.
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
};

instance DIA_Jesper_Quest(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Quest_condition;
	information = DIA_Jesper_Quest_info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jesper_Quest_condition()
{
	if(Wld_IsTime(10,00,19,00) && (IS_LOVCACH == TRUE) && (MSINEXTREMO == FALSE) && (Npc_GetDistToWP(pir_1397_addon_inextremo_charlotte,"OCR_CHARLOTTE") <= 250) && (Npc_IsDead(pir_1397_addon_inextremo_charlotte) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Quest_info()
{
	AI_Output(self,other,"DIA_Jesper_Quest_01_00");	//Chlape, měl bys udělat další dobrý skutek.
	AI_Output(other,self,"DIA_Jesper_Quest_01_01");	//Co bys potřeboval?
	AI_Output(self,other,"DIA_Jesper_Quest_01_02");	//Vyběhni nahoru po schodech a řekni těm muzikantům aby zahráli něco veselého.
	AI_Output(self,other,"DIA_Jesper_Quest_01_03");	//Nebo tady brzo umřu úzkostí.
	AI_Output(other,self,"DIA_Jesper_Quest_01_04");	//Neboj, nenechám tě umřít.
	MIS_JESPERMUSIC = LOG_Running;
	Log_CreateTopic(TOPIC_JESPERMUSIC,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JESPERMUSIC,LOG_Running);
	B_LogEntry(TOPIC_JESPERMUSIC,"Jesper po mě chce, abych šel nahoru a řekl těm muzikantům, aby zahráli něco veselého. Měl bych si pospíšit, než skončí představení.");
};

instance DIA_Jesper_Quest_Done(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Quest_Done_condition;
	information = DIA_Jesper_Quest_Done_info;
	permanent = FALSE;
	description = "Tak jak se ti líbí hudba?";
};

func int DIA_Jesper_Quest_Done_condition()
{
	if((IS_INEXTREMO_PLAYING_DONE == TRUE) && (MIS_JESPERMUSIC == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Quest_Done_info()
{
	B_GivePlayerXP(XP_JesperTruhe);
	AI_Output(other,self,"DIA_Jesper_Quest_Done_01_01");	//Tak jak se ti líbí hudba?
	AI_Output(self,other,"DIA_Jesper_Quest_Done_01_02");	//Díky chlape... To jsem potřeboval!
	AI_Output(self,other,"DIA_Jesper_Quest_Done_01_03");	//Tady, vem si tyhle paklíče. Budou se ti hodit.
	B_GiveInvItems(self,other,ItKE_lockpick,5);
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	JesperDanceDay = Wld_GetDay();
	MIS_JESPERMUSIC = LOG_SUCCESS;
	IS_INEXTREMO_PLAYING = FALSE;
	Log_SetTopicStatus(TOPIC_JESPERMUSIC,LOG_SUCCESS);
	B_LogEntry(TOPIC_JESPERMUSIC,"Jesperovi se líbí hudba, co se teď hraje na náměstí.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Dance");
};

instance DIA_Jesper_Quest_StopDance(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Quest_StopDance_condition;
	information = DIA_Jesper_Quest_StopDance_info;
	permanent = FALSE;
	description = "Hej, si v pohodě?";
};

func int DIA_Jesper_Quest_StopDance_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_JESPERMUSIC == LOG_SUCCESS) && (JesperDanceDay != FALSE) && (JesperDanceDay == (daynow - 1)))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Quest_StopDance_info()
{
	AI_Output(other,self,"DIA_Jesper_Quest_StopDance_01_00");	//Hej, si v pohodě? Nikdo nehrál už dlouhou dobu a si celý pobledlý.
	AI_Output(self,other,"DIA_Jesper_Quest_StopDance_01_01");	//No jasně... (těžké dýchání) Ani jsem si toho nevšim.
	AI_Output(self,other,"DIA_Jesper_Quest_StopDance_01_02");	//Myslím, že bych se měl vrátit do práce.
	AI_Output(self,other,"DIA_Jesper_Quest_StopDance_01_03");	//Nemáš náhodou s sebou krýgl piva?
	JesperCalm = TRUE;
	Info_ClearChoices(DIA_Jesper_Quest_StopDance);

	if(Npc_HasItems(hero,ItFo_Beer))
	{
		Info_AddChoice(DIA_Jesper_Quest_StopDance,"Jasně.",DIA_Jesper_Quest_StopDance_yes);
	};

	Info_AddChoice(DIA_Jesper_Quest_StopDance,"Ne.",DIA_Jesper_Quest_StopDance_no);
};

func void DIA_Jesper_Quest_StopDance_yes()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jesper_Quest_StopDance_yes_01_01");	//Jasně. Tady.
	B_GiveInvItems(hero,self,ItFo_Beer,1);
	B_UseItem(self,ItFo_Beer);
	AI_Output(self,other,"DIA_Jesper_Quest_StopDance_yes_01_02");	//Och, jak výborné... Díky chlape.
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Jesper_Quest_StopDance_no()
{
	AI_Output(other,self,"DIA_Jesper_Quest_StopDance_no_01_01");	//Ne.
	AI_Output(self,other,"DIA_Jesper_Quest_StopDance_no_01_02");	//Tak nic no.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Jesper_Armor(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Armor_Condition;
	information = DIA_Jesper_Armor_Info;
	permanent = FALSE;
	description = "Kde mohu najít nějakou dobrou zbroj?";
};

func int DIA_Jesper_Armor_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jesper_Armor_Info()
{
	AI_Output(other,self,"DIA_Jesper_Armor_01_00");	//Kde mohu najít nějakou dobrou zbroj?
	AI_Output(self,other,"DIA_Jesper_Armor_01_01");	//Hmm... (sarkasticky) Když už jsi jeden z nás, myslím, že bych ti s tím mohl pomoci.
	AI_Output(self,other,"DIA_Jesper_Armor_01_02");	//Mám pár věcí, které by tě mohly zajímat.
	AI_Output(self,other,"DIA_Jesper_Armor_01_03");	//Ale jak už určitě víš, všechno má svou cenu.
	AI_Output(self,other,"DIA_Jesper_Armor_01_04");	//Zadarmo nic nedostaneš.
	Jesper_Armor = TRUE;
	B_LogEntry_Quiet(TOPIC_ThiefTeacher,"Jesper mi může prodat zlodějskou zbroj.");
};

var int BuyThiefArmor_01;
var int BuyThiefArmor_02;
var int BuyThiefArmor_03;
var int BuyThiefArmor_04;
var int BuyThiefArmor_05;
var int BuyThiefArmor_06;
var int BuyThiefArmor_07;

instance DIA_Jesper_TRADE(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 2;
	condition = DIA_Jesper_TRADE_Condition;
	information = DIA_Jesper_TRADE_Info;
	permanent = TRUE;
	description = "Ukaž mi, co máš na skladě.";
};

func int DIA_Jesper_TRADE_Condition()
{
	if(Jesper_Armor == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jesper_TRADE_Info()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_01_00");	//Ukaž mi, co máš na skladě.
	AI_Output(self,other,"DIA_Jesper_TRADE_01_01");	//Tady. Jestli jsi teda dost obratný...
	Info_ClearChoices(DIA_Jesper_TRADE);
	Info_AddChoice(DIA_Jesper_TRADE,"Možná později.",DIA_Jesper_TRADE_Back);

	if(BuyThiefHelm_01 == FALSE)
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Čapka zloděje (cena: 250 zlatých)",DIA_Jesper_TRADE_DHM);
	};
	if(BuyThiefArmor_01 == FALSE)
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Zbroj šejdíře (cena: 500 zlatých, Potřebná obratnost: 50)",DIA_Jesper_TRADE_DHT);
	};
	if((Kapitel >= 1) && (hero.guild != GIL_NONE) && (BuyThiefArmor_02 == FALSE))
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Zbroj zloděje (cena: 2000 zlatých, Potřebná obratnost: 80)",DIA_Jesper_TRADE_DHT_1);
	};
	if((Kapitel >= 2) && (BuyThiefArmor_03 == FALSE))
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Zbroj ducha (cena: 3000 zlatých, Potřebná obratnost: 120)",DIA_Jesper_TRADE_DHT_2);
	};
	if((Kapitel >= 2) && (RavenAway == TRUE) && (BuyThiefArmor_04 == FALSE))
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Zbroj nočního stínu (cena: 5000 zlatých, Potřebná obratnost: 150)",DIA_Jesper_TRADE_DHT_3);
	};
	if((Kapitel >= 3) && (BuyThiefArmor_05 == FALSE))
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Zbroj mistra zloděje (cena: 8000 zlatých, Potřebná obratnost: 180)",DIA_Jesper_TRADE_DHT_4);
	};
	if((Kapitel >= 3) && (MEETURNAZUL == TRUE) && (BuyThiefArmor_06 == FALSE))
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Zbroj vůdce zlodějů (cena: 12000 zlatých, Potřebná obratnost: 230)",DIA_Jesper_TRADE_DHT_5);
	};
	if((Kapitel >= 4) && (BuyThiefArmor_07 == FALSE))
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Zbroj krále zlodějů (cena: 15000 zlatých, Potřebná obratnost: 350)",DIA_Jesper_TRADE_DHT_6);
	};
};

func void DIA_Jesper_TRADE_Back()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_Back_01_00");	//Možná později.
	AI_Output(self,other,"DIA_Jesper_TRADE_Back_01_01");	//Jak je libo.
	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHT_01_00");	//Dej mi zbroj šejdíře.

	if(hero.attribute[ATR_DEXTERITY] >= 50)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,500))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,500);
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_01");	//Tady! Teď je tvoje.
			CreateInvItems(other,ITAR_DHT_END,1);
			BuyThiefArmor_01 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_02");	//Nejdřív zlato!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_03");	//Ještě nejsi dost obratný.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHM()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHM_01_00");	//Dej mi čapku zloděje.

	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		Npc_RemoveInvItems(self,ItMi_Gold,250);
		AI_Output(self,other,"DIA_Jesper_TRADE_DHM_01_01");	//Tady! Teď je tvoje.
		CreateInvItems(other,ItAr_ThiefHut,1);
		BuyThiefHelm_01 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHM_01_02");	//Ještě nejsi dost obratný.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_1()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHT_1_01_00");	//Dej mi zbroj zloděje.

	if(hero.attribute[ATR_DEXTERITY] >= 80)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,2000))
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_1_01_01");	//Tady! Teď je tvoje.
			CreateInvItems(other,ITAR_DHT_END_1,1);
			BuyThiefArmor_02 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_1_01_02");	//Nejdřív zlato!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_03");	//Ještě nejsi dost obratný.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_2()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHT_2_01_00");	//Dej mi zbroj ducha.

	if(hero.attribute[ATR_DEXTERITY] >= 120)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,3000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,3000);
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_2_01_01");	//Dobrá volba. Konečně máš pořádnou zbroj.
			CreateInvItems(other,ITAR_DHT_END_2,1);
			BuyThiefArmor_03 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_2_01_02");	//Nejdřív zlato!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_03");	//Ještě nejsi dost obratný.
	};	

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_3()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHT_3_01_00");	//Dej mi zbroj nočního stínu.

	if(hero.attribute[ATR_DEXTERITY] >= 150)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,5000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,5000);
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_3_01_01");	//Skvělé! V něm se budeš cítit mnohem bezpečněji.
			CreateInvItems(other,ITAR_DHT_END_3,1);
			BuyThiefArmor_04 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_3_01_02");	//Nejdřív zlato!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_03");	//Ještě nejsi dost obratný.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_4()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHT_4_01_00");	//Dej mi zbroj mistra zloděje.

	if(hero.attribute[ATR_DEXTERITY] >= 180)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,8000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,8000);
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_4_01_01");	//Výborná volba! Takovou zbroj nemá každý.
			CreateInvItems(other,ITAR_DHT_END_4,1);
			BuyThiefArmor_05 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_4_01_02");	//Nejdřív zlato!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_03");	//Ještě nejsi dost obratný.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_5()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHT_5_01_00");	//Dej mi zbroj vůdce zlodějů.

	if(hero.attribute[ATR_DEXTERITY] >= 230)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,12000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,12000);
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_5_01_01");	//To není zbroj ale umění.
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_5_01_02");	//Nosí ji jen ti nejlepší zloději.
			CreateInvItems(other,ITAR_DHT_END_5,1);
			BuyThiefArmor_06 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_5_01_03");	//Nejdřív zlato!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_03");	//Ještě nejsi dost obratný.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_6()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHT_6_01_00");	//Dej mi zbroj krále zlodějů.

	if(hero.attribute[ATR_DEXTERITY] >= 350)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,15000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,15000);
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_5_01_01");	//Ne zbroj ale umělecké dílo!
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_5_01_02");	//Koneckonců nosí je pouze sbírka nejzkušenějších zlodějů.
			CreateInvItems(other,ITAR_DHT_END_6,1);
			BuyThiefArmor_07 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_5_01_03");	//Za prvé chci vidět moje zlato kamaráde.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_03");	//Ještě nejsi dost obratný.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};
