/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

ItMi_Moleratlubric_MIS - vytvoření předmětu přesunuto ze 3. do 1. kapitoly

*/



instance DIA_DMT_2200_DarkSpeaker_Exit(C_Info)
{
	npc = DMT_2200_DarkSpeaker;
	nr = 999;
	condition = DIA_DMT_2200_DarkSpeaker_Exit_condition;
	information = DIA_DMT_2200_DarkSpeaker_Exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DMT_2200_DarkSpeaker_Exit_condition()
{
	return TRUE;
};

func void DIA_DMT_2200_DarkSpeaker_Exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DMT_2200_DarkSpeaker_Hello(C_Info)
{
	npc = DMT_2200_DarkSpeaker;
	nr = 1;
	condition = DIA_DMT_2200_DarkSpeaker_Hello_condition;
	information = DIA_DMT_2200_DarkSpeaker_Hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2200_DarkSpeaker_Hello_condition()
{
	return TRUE;
};

func void DIA_DMT_2200_DarkSpeaker_Hello_info()
{
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_00");	//Tak jsme se konečně setkali Hrdino...
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_Hello_01_01");	//Kdo jsi?
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_Hello_01_02");	//Další zástupce Beliara, který tě poslal mě zastavit?
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_03");	//Moje jméno ti nebude nic říkat... Ale mám pro tebe nabídku.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_04");	//Doufám že si ji poslechneš než se mě pokusíš zabít.
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_Hello_01_05");	//Tak povídej!
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_06");	//Přišel jsem s návrhem mého pána.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_07");	//Vídí v tobě obrovskou sílu a schopnost trvale změnit tento svět.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_08");	//Nyní bojuješ na straně jeho bratra Innose... Ale přemýšlej... Opravdu stojí za to?
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_09");	//Co pro tebe Innos udělal? Jaké má výhody že mu tak věrně sloužíš?
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_10");	//Jsem si jistý že žádné! Riskuješ svůj život pro nic za nic!
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_11");	//A můj pán by ti nabídl mnohem více! Ne jen prázdné sliby toho podvodného pokrytce!
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_12");	//Dostaneš všechno - sílu, moc, bohatství... Pokud to je to co pro sebe požaduješ.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_13");	//Jsem si jistý že tě nezklame!
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_01_14");	//Co na to říkáš?
	Info_ClearChoices(dia_dmt1298_hello);
	MeetDarkRavenSpeaker = TRUE;

	//if(DarkPathStartEnd == FALSE)
	//{
	//	Info_AddChoice(DIA_DMT_2200_DarkSpeaker_Hello,"Zvuchit zamanchivo!",DIA_DMT_2200_DarkSpeaker_Hello_Yes);
	//};

	Info_AddChoice(DIA_DMT_2200_DarkSpeaker_Hello,"Řekl bych, že je na čase abys už zemřel!.",DIA_DMT_2200_DarkSpeaker_Hello_No);
};

func void DIA_DMT_2200_DarkSpeaker_Hello_Yes()
{
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_01");	//Zní to skvěle!
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_02");	//Ale jakou mám záruku, že tvůj pán opravdu ukáže milost, pokud souhlasím s vaším návrhem.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_03");	//Neboj se to on vždycky dodrží.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_04");	//Nicméně, až po určité době. Nejdřív musíš dokázat svou loajalitu a až poté dostaneš svou odmenu.
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_05");	//No dobře... Řekněme že souhlasím!
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_06");	//Je to moudré rozhodnutí... Jsem si jistý že nebudeš litovat, ale teď k věci.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_07");	//Vím že hledáš způsob jak dostat od paladinů mocný artefakt INNOSOVO OKO.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_08");	//Jsem si jistý, že časem bude určitě ve tvích rukou.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_09");	//Na znamení toho, že jsi poklekl před Pánem Temnoty, a nazýváš se jeho sluhem, nám přineseš tento mocný artefakt.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_10");	//Jak vidíš - nic složitého.
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_11");	//Dobře, udělám to.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_12");	//Budeme tě čekat v kruhu Slunce! Vrať se s amuletem, až ho budeš mít.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeakerHello_Yes_01_13");	//Sbohem... Jsem si jistý že se brzy setkáme.
	DarkPathStart = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
};

func void DIA_DMT_2200_DarkSpeaker_Hello_No()
{
	var int randyspeech;

	randyspeech = Hlp_Random(2);

	if(randyspeech == FALSE)
	{
		Snd_Play("DEM_RITUAL_01");
	}
	else
	{
		Snd_Play("DEM_RITUAL_02");
	};

	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_Hello_No_01_01");	//Řekl bych, že je na čase abys už zemřel!
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_Hello_No_01_02");	//CO?! (hrozivě) Vybral sis špatný osud!
	Info_ClearChoices(DIA_DMT_2200_DarkSpeaker_Hello);
	Info_AddChoice(DIA_DMT_2200_DarkSpeaker_Hello,Dialog_Ende,DIA_DMT_2200_DarkSpeaker_Hello_Quit);
};

func void DIA_DMT_2200_DarkSpeaker_Hello_Quit()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.flags = FALSE;
	Snd_Play("MFX_FEAR_CAST");

	if(SBMODE == TRUE)
	{
		Wld_SpawnNpcRange(hero,Skeleton_Dark,2,500);
	}
	else
	{
		Wld_SpawnNpcRange(hero,Skeleton_Dark,1,500);
	};

	self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;

	//---------------------------osnovnaya----------------------------

	if(Npc_IsDead(Salandril) == FALSE)
	{
		Salandril.aivar[AIV_ToughGuy] = TRUE;
	};

	Cornelius.flags = FALSE;
	NoDarkInsMe = TRUE;

	if(!Npc_IsDead(Hodges))
	{
		B_StartOtherRoutine(Hodges,"BENNETWEG");
	};
	if(Npc_IsDead(Sekob) == FALSE)
	{
		B_StartOtherRoutine(Sekob,"FleeDMT");
		B_StartOtherRoutine(Rosi,"FleeDMT");
		B_StartOtherRoutine(Till,"FleeDMT");
		B_StartOtherRoutine(Balthasar,"FleeDMT");
		B_StartOtherRoutine(BAU_933_Rega,"FleeDMT");
		B_StartOtherRoutine(BAU_934_Babera,"FleeDMT");
		B_StartOtherRoutine(BAU_937_Bauer,"FleeDMT");
		B_StartOtherRoutine(BAU_938_Bauer,"FleeDMT");
		Wld_InsertNpc(DMT_DementorAmbientSekob1,"NW_FARM4_IN_06");
		Wld_InsertNpc(DMT_DementorAmbientSekob2,"NW_FARM4_IN_02");
		Wld_InsertNpc(DMT_DementorAmbientSekob3,"NW_FARM4_IN_03");
		Wld_InsertNpc(DMT_DementorAmbientSekob4,"NW_FARM4_IN_04");
	};

	B_StartOtherRoutine(Lester,"WAITFORPLAYER");
	AI_Teleport(Lester,"NW_GREATPEASENT_TO_PASS");
	B_StartOtherRoutine(Bennet,"PRISON");
	B_RemoveNpc(PAL_203_Lothar);

	if(Bennet.flags == NPC_FLAG_IMMORTAL)
	{
		Bennet.flags = NPC_FLAG_NONE;
	};

	if(Npc_IsDead(Malak) == FALSE)
	{
		B_StartOtherRoutine(Malak,"FleeFromPass");
		Malak_isAlive_Kap3 = TRUE;
		B_StartOtherRoutine(BAU_962_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_964_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_965_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_966_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_967_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_968_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_969_Bauer,"FleeFromPass");

		if(hero.guild == GIL_KDF)
		{
			CreateInvItems(Malak,ITWR_DementorObsessionBook_MIS,1);
		};
	};

	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"NW_CITY_TO_FARM2_03");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_NW_BIGFARM_FELDREUBER11");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_02");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_03");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_04");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_05");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_06");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_CITY_TO_FOREST_01");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_CITY_TO_FOREST_15");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_07");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_08");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_09");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_10");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_11");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_12");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_13");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_14");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_15");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_16");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_17");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_18");
	Wld_InsertNpc(DMT_DementorAmbientWalker11,"CITY1");
	Wld_InsertNpc(DMT_DementorAmbientWalker9,"CITY1");
	Wld_InsertNpc(DMT_DementorAmbientWalker6,"CITY1");
	Wld_InsertNpc(DMT_DementorAmbientWalker3,"CITY1");
	Wld_InsertNpc(DMT_DementorAmbientWalker1,"CITY1");

	if(Npc_IsDead(skeletonmage_darktower) == TRUE)
	{
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_01");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_02");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_03");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_04");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_05");
	};
	if(hero.guild == GIL_KDF)
	{
		Wld_InsertItem(ItMi_KarrasBlessedStone_Mis,"FP_ITEM_FARM1_03");
		Wld_InsertItem(ItMi_KarrasBlessedStone_Mis,"FP_NW_ITEM_TROLL_10");
		B_StartOtherRoutine(Hilda,"KRANK");

		if(Npc_IsDead(Vino) == FALSE)
		{
			B_StartOtherRoutine(Vino,"OBESESSIONRITUAL");
			CreateInvItems(Vino,ITWR_DementorObsessionBook_MIS,1);
			Vino_isAlive_Kap3 = TRUE;
			B_StartOtherRoutine(Lobart,"OBESESSIONRITUAL");
			Wld_InsertNpc(DMT_DementorSpeakerVino1,"FP_STAND_DEMENTOR_KDF_31");
			Wld_InsertNpc(DMT_DementorSpeakerVino2,"FP_STAND_DEMENTOR_KDF_32");
			Wld_InsertNpc(DMT_DementorSpeakerVino3,"FP_STAND_DEMENTOR_KDF_33");
			Wld_InsertNpc(DMT_DementorSpeakerVino4,"NW_LITTLESTONEHENDGE_02");
			B_KillNpc(YGiant_Bug_VinoRitual1);
			B_KillNpc(YGiant_Bug_VinoRitual2);
		};
		if(Npc_IsDead(Bromor) == FALSE)
		{
			CreateInvItems(Bromor,ITWR_DementorObsessionBook_MIS,1);
		};
	};

	CreateInvItems(Lester,ItMw_1h_Bau_Axe,1);
	// CreateInvItems(Ehnim,ItMi_Moleratlubric_MIS,1);
	ShrineIsObsessed_NW_TROLLAREA_PATH_37 = TRUE;
	ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS = TRUE;
	ShrineIsObsessed_NW_TROLLAREA_PATH_66 = TRUE;
	ShrineIsObsessed_NW_TROLLAREA_PATH_04 = TRUE;
	ShrineIsObsessed_SAGITTA = TRUE;
	ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02 = TRUE;
	ShrineIsObsessed_NW_FARM3_BIGWOOD_02 = TRUE;

	if((Npc_IsDead(BDT_1060_Dexter) == TRUE) && (DMTINCASTLEMINEISREADY == FALSE))
	{
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_01");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_REP_HUT");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_PATH_HUT_02");
		Wld_InsertNpc(DMT_DementorAmbient,"CASTLEMINE");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_01");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_PATH_OUTSIDEHUT_02");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_PATH_01");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_CAMPFIRE_01");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_CAMPFIRE_02");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_CAMPFIRE_03");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"NW_CASTLEMINE_PATH_03");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_CAMPFIRE_04");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_HUT_01");
		Wld_InsertNpc(CastlemineDMT,"NW_CASTLEMINE_HUT_10");
		DMTINCASTLEMINEISREADY = TRUE;
	};
};

instance DIA_DMT_2200_DarkSpeaker_InnosEye(C_Info)
{
	npc = DMT_2200_DarkSpeaker;
	nr = 1;
	condition = DIA_DMT_2200_DarkSpeaker_InnosEye_condition;
	information = DIA_DMT_2200_DarkSpeaker_InnosEye_info;
	permanent = FALSE;
	description = "Přinesl jsem ti Innosův artefakt.";
};

func int DIA_DMT_2200_DarkSpeaker_InnosEye_condition()
{
	if(Npc_HasItems(hero,ItMi_InnosEye_Bad) >= 1)
	{
		return TRUE;
	};
};

func void DIA_DMT_2200_DarkSpeaker_InnosEye_info()
{
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_00");	//Přinesl jsem ti Innosův artefakt.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_01");	//Ukaž mi ho!
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_02");	//Zde je.
	B_GiveInvItems(other,self,ItMi_InnosEye_Bad,1);
	Npc_RemoveInvItems(self,ItMi_InnosEye_Bad,1);
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_03");	//Výborně! Udělal jsi moudré rozhodnutí, tím že jsi mi ho dal, jsi prokázal svou vůli sloužit Beliarovi.
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_04");	//A co slíbená odměna?
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_05");	//Samozřejmě! Tady, vem si to zlato jako odměnu za svoji práci.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_06");	//Děkuji a co teď?
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_07");	//Myslím, že je čas, seznámit se s naším představeným.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_08");	//On je moudrý a mocný! Vysvětlí ti všechno lépe než já.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_09");	//Kromě toho, jsem si jistý, že pro tebe bude mít nějaké úkoly.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_10");	//Můžu ti dát jednu radu - nezklam ho!
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_11");	//A jestli se ti povede tak dobře jako s amuletem, můžeš se brzy stát jedním z nás.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_12");	//Ale na to je ještě příliš brzy.
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_13");	//Dobře. Kde se mohu setkat s tím vaším představeným?
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_14");	//Bude na tebe čekat ve zničené věži, která je v blízkosti starého majáku. Je to nedaleko od pevnosti paladinů.
	AI_Output(self,other,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_15");	//Běž za ním radši hned! Nerad čeká...
	AI_Output(other,self,"DIA_DMT_2200_DarkSpeaker_InnosEye_01_16");	//Dobře, už jdu.
	TOPIC_END_INNOSEYE = TRUE;
	Log_SetTopicStatus(TOPIC_INNOSEYE,LOG_SUCCESS);
	B_LogEntry_Quiet(TOPIC_INNOSEYE,"Dal jsem Innosův artefakt služebníkovi Beliara! Byl velmi spokojen. Zřejmě je teď můj osud neoddělitelně spjat s purpurovou temnotou Beliara... a není cesty zpět!");
	MIS_MeetWithDark = LOG_Running;
	NazgulsAwayMe = TRUE;
	Log_CreateTopic(TOPIC_MeetWithDark,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MeetWithDark,LOG_Running);
	B_LogEntry(TOPIC_MeetWithDark,"Musím se setkat s představeným Temných poutníků. Čeká na mě ve zničené věži, u majáku, v blízkosti vstupu do pevnosti paladinů. Myslím, že bych ho neměl nechat čekat...");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ritual");
	Wld_InsertNpc(DMT_DementorFriendly,"NW_DARKMASTER_02_01");
	Wld_InsertNpc(DMT_DementorFriendly,"NW_DARKMASTER_02_02");
	Wld_InsertNpc(DMT_2201_Krah,"NW_DARKMASTER_02");
};

//---------------------------------------------------------------------------------------------

instance DIA_DMT_2201_Krah_Exit(C_Info)
{
	npc = DMT_2201_Krah;
	nr = 999;
	condition = DIA_DMT_2201_Krah_Exit_condition;
	information = DIA_DMT_2201_Krah_Exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DMT_2201_Krah_Exit_condition()
{
	return TRUE;
};

func void DIA_DMT_2201_Krah_Exit_info()
{
	AI_StopProcessInfos(self);
};

var int DS_CheckInfo_01;
var int DS_CheckInfo_02;
var int DS_CheckInfo_03;

instance DIA_DMT_2201_Krah_Hello(C_Info)
{
	npc = DMT_2201_Krah;
	nr = 1;
	condition = DIA_DMT_2201_Krah_Hello_condition;
	information = DIA_DMT_2201_Krah_Hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2201_Krah_Hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2201_Krah_Hello_info()
{
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_00");	//Čekám tu na tebe...
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_01_01");	//Přišel jsem hned jak jsem mohl.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_02");	//Dobře, na tom nezáleží.
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_01_03");	//Kdo jsi?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_04");	//Jmenuji se Ek'Rah.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_05");	//Jsem jeden z nástupců temných mágů Beliara, nebo jak vy lidé jim říkáte - Pátračů.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_06");	//I když, po pravdě řečeno už nemusíme nic hledat. Už jsme našli to co jsme hledali.
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_01_07");	//A cože jste hledali?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_08");	//Tebe přece! Hledali jsme tě, abychom ti navrhli, se k nám přidat.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_09");	//A jak vidím přijal jsi to... Což je moudré rozhodnutí!
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_10");	//Beliar byl vždy štědrý k těm, kteří mu věrně slouží. Narozdíl od svých bratrů.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_11");	//Ale dost řečí! Máme příliš málo času, který můžem využít k službě našemu pánu.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_01_12");	//Ve světě nadcházejí velké změny, ve kterých hraješ nemalou roli.
	Info_ClearChoices(DIA_DMT_2201_Krah_Hello);
	Info_AddChoice(DIA_DMT_2201_Krah_Hello,"Proč potřebujete 'Innosovo oko'?",DIA_DMT_2201_Krah_Hello_Eye);
	Info_AddChoice(DIA_DMT_2201_Krah_Hello,"Kdo jsou Pátrači?",DIA_DMT_2201_Krah_Hello_About);
	Info_AddChoice(DIA_DMT_2201_Krah_Hello,"Co tím myslíš?",DIA_DMT_2201_Krah_Hello_Plan);
};

func void DIA_DMT_2201_Krah_Hello_Eye()
{
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_Eye_01_00");	//Proč potřebujete 'Innosovo oko'?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_Eye_01_01");	//Jsem si jistý, že víš, že se jedná o velmi mocný artefakt, vytvořený bratrem našeho pána.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_Eye_01_02");	//Jeho pouhá přítomnost v tomto světě je pro nás nepřijatelná.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_Eye_01_03");	//Proto musí být zničen všemi prostředky! A ty jsi nám v tom pomohl.
	DS_CheckInfo_01 = TRUE;
	
	if((DS_CheckInfo_01 == TRUE) || (DS_CheckInfo_02 == TRUE) || (DS_CheckInfo_03 == TRUE))
	{
		Info_ClearChoices(DIA_DMT_2201_Krah_Hello);
		Info_AddChoice(DIA_DMT_2201_Krah_Hello,"Co dál?",DIA_DMT_2201_Krah_Hello_WhatDo);
	};
};

func void DIA_DMT_2201_Krah_Hello_About()
{
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_About_01_00");	//Kdo vlastně jsou Pátrači?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_01");	//Jsou to mocní mágové, kteří se vložili do služeb Temného boha.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_02");	//Mnozí z nich vstoupili na tuto cestu již dávno, ale jsou i tací, kteří se přidali nedávno.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_03");	//Například šílení fanatici, kteří uctívali Spáče, než jsi ho vyhnal z tohoto světa.
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_About_01_04");	//Jak víš, že jsem vyhnal Spáče?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_05");	//Některé věci jen stěží skryješ před zraky těch, co opravdu vidí. 
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_06");	//Kromě toho nárust magické energie byl tak veliký, že ho nebylo možné přehlédnout.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_07");	//Nicméně si myslím, že to není poslední zjevení Spáče na tomto světě.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_08");	//Určitě se najdou tací, co se snaží přivolat ho zpět.
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_About_01_09");	//Zajímalo by mě proč?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_10");	//Spáč je velmi starý a mocný démon, jehož vznik sahá až do samých počátků světa.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_About_01_11");	//Takže o jeho sílu se zajímají mnozí. Včetně našeho pána.
	DS_CheckInfo_02 = TRUE;

	if((DS_CheckInfo_01 == TRUE) || (DS_CheckInfo_02 == TRUE) || (DS_CheckInfo_03 == TRUE))
	{
		Info_ClearChoices(DIA_DMT_2201_Krah_Hello);
		Info_AddChoice(DIA_DMT_2201_Krah_Hello,"Co dál?",DIA_DMT_2201_Krah_Hello_WhatDo);
	};
};

func void DIA_DMT_2201_Krah_Hello_Plan()
{
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_Plan_01_00");	//Co tím myslíš?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_Plan_01_01");	//Ještě je příiž brzo! Až přijde čas sám všemu porozumíš.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_Plan_01_02");	//Jednu věc ti ale můžu říct - svět už nikdy nebude jako dřív.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_Plan_01_03");	//Jaké místo v ňěm pak zaujmem, závislí na úspěchu našich činů ve jménu Temného boha!
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_Plan_01_04");	//O to jediné má smysl usilovat, a ne rozptylovat se světskými věcmi.
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_Plan_01_05");	//Dobře, pokusím se.
	DS_CheckInfo_03 = TRUE;

	if((DS_CheckInfo_01 == TRUE) || (DS_CheckInfo_02 == TRUE) || (DS_CheckInfo_03 == TRUE))
	{
		Info_ClearChoices(DIA_DMT_2201_Krah_Hello);
		Info_AddChoice(DIA_DMT_2201_Krah_Hello,"Co dál?",DIA_DMT_2201_Krah_Hello_WhatDo);
	};
};

func void DIA_DMT_2201_Krah_Hello_WhatDo()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_WhatDo_01_00");	//Dobrá. Co bude dál?
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_WhatDo_01_01");	//Teď otevřu magický portál. Skrze něj se vydáš k sidlu tmavých poutníků, které se nachází na ostrově Ir'Erat.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_WhatDo_01_02");	//Tam začneš své studium umění magie Temnoty. Nebo vstoupíš na cestu Beliarova válečníka!
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_WhatDo_01_03");	//Cože se budu učit?!
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_WhatDo_01_04");	//Při pohledu na tebe jsem si uvědomil, že je to nezbytné! V tuto chvíli jsi příliš slabý než abys mohl být opravdu užitečný pro Temného pána.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_WhatDo_01_05");	//Až budeš připraven, vrátíme se k našemu rozhovoru.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_WhatDo_01_06");	//Když dorazíš na Ir'Erat - promluv si s opatem Kiratem. On tě oboznámí o dalším průběhu.
	AI_Output(self,other,"DIA_DMT_2201_Krah_Hello_WhatDo_01_07");	//To je vše! Nyní už neplýtvej časem... příliš mnoho nám ho nezbylo.
	AI_StopProcessInfos(self);
	WayToIrat = TRUE;
};

//---------------------------------Nastoyatel' Kirat------------------------------------------------------------

instance DIA_DMT_2202_Kirat_Exit(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 999;
	condition = DIA_DMT_2202_Kirat_Exit_condition;
	information = DIA_DMT_2202_Kirat_Exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DMT_2202_Kirat_Exit_condition()
{
	return TRUE;
};

func void DIA_DMT_2202_Kirat_Exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DMT_2202_Kirat_Hello(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_Hello_condition;
	information = DIA_DMT_2202_Kirat_Hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2202_Kirat_Hello_condition()
{
		return TRUE;
};

func void DIA_DMT_2202_Kirat_Hello_info()
{
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_01_00");	//Ani se nebudu ptát kdo jseš a co tady děláš.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_01_01");	//Pokud jsi skončil na tomto místě, pak tě s největší pravděpodobností poslal někdo z našich nadřízených.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_Hello_01_02");	//Poslal mě Ek'Rah!
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_01_03");	//Mistr Ek'Rah?! Zajímalo by mě... Co jsi udělal, že sis vysloužil jeho pozornost?
	AI_Output(other,self,"DIA_DMT_2202_Kirat_Hello_01_04");	//O čem to mluvíš?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_01_05");	//Jak o čem? Vždyť on je jedním z nejmocnějších učitelů naší enklávy.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_01_06");	//Pouze několika vyvoleným se dostalo takové cti.
	Info_ClearChoices(DIA_DMT_2202_Kirat_Hello);
	Info_AddChoice(DIA_DMT_2202_Kirat_Hello,"To není tvoje věc!",DIA_DMT_2202_Kirat_Hello_Bad);
	Info_AddChoice(DIA_DMT_2202_Kirat_Hello,"Přinesl jsem mu Innosovo oko.",DIA_DMT_2202_Kirat_Hello_Good);
};

func void DIA_DMT_2202_Kirat_Hello_Bad()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_Hello_Bad_01_00");	//To není tvoje věc!
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_Bad_01_01");	//Dobře, jak chceš.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_Bad_01_02");	//Tak, pojďme. Uvidíme se v chrámu.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_Bad_01_03");	//O ostatním si promluvíme později.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitInHram");
};

func void DIA_DMT_2202_Kirat_Hello_Good()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_Hello_Good_01_00");	//Přinesl jsem mu Innosovo oko.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_Good_01_01");	//Innosovo oko?! Nejmocnější artefakt paladinů?
	AI_Output(other,self,"DIA_DMT_2202_Kirat_Hello_Good_01_02");	//Ano, je to tak.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_Good_01_03");	//Neuvěřitelné! To ovšem vysvětluje tvou přítomnost zde.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_Good_01_04");	//Dobře, pojďme. Uvidíme se v chrámu.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_Hello_Good_01_05");	//Ostatní probereme později.
	KirratPRP += 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitInHram");
};

instance DIA_DMT_2202_Kirat_WelcomeHell(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WelcomeHell_condition;
	information = DIA_DMT_2202_Kirat_WelcomeHell_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2202_Kirat_WelcomeHell_condition()
{
	if(Npc_GetDistToWP(self,"DT_KIRATWAIT_02") <= 500)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WelcomeHell_info()
{
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WelcomeHell_01_00");	//Tady jsme na místě.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WelcomeHell_01_01");	//Působivé! A čí je to chrám?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WelcomeHell_01_02");	//Beliarův, samozřejmě! Jeden z těch dvou, které jsou stále aktivní.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WelcomeHell_01_03");	//A byli i jiné?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WelcomeHell_01_04");	//Byli, dokud je nezničili Innosovi paladinové.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WelcomeHell_01_05");	//Teď už zbývají jenom dva - náš a ten, který se nachází na ostrově Irdorath.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WelcomeHell_01_06");	//Irdorath?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WelcomeHell_01_07");	//Tam je svatyně velkého Zvěra a komnaty toho jehož si sám Beliar vybral za svého vyvoleného v tomto světě.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WelcomeHell_01_08");	//Ale tam se ty nikdy nedostaneš. Takže na to radši rovnou zapomeň.
};

instance DIA_DMT_2202_Kirat_WhoMain(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 2;
	condition = DIA_DMT_2202_Kirat_WhoMain_condition;
	information = DIA_DMT_2202_Kirat_WhoMain_info;
	permanent = FALSE;
	description = "Kdo to tady řídí?";
};

func int DIA_DMT_2202_Kirat_WhoMain_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WelcomeHell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhoMain_info()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoMain_01_00");	//Kdo to tady řídí?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoMain_01_01");	//Naši enklávu vede velký mistr Mi'Argul. On je také hlavním opatem chrámu!
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoMain_01_02");	//Navíc, do nejvyšší svatyne mají přístup jenom mistři Mulzog a Norrath.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoMain_01_03");	//První je mentor temných učedníků a provádí jejich výcvik v magickém umění.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoMain_01_04");	//Tan druhý trénuje vojáky Beliara - věrné fanatiky, připravené položit za Pána svoje životy.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoMain_01_05");	//Beliar potřebuje tolik válečníků? Nestačí mu nespočetné množství nemrtvých?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoMain_01_06");	//Není to tak jednoduché, příteli. Ne všechny tvory tmy následují jeho volání.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoMain_01_07");	//V tomto světě existuje mnoho sil, které jsou mimo jeho kontrolu.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoMain_01_08");	//Koho potom uctívají?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoMain_01_09");	//Uctívají ty, kteří stáli na počátku narození tohoto světa. Ty, kdo vytvořili tento svět a samotné bohy.
};

instance DIA_DMT_2202_Kirat_WhoYou(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WhoYou_condition;
	information = DIA_DMT_2202_Kirat_WhoYou_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};

func int DIA_DMT_2202_Kirat_WhoYou_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WelcomeHell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhoYou_info()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoYou_01_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoYou_01_01");	//Jmenuji se Kirat. I když jsem si jistý, že moje jméno ti moc neříká.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoYou_01_02");	//A čím se zabýváš ty, Kirate?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoYou_01_03");	//Starám se o přiboudající nováčky a seznamuju je se zdejším chodem věcí.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoYou_01_04");	//A také dohlížím na pořádek.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoYou_01_05");	//To není příliš náročná práce.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoYou_01_06");	//Hmmm... jak říkáš.
};

instance DIA_DMT_2202_Kirat_WhatRules(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WhatRules_condition;
	information = DIA_DMT_2202_Kirat_WhatRules_info;
	permanent = FALSE;
	description = "Co bych měl vědět o tomto místě?";
};

func int DIA_DMT_2202_Kirat_WhatRules_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WelcomeHell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhatRules_info()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhatRules_01_00");	//Co bych měl vědět o tomto místě?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_01");	//Především si zapamatuj, že tohle je posvátný chrám samotného Beliara.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_02");	//O jeho existenci se nesmí nikdo dovědět. Nikdo!
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_03");	//To se týká zejména mágů Innose a jeho paladinů.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_04");	//Tito šílení fanatici se nezastaví před ničím, jen aby se sem dostali.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_05");	//A my jsme nyní příliš slabý, než abychom jim v otevřené bitvě odolali.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_06");	//Nyní k více aktuálním věcem. Naše enkláva netoleruje zloděje ani výtržníky.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_07");	//Za jakýkoli boj nebo krádež viníka čeká jen jeden trest - smrt!
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_08");	//Dobře si to zapamatuj.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_09");	//A co je nejdůležitější - nezapomeň věnovat dostatek času modlitbě svému pánovi.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_10");	//Jeho milost může snadno vystřídat hněv, pokud uvidí, že mu nejsi příliš oddaný.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatRules_01_11");	//Proto se musíš neustále prokazovat, jestli tu plánuješ zůstat déle.
};


instance DIA_DMT_2202_Kirat_WhatPray(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WhatPray_condition;
	information = DIA_DMT_2202_Kirat_WhatPray_info;
	permanent = FALSE;
	description = "Kde se mohu modlit?";
};

func int DIA_DMT_2202_Kirat_WhatPray_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WhatRules) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhatPray_info()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhatPray_01_00");	//Kde se mohu modlit?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatPray_01_01");	//Oltáře Temného boha se nachází v chrámu. Jsem si jistý, že je snadno najdeš.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatPray_01_02");	//V každém z nich se můžete modlit k našemu Pánu nebo mu dát malý dárek. Kromě velkého oltáře Temnoty!
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhatPray_01_03");	//Co je to velký oltář Temnoty?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatPray_01_04");	//Prostřednictvím něho nám náš pán ukazuje svou vůli a přijímá mimořádně zvláštní nabídky.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatPray_01_05");	//Nicméně, přístup má jenom mistr Mi'Argul! Ostatní čeká těžký trest v případě neposlušnosti.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhatPray_01_06");	//Takže ti radím, od tohoto oltáře se drž dál.
};

instance DIA_DMT_2202_Kirat_WhoNow(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WhoNow_condition;
	information = DIA_DMT_2202_Kirat_WhoNow_info;
	permanent = FALSE;
	description = "Co teď?";
};

func int DIA_DMT_2202_Kirat_WhoNow_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WhoMain) == TRUE) 
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhoNow_info()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoNow_01_00");	//Co teď?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_01");	//Nejdřív si musíš promluvit s jedním z mistrů.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_02");	//Pokud tě schlédají hodným, brzy začneš s některým z nich trénovat.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoNow_01_03");	//A jak jim mohu dokázat, že jsem hoden?
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_04");	//Každý z nich tě prozkouší. A ne jen jednou...
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_05");	//Dál je vše jednoduché! Buď zvládneš jejich zkoušky a získáš jejich respekt, nebo zemřeš bolestivou smrtí.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_06");	//Zbytek je jen na tobě.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoNow_01_07");	//Rozumím.


	if(KirratPRP > 0)
	{
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_08");	//Ale mohu ti dát jednu radu, jak udělat na ně dobrý dojem.
		AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoNow_01_09");	//Jsem jedno ucho.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_10");	//Mistr Mulzog je příliš výmluvný v jeho pokynech a lehce se rozčílá, pokud ho najednou někdo přeruší.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_11");	//Jednou zabil novice přímo na místě, protože počas jeho kázání náhodně kýchl.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_12");	//Proto v jeho případě je ticho nejen zlato, ale také jedinou možností uchránit si život.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_13");	//Naopak, mistr Norrath je spíše tichý! V jeho tváři člověk nikdy nedokáže spoznat, na co zrovna myslí.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_14");	//Své učedníky od rána do noci nemilosrdně pohání při výcviku bojových umění.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_15");	//Ty, kteří tyto nelidské břemeny nesnesou krutě potrestá.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_16");	//Takže na tvém místě bych dobřě popřemýšlel, než se s ním rozhodneš mluvit.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_17");	//Pokud souhlasíš s jeho zkouškami, nebude žádné cesty zpět.
		AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_18");	//Doufám, že chápeš co tím myslím?
		AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoNow_01_19");	//Ano, naprosto.
	};

	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_20");	//Dobře! Pak nestrácej čas a okamžitě jdi k nim.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_21");	//Nicméně, pokud se chceš ještě trochu porozhlédnout, myslím že nikdo nebude proti.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_22");	//Jsi zde nový a pravděpodobně budeš mít další otázky.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_23");	//Tehdy radši přiď za mnou a neotravuj samotné mistri.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_24");	//V opačném případě to může skončit špatně. Samozřejmě pro tebe.
	AI_Output(self,other,"DIA_DMT_2202_Kirat_WhoNow_01_25");	//Dobře, teď už jdi učedníku. Nechť se posvětí jméno Beliarovo!
	AI_StopProcessInfos(self);
};

//--------------------------Mulzog---------------------------------------------------------------

instance DIA_DMT_2204_Mulzog_Exit(C_Info)
{
	npc = DMT_2204_Mulzog;
	nr = 999;
	condition = DIA_DMT_2204_Mulzog_Exit_condition;
	information = DIA_DMT_2204_Mulzog_Exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DMT_2204_Mulzog_Exit_condition()
{
	return TRUE;
};

func void DIA_DMT_2204_Mulzog_Exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DMT_2204_Mulzog_Hello(C_Info)
{
	npc = DMT_2204_Mulzog;
	nr = 1;
	condition = DIA_DMT_2204_Mulzog_Hello_condition;
	information = DIA_DMT_2204_Mulzog_Hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2204_Mulzog_Hello_condition()
{
	return TRUE;
};

func void DIA_DMT_2204_Mulzog_Hello_info()
{
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_00");	//Tak, nuže... Koho to tady máme? Ty jsi nový žák?
	AI_Output(other,self,"DIA_DMT_2204_Mulzog_Hello_01_01");	//Ano, pane, to jsem.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_02");	//Hmmm... (pozorně hledí) Přiznávám, vypadáš poněkud podivně. A očividně se mi snažíš něco skrývat.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_03");	//No dobře! S tím budeme zabývat později.
	AI_Output(other,self,"DIA_DMT_2204_Mulzog_Hello_01_04");	//Co se děje?
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_05");	//Jen mě překvapuje, že člověk jako ty se rozhodl sloužit Beliarovi.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_06");	//Ne mnoho lidí je připraveno věnovat mu celý svůj život. A už vůbec ne mnozí jsou ochotni se ho i vzdát pro Temného boha.
	AI_Output(other,self,"DIA_DMT_2204_Mulzog_Hello_01_07");	//Kdybych nechtěl sloužit Beliarovi, nebyl bych tady.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_08");	//Ale ty jsi tady! Přestože si neuvědomuješ, kam tě tahle cesta může zavést.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_09");	//Teď vypadáš spíš jako slepé kotě, které putuje ve tmě.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_10");	//Ale já ti pomůžu najít to, pro co jsi sem přišel.
	AI_Output(other,self,"DIA_DMT_2204_Mulzog_Hello_01_11");	//Ty víš, co chci?
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_12");	//Vím vše... (podrážděně) Moc a slávu - co jiného mohou lidé chtít? V tomto případě nebudeš výjimkou.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_13");	//A slibuji ti - to všechno dostaneš, pokud zůstaneš věrný službě našemu pánovi.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_14");	//Ne hned, samozřejmě, ale včas, budeš mít všechno, o čem bys jen mohl snít.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_15");	//Pokud ovšem bude hoden všech těchto požehnání.
	AI_Output(other,self,"DIA_DMT_2204_Mulzog_Hello_01_16");	//Ještě jsem to neprokázal?
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_17");	//Zatím jsi dokázal, že si zasloužíš být povolán v tomto chrámu.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_18");	//Pořád si ale musíš zasloužit právo zde zůstat!
	AI_Output(other,self,"DIA_DMT_2204_Mulzog_Hello_01_19");	//Co tím myslíš?
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_20");	//To, že služba Beliarovi není jen líbáním podlahy před jeho sochou.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_21");	//Musí to být něco důležitějšího a příznačného, aby tě Temný bůh, dokonce i v mé tváři, uznal za hodné těchto ocenění.
	AI_Output(other,self,"DIA_DMT_2204_Mulzog_Hello_01_22");	//A já myslel že už můžu zvolnit.
	AI_Output(self,other,"DIA_DMT_2204_Mulzog_Hello_01_23");	//V tom případě se musíš znovu vzchopit...
};
