
var int Brahim_ShowedMaps;

func void B_BrahimNewMaps()
{
	if(Brahim_ShowedMaps == TRUE)
	{
		AI_Output(self,other,"B_BrahimNewMaps_07_00");	//Vrať se později, určitě pro tebe pak budu něco mít.
	};
};


instance DIA_Brahim_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_EXIT_Condition;
	information = DIA_Brahim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brahim_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Brahim_EXIT_Info()
{
	B_BrahimNewMaps();
	AI_StopProcessInfos(self);
};

instance DIA_Brahim_PICKPOCKET(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 900;
	condition = DIA_Brahim_PICKPOCKET_Condition;
	information = DIA_Brahim_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(zkusit ukrást sextant)";
};

func int DIA_Brahim_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brahim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
	Info_AddChoice(DIA_Brahim_PICKPOCKET,Dialog_Back,DIA_Brahim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brahim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brahim_PICKPOCKET_DoIt);
};

func void DIA_Brahim_PICKPOCKET_DoIt()
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
		B_GiveInvItems(self,other,ItMi_Sextant,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Brahim_PICKPOCKET);
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

func void DIA_Brahim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
};

instance DIA_Brahim_GREET(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_GREET_Condition;
	information = DIA_Brahim_GREET_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Brahim_GREET_Condition()
{
	return TRUE;
};

func void DIA_Brahim_GREET_Info()
{
	AI_Output(other,self,"DIA_Brahim_GREET_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Brahim_GREET_07_01");	//Jmenuji se Brahim. Kreslím mapy a pak je prodávám.
	AI_Output(self,other,"DIA_Brahim_GREET_07_02");	//Tys tu nový, a tak by se ti nějaká mapa města jistě hodila.
	AI_Output(self,other,"DIA_Brahim_GREET_07_03");	//Je poměrně levná a bude se ti dost hodit, dokud se tu úplně nezorientuješ.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Brahim kreslí a prodává mapy. Sídlí poblíž přístavu.");
};

instance DIA_Brahim_HelpPath(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_HelpPath_Condition;
	information = DIA_Brahim_HelpPath_Info;
	permanent = FALSE;
	description = "Nepotřeboval bys nějakou pomoc?";
};

func int DIA_Brahim_HelpPath_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brahim_GREET) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Brahim_HelpPath_Info()
{
	AI_Output(other,self,"DIA_Brahim_HelpPath_01_00");	//Nepotřeboval bys nějakou pomoc?
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_01");	//Dobrá otázka. Právěže i jo.
	AI_Output(other,self,"DIA_Brahim_HelpPath_01_02");	//Tak ven s tím, co bys potřeboval?
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_03");	//Však to poznáš, nedávno jsem dostal objednávku na mapu celého ostrova.
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_04");	//Kupec za ni platí pěknou hromádku peněz. Skoro 500 zlatých!
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_05");	//A mně zrovna došel atrament.
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_06");	//Takže teď sedím a přemýšlím kde bych nejaký sehnal.
	AI_Output(other,self,"DIA_Brahim_HelpPath_01_07");	//A skusils nejaký koupit?
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_08");	//V téhle části města atrament nikdo nemá na prodej a do horní čtvrti mě nepustí.
	AI_Output(other,self,"DIA_Brahim_HelpPath_01_09");	//Dobře, skusím ti teda nejaký sehnat.
	AI_Output(other,self,"DIA_Brahim_HelpPath_01_10");	//Jen tak mimochodem, kto je tou štědrou osobou, která ti platí za tu mapu?
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_11");	//Pravdu říci, nikdy předtím jsem ho neviděl.
	AI_Output(self,other,"DIA_Brahim_HelpPath_01_12");	//Myslím, že to bylo něco jako Goales nebo Gonsles. Moc si to nepamatuju.
	MIS_BrahimWax = LOG_Running;
	Log_CreateTopic(TOPIC_BrahimWax,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrahimWax,LOG_Running);
	B_LogEntry(TOPIC_BrahimWax,"Brahim nutně potřebuje atrament, bez něj nemůže dokončit mapu kterou si u něho objednali.");
};

instance DIA_Brahim_HelpPath_Done(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_HelpPath_Done_Condition;
	information = DIA_Brahim_HelpPath_Done_Info;
	permanent = FALSE;
	description = "Tady je tvůj atrament.";
};

func int DIA_Brahim_HelpPath_Done_Condition()
{
	if((MIS_BrahimWax == LOG_Running) && (Npc_HasItems(other,ItMi_Wax) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brahim_HelpPath_Done_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Brahim_HelpPath_Done_01_00");	//Tady je tvůj atrament.
	B_GiveInvItems(other,self,ItMi_Wax,1);
	Npc_RemoveInvItems(self,ItMi_Wax,1);
	AI_Output(self,other,"DIA_Brahim_HelpPath_Done_01_01");	//Díky, zachránil jsi mě. 
	AI_Output(self,other,"DIA_Brahim_HelpPath_Done_01_02");	//Teď můžu konečně dokončit tu mapu a shrábnout za ni kopu zlata.
	AI_Output(other,self,"DIA_Brahim_HelpPath_Done_01_03");	//A co já?
	AI_Output(self,other,"DIA_Brahim_HelpPath_Done_01_04");	//Nemám pro tebe nic cenného.
	AI_Output(self,other,"DIA_Brahim_HelpPath_Done_01_05");	//I když... Počkej, vezmi si tenhle papír.
	AI_Output(self,other,"DIA_Brahim_HelpPath_Done_01_06");	//Není to jen obyčejný papír jako by se zdálo na první pohled.
	B_GiveInvItems(self,other,itwr_magicpaper,3);
	AI_Output(self,other,"DIA_Brahim_HelpPath_Done_01_07");	//Můžes z něho dělat magické svitky.
	AI_Output(self,other,"DIA_Brahim_HelpPath_Done_01_08");	//Ale nic víc nemám.
	AI_Output(other,self,"DIA_Brahim_HelpPath_Done_01_09");	//Dobře tedy. Dej ho sem.
	CreateInvItems(self,itwr_map_newworld_1,1);
	MIS_BrahimWax = LOG_Success;
	Log_SetTopicStatus(TOPIC_BrahimWax,LOG_Success);
	B_LogEntry(TOPIC_BrahimWax,"Koupil jsem Brahimovi atrament.");
};

instance DIA_Addon_Brahim_MissingPeople(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 5;
	condition = DIA_Addon_Brahim_MissingPeople_Condition;
	information = DIA_Addon_Brahim_MissingPeople_Info;
	description = "Je to pravda, že obyvatelé tohohle města mizejí bez jakékoli stopy?";
};


func int DIA_Addon_Brahim_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (ENTERED_ADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brahim_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Brahim_MissingPeople_15_00");	//Je to pravda, že obyvatelé tohohle města mizejí bez jakékoli stopy?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_01");	//Hej, taky sem o tom slyšel. Bohužel, nemůžu říct, jestli jsou ty příbehy pravdivé.
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_02");	//Jen se koukni okolo. Tohle skutečně není místo kde bys chtel žít navždy, co?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_03");	//Žáden div, že lidé odcházejí.
};


var int brahimowmapready;

instance DIA_BRAHIM_COAST_MAP(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 5;
	condition = dia_brahim_coast_map_condition;
	information = dia_brahim_coast_map_info;
	permanent = FALSE;
	description = "Nemáš věrnou kopii mapy Hornického údolí?";
};

func int dia_brahim_coast_map_condition()
{
	if((Npc_HasItems(other,itwr_map_oldworld_forest_1) >= 1) && Npc_KnowsInfo(other,DIA_Brahim_GREET))
	{
		return TRUE;
	};
};

func void dia_brahim_coast_map_info()
{
	AI_Output(other,self,"DIA_Brahim_Coast_Map_15_00");	//Nemáš věrnou kopii mapy Hornického údolí
	AI_Output(self,other,"DIA_Brahim_Coast_Map_07_01");	//Ukaž, podívám se...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Brahim_Coast_Map_07_02");	//Hm, velmi zajímavé.
	AI_Output(self,other,"DIA_Brahim_Coast_Map_07_03");	//Co za to chceš? Mám málo zlata, ale mohu ti dát i něco jiného.
	AI_Output(self,other,"DIA_Brahim_Coast_Map_07_04");	//Vyber si:
	Info_ClearChoices(dia_brahim_coast_map);
	Info_AddChoice(dia_brahim_coast_map,"Léčivý lektvar",dia_brahim_coast_map_health_03);
	Info_AddChoice(dia_brahim_coast_map,"Elixír many",dia_brahim_coast_map_mana_03);
	Info_AddChoice(dia_brahim_coast_map,"30 zlatých",dia_brahim_coast_map_gold_03);
};

func void dia_brahim_coast_give()
{
	AI_Output(self,other,"DIA_Brahim_Coast_Map_07_05");	//Výborně, ber.
	AI_Output(self,other,"DIA_Brahim_Coast_Map_07_06");	//Snad jsi vybral dobře.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Brahim_Coast_Map_07_07");	//Zítra k večeru již budou kopie k prodeji.
	Info_ClearChoices(dia_brahim_coast_map);
	B_GivePlayerXP(XP_Ambient);
	BRAHIMOWMAPREADY = Wld_GetDay() + 1;
};

func void dia_brahim_coast_map_mana_03()
{
	AI_Output(other,self,"DIA_Brahim_Coast_Map_15_01");	//Dej mi lektvar many.
	B_GiveInvItems(self,other,ItPo_Mana_03,1);
	dia_brahim_coast_give();
};

func void dia_brahim_coast_map_health_03()
{
	AI_Output(other,self,"DIA_Brahim_Coast_Map_15_02");	//Dej mi léčivý lektvar.
	B_GiveInvItems(self,other,ItPo_Health_03,1);
	dia_brahim_coast_give();
};

func void dia_brahim_coast_map_gold_03()
{
	AI_Output(other,self,"DIA_Brahim_Coast_Map_15_03");	//Dej mi zlato.
	B_GiveInvItems(self,other,ItMi_Gold,30);
	dia_brahim_coast_give();
};

instance DIA_Brahim_BUY(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 9;
	condition = DIA_Brahim_BUY_Condition;
	information = DIA_Brahim_BUY_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své mapy.";
};

func int DIA_Brahim_BUY_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_Brahim_GREET) == TRUE) && Wld_IsTime(8,0,22,0))
	{
		return TRUE;
	};
};

func void DIA_Brahim_BUY_Info()
{
	var int today;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	today = Wld_GetDay();

	if((BRAHIMOWMAPREADY != 0) && (Npc_HasItems(self,itwr_map_oldworld_forest_1) == 0) && ((today > BRAHIMOWMAPREADY) || ((today == BRAHIMOWMAPREADY) && Wld_IsTime(12,0,23,59))))
	{
		CreateInvItems(self,itwr_map_oldworld_forest_1,1);
		BRAHIMOWMAPREADY = 0;
	};

	AI_Output(other,self,"DIA_Brahim_BUY_15_00");	//Ukaž mi své mapy.

	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_01");	//Lepší nenajdeš ani v tom svém klášteře.
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_02");	//Dobré mapy jsou důležité, zvláště pro ty, kdo přicházejí z pevniny, mistře paladine.
	};

	Brahim_ShowedMaps = TRUE;
	B_GiveTradeInv(self);
};


instance DIA_Brahim_Kap3_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_Kap3_EXIT_Condition;
	information = DIA_Brahim_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brahim_Kap3_EXIT_Condition()
{
	if((Kapitel >= 3) && (Npc_KnowsInfo(other,DIA_Brahim_Kap3_First_EXIT) || (Npc_HasItems(other,itwr_shatteredgolem_mis_1) == 0)))
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_EXIT_Info()
{
	if(Kapitel <= 4)
	{
		B_BrahimNewMaps();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Brahim_Kap3_First_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_Kap3_First_EXIT_Condition;
	information = DIA_Brahim_Kap3_First_EXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_Brahim_Kap3_First_EXIT_Condition()
{
	if((Kapitel >= 3) && (Npc_HasItems(other,itwr_shatteredgolem_mis_1) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_First_EXIT_Info()
{
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_00");	//Já věděl, že tě tenhle kousek bude zajímat.
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_15_01");	//Jaký kousek?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_02");	//No, ta stará mapa, kterou sis právě koupil.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_03");	//Znám takové, jako jsi ty. Nepropásnete jedinou šanci, jak přijít k bohatství.
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,Dialog_Back,DIA_Brahim_Kap3_First_EXIT_BACK);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Jak jsi získal tenhle dokument?",DIA_Brahim_Kap3_First_EXIT_WhereGetIt);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Co je to za dokument?",DIA_Brahim_Kap3_First_EXIT_Content);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,"Proč si ji nenecháš sám?",DIA_Brahim_Kap3_First_EXIT_KeepIt);
};

func void DIA_Brahim_Kap3_First_EXIT_BACK()
{
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
};

func void DIA_Brahim_Kap3_First_EXIT_WhereGetIt()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00");	//Jak jsi získal tenhle dokument?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01");	//No, našel jsem ji ve štosu starých map, který jsem nedávno koupil.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02");	//Ten, kdo ji prodával, ji musel přehlédnout.
};

func void DIA_Brahim_Kap3_First_EXIT_Content()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_Content_15_00");	//Co je to za dokument?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01");	//Vypadá to jako nějaká mapa k pokladu.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02");	//Ty mi ale připadáš jako někdo, kdo by něčemu takovému mohl přijít na kloub.
};

func void DIA_Brahim_Kap3_First_EXIT_KeepIt()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");	//Proč si ji nenecháš sám?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01");	//Jsem už starý a časy, kdy jsem vyrážel na výpravy, už jsou dávno pryč.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02");	//Teď už to nechávám na mladších.
};

instance DIA_Brahim_NeedWorldMap(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_NeedWorldMap_Condition;
	information = DIA_Brahim_NeedWorldMap_Info;
	permanent = FALSE;
	description = "Potřebujem mapu.";
};

func int DIA_Brahim_NeedWorldMap_Condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (RatfordNeedMap == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Brahim_NeedWorldMap_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Brahim_NeedWorldMap_01_00");	//Potřebujem mapu, která ukazuje přesný kurs ku kontinentu.
	AI_Output(self,other,"DIA_Brahim_NeedWorldMap_01_01");	//Hmmm...(překvapeně) A odkud bych ji měl získat?
	AI_Output(other,self,"DIA_Brahim_NeedWorldMap_01_02");	//Vždyť jsi kartograf!
	AI_Output(self,other,"DIA_Brahim_NeedWorldMap_01_03");	//Ano, ale nejsem moreplavec! Kreslím jen mapy míst které už někdo navštívil.
	AI_Output(self,other,"DIA_Brahim_NeedWorldMap_01_04");	//A já ani nikdy nebyl na moři.
	AI_Output(other,self,"DIA_Brahim_NeedWorldMap_01_05");	//Možná mně aspoň nasměruj kde bych ji mohl najít.
	AI_Output(self,other,"DIA_Brahim_NeedWorldMap_01_06");	//Mohli by ji mít paladinové, oni odtamtudy přijeli!
	AI_Output(other,self,"DIA_Brahim_NeedWorldMap_01_07");	//Ano, oni by ji mohli mít.
	B_LogEntry(Topic_SylvioCrew,"Kartograf Brahim mi nepomůže, ale poradil mi abych skusil paladiny.");
};