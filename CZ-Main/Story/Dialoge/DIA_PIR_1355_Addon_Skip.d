var int SkipElzaDay;
var int SkipOnWork;

instance DIA_Addon_Skip_EXIT(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 999;
	condition = DIA_Addon_Skip_EXIT_Condition;
	information = DIA_Addon_Skip_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_PICKPOCKET(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 900;
	condition = DIA_Addon_Skip_PICKPOCKET_Condition;
	information = DIA_Addon_Skip_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Skip_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void DIA_Addon_Skip_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Skip_PICKPOCKET,Dialog_Back,DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Skip_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
};

func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
};


instance DIA_Addon_Skip_Hello(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Hello_Condition;
	information = DIA_Addon_Skip_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Skip_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerTalkedToSkipNW == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_00");	//No kdopak to zase kříží cestu starému Skipovi?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_01");	//Tebe já znám!
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_02");	//Zátoka poblíž města, pamatuješ?
	AI_Output(other,self,"DIA_Addon_Skip_Hello_15_03");	//Skip! Správně?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_04");	//Vidím, že jsem na tebe udělal dojem, že si mě pamatuješ.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_05");	//Ale zdá se mi, že jsem tvůj obličej musel vidět někde jinde.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_06");	//Á! Jasně!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_07");	//No dobrá, není to úplně perfektní podobizna, ale jsi to ty.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_08");	//Nic se neboj kamaráde. Můj obličej na plakátech nevypadá o nic lépe.
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Addon_SkipADW_BaltramPaket(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 2;
	condition = DIA_Addon_SkipADW_BaltramPaket_Condition;
	information = DIA_Addon_SkipADW_BaltramPaket_Info;
	description = "Mám pro tebe balík od Baltrama.";
};


func int DIA_Addon_SkipADW_BaltramPaket_Condition()
{
	if(Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_SkipADW_BaltramPaket_Info()
{
	AI_Output(other,self,"DIA_Addon_SkipADW_BaltramPaket_15_00");	//Mám pro tebe balík od Baltrama.
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_01");	//(šklebí se) Vypadá to, že si velice přivykl na náš rum.
	B_GiveInvItems(other,self,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_02");	//Tady jsou pro něj 2 láhve rumu. Třetí jsem vypil, když jsem na něj čekal.
	B_GiveInvItems(self,other,ItFo_Addon_Rum,2);
	B_GivePlayerXP(XP_Addon_Skip_BaltramPaket);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram);
	Skip_Rum4Baltram = TRUE;
};


instance DIA_Addon_Skip_Job(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 3;
	condition = DIA_Addon_Skip_Job_Condition;
	information = DIA_Addon_Skip_Job_Info;
	description = "Co tady děláš?";
};


func int DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_Job_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Job_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Addon_Skip_Job_08_01");	//Zrovna jsem se vrátil z Khorinisu a teď čekám, až se Greg vrátí.
};


instance DIA_Addon_Skip_ADW_GregGetroffen(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 4;
	condition = DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information = DIA_Addon_Skip_ADW_GregGetroffen_Info;
	description = "Viděl jsem Grega v Khorinisu.";
};


func int DIA_Addon_Skip_ADW_GregGetroffen_Condition()
{
	if((PlayerTalkedToGregNW == TRUE) && (GregIsBack == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Skip_Job))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_ADW_GregGetroffen_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ADW_GregGetroffen_15_00");	//Viděl jsem Grega v Khorinisu.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_01");	//Opravdu? Do čerta! Něco musí být špatně.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_02");	//Už by tady dávno měl být se svou lodí.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_03");	//(zamyšleně) Bude nejlepší, když se vrátím zpět do Khorinisu, abych se s ním potkal...
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_04");	//(povzdech) Ale určitě ne dnes. Zrovna jsem přijel.
	B_GivePlayerXP(XP_Ambient);
};

var int Skip_Transport_Variation;

instance DIA_Addon_Skip_Transport(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 99;
	condition = DIA_Addon_Skip_Transport_Condition;
	information = DIA_Addon_Skip_Transport_Info;
	permanent = TRUE;
	description = "Můžeš mě vzít zpět do Khorinisu?";
};

func int DIA_Addon_Skip_Transport_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Job) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_Transport_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Transport_15_00");	//Můžeš mě vzít zpět do Khorinisu?

	if(GregIsBack == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_01");	//Ne. Teďka se ještě nikam nechystám. Nejdřív si dám pořádný hlt grogu.
	}
	else if(Skip_Transport_Variation == 0)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_02");	//Zbláznil ses? Ztratili jsme naši loď, chlape!
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_03");	//Nebudu riskovat naši poslední loď, jenom proto, že ty jsi moc líný dostat svůj zadek do Khorinisu SÁM!
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_04");	//Naposled ti říkám: NE!
	};
};


instance DIA_Addon_Skip_Bandits(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_Bandits_Condition;
	information = DIA_Addon_Skip_Bandits_Info;
	description = "Co mi můžeš říct o banditech?";
};


func int DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_Bandits_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Bandits_15_00");	//Co mi můžeš říct o banditech?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_01");	//Banditi? Útočí na nás!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_02");	//Proč bychom jinak stavěli palisády?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_03");	//Vlastně jsme si ty šmejdy sem přivedli sami.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_04");	//Prvně jsme s nimi obchodovali. Řeknu ti kamaráde, mají tolik zlata, že už neví kam s ním!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_05");	//Za láhev rumu zaplatili pěknou sumičku.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_06");	//Ale časy míru jsou ty tam. Teď je válka!
	AI_Output(other,self,"DIA_Addon_Erol_Bandits_15_06");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_07");	//Ti bastardi nezaplatili za poslední zásilku.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_08");	//Byl jsem se tam podívat, abych zjistil, co se stalo s našim zlatem.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_09");	//Ale když jsem vstoupil do močálu, ti bastardi na mě začali útočit!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_10");	//To ale není vše. Zabili Anguse a Hanka - dva z našich nejlepších lidí.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_11");	//Moje rada pro tebe, drž se od toho močálu dál!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_12");	//Banditi útočí na každého, kdo vypadá, že se má líp než oni sami.
};


instance DIA_Addon_Skip_ArmorPrice(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_ArmorPrice_Condition;
	information = DIA_Addon_Skip_ArmorPrice_Info;
	description = "Potřebuji zbroj banditů.";
};


func int DIA_Addon_Skip_ArmorPrice_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_ArmorPrice_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_00");	//Potřebuji zbroj banditů.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_01");	//Ty tam chceš jít? Asi ses úplně zbláznil!
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_02");	//Jakmile zjistí, že nejsi jeden z nich, je s tebou ámen!
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_02");	//Nějaký nápad, kde mohu najít takovou zbroj?
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_03");	//(povzdech) Ty si prostě nedáš říct, že? Dobrá. Měli jsme jedno.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_04");	//Pravděpodobně furt leží v Gregově chatrči.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_05");	//Až se vrátí, možná ti ho prodá...
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Skip si myslí, že zbroj je v Gregově chatrči.");
};


instance DIA_Addon_Skip_GregsHut(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_GregsHut_Condition;
	information = DIA_Addon_Skip_GregsHut_Info;
	permanent = FALSE;
	description = "Nějaký nápad, jak se můžu dostat do jeho chatrče?";
};


func int DIA_Addon_Skip_GregsHut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_ArmorPrice) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_GregsHut_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GregsHut_15_00");	//Nějaký nápad, jak se můžu dostat do jeho chatrče?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_01");	//Hele! Brzdi!
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_02");	//Nechystáš se snad hrabat v Gregových věcech?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_03");	//Když odešel, dal Francisovi klíče a příkaz, že NIKDO nesmí vstoupit do chatrče.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Francis má klíč od Gregovy chatrče, ale má příkaz nikoho nepouštět dovnitř.");
	Knows_GregsHut = TRUE;
};


instance DIA_Addon_Skip_Francis(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 6;
	condition = DIA_Addon_Skip_Francis_Condition;
	information = DIA_Addon_Skip_Francis_Info;
	permanent = FALSE;
	description = "Co mi můžeš říct o Francisovi?";
};


func int DIA_Addon_Skip_Francis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Francis_15_00");	//Co mi můžeš říct o Francisovi?
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_01");	//Francis je náš pokladník.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_02");	//Kapitán mu věří. Proto mu svěřil velení.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_03");	//Ale nikdo ho tady nebere vážně.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_04");	//Jestli se chceš dovědět víc, promluv se Samuelem.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_05");	//Má laboratoř v malé jeskyni na severu odsud.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_06");	//V tomhle táboře není nikdo, o kom by Samuel nevěděl něco zajímavého...
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Měl bych si promluvit se Samuelem. Možná mě může dát nějaký tip.");
};


instance DIA_Addon_Skip_Raven(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_Raven_Condition;
	information = DIA_Addon_Skip_Raven_Info;
	permanent = FALSE;
	description = "Setkal ses někdy s Ravenem?";
};


func int DIA_Addon_Skip_Raven_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Raven_15_00");	//Setkal ses někdy s Ravenem?
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_01");	//Jasně, setkal. Byli jsme s Henrym u přední brány na hlídce a viděli jsme, jak Raven posílal některé ze svých lidí do věže na východ odsud.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_02");	//Z věže je skoro možné dohodit do našeho tábora kamenem. (směje se) Je jasné, že jsou tam proto, aby nás špehovali.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_03");	//Také jsem viděl, jak skončí lidi, kteří nedělají, co jim přikáže.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_04");	//Každý kdo neposlechne na slovo, s tím je proces krátký.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_05");	//Vyvaruj se Ravena, to ti povím.
};


instance DIA_Addon_Skip_AngusHank(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHank_Condition;
	information = DIA_Addon_Skip_AngusHank_Info;
	description = "Řekni mi více o Angusovi a Hankovi.";
};


func int DIA_Addon_Skip_AngusHank_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_AngusHank_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHank_15_00");	//Řekni mi více o Angusovi a Hankovi.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_01");	//Angus a Hank se měli setkat s pár bandity poblíž tábora.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_02");	//Měli s sebou všechno možné. Vše, o co si ti bastardi řekli.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_03");	//Surovou ocel, paklíče a další.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_04");	//Ale zpět se nevrátili. Ty svině je museli odpravit!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_05");	//Morgan a Bill se po nich byli podívat - bez výsledku.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_06");	//Bill je z toho pěkně špatný. S Angusem a Hankem byli fakt kamarádi.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_07");	//Je stále dost mladý a přenést se přes tento incident je pro něj těžší.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_08");	//Avšak život jde dál. Ztráta věcí se dá přežít. (povzdechne si) Ale ten grog co měli s sebou...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_09");	//(naštvaně) Mluvíme tu nejméně o 20 láhvích!
	MIS_ADDON_SkipsGrog = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_SkipsGrog,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_SkipsGrog,LOG_Running);
	B_LogEntry(TOPIC_Addon_SkipsGrog,"Banditi nezaplatili Skipovi za 20 láhví grogu. Chce je zpátky!");
	Log_AddEntry(TOPIC_Addon_SkipsGrog,"Angus a Hank byli vysláni, aby se setkali s bandity. Od té doby už je nikdo neviděl.");
	Log_AddEntry(TOPIC_Addon_SkipsGrog,"Pátrání Morgana a Billa nepřineslo žádné výsledky.");
};


instance DIA_Addon_Skip_AngusHankDead(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHankDead_Condition;
	information = DIA_Addon_Skip_AngusHankDead_Info;
	permanent = FALSE;
	description = "O Angusovi a Hankovi...";
};


func int DIA_Addon_Skip_AngusHankDead_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_Bandits) && !Npc_HasItems(Angus,ItRi_Addon_MorgansRing_Mission))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_AngusHankDead_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_00");	//O Angusovi a Hankovi...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_01");	//Co?
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_01");	//Našel jsem je.
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_03");	//Jsou mrtví.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_03");	//(pro sebe) zabití... chlapi ubozí...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_04");	//Dobrá, nic víc jsem nečekal.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_05");	//Měl bys dát Billovi vědět, pokud jsi to už neudělal.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_06");	//Ale řekni mu to jemně. Je stále mladý.
};


instance DIA_Addon_Skip_AngusHankMurder(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 5;
	condition = DIA_Addon_Skip_AngusHankMurder_Condition;
	information = DIA_Addon_Skip_AngusHankMurder_Info;
	permanent = FALSE;
	description = "Znám vraha Anguse a Hanka.";
};


func int DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_AngusHankDead) && (SC_Knows_JuanMurderedAngus == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_AngusHankMurder_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_JuanMurder_15_00");	//Znám vraha Anguse a Hanka.
	if(MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_01");	//To je hezké. Ale jsou oba mrtví. Proč to dál řešit?
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_02");	//Díky pomstě pirát nikdy nezbohatl.
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_03");	//Nejdůležitější je, abych měl svůj grog zpátky.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_04");	//Vrah mě nezajímá! Co můj grog?!
	};
};


instance DIA_Addon_Skip_Grog(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 9;
	condition = DIA_Addon_Skip_Grog_Condition;
	information = DIA_Addon_Skip_Grog_Info;
	permanent = TRUE;
	description = "Ohledně grogu...";
};


func int DIA_Addon_Skip_Grog_Condition()
{
	if(MIS_ADDON_SkipsGrog == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Grog_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_15_00");	//Ohledně grogu...
	if(Npc_HasItems(other,ItFo_Addon_Grog) >= 20)
	{
		Info_ClearChoices(DIA_Addon_Skip_Grog);
		Info_AddChoice(DIA_Addon_Skip_Grog,Dialog_Back,DIA_Addon_Skip_Grog_back);
		Info_AddChoice(DIA_Addon_Skip_Grog,"Tady je tvých 20 láhví.",DIA_Addon_Skip_Grog_geben);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Skip_Grog_15_01");	//Postrádáš 20 láhví, že?
		AI_Output(self,other,"DIA_Addon_Skip_Grog_08_02");	//Ano, zatraceně. Byly to všechny moje zásoby.
	};
};

func void DIA_Addon_Skip_Grog_back()
{
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

func void DIA_Addon_Skip_Grog_geben()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_00");	//Tady je tvých 20 láhví.
	B_GiveInvItems(other,self,ItFo_Addon_Grog,20);
	B_LogEntry(TOPIC_Addon_SkipsGrog,"Skip má svých 20 láhví grogu a je velice spokojený.");
	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_SkipsGrog);
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_01");	//Co to? Nic za to?
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_02");	//Noo...
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_03");	//Dobrá. Zaplatím ti.
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_04");	//Máš u sebe něco zajímavějšího než je zlato?
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_05");	//Hmm. (zaujatě) Nech mě se kouknout. Mám tady jeden prsten.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_06");	//Vyhrál jsem ho před mnoha lety v jednom zaplivaném přístavním baru v kostkách.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_07");	//Ten chlápek říkal, že je magický. Nemám ale tucha jestli je to pravda.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_08");	//Chceš ho, nebo chceš zlato?
	Info_ClearChoices(DIA_Addon_Skip_Grog);
	Info_AddChoice(DIA_Addon_Skip_Grog,"Dej mi peníze.",DIA_Addon_Skip_Grog_gold);
	Info_AddChoice(DIA_Addon_Skip_Grog,"Dej mi prsten.",DIA_Addon_Skip_Grog_ring);
};

func void DIA_Addon_Skip_Grog_ring()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_ring_15_00");	//Dej mi prsten.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_ring_08_01");	//Tady máš.
	B_GiveInvItems(self,other,ItRi_Prot_Edge_02,1);
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

func void DIA_Addon_Skip_Grog_gold()
{
	var int GrogKohle;
	AI_Output(other,self,"DIA_Addon_Skip_Grog_gold_15_00");	//Dej mi peníze.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_gold_08_01");	//Jasně.
	GrogKohle = Value_Grog * 20;
	B_GiveInvItems(self,other,ItMi_Gold,GrogKohle);
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};


instance DIA_Addon_Skip_News(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 888;
	condition = DIA_Addon_Skip_News_Condition;
	information = DIA_Addon_Skip_News_Info;
	permanent = FALSE;
	description = "Máš něco na prodej?";
};


func int DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_News_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_News_15_00");	//Máš něco na prodej?
	AI_Output(self,other,"DIA_Addon_Skip_News_08_01");	//Jestli chceš obchodovat, promluv si s Garettem. Stará se o zásoby.
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_GarettTrade);
};


instance DIA_Addon_Skip_Anheuern(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 11;
	condition = DIA_Addon_Skip_Anheuern_Condition;
	information = DIA_Addon_Skip_Anheuern_Info;
	permanent = FALSE;
	description = "Pojď, pomoz mi.";
};


func int DIA_Addon_Skip_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_00");	//Pojď, pomoz mi.
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_01");	//Co se děje?
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_01");	//Kaňon čeká.
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_02");	//Vidím, že jsi shromáždil pár chlapců. To je dobře!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_03");	//Radši s sebou vezmi víc chlapů!
	};
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_04");	//Kaňon je pěkně nebezpečný!
};


instance DIA_Addon_Skip_ComeOn(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 12;
	condition = DIA_Addon_Skip_ComeOn_Condition;
	information = DIA_Addon_Skip_ComeOn_Info;
	permanent = TRUE;
	description = "Pojď se mnou.";
};


func int DIA_Addon_Skip_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Skip_Anheuern))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ComeOn_15_00");	//Pojď se mnou.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_02");	//Počkej. Nejdřív se vraťme do kaňonu...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_01");	//Jdeme!
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			B_TurnToNpc(self,other);
		};
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

instance DIA_Addon_Skip_GoHome(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 13;
	condition = DIA_Addon_Skip_GoHome_Condition;
	information = DIA_Addon_Skip_GoHome_Info;
	permanent = TRUE;
	description = "Už tě více nepotřebuji.";
};


func int DIA_Addon_Skip_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GoHome_15_00");	//Už tě více nepotřebuji.
	AI_Output(self,other,"DIA_Addon_Skip_GoHome_08_01");	//Dobrá, pěkně jsme se provětrali. kdyby něco, najdeš mě v táboře.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};

instance DIA_Addon_Skip_TooFar(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 14;
	condition = DIA_Addon_Skip_TooFar_Condition;
	information = DIA_Addon_Skip_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Skip_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_01");	//To je dost daleko!
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_02");	//Jestli opravdu chceš jít dál, běž bez nás!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_03");	//Jestli opravdu chceš jít dál, běž beze mě!
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_Treffpunkt(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Treffpunkt_Condition;
	information = DIA_Addon_Skip_Treffpunkt_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Skip_Treffpunkt_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 800) && (C_AllCanyonRazorDead() == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_Treffpunkt_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_00");	//Pokud se rozdělíme, setkáme se u tohohle jezírka.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_02");	//Pojďme!
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_Orks(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_Orks_Condition;
	information = DIA_Addon_Skip_Orks_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Skip_Orks_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_Orks_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_01");	//Skřeti! Nenávidím tyhle bestie!
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Skip_AllRazorsDead(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_AllRazorsDead_Condition;
	information = DIA_Addon_Skip_AllRazorsDead_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_AllCanyonRazorDead() == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_AllRazorsDead_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_03");	//Vypadá to, že jsme dostali všechny břitvy.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_04");	//Můžeme se tu ještě trochu potulovat, jestli chceš.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_05");	//Tak dlouho dokud zůstaneme v kaňonu.
	AI_StopProcessInfos(self);
};

//----------------vetka Drakii------------------------------------------

instance DIA_Addon_Skip_TalkAboutElza(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_TalkAboutElza_Condition;
	information = DIA_Addon_Skip_TalkAboutElza_Info;
	permanent = FALSE;
	description = "Greg říkal, že ses pokoušel opravit 'Jednookou Elsu'.";
};

func int DIA_Addon_Skip_TalkAboutElza_Condition()
{
	if((MIS_OldElza == LOG_Running) && (ViewElza == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_TalkAboutElza_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Skip_TalkAboutElza_01_00");	//Greg říkal, že ses pokoušel opravit 'Jednookou Elsu'.
	AI_Output(self,other,"DIA_Addon_Skip_TalkAboutElza_01_01");	//Jo, zkusil. Ale bylo to k ničemu! 
	AI_Output(other,self,"DIA_Addon_Skip_TalkAboutElza_01_02");	//Jakto?
	AI_Output(self,other,"DIA_Addon_Skip_TalkAboutElza_01_03");	//Praskliny v trupu a velkou díru, která je na přídi lodi si můžeme opravit sami.
	AI_Output(self,other,"DIA_Addon_Skip_TalkAboutElza_01_04");	//Ale potřebujeme šikovného tesaře, který by opravil kormidlo. Bez toho bude loď jednoduše neříditelná.
	AI_Output(self,other,"DIA_Addon_Skip_TalkAboutElza_01_05");	//A takový, jestli tomu rozumíš, tu není. Jsme piráti k čertu, ne mistři řemeslníci.
};

instance DIA_Addon_Skip_TalkAboutElza_Fix(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_TalkAboutElza_Fix_Condition;
	information = DIA_Addon_Skip_TalkAboutElza_Fix_Info;
	permanent = FALSE;
	description = "Mohl bych se vám po nějakém tesaři podívat.";
};

func int DIA_Addon_Skip_TalkAboutElza_Fix_Condition()
{
	if((MIS_OldElza == LOG_Running) && (ViewElza == TRUE) && (Npc_KnowsInfo(other,DIA_Addon_Skip_TalkAboutElza) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_TalkAboutElza_Fix_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_TalkAboutElza_Fix_01_01");	//Mohl bych se vám po nějakém tesaři podívat.
	AI_Output(self,other,"DIA_Addon_Skip_TalkAboutElza_Fix_01_02");	//Hmmm... můžeš se o to pokusit. Může to být jenom k dobru. Ale kde najít někoho, kdo se bude chtít kamarádíčkovat s piráty? 
	AI_Output(other,self,"DIA_Addon_Skip_TalkAboutElza_Fix_01_03");	//Nevím. Ale podívat se po někom můžu.
	AI_Output(self,other,"DIA_Addon_Skip_TalkAboutElza_Fix_01_04");	//Dobře, pokud náhodou najdeš nějakého mistra, který by pro nás chtěl pracovat, tak tady...
	B_GiveInvItems(self,other,ItMi_ShipShceme,1);
	AI_Output(other,self,"DIA_Addon_Skip_TalkAboutElza_Fix_01_05");	//Co to je?
	AI_Output(self,other,"DIA_Addon_Skip_TalkAboutElza_Fix_01_06");	//Ve volné chvíli jsem načrtl podoby těch součástek, které jsou potřeba vyměnit u 'Elsy'.
	AI_Output(self,other,"DIA_Addon_Skip_TalkAboutElza_Fix_01_07");	//Pokud by náhodou nechtěl přijít k nám do tábora, o čemž pochybuji, tak třeba bude souhlasit, že by nám je vyrobil.
	AI_Output(self,other,"DIA_Addon_Skip_TalkAboutElza_Fix_01_08");	//O peníze se neboj. Všechny výdaje s tím spojene ti pokryju. Samozřejmě v rozumné míře.
	AI_Output(other,self,"DIA_Addon_Skip_TalkAboutElza_Fix_01_09");	//Dobře, uvidím, co půjde dělat.
	B_LogEntry(TOPIC_OldElza,"Souhlasil jsem, že se podívám po tesaři, který by pirátům mohl opravit kormidlo na 'Jednooké Else'. Pro tyto účely mi Skip dal náčrty těch součástí, které jsou potřeba udělat.");
};

instance DIA_Addon_Skip_FixShip(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_FixShip_Condition;
	information = DIA_Addon_Skip_FixShip_Info;
	permanent = FALSE;
	description = "Tady jsou všechny díly ke kormidlu.";
};

func int DIA_Addon_Skip_FixShip_Condition()
{
	if((MIS_OldElza == LOG_Running) && (Npc_HasItems(other,ItMi_SkipShipPack) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_FixShip_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_01_01");	//Tady jsou všechny díly ke kormidlu.
	B_GiveInvItems(other,self,ItMi_SkipShipPack,1);
	Npc_RemoveInvItems(self,ItMi_SkipShipPack,1);
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_01_02");	//No to mě podrž, nevěřím vlastním očím! Opravdu je to vše tu!
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_01_03");	//Znamená to, že teď už je možné začít opravovat loď?
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_01_04");	//Samo sebou! Hned se o to postarám.
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_01_05");	//A jak dlouho to myslíš zabere?
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_01_06");	//Hmm... no pokud se nic nepokazí, myslím, že za pár dní by to mohlo být hotové.
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_01_07");	//Hlavní je, že ty součástky, které si přinesl, sedí ke kormidlu na 'Else'. Kolik si za ně vlastně zaplatil?
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_01_08");	//2000 zlatých.
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_01_09");	//Můj ty blázne! To je ale pěkná sumička. 
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_01_10");	//Nebylo s níma lehké smlouvat.
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_01_11");	//Uuuuf... (povzdechne) Dobrá, koneckonců, jsem ti slíbil, že ti zaplatím všechny náklady.
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_01_12");	//Ano, a opravit naší loď je teď mnohem důležitější. 
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_01_13");	//Na, tady si vem peníze. Plus něco víc za tvojí námahu.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_01_14");	//Díky.
	SkipShipRepairDay = Wld_GetDay();
	SkipShipRepair = TRUE;
	B_LogEntry(TOPIC_OldElza,"Dal jsem Skipovi díly na opravu kormidla a slíbil, že začně s opravou co nejdříve.");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Skip_FixShip_Done(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_FixShip_Done_Condition;
	information = DIA_Addon_Skip_FixShip_Done_Info;
	permanent = FALSE;
	description = "Jak to jde s opravou lodi?";
};

func int DIA_Addon_Skip_FixShip_Done_Condition()
{
	if((MIS_OldElza == LOG_Running) && (SkipReadySailDrakia == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_FixShip_Done_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_Done_01_01");	//Jak to jde s opravou lodi?
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_Done_01_02");	//Skvělé, kamaráde! Díly, které si mi sehnal, zapadly do kormidla 'Elsy' jak ulité a loď je teď velmi plavbyschopná.
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_Done_01_03");	//A trhliny a díru na přídi jsem zapravil včera. Jestli chceš, můžeš se sám podívat jak to dopadlo.
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_Done_01_04");	//Vypadá to, že už zase můžete na moře?
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_Done_01_05");	//No, ne tak úplně... (mrzutě) Je to pořád dost nebezpečné se na ní vydat dál od břehu. I malá bouře by jí poslala ke dnu.
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_Done_01_06");	//Neplánovali jsme to udělat. Greg má ale ještě nějaký plán na mysli.
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_Done_01_07");	//Jaký plán?
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_Done_01_08");	//Hmm... Určitě ti už řekl o té kupě věci, které se nashromáždily v našem táboře a které jsme neměli čas prodat předtím než nám paladinové potopili loď.
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_Done_01_09");	//Z větší části jsou tady tyto krámy pěkně drahé, a ve městech je člověk ke koupení jen tak nenajde.
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_Done_01_10");	//No a Greg plánoval tyto věci převézt na 'Else' do Drakie. Když bychom měli štěstí a všechny věci tam prodali, klidně bychom si pak mohli koupit novou loď.
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_Done_01_11");	//Ale ty si říkal, že není bezpečné vyplout na 'Else' na moře, ne?
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_Done_01_12");	//Až do této části ostrova je naše stará galeona schopná se plavit bez problémů. Hlavní je znát kurz a neplavit se daleko od pobřeží.
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_Done_01_13");	//A kdy se tam plánujete vydat?
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_Done_01_14");	//Hm... tak za pár dní hned co naložíme všechny věci na 'Elsu'. A co ty... (usmívá se) chtěl by ses přidat?
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_Done_01_15");	//Nejsem proti se přidat.
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_Done_01_16");	//Pravdu říct, a proč ne. Nejsi sice námořník, ale chlapík jsi fajn. Věřím, že ani Greg nebude mít nic proti, když se s náma vydáš.
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_Done_01_17");	//Tak já se zastavím později. 
	AI_Output(self,other,"DIA_Addon_Skip_FixShip_Done_01_18");	//Dobře. Ale pamatuj - jen na tebe čekat nebudeme! Jak se sbalíme, ihned odplouváme.
	AI_Output(other,self,"DIA_Addon_Skip_FixShip_Done_01_19");	//Samo sebou.
	MIS_OldElza = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OldElza,LOG_SUCCESS);
	B_LogEntry(TOPIC_OldElza,"Díky mojí pomoci byl Skip schopný opravit 'Jednookou Elsu', ale pravda je taková, že není možné s ní plout moc daleko od pobřeží.");
};

instance DIA_Addon_Skip_DrakiaAway(C_Info)
{
	npc = PIR_1355_Addon_Skip;
	nr = 1;
	condition = DIA_Addon_Skip_DrakiaAway_Condition;
	information = DIA_Addon_Skip_DrakiaAway_Info;
	permanent = TRUE;
	description = "Tak jak, už je loď připravená odeplout?";
};

func int DIA_Addon_Skip_DrakiaAway_Condition()
{
	if((MIS_OldElza == LOG_SUCCESS) && (SailAwayDrakia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_DrakiaAway_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_DrakiaAway_01_01");	//Tak jak, už je loď připravená odeplout?
	AI_Output(self,other,"DIA_Addon_Skip_DrakiaAway_01_02");	//Ještě ne. Zastav se později.
};
