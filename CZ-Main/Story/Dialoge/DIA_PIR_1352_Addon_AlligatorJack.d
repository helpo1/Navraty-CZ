
instance DIA_Addon_AlligatorJack_Exit(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 999;
	condition = DIA_Addon_AlligatorJack_Exit_Condition;
	information = DIA_Addon_AlligatorJack_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_AlligatorJack_Exit_Condition()
{
	return TRUE;
};


var int DIA_Addon_AlligatorJack_Exit_Info_OneTime;

func void DIA_Addon_AlligatorJack_Exit_Info()
{
	if((MIS_KrokoJagd == LOG_SUCCESS) && (DIA_Addon_AlligatorJack_Exit_Info_OneTime == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_00");	//Jestliže mě budeš hledat, jsem obvykle někde blíž mého tábora blízko palisád.
		if(PIR_1354_Addon_Henry.aivar[AIV_TalkedToPlayer] == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_AlligatorJack_Exit_15_01");	//Palisády?
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_02");	//Prostě jdi na západ. Pochopíš, co myslím.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DIA_Addon_AlligatorJack_Exit_Info_OneTime = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_AlligatorJack_PICKPOCKET(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 900;
	condition = DIA_Addon_AlligatorJack_PICKPOCKET_Condition;
	information = DIA_Addon_AlligatorJack_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_AlligatorJack_PICKPOCKET_Condition()
{
	return C_Beklauen(100,333);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
	Info_AddChoice(DIA_Addon_AlligatorJack_PICKPOCKET,Dialog_Back,DIA_Addon_AlligatorJack_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_AlligatorJack_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_AlligatorJack_PICKPOCKET_DoIt);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
};


instance DIA_Addon_AlligatorJack_Hello(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Hello_Condition;
	information = DIA_Addon_AlligatorJack_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_Hello_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_00");	//Kdo tedy MŮŽEŠ být? Nevypadáš jako ostatní.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Hello_15_01");	//Jací další?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_02");	//Myslím mágy, kteří si vykračují v těch ruinách nahoře.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_03");	//Patříš do toho spolku?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_04");	//Pěkně odvážný, že se tu potuluješ sám.
};


instance DIA_Addon_AlligatorJack_WerBistDu(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_WerBistDu_Condition;
	information = DIA_Addon_AlligatorJack_WerBistDu_Info;
	description = "Kdo jsi?";
};


func int DIA_Addon_AlligatorJack_WerBistDu_Condition()
{
	return TRUE;
};

func void DIA_Addon_AlligatorJack_WerBistDu_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WerBistDu_15_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_01");	//Pravděpodobně si už o mě slyšel.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_02");	//(pyšně) Já jsem Alligator Jack.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_03");	//Obávaný ve všech zemích. Já a ostatní jsme nejnebezpečnější piráti v okolí.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_04");	//Společně s naším kapitánem Gregem jsme vylupovali obchodní lodě.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_05");	//Stojíš před živoucí legendou a to je co říct.
};


instance DIA_Addon_AlligatorJack_Vorschlag(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Vorschlag_Condition;
	information = DIA_Addon_AlligatorJack_Vorschlag_Info;
	description = "Znáš někoho, kdo se jmenuje Raven?";
};


func int DIA_Addon_AlligatorJack_Vorschlag_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Vorschlag_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_15_00");	//Znáš někoho, kdo se jmenuje Raven?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_01");	//Jasně. Je vůdcem banditů na východě.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_02");	//Co od NĚJ chceš?
	B_LogEntry(TOPIC_Addon_RavenKDW,"Raven a jeho banditi jsou schovaní u východu z údolí.");
	Info_ClearChoices(DIA_Addon_AlligatorJack_Vorschlag);
	Info_AddChoice(DIA_Addon_AlligatorJack_Vorschlag,"Chci se k němu připojit.",DIA_Addon_AlligatorJack_Vorschlag_join);
	Info_AddChoice(DIA_Addon_AlligatorJack_Vorschlag,"Musím ho zabít.",DIA_Addon_AlligatorJack_Vorschlag_tot);
};

func void B_AlligatorJack_Besser()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_00");	//Mám lepší nápad.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_01");	//Připoj se k nám.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_02");	//Důkladně si to promysli.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_03");	//Jen co zkusíš domácí rum, svět se ti bude zdát mnohem krásnější.
	Info_ClearChoices(DIA_Addon_AlligatorJack_Vorschlag);
};

func void DIA_Addon_AlligatorJack_Vorschlag_tot()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_tot_15_00");	//Musím ho zabít.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_01");	//(směje se) Co? TY? Jak myslíš, že HO odstraníš?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_02");	//Není ten chlap na tebe trochu velké sousto?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_03");	//Vůbec se k němu nedostaneš. Banditi, které shromáždil, tě stejmou dřív, než ho jen spatříš.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_04");	//Nedostneš se ani přes první předsunutou hlídku.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_05");	//Vypadáš tak že při pohledu na tvoje paže popadaj smichy.
	B_AlligatorJack_Besser();
};

func void DIA_Addon_AlligatorJack_Vorschlag_join()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_join_15_00");	//Chci se k němu připojit.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_01");	//(opatrně) Je to tak?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_02");	//Nevypadáš, jako někdo, kdo by se chtěl přidat k těm bláznům.
	B_AlligatorJack_Besser();
};


instance DIA_Addon_AlligatorJack_BDTRuestung(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_BDTRuestung_Condition;
	information = DIA_Addon_AlligatorJack_BDTRuestung_Info;
	description = "Potřebuji zbroj banditů.";
};


func int DIA_Addon_AlligatorJack_BDTRuestung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Vorschlag) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_BDTRuestung_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_15_00");	//Potřebuji zbroj banditů.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_01");	//A co s NÍ?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_02");	//Dostaneš se jenom do problémů, jenom co tě někdo uvidí ji nosit.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_03");	//Každý si bude myslet, že jsi bandita a bude se tě snažit zabít.
	Info_ClearChoices(DIA_Addon_AlligatorJack_BDTRuestung);
	Info_AddChoice(DIA_Addon_AlligatorJack_BDTRuestung,"Máš nějaký nápad, kde bych mohl sehnat takovou zbroj?",DIA_Addon_AlligatorJack_BDTRuestung_wo);
	Info_AddChoice(DIA_Addon_AlligatorJack_BDTRuestung,"To zní dobře...",DIA_Addon_AlligatorJack_BDTRuestung_gut);
};

func void DIA_Addon_AlligatorJack_BDTRuestung_gut()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_gut_15_00");	//To zní dobře...
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01");	//Jo, ale pro někoho, kdo je sebevrah.
};

func void DIA_Addon_AlligatorJack_BDTRuestung_wo()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00");	//Máš nějaký nápad, kde bych mohl sehnat takovou zbroj?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01");	//Myslím, že máme jednu v pirátském táboře.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03");	//Ale nevím, jestli tam ještě je.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Piráti kdysi měli zbroj banditů. Alligator Jack mi nemůže říct jestli ještě existuje.");
	Info_ClearChoices(DIA_Addon_AlligatorJack_BDTRuestung);
};


instance DIA_Addon_AlligatorJack_Greg(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Greg_Condition;
	information = DIA_Addon_AlligatorJack_Greg_Info;
	description = "Tvůj kapitán se jmenuje Greg?";
};


func int DIA_Addon_AlligatorJack_Greg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Greg_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_00");	//Tvůj kapitán se jmenuje Greg?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_01");	//Jo. Je největší pirát, kterého kdy oceán splodil.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_02");	//Myslím, že znám tvého kapitána. Potkal jsem ho v Khorinisu.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_03");	//(směje se) Greg? V Khorinisu? Nesmysl!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_04");	//Greg je pryč na mořském nájezdu s pár chlapci.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_05");	//Jediná věc, která by mohla Grega přivést do Khorinisu je vězeňská galéra krále.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_06");	//Je jedním z nejhledanějších můžů v zemi.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_07");	//Nepůjde dobrovolně do města a nenechá královské stráže, aby ho hodily do kobek.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_08");	//Když myslíš.
};


instance DIA_Addon_AlligatorJack_PIRLager(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_PIRLager_Condition;
	information = DIA_Addon_AlligatorJack_PIRLager_Info;
	description = "Kde je tvůj pirátský tábor?";
};


func int DIA_Addon_AlligatorJack_PIRLager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_PIRLager_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_00");	//Kde je tvůj pirátský tábor?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_01");	//Vidíš ten tunel tady? Když ho budeš sledovat a pokračovat západně, dřív nebo později dojdeš k naší pláži.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_02");	//Tam máme naše chatrče.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_03");	//Pokud chceš, můžu ti ukázat cestu. Ale musíš pro mě udělat malou laskavost.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_04");	//A co to má být?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_05");	//Předtím, než se můžu vrátit do tábora, musím nalovit nějaké maso pro kluky.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_06");	//Jsi silný mladík.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_07");	//Můžu potřebovat pomoc s lovem. Máš zájem?
	Log_CreateTopic(TOPIC_Addon_RatHunt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RatHunt,LOG_Running);
	B_LogEntry(TOPIC_Addon_RatHunt,"Alligatorovi Jackovi se může hodit pomoc s lovením.");
};


instance DIA_Addon_AlligatorJack_WasJagen(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_WasJagen_Condition;
	information = DIA_Addon_AlligatorJack_WasJagen_Info;
	description = "Co lovíš?";
};


func int DIA_Addon_AlligatorJack_WasJagen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_WasJagen_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_00");	//Co lovíš?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_01");	//Nic, obvykle jen aligátory. Ale nemůžeme je sníst.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_02");	//Kromě toho, tu žádní nezbyli.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_03");	//Proto lovím, co se dá jíst. Močálové krysy.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_04");	//Co?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_05");	//Většina potvor okolo chutná jako lidská noha, nebo jsou moc tuhý, jako alligatoří maso.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_06");	//Tlusté močálové krysy jsou jediná věc, co se dá jíst.
	B_LogEntry(TOPIC_Addon_RatHunt,"Jedina věc, co je tady pravděpodobně k jídlu je močalová krysa.");
};


instance DIA_Addon_AlligatorJack_Pirates(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Pirates_Condition;
	information = DIA_Addon_AlligatorJack_Pirates_Info;
	permanent = FALSE;
	description = "Řekni mi více o pirátech.";
};


func int DIA_Addon_AlligatorJack_Pirates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Pirates_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Pirates_15_00");	//Řekni mi více o pirátech.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_01");	//Žili jsme tu celé roky. Za starých časů, před válkou, každý odsud až po kontinent věděl, kdo jsme.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_02");	//Naše vlajka na obzoru stačila, aby vyděsila obchodní lodě.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_03");	//Ale tyto dny skončili. Jsou to týdny, co jsme měli obchodní loď před stěžní.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_04");	//Kapitán Greg se šel podívat znovu, jestli náhodou nemůže jednu polapit.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_05");	//Zbytek z nás sedí okolo tábora a točí palcema, dokud se nevrátí.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_06");	//Doufejme, že přinese nějakou dobrou kořist.
};


instance DIA_Addon_AlligatorJack_LetsGoHunting(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_LetsGoHunting_Condition;
	information = DIA_Addon_AlligatorJack_LetsGoHunting_Info;
	permanent = TRUE;
	description = "Jdeme na lov.";
};


func int DIA_Addon_AlligatorJack_LetsGoHunting_Condition()
{
	if((MIS_KrokoJagd == FALSE) && Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WasJagen) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_LetsGoHunting_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_15_00");	//Jdeme na lov.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_01");	//Dobře. I pro dva je to dost práce.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02");	//Jsi připraven?
	Info_ClearChoices(DIA_Addon_AlligatorJack_LetsGoHunting);
	Info_AddChoice(DIA_Addon_AlligatorJack_LetsGoHunting,"Ne, ještě ne.",DIA_Addon_AlligatorJack_LetsGoHunting_No);
	Info_AddChoice(DIA_Addon_AlligatorJack_LetsGoHunting,"Ano",DIA_Addon_AlligatorJack_LetsGoHunting_Yes);
};


const int AlligatorJack_Inter1 = 1;
const int AlligatorJack_Kessel = 2;
const int AlligatorJack_Inter2 = 3;
const int AlligatorJack_Canyon = 4;

func void DIA_Addon_AlligatorJack_LetsGoHunting_Yes()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00");	//Ano
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01");	//Dobře. Drž se za mnou.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"HUNT1");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	AlligatorJack_JagdStart = AlligatorJack_Inter1;
	MIS_KrokoJagd = LOG_Running;
};

func void DIA_Addon_AlligatorJack_LetsGoHunting_No()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00");	//Ne, ještě ne.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01");	//Pak si pospěš.
	Info_ClearChoices(DIA_Addon_AlligatorJack_LetsGoHunting);
};


instance DIA_Addon_AlligatorJack_AlligatorJackInter1(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition;
	information = DIA_Addon_AlligatorJack_AlligatorJackInter1_Info;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Inter1) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter1_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00");	//Roklina.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01");	//Tady možná najdeme nějaká zvířata.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02");	//Pojď za mnou.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT2");
	AlligatorJack_JagdStart = AlligatorJack_Kessel;
};


instance DIA_Addon_AlligatorJack_TheHunt(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_TheHunt_Condition;
	information = DIA_Addon_AlligatorJack_TheHunt_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_TheHunt_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Kessel) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WATERHOLE_07") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TheHunt_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_00");	//To je to, čeho jsem se obával.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_15_01");	//Co?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_02");	//Masa z těch potvor je jenom polovina, než potřebuju.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_03");	//Teď musíme jít také do kaňonu.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_04");	//Dávej bacha. Hlouběji v kaňonu už je to trochu nebezpečnější.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_05");	//Pokud máš rád svůj život, tak se mě drž.
	Wld_InsertNpc(Waran,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc(Waran,"ADW_ENTRANCE_2_VALLEY_10");
	Info_ClearChoices(DIA_Addon_AlligatorJack_TheHunt);
	Info_AddChoice(DIA_Addon_AlligatorJack_TheHunt,"CO je v kaňonu?",DIA_Addon_AlligatorJack_TheHunt_Enough);
	Info_AddChoice(DIA_Addon_AlligatorJack_TheHunt,"Dobrá, jdeme.",DIA_Addon_AlligatorJack_TheHunt_Running);
};

func void DIA_Addon_AlligatorJack_TheHunt_Enough()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Enough_15_00");	//CO je v kaňonu?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_01");	//Pokud to bude možné, tak se tomu vyhneme.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_02");	//Jsou tam břitvy. Pěkně vytrvalý. Drž se od nich dál, pokud chceš žít.
};

func void DIA_Addon_AlligatorJack_TheHunt_Running()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Running_15_00");	//Dobrá, jdeme.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01");	//Jasně.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT3");
	AlligatorJack_JagdStart = AlligatorJack_Inter2;
};


instance DIA_Addon_AlligatorJack_AlligatorJackInter2(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition;
	information = DIA_Addon_AlligatorJack_AlligatorJackInter2_Info;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Inter2) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter2_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00");	//Pojď sem.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT4");
	AlligatorJack_JagdStart = AlligatorJack_Canyon;
};


instance DIA_Addon_AlligatorJack_HuntEnd(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_HuntEnd_Condition;
	information = DIA_Addon_AlligatorJack_HuntEnd_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_HuntEnd_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Canyon) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_HuntEnd_Info()
{
	if(AlligatorJack_KrokosKilled == 0)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_00");	//Teď mi řekni, proč jsem tě vlastně bral sebou?
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_01");	//Nezabil jsi ani jednu močálovou krysu.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_02");	//Hmm, dobrá, možná se ukážeš víc potřebný příště.
	}
	else if(AlligatorJack_KrokosKilled == 1)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_03");	//Velmi dobře! Můžeme potřebovat někoho, jako si ty.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_04");	//Na tvém prvním lovu jsi ulovil jednu z těch potvor. To není špatné.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_05");	//Máš opravdový talent.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_06");	//Zatraceně, pokud budeš pokračovat jako teď, můžu zůstat v táboře.
	};
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_07");	//Tady, vem tohle krysí maso a dones to tomu povaleči Morganovi.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_08");	//Najdeš ho v našem táboře.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_09");	//Pravděpodobně se povaluje někde okolo pláže. Myslím, že tě už očekává.
	if(PIR_1354_Addon_Henry.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_10");	//U vchodu do tábora najdeš pravděpodobně Henryho. Stará se o hlídáni v případě, že by zaútočili banditi.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_11");	//Jestli tě nepustí dovnitř, tak mu řekni, že tě posílám.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_12");	//To by ho mělo udělat přípustnějším.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_13");	//Henry může být trochu nepříjemný a rád šéfuje.
	};
	MIS_AlligatorJack_BringMeat = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_BringMeat,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BringMeat,LOG_Running);
	B_LogEntry(TOPIC_Addon_BringMeat,"Alligator Jack mi dal 10 kousků masa. Mám je přinést Morganovi.");
	B_LogEntry_Quiet(TOPIC_Addon_RatHunt,"Lov byl uspěšný. Zabili jsme několik močálových krys.");
	B_GiveInvItems(self,other,ItFoMuttonRaw,10);
	MIS_KrokoJagd = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_KrokoJagd);
};


instance DIA_Addon_AlligatorJack_Angus(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Angus_Condition;
	information = DIA_Addon_AlligatorJack_Angus_Info;
	permanent = FALSE;
	description = "Znáš Anguse a jeho kamaráda Hanka?";
};


func int DIA_Addon_AlligatorJack_Angus_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_AngusnHank) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Angus_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_00");	//Znáš Anguse a jeho kamaráda Hanka?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_03");	//Docela dlouho jsem je neviděl.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_04");	//Vlastně si myslím, že se už znovu neobjeví.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_05");	//Proč?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_06");	//Tihle idioti se jen poflakovali kolem jezera a byli stále vyděšení.
};

instance DIA_Addon_AlligatorJack_Lake(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Lake_Condition;
	information = DIA_Addon_AlligatorJack_Lake_Info;
	permanent = FALSE;
	description = "U kterého jezera se potloukali?";
};

func int DIA_Addon_AlligatorJack_Lake_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Angus) == TRUE) && (MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Lake_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_00");	//U kterého jezera se potloukali?

	if(MIS_KrokoJagd == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_01");	//Pamatuješ náš lov?
		AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_02");	//Ano.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_03");	//Jezero v roklině. Tam jsem je většinou viděl.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_04");	//Na jezeru ve velké kotlině.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_05");	//Jenom jdi na východ z našeho tábora. Nemůžeš to minout.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_06");	//Má to hodně malých vodopádů.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_07");	//Ale buď opatrný. Jestli nic nemáš, ale cítíš suchý písek pod svýma nohama, tak si se špatně otočil a vstoupil do kaňonu.
	};
	B_LogEntry(TOPIC_Addon_SkipsGrog,"Jak se zdá jeskyně je na východ od tábora. Na pravo jezera.");
};


instance DIA_Addon_AlligatorJack_CanLearn(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_CanLearn_Condition;
	information = DIA_Addon_AlligatorJack_CanLearn_Info;
	permanent = TRUE;
	description = "Můžeš mě něco naučit?";
};


func int DIA_Addon_AlligatorJack_CanLearn_Condition()
{
	if(AlligatorJack_Addon_TeachPlayer == FALSE)
	{
		if((Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_HuntEnd) == TRUE) || (GregIsBack == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_AlligatorJack_CanLearn_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_CanLearn_15_00");	//Můžeš mě něco naučit?

	if(MIS_KrokoJagd > LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_01");	//Jasně, jsem dobrý lovec. Můžu ti ukázat jak stáhnout zvířata a jak vyndat jejich zuby.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_02");	//Můži ti to ukázat, jestli chceš.
		Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher,"Alligator Jack mě může naučit jak stáhnout ze zvířat kůži a vyndat jejich zuby. Může mě také naučit střílet z luku.");
		AlligatorJack_Addon_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_03");	//Nejdřiv mi musíš ukázat, jak si připravený na lov.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_04");	//Když budeme na lovu společně, možná to zvládnu.
	};
};

func void B_AJ_Teach()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_Teach);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,Dialog_Back,DIA_Addon_AlligatorJack_Teach_Back);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Addon_AlligatorJack_Teach_Bow_5);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Addon_AlligatorJack_Teach_Bow_1);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_addon_alligatorjack_teach_hp_1);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_addon_alligatorjack_teach_hp_5);

	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	{
		Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforsmithhunt("Stahování kůží plazů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ReptileSkin)),DIA_Addon_AlligatorJack_Teach_FUR);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{
		Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforsmithhunt("Vyjímání zubů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Addon_AlligatorJack_Teach_Teeth);
	};
};


instance DIA_Addon_AlligatorJack_Teach(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Teach_Condition;
	information = DIA_Addon_AlligatorJack_Teach_Info;
	permanent = TRUE;
	description = "Uč mě!";
};

func int DIA_Addon_AlligatorJack_Teach_Condition()
{
	if(AlligatorJack_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Teach_15_00");	//Uč mě!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_12_01");	//Co chceš vědět?
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_Teach);
};

func void DIA_Addon_AlligatorJack_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,75);
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,75);
	B_AJ_Teach();
};

func void dia_addon_alligatorjack_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	B_AJ_Teach();
};

func void dia_addon_alligatorjack_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_FUR()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	{
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ReptileSkin))
		{
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_Fur_12_00");	//Vždy proveď řez podél břicha, nebo to zničí kvalitu.
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_Teeth()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{
		B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth);
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};

func void B_AlliJack_AlliKlar()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Anheuern_12_01");	//Jasně.
};

instance DIA_Addon_AlligatorJack_Anheuern(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 11;
	condition = DIA_Addon_AlligatorJack_Anheuern_Condition;
	information = DIA_Addon_AlligatorJack_Anheuern_Info;
	permanent = FALSE;
	description = "Pojďme lovit.";
};

func int DIA_Addon_AlligatorJack_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Anheuern_15_00");	//Pojďme lovit.
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos(self);
	B_Addon_PiratesFollowAgain();
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_Addon_AlligatorJack_ComeOn(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 12;
	condition = DIA_Addon_AlligatorJack_ComeOn_Condition;
	information = DIA_Addon_AlligatorJack_ComeOn_Info;
	permanent = TRUE;
	description = "Jdeme na lov.";
};


func int DIA_Addon_AlligatorJack_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Anheuern))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_KommMit_15_00");	//Jdeme na lov.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_AlliJack_AlliKlar();
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_AlligatorJack_GoHome(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 13;
	condition = DIA_Addon_AlligatorJack_GoHome_Condition;
	information = DIA_Addon_AlligatorJack_GoHome_Info;
	permanent = TRUE;
	description = "Už tě nepotřebuji.";
};


func int DIA_Addon_AlligatorJack_GoHome_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_DontNeedYou_15_00");	//Už tě nepotřebuji.
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_AlligatorJack_TooFar(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 14;
	condition = DIA_Addon_AlligatorJack_TooFar_Condition;
	information = DIA_Addon_AlligatorJack_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TooFar_Info()
{
	B_Say(self,other,"$RUNAWAY");
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

instance DIA_Addon_AlligatorJack_Croc(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Croc_Condition;
	information = DIA_Addon_AlligatorJack_Croc_Info;
	permanent = FALSE;
	description = "Proč ti říkají Alligator?";
};

func int DIA_Addon_AlligatorJack_Croc_Condition()
{
	if(MIS_KrokoJagd == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Croc_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Croc_01_00");	//Proč ti říkají Alligator?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_01");	//(směje se) Věechno začalo tím, když mě málem snědl obrovský aligátor.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_02");	//To zvíře mě tak špatně pokousalo, že jsem málem umřel!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_03");	//Ale měl jsem štěstí, Samuel mě dokázal vyléčit.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Croc_01_04");	//Opravdu ses neuměl vypořádat s obyčejným aligátorem?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_05");	//Eh, člověče. (se smíchem) Nebyl to jen obyčejný aligátor!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_06");	//Takovou bestii jsem za svůj život ještě nikdy neviděl.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_07");	//Kůže toho aligátora byla tak silná, že jsem mu svou šavlí dokázal udělat jenom malý škrábanec.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_08");	//Nazvali jsme ho Skalozub. Víc už sme nepokoušeli jít blíž k jezeru.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Croc_01_09");	//Co kdybychom ho šli ulovit spolu?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_10");	//Praštil sis hlavu? Lepší bude na to zapomenout.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_11");	//Obyčejné šipky ani čepele ho nijak nezraní.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_12");	//Jediné kousnutí bude stačit, aby nás poslat na onen svět.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Croc_01_13");	//No a kdybych ho přesto chtěl jít ulovit - kde to monstrum najdu?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_14");	//Někdy je ho vidět na mělčině u jezera.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_01_15");	//Ale si prostě blázen, pokud to myslíš vážně!
	MIS_Alligator = LOG_Running;
	Log_CreateTopic(TOPIC_Alligator,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Alligator,LOG_Running);
	B_LogEntry(TOPIC_Alligator,"Jack mi vyprávěl příběh o tom, jak ho skoro snědl obrovský aligátor. Vypadá to, že tato příšera je velmi silná a Jack nedoporučuje se k ní ani přiblížit. Žije u jezera, v malé rokli.");
};

instance DIA_Addon_AlligatorJack_Croc_Done(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Croc_Done_Condition;
	information = DIA_Addon_AlligatorJack_Croc_Done_Info;
	permanent = FALSE;
	description = "Toto je tvůj mrtvý aligátor.";
};

func int DIA_Addon_AlligatorJack_Croc_Done_Condition()
{
	if((MIS_Alligator == LOG_Running) && (Npc_IsDead(ALLIGATOR_UNIQ) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Croc_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Croc_Done_01_00");	//Toto je tvůj mrtvý aligátor.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_Done_01_01");	//(nevěřícně) Děláš si srandu, chlape?
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Croc_Done_01_02");	//Pokud nevěříš, můžeš se jít podívat. Jeho kostra pravděpodobně stále leží na břehu jezera.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_Done_01_04");	//Hmmm. Jste statečný! Vážím si toho.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_Done_01_05");	//No, měl bych ti poděkovat za tvou pomoc.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_Done_01_06");	//Já nemám moc zlata. Ale od posledního lovu mi zbyla jedna docela pěkná kůže stínové šelmy!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Croc_Done_01_07");	//Tady, vem si ji.
	B_GiveInvItems(self,other,ItAt_ShadowFur,1);
	MIS_Alligator = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Alligator,LOG_SUCCESS);
	B_LogEntry(TOPIC_Alligator,"Řekl jsem Jackovi, že jsem dokázal zabít jeho aligátora. Vypadal, že to na něho zapůsobilo a dal mi jednu kůži stínové šelmy.");
};