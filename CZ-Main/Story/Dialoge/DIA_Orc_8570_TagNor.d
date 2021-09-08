const int Bonus_TagNor = 10;
const int Bonus_TagNor_HP = 100;

instance DIA_Orc_8570_TagNor_EXIT(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_exit_condition;
	information = DIA_Orc_8570_TagNor_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int DIA_Orc_8570_TagNor_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8570_TagNor_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8570_TagNor_PreHello(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_PreHello_condition;
	information = DIA_Orc_8570_TagNor_PreHello_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_8570_TagNor_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_PreHello_info()
{
	AI_Output(self,other,"DIA_Orc_8570_TagNor_PreHello_01_01");	//MORA KAR TUK... (podrážděně) HRAK DURAN?
	AI_Output(other,self,"DIA_Orc_8570_TagNor_PreHello_01_02");	//Co říkáš?!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_PreHello_01_03");	//BEŠ MORA! HAD KUD SAD...
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8570_TagNor_PreHelloOk(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_PreHelloOk_condition;
	information = DIA_Orc_8570_TagNor_PreHelloOk_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8570_TagNor_PreHelloOk_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerKnowsOrcLanguage == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_PreHelloOk_info()
{
	AI_Output(self,other,"DIA_Orc_8570_TagNor_PreHelloOk_01_01");	//Co ty chtít, Morra?
};

instance DIA_Orc_8570_TagNor_Hello(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_Hello_condition;
	information = DIA_Orc_8570_TagNor_Hello_info;
	important = FALSE;
	permanent = FALSE;
	description = "Slyšel jsem, že jseš ze všech skřetů nejlepší lovec.";
};

func int DIA_Orc_8570_TagNor_Hello_condition()
{
	if((TagNorTell == TRUE) && (PlayerKnowsOrcLanguage == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_Hello_info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Hello_Info_18_01");	//Slyšel jsem, že jseš ze všech skřetů nejlepší lovec.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Hello_Info_18_02");	//Arrgh... (pohrdavě) A proč se člověk stará?!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Hello_Info_18_03");	//Jen mě napadlo, že bys mě mohl učit své řemeslo.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Hello_Info_18_04");	//Ne! Tag-Nor nebude nic učit člověk.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Hello_Info_18_05");	//Máš nějaký důvod, proč?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Hello_Info_18_06");	//Tag-Nor nezná člověk a ani ho nerespektuje!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Hello_Info_18_07");	//Člověk nejdřív ukázat, co dokáže. Pak může Tag-Nor učit člověk, jak se stát velkým lovcem.
	MIS_TagNorRespect = LOG_Running;
	Log_CreateTopic(TOPIC_TagNorRespect,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TagNorRespect,LOG_Running);
	B_LogEntry(TOPIC_TagNorRespect,"Setkal jsem Tag-Nora. Podle skřetů je nejlepším lovcem z klanu, a myslím, že bych se od něj mohl učit. Nejdřív mu ale musím dokázat, že za něco stojím, nejspíš nějakou vzácnou a speciální trofejí.");
};

instance DIA_Orc_8570_TagNor_Muritan(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_Muritan_condition;
	information = DIA_Orc_8570_TagNor_Muritan_info;
	permanent = FALSE;
	description = "Mám pro tebe něco.";
};

func int DIA_Orc_8570_TagNor_Muritan_condition()
{
	if((MIS_TagNorRespect == LOG_Running) && ((Npc_HasItems(hero,ItAt_BuritanTooth) >= 1) || (Npc_HasItems(hero,ItAt_TrollBlackFur) >= 1) || (Npc_HasItems(hero,ItAt_CurratIshi) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_Muritan_info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Muritan_Info_18_01");	//Mám tu něco pro tebe.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Info_18_02");	//A co člověk přinést Tag-Nor?
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Muritan_Info_18_03");	//Jednu velmi vzácnou loveckou trofej. Tady, podívej se.
	Info_ClearChoices(DIA_Orc_8570_TagNor_Muritan);

	if(Npc_HasItems(other,ItAt_BuritanTooth) >= 1)
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_Muritan,"(dát tesák Muritana)",DIA_Orc_8570_TagNor_Muritan_Claw);
	};
	if(Npc_HasItems(other,ItAt_TrollBlackFur) >= 1)
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_Muritan,"(dát kůži černého trola)",DIA_Orc_8570_TagNor_Muritan_Fur);
	};
	if(Npc_HasItems(other,ItAt_CurratIshi) >= 1)
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_Muritan,"(dát osten Ishi-Kurrata)",DIA_Orc_8570_TagNor_Muritan_Ishi);
	};
};

func void DIA_Orc_8570_TagNor_Muritan_Claw()
{
	B_GivePlayerXP(500);
	B_GiveInvItems(other,self,ItAt_BuritanTooth,1);
	Npc_RemoveInvItems(self,ItAt_BuritanTooth,1);

	if(Trophy_MuritanTooth  == TRUE)
	{
		if((Npc_HasItems(other,ItAt_PW_MuritanTooth) == FALSE) && (Npc_HasItems(other,ItAt_BuritanTooth) == FALSE))
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_MuritanTooth,Npc_HasItems(other,ItUt_MuritanTooth));
			Trophy_MuritanTooth  = FALSE;
		};
	};

	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Claw_01_01");	//Arrgh... (překvapeně) To být jedovatý zub Muritana! Kde to člověk vzít?!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Muritan_Claw_01_02");	//Byl jsem schopen vypátrat jednoho z těchto tvorů a zabít ho.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Claw_01_03");	//Člověk být velmi zručný lovec, když ho dokázal zabít. Tag-Nord být ohromen!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Muritan_Claw_01_04");	//Vidím, že můj dar na tebe udělal dojem. Teď už mě budeš učit lovit?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Claw_01_06");	//Dobře, Tag-Nor bude učit člověk.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Claw_01_07");	//Ale myslet, že když člověk zabít Muritana, není mnoho co učit.
	ORCRESPECT = ORCRESPECT + 10;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Reputace u skřetů + 10");
	};

	TagNorTeach = TRUE;
	MIS_TagNorRespect = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TagNorRespect,LOG_SUCCESS);
	B_LogEntry(TOPIC_TagNorRespect,"Přinesl jsem Tag-Norovi vzácnou loveckou trofej - jedovatý tesák Muritana. Tím jsem na starého lovce výrazně zapůsobil, a on souhlasil, že mě naučí své řemeslo.");
	Info_ClearChoices(DIA_Orc_8570_TagNor_Muritan);
};

func void DIA_Orc_8570_TagNor_Muritan_Fur()
{
	B_GivePlayerXP(250);
	B_GiveInvItems(other,self,ItAt_TrollBlackFur,1);
	Npc_RemoveInvItems(self,ItAt_TrollBlackFur,1);
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Fur_01_01");	//Arrgh... (souhlasně) Být velká kůže černého trola!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Fur_01_02");	//Tag-Nor vidět, že člověk být velmi zkušený lovec.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Muritan_Fur_01_03");	//Teď už mě budeš učit lovit?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Fur_01_04");	//Dobře, Tag-Nor bude učit člověk.
	ORCRESPECT = ORCRESPECT + 5;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Reputace u skřetů + 5");
	};

	TagNorTeach = TRUE;
	MIS_TagNorRespect = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TagNorRespect,LOG_SUCCESS);
	B_LogEntry(TOPIC_TagNorRespect,"Přinesl jsem Tag-Norovi vzácnou loveckou trofej - kůži černého trola, a on souhlasil, že mě naučí své řemeslo.");
	Info_ClearChoices(DIA_Orc_8570_TagNor_Muritan);
};

func void DIA_Orc_8570_TagNor_Muritan_Ishi()
{
	B_GivePlayerXP(1500);
	B_GiveInvItems(other,self,ItAt_CurratIshi,1);
	Npc_RemoveInvItems(self,ItAt_CurratIshi,1);

	if(Trophy_IshiCurrat == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_IshiCurrat,Npc_HasItems(other,ItUt_IshiCurrat));
		Trophy_IshiCurrat = FALSE;
	};

	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Ishi_01_01");	//Hmmm... Tag-Nor nikdy nevidět! Být velmi překvapen.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Ishi_01_02");	//Myslet, že člověk být velmi zkušený lovec, když dokázal takové získat.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Muritan_Ishi_01_03");	//Teď už mě budeš učit lovit?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Ishi_01_04");	//Dobře, Tag-Nor bude učit člověk!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Muritan_Ishi_01_05");	//Ale myslet, že když byl člověk schopen přinést tuto trofej pro Tag-Nor, učit již není nutné.
	ORCRESPECT = ORCRESPECT + 15;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Reputace u skřetů + 15");
	};

	TagNorTeach = TRUE;
	MIS_TagNorRespect = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TagNorRespect,LOG_SUCCESS);
	B_LogEntry(TOPIC_TagNorRespect,"Přinesl jsem Tag-Norovi vzácnou loveckou trofej - páteřní osten Ishi-Kurrata. Tím jsem na starého lovce výrazně zapůsobil, a on souhlasil, že mě naučí své řemeslo.");
	Info_ClearChoices(DIA_Orc_8570_TagNor_Muritan);
};

instance DIA_Orc_8570_TagNor_Bow(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_Bow_condition;
	information = DIA_Orc_8570_TagNor_Bow_info;
	important = FALSE;
	permanent = FALSE;
	description = "Proč vy skřeti nepoužíváte luky?";
};

func int DIA_Orc_8570_TagNor_Bow_condition()
{
	if(TagNorTeach == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_Bow_info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Bow_Info_18_01");	//A proč vy skřeti nepoužíváte luky?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Bow_Info_18_02");	//Luk je zbraň lidí. Bratři nevěděli, jak s ní bojovat!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_Bow_Info_18_03");	//A co kuše?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Bow_Info_18_04");	//To taky přinést lidi, ale my se je naučili používat v boji.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_Bow_Info_18_05");	//Pokud člověk má trochu zkušeností, Tag-Nor může ukázat, jak ještě líp střílet z kuše.
	TagNorTeachCrossBow = TRUE;
};

instance DIA_Orc_8570_TagNor_FindCrBow(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_FindCrBow_condition;
	information = DIA_Orc_8570_TagNor_FindCrBow_info;
	permanent = FALSE;
	description = "Kde mohu získat dobrou kuši pro lov?";
};

func int DIA_Orc_8570_TagNor_FindCrBow_condition()
{
	if(TagNorTeachCrossBow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_FindCrBow_info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_01");	//Kde mohu získat dobrou kuši pro lov?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_02");	//(zamyšleně) Obvykle se lovci uspokojit s kteroukoliv kuší.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_03");	//I jednoduché kuše být dost silné, aby nakonec zabít jakékoliv zvíře.

	if((KELIOSFIRETEST == FALSE) && (SBMODE == TRUE))
	{
		AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_04");	//Ale pokud člověk chce mít zbraň, hodnou pouze velkého lovce, pak...
		AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_05");	//Pak co?
		AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_06");	//... pak možná Tag-Nor může pomoci. Ale být velmi obtížné!
		AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_07");	//Nebojím se potíží! Pověz mi, kde najdu takovou zbraň.
		AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_08");	//No dobře... Ale člověk nejpoprve přinést nějaké věci.
		AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_09");	//No, ovšem, když jinak nedáš! Dobře, řekni mi - co chceš?
		AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_10");	//Za prvé, Tag-Nor bude potřebovat magickou rudu! Mnoho magické rudy...
		AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_11");	//Kolik rudy budeš potřebovat?
		AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_12");	//Sto kousků rudy by mělo stačit.
		AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_13");	//Vždyť to je hromada rudy!
		AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_14");	//A kdy Tag-Nor říct, že to bude snadné?
		AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Info_18_15");	//Jestli získat takové množství pro člověk příliš těžké, pak můžeme zakončit tento rozhovor.
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBow);
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBow,"Jo, tohle asi pro mě není.",DIA_Orc_8570_TagNor_FindCrBow_Back);
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBow,"Dobře, skusím tu rudu pro tebe získat.",DIA_Orc_8570_TagNor_FindCrBow_Forward);
	};
};

func void DIA_Orc_8570_TagNor_FindCrBow_Back()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Back_01_01");	//Jo, tohle asi pro mě není.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Back_01_02");	//Cokoliv řekneš, člověče.
	AI_StopProcessInfos(self);
};


func void DIA_Orc_8570_TagNor_FindCrBow_Forward()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_01");	//Dobře, skusím tu rudu pro tebe získat.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_02");	//Dobře... A ještě, kdyby člověk náhodou našel černou rudu, také ji může přinést pro Tag-Nor!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_03");	//On určite použít jestli člověk najít.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_04");	//Jistě. Co ještě potřebuješ?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_05");	//Druhá věc, kterou muset získat pro Tag-Nor, být kus dřeva... bukového dřeva!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_06");	//Slyšet, že na jihu ostrova rostou takové stromy. Člověk nejlíp hledat tam!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_07");	//Doufám, že to už je všechno.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_08");	//Ne. Roh černého jeskynního trola! Tag-Nor potřebovat!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_09");	//Aha - no, začíná to být zajímavé...
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_10");	//Proč člověk tak hledět? On se vylekat?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_11");	//Tag-Nor myslet, že pro takový lovec to nebýt těžké.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_12");	//Mít tak tvou sebedůvěru. Nuže, co máš další na seznamu?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_13");	//Dále potřebovat... šlach obrovské černé pumy! Tag-Nor slyšet, že žijí v horách na jihozápadě ostrova.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_14");	//Ale dávat pozor, aby je nepotrhal když řezat šelmu. V opačném případě k ničemu!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_15");	//Pokusím se být opatrnější.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_16");	//A poslední, nejdůležitější věc, kterou je třeba najít - je vzácný talisman, který kdysi patřit velkému skřetímu lovci!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_17");	//A kde najdu tento vzácný talisman?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_18");	//Tag-Nor slyšet na starém skřetím hřbitově pohřben jeden takový hrdina.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBow_Forward_01_22");	//No, vypadá to, že mě čeká hodně práce. Nebudu ztrácet čas!
	MIS_TagNorGrHunWeap = LOG_Running;
	Log_CreateTopic(TOPIC_TagNorGrHunWeap,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TagNorGrHunWeap,LOG_Running);
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Tag-Nor řekl, že by mi mohl pomoct získat zbraň hodnou velkých lovců. Nicméně poté, co mi vylíčil všechno co bude potřeba sehnat, jsem téměr litoval, že jsem se vůbec zeptal. Takže musím přinést Tag-Norovi sto kusů magické rudy, špalík pevného bukového dřeva, roh černého jeskynního trola, šlach obří černé pumy, a konečně - talisman, který kdysi patřil velkému skřetímu lovci. Tag-Nor mi poradil, abych to poslední hledal ve starém skřetím hřbitově. Podle něj zde musí být pohřben jeden z takových hrdinů.");
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8570_TagNor_BlackOre(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_BlackOre_condition;
	information = DIA_Orc_8570_TagNor_BlackOre_info;
	important = FALSE;
	permanent = FALSE;
	description = "A v čem se běžná magická ruda se liší od černé?";
};

func int DIA_Orc_8570_TagNor_BlackOre_condition()
{
	if(MIS_TagNorGrHunWeap == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_BlackOre_info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_BlackOre_01_01");	//A v čem se běžná magická ruda se liší od černé?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_BlackOre_01_02");	//Tag-Nor nezná odpověd na tuto otázku.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_BlackOre_01_03");	//Ale vědět jistě, že černá ruda mít více magie, než je obvyklé.
};

instance DIA_Orc_8570_TagNor_TeachHunting(C_Info)
{
	npc = Orc_8570_TagNor;
	nr = 5;
	condition = DIA_Orc_8570_TagNor_TeachHunting_Condition;
	information = DIA_Orc_8570_TagNor_TeachHunting_Info;
	permanent = TRUE;
	description = "Chci se zlepšit v rozřezáváni kořisti.";
};

func int DIA_Orc_8570_TagNor_TeachHunting_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Orc_8570_TagNor_Hello) && (TagNorTeach == TRUE) && (TagNorTeachAll == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_TeachHunting_Info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_TeachHunting_01_00");	//Chci se zlepšit v rozřezáváni kořisti.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_TeachHunting_01_01");	//Co přesně člověka zajímá?

	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE))
	{
		Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
		Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,Dialog_Back,DIA_Orc_8570_TagNor_TeachHunting_Back);

		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc("Vyjímání drápů",B_GetLearnCostTalentOrc(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Orc_8570_TagNor_TeachHunting_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc("Stahování kůží",B_GetLearnCostTalentOrc(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Orc_8570_TagNor_TeachHunting_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc("Vyjímání zubů",B_GetLearnCostTalentOrc(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Orc_8570_TagNor_TeachHunting_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc("Vyjímání ohnivých jazyků",B_GetLearnCostTalentOrc(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),DIA_Orc_8570_TagNor_TeachHunting_FireTongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(DIA_Orc_8570_TagNor_TeachHunting,B_BuildLearnStringForOrc("Vyjímání rohů dračích chňapavců",B_GetLearnCostTalentOrc(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),DIA_Orc_8570_TagNor_TeachHunting_DrgSnapperHorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8570_TagNor_TeachHunting_01_04");	//Nemám nic více učit člověk.
		TagNorTeachAll = TRUE;
	};
};

func void DIA_Orc_8570_TagNor_TeachHunting_Back()
{
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_Claws))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_Fur))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_Teeth))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_FireTongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_FireTongue))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};

func void DIA_Orc_8570_TagNor_TeachHunting_DrgSnapperHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophyOrc(self,other,TROPHY_DrgSnapperHorn))
	{
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachHunting);
};


instance DIA_Orc_8570_TagNor_TeachCrossBow(C_Info)
{
	npc = Orc_8570_TagNor;
	nr = 6;
	condition = DIA_Orc_8570_TagNor_TeachCrossBow_Condition;
	information = DIA_Orc_8570_TagNor_TeachCrossBow_Info;
	permanent = TRUE;
	description = "Nauč mě, jak střílet z kuše.";
};

func int DIA_Orc_8570_TagNor_TeachCrossBow_Condition()
{
	if(TagNorTeachCrossBow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_TeachCrossBow_Info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_TeachCrossBow_15_00");	//Nauč mě, jak střílet z kuše.
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachCrossBow);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,Dialog_Back,DIA_Orc_8570_TagNor_TeachCrossBow_Back);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow1,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,1)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_1);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow5,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,5)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_5);
};


func void DIA_Orc_8570_TagNor_TeachCrossBow_Back()
{
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachCrossBow);
};

func void DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_1()
{
	if(B_TeachFightTalentPercentOrc(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
	};
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachCrossBow);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,Dialog_Back,DIA_Orc_8570_TagNor_TeachCrossBow_Back);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow1,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,1)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_1);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow5,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,5)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_5);
};

func void DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_5()
{
	if(B_TeachFightTalentPercentOrc(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
	};
	Info_ClearChoices(DIA_Orc_8570_TagNor_TeachCrossBow);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,Dialog_Back,DIA_Orc_8570_TagNor_TeachCrossBow_Back);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow1,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,1)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_1);
	Info_AddChoice(DIA_Orc_8570_TagNor_TeachCrossBow,B_BuildLearnStringForOrc(PRINT_LearnCrossBow5,B_GetLearnCostTalentOrc(other,NPC_TALENT_CROSSBOW,5)),DIA_Orc_8570_TagNor_TeachCrossBow_CROSSBOW_5);
};

instance DIA_Orc_8570_TagNor_FindCrBowIng(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_FindCrBowIng_condition;
	information = DIA_Orc_8570_TagNor_FindCrBowIng_info;
	permanent = TRUE;
	description = "Pokud jde o věci, které jsi potřeboval.";
};

func int DIA_Orc_8570_TagNor_FindCrBowIng_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (AllIngCrBow_All == FALSE) && ((AllIngCrBow_Ore == FALSE) || (AllIngCrBow_Tree == FALSE) || (AllIngCrBow_Horn == FALSE) || (AllIngCrBow_Puma == FALSE) || (AllIngCrBow_Sign == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_info()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_01");	//Pokud jde o věci, které jsi potřeboval.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_02");	//Člověk má ještě co ukázat Tag-Nor?

	Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
	Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,Dialog_Back,DIA_Orc_8570_TagNor_FindCrBowIng_Back);

	if((Npc_HasItems(other,ItMi_Nugget) >= 100) && (AllIngCrBow_Ore == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,"(dát magickou rudu)",DIA_Orc_8570_TagNor_FindCrBowIng_Ore);
	};

	if((Npc_HasItems(other,ItMi_BukTree) >= 1) && (AllIngCrBow_Tree == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,"(dát bukové dřevo)",DIA_Orc_8570_TagNor_FindCrBowIng_Tree);
	};

	if((Npc_HasItems(other,ItAt_BlackTrollHorn) >= 1) && (AllIngCrBow_Horn == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,"(dát roh černého trola)",DIA_Orc_8570_TagNor_FindCrBowIng_Horn);
	};

	if((Npc_HasItems(other,ItAt_PumaMuscle) >= 1) && (AllIngCrBow_Puma == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,"(dát šlachy pumy)",DIA_Orc_8570_TagNor_FindCrBowIng_Puma);
	};

	if((Npc_HasItems(other,ItMi_HuntSign) >= 1) && (AllIngCrBow_Sign == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,"(dát talisman velkého lovce)",DIA_Orc_8570_TagNor_FindCrBowIng_Sign);
	};

	if((Npc_HasItems(other,ItMi_Zeitspalt_Addon) >= 1) && (AllIngCrBow_BlackOre == FALSE))
	{
		Info_AddChoice(DIA_Orc_8570_TagNor_FindCrBowIng,"(dát černou rudu)",DIA_Orc_8570_TagNor_FindCrBowIng_BlackOre);
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Ore()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_03");	//Tady je sto kusů magické rudy, jak jsi chtěl.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_04");	//Hmmm... být dobrý! Člověk dát Tag-Nor.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_05");	//Chytej.
	B_GiveInvItems(other,self,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ItMi_Nugget,Npc_HasItems(self,ItMi_Nugget));
	AllIngCrBow_Ore = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Přinesl jsem Tag-Norovi všechny věci, které žádal. Uvidíme se, co se bude dít dál...");
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Přinesl jsem Tag-Norovi sto kusů magické rudy.");
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Tree()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_06");	//Mám tady kus bukového dřeva.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_07");	//Člověk dát Tag-Nor.
	B_GiveInvItems(other,self,ItMi_BukTree,1);
	Npc_RemoveInvItems(self,ItMi_BukTree,Npc_HasItems(self,ItMi_BukTree));
	AllIngCrBow_Tree = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Přinesl jsem Tag-Norovi všechny věci, které žádal. Uvidíme se, co se bude dít dál...");
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Přinesl jsem Tag-Norovi kus bukového dřeva.");
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Horn()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_09");	//Roh černého jeskynního trola.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_10");	//Skvělé, člověče! Tag-Nor vzít.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_11");	//Tady.
	B_GiveInvItems(other,self,ItAt_BlackTrollHorn,1);
	Npc_RemoveInvItems(self,ItAt_BlackTrollHorn,Npc_HasItems(self,ItAt_BlackTrollHorn));
	AllIngCrBow_Horn = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Přinesl jsem Tag-Norovi všechny věci, které žádal. Uvidíme se, co se bude dít dál...");
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Přinesl jsem Tag-Norovi roh černého jeskynního trola.");
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Puma()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_12");	//Přinesl jsem ti šlachu černé pumy, jak jsi chtěl.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_13");	//Výborně, Tag-Nor rád vezme.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_14");	//Tady máš.
	B_GiveInvItems(other,self,ItAt_PumaMuscle,1);
	Npc_RemoveInvItems(self,ItAt_PumaMuscle,Npc_HasItems(self,ItAt_PumaMuscle));
	AllIngCrBow_Puma = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Přinesl jsem Tag-Norovi všechny věci, které žádal. Uvidíme se, co se bude dít dál...");
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Přinesl jsem Tag-Norovi šlachu černé pumy.");
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Sign()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_15");	//Mám talisman velkého skřetího lovece.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_16");	//Opravdu? Tag-Nor velmi překvapen! Člověk hned ukázat!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_17");	//Tady.
	B_GiveInvItems(other,self,ItMi_HuntSign,1);
	Npc_RemoveInvItems(self,ItMi_HuntSign,Npc_HasItems(self,ItMi_HuntSign));
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_18");	//Ano, to je ono! Člověk najít pravý talisman... Tag-Nor velmi rád!
	AllIngCrBow_Sign = TRUE;

	if((AllIngCrBow_Ore == TRUE) && (AllIngCrBow_Tree == TRUE) && (AllIngCrBow_Horn == TRUE) && (AllIngCrBow_Puma == TRUE) && (AllIngCrBow_Sign == TRUE))
	{
		AllIngCrBow_All = TRUE;
		Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Přinesl jsem Tag-Norovi všechny věci, které žádal. Uvidíme se, co se bude dít dál...");
	}
	else
	{
		B_LogEntry(TOPIC_TagNorGrHunWeap,"Přinesl jsem Tag-Norovi talisman velkého skřetího lovece.");
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_BlackOre()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_19");	//Mám černou rudu.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowIng_01_20");	//Být velmi dobré! Člověk si zatím nechat, ještě bude užitečné.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_21");	//Jak chceš.
	AllIngCrBow_BlackOre = TRUE;
};

func void DIA_Orc_8570_TagNor_FindCrBowIng_Back()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowIng_01_22");	//Zatím nic.
	Info_ClearChoices(DIA_Orc_8570_TagNor_FindCrBowIng);
};

instance DIA_Orc_8570_TagNor_FindCrBowSmithTeacher(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_condition;
	information = DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_info;
	important = FALSE;
	permanent = FALSE;
	description = "Teď už máš všechno.";
};

func int DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (AllIngCrBow_All == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_01");	//Teď už máš všechno. Co dál?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_02");	//Člověk pracoval dobře... Přinesl všechno pro Tag-Nor.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_03");	//Aby práce nebýt zbytečná, člověk musí najít učitele jak vyrobit zbraň.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_04");	//Chceš říct, že tu kuši si mám vyrobit sám?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_05");	//Být opravdu tak. Nebo člověk myslet, že to pro něj udělat Tag-Nor?
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_06");	//No, myslel jsem...
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_07");	//Tag-Nor být jenom lovec a vyrobit zbraň neumí!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_08");	//Člověk najít někoho, kto naučí jak vyrobit.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_09");	//Kdo by to mohl být?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_10");	//Člověk se ptát u stejné lidi jako je on. Možná naučí ten který umí vykovat zbraně.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_11");	//Myslíš kováře. No dobře, rozumím.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_12");	//Dobrá. Když se člověk naučí vyrobit zbraň, on znovu navštívit Tag-Nor.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_FindCrBowSmithTeacher_01_13");	//Tag-Nor pak ríct člověk, co dělat dál.
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Tag-Nor chce, abych našel někoho, kdo by mě naučil vyrábět kuše. Zřejmě bych se měl poptat kolem kovářů.");
	FindSmithTeacherCrBow = TRUE;
};

instance DIA_Orc_8570_TagNor_BeginMakeNimrod(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_BeginMakeNimrod_condition;
	information = DIA_Orc_8570_TagNor_BeginMakeNimrod_info;
	important = FALSE;
	permanent = FALSE;
	description = "Vím, jak vyrábět kuše.";
};

func int DIA_Orc_8570_TagNor_BeginMakeNimrod_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (PlayerTeachCrBowMade == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_BeginMakeNimrod_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_BeginMakeNimrod_01_01");	//Vím, jak vyrábět kuše.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_BeginMakeNimrod_01_02");	//Pokud ano, pak člověk být připraven vytvořit velikou zbraň skřetích lovců!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_BeginMakeNimrod_01_03");	//Co musím udělat?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_BeginMakeNimrod_01_04");	//Člověk vzít tyto dávné spisy skřetů. Tam najít všechno co potřebovat.
	B_GiveInvItems(self,other,ItWr_DragNimrod,1);
	AI_Output(self,other,"DIA_Orc_8570_TagNor_BeginMakeNimrod_01_05");	//Tag-Nor také vrátit všechno, co člověk přinést.
	CreateInvItems(other,ItMi_Nugget,100);
	CreateInvItems(other,ItMi_BukTree,1);
	CreateInvItems(other,ItAt_BlackTrollHorn,1);
	CreateInvItems(other,ItMi_HuntSign,1);
	CreateInvItems(other,ItAt_PumaMuscle,1);
	AI_Output(self,other,"DIA_Orc_8570_TagNor_BeginMakeNimrod_01_06");	//Nyní člověk jít a vrátit se k Tag-Nor, když udělat velkou zbraň!
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Tag-Nor mi dal starověký skřetí spis, ve kterém je popsaná výroba velké skřetí zbraně. Teď už jen dát se do práce.");
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8570_TagNor_GetNimrod(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_GetNimrod_condition;
	information = DIA_Orc_8570_TagNor_GetNimrod_info;
	permanent = FALSE;
	description = "Vytvořil jsem kuši velikého lovce!";
};

func int DIA_Orc_8570_TagNor_GetNimrod_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && ((Npc_HasItems(hero,ITRW_GREATARBALET_ORC_01) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_02) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_03) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_04) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_05) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_GetNimrod_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_01");	//Vytvořil jsem kuši velikého lovce!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_02");	//KHROK NAKAR! (s obdivem) Člověk skutečně udělat? Vytvořit velkou zbraň...
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_03");	//... zbraň hodnou pouze velkých válečníků.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_04");	//Jak vidíš, Tag-Nore! Nelhal bych ti.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_05");	//No, pokud ano... Pak člověk sám být velký válečník. A oprávněně zaslouží nosit!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_06");	//A taky že budu.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_07");	//Tag-Nor není překvapen, že člověk si chce nechat tuto kuši... (směje se) Být téměř neporazitelný s takovou zbraní!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_08");	//Nicméně, Tag-Nor chce požádat člověl o jednu věc.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_09");	//Jakou?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_10");	//(vlezle) Pokud chce, člověk může dát tuto velkou zbraň Tag-Nor?
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_11");	//Co?!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_12");	//Tag-Nor vždycky snít o takové zbrani jako Drag Nimrod! S takovou kuší Tag-Nor získat ještě větší úctu u svých bratří.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_13");	//Na oplátku, člověk může požádat Tag-Nor úplne všechno, co by on chtít!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_14");	//To je hodně nečekaný návrh! Musím si to pečlivě zvážit.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_15");	//Tag-Nor nespěchat. Člověk přemýšlet jak dlouho chce. Tag-Nor bude čekat na jeho odpověď.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GetNimrod_01_16");	//Souhlasím. Zatím si ale kuši nechám, jestli se naurazíš?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GetNimrod_01_17");	//Samozřejmě, že nosit! Zbraň patřit po právu člověk.
	ORCRESPECT = ORCRESPECT + 10;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Reputace u skřetů + 10");
	};

	MIS_TagNorGrHunWeap = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TagNorGrHunWeap,LOG_SUCCESS);
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Řekl jsem Tag-Norovi, že jsem vyrobil Drag Nimrod - kuši velkých skřetích lovců. Ocenil mou práci a nabídl mi dát mu tu zbraň za přiměřenou odměnu. Musím nad jeho návrhem popřemýšlet.");};

instance DIA_Orc_8570_TagNor_GiveNimrod(C_Info)
{
	npc = Orc_8570_TagNor;
	condition = DIA_Orc_8570_TagNor_GiveNimrod_condition;
	information = DIA_Orc_8570_TagNor_GiveNimrod_info;
	permanent = FALSE;
	description = "Pořád ještě chceš tu kuši?";
};

func int DIA_Orc_8570_TagNor_GiveNimrod_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_SUCCESS) && ((Npc_HasItems(hero,ITRW_GREATARBALET_ORC_01) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_02) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_03) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_04) >= 1) || (Npc_HasItems(hero,ITRW_GREATARBALET_ORC_05) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8570_TagNor_GiveNimrod_info()
{
	B_GivePlayerXP(3000);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_01_01");	//Pořád ještě chceš tu kuši?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_02");	//Drag-Nimrod?! (oživle) Tag-Nor už říct člověk, že zbraň skutečně chce vlastnit. Proč se teď ptá?
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_01_03");	//Nakonec jsem se rozhodl, že ti ji dám.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_04");	//Člověk mluvit vážně? Opravdu chce dát Drag Nimrod?
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_01_05");	//Ano, ale rád bych věděl, co dostanu na oplátku.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_06");	//Tag-Nor očekávat tato slova! Tag-Nor chce nabídnout to co nikdo nemůže dát.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_01_07");	//A to je co?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_08");	//Skutečně mistrovská dovednost lovce - být jak vždy zůstat nenápadný, když připlížit na svou kořist.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_09");	//Tag-Nor může ukázat člověk, jak se stát na chvíli neviditelný!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_01_10");	//Děláš si srandu?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_11");	//Tag-Nor nežertuje. (vážně) On se podelit s člověk o toto tajemství, když mu dát Drag-Nimrod!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_12");	//Ale jestli nemá zájem, může se naučit, jak zvýšit svou sílu, obratnost a vitalitu! Tag-Nor může naučit i to.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_01_14");	//Tak, jak člověk vybrat?
	ORCRESPECT = ORCRESPECT + 5;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Reputace u skřetů + 5");
	};

	Info_ClearChoices(DIA_Orc_8570_TagNor_GiveNimrod);
	Info_AddChoice(DIA_Orc_8570_TagNor_GiveNimrod,"Ukaž mi, jak se stát neviditelným.",DIA_Orc_8570_TagNor_GiveNimrod_Hide);
	Info_AddChoice(DIA_Orc_8570_TagNor_GiveNimrod,"Ukaž mi, jak být silnější.",DIA_Orc_8570_TagNor_GiveNimrod_Str);
	Info_AddChoice(DIA_Orc_8570_TagNor_GiveNimrod,"Ukaž mi, jak být obratnější.",DIA_Orc_8570_TagNor_GiveNimrod_Dex);
	Info_AddChoice(DIA_Orc_8570_TagNor_GiveNimrod,"Ukaž mi, jak být houževnatý.",DIA_Orc_8570_TagNor_GiveNimrod_Hlth);
};

func void DIA_Orc_8570_TagNor_GiveNimrod_Hide()
{
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_01");	//Ukaž mi, jak se stát neviditelným.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_02");	//Člověk vybrat nejhodnotnější cenu! Nyní člověk pozorně naslouchat.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_03");	//Za prvé, vzít tento magický elixír.
	B_GiveInvItems(self,other,ItPo_ElixirSHadow,1);
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_04");	//Po pití, stát se duchem a žádná živá duše neuvidí!
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_05");	//A jak dlouho mohu být neviditelný?
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_06");	//Tag-Nor to neví. Ale trvat tak dlouho, dokud se člověk nenechá sám najít.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_07");	//Člověk ale musí dávat pozor na magické tvory! Někteří z nich mohou cítit jeho přítomnost v okolí!
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_08");	//A pak jejich magie zničit působení elixíru.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_09");	//Dobře, Tag-Nore. Všechno jsem pochopil. Vezmi si svou kuši, jak jsme se dohodli.

	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_01) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_01,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_01,Npc_HasItems(self,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_02) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_02,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_02,Npc_HasItems(self,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_03) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_03,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_03,Npc_HasItems(self,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_04) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_04,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_04,Npc_HasItems(self,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_05) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_05,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_05,Npc_HasItems(self,ITRW_GREATARBALET_ORC_05));
	};

	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_10");	//KHROTAK NAK!... (šťastně) Konečně, zbraň velikích skřetích lovců patřit Tag-Nor! On velice děkovat člověk za to.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Hide_01_11");	//No jo, samozřejmě.
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8570_TagNor_GiveNimrod_Str()
{
	B_RaiseAttribute_Bonus(other,ATR_STRENGTH,Bonus_TagNor);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_01");	//Ukaž mi, jak být silnější.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_02");	//Cokoliv řekneš, člověče. Teď poslouchat pozorně.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_03");	//... (vypráví) ...
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_04");	//Nyní člověk být mnohem silnější než předtím.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_05");	//A tady je tvá kuše Tag-Nore. Jak jsme se dohodli.

	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_01) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_01,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_01,Npc_HasItems(self,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_02) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_02,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_02,Npc_HasItems(self,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_03) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_03,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_03,Npc_HasItems(self,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_04) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_04,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_04,Npc_HasItems(self,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_05) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_05,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_05,Npc_HasItems(self,ITRW_GREATARBALET_ORC_05));
	};

	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_06");	//KHROTAK NAK!... (šťastně) Konečně, zbraň velikích skřetích lovců patřit Tag-Nor! On velice děkovat člověk za to.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Str_01_07");	//No jo, samozřejmě.
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8570_TagNor_GiveNimrod_Dex()
{
	B_RaiseAttribute_Bonus(other,ATR_DEXTERITY,Bonus_TagNor);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_01");	//Ukaž mi, jak být obratnější.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_02");	//Cokoliv řekneš, člověče. Teď poslouchat pozorně.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_03");	//... (vypráví) ...
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_04");	//To je vše! Nyní člověk být mnohem obratnější než předtím.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_05");	//A tady je tvá kuše Tag-Nore. Jak jsme se dohodli.


	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_01) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_01,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_01,Npc_HasItems(self,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_02) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_02,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_02,Npc_HasItems(self,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_03) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_03,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_03,Npc_HasItems(self,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_04) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_04,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_04,Npc_HasItems(self,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_05) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_05,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_05,Npc_HasItems(self,ITRW_GREATARBALET_ORC_05));
	};

	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_06");	//KHROTAK NAK!... (šťastně) Konečně, zbraň velikích skřetích lovců patřit Tag-Nor! On velice děkovat člověk za to.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Dex_01_07");	//No jo, samozřejmě.
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8570_TagNor_GiveNimrod_Hlth()
{
	B_RaiseAttribute(other,ATR_HITPOINTS_MAX,Bonus_TagNor_HP);
	Npc_ChangeAttribute(other,ATR_HITPOINTS,Bonus_TagNor_HP);
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_01");	//Ukaž mi, jak být houževnatý.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_02");	//Cokoliv řekneš, člověče. Teď poslouchat pozorně.
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_03");	//... (vypráví) ...
	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_04");	//To je vše! Nyní člověk vydržet mnohem víc uderů než předtím.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_05");	//A tady je tvá kuše Tag-Nore. Jak jsme se dohodli.

	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_01) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_01,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_01,Npc_HasItems(self,ITRW_GREATARBALET_ORC_01));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_02) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_02,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_02,Npc_HasItems(self,ITRW_GREATARBALET_ORC_02));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_03) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_03,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_03,Npc_HasItems(self,ITRW_GREATARBALET_ORC_03));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_04) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_04,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_04,Npc_HasItems(self,ITRW_GREATARBALET_ORC_04));
	};
	if(Npc_HasItems(other,ITRW_GREATARBALET_ORC_05) >= 1)
	{
		B_GiveInvItems(other,self,ITRW_GREATARBALET_ORC_05,1);
		Npc_RemoveInvItems(self,ITRW_GREATARBALET_ORC_05,Npc_HasItems(self,ITRW_GREATARBALET_ORC_05));
	};

	AI_Output(self,other,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_06");	//KHROTAK NAK!... (šťastně) Konečně, zbraň velikích skřetích lovců patřit Tag-Nor! On velice děkovat člověk za to.
	AI_Output(other,self,"DIA_Orc_8570_TagNor_GiveNimrod_Hlth_01_07");	//No jo, samozřejmě.
	AI_StopProcessInfos(self);
};

//--------------------------------------ork torgovets--------------------------------

var int OrcTradeDone_01;
var int OrcTradeDone_02;
var int OrcTradeDone_03;
var int OrcTradeDone_04;
var int OrcTradeDone_05;

instance DIA_Orc_8549_TradeOrc_EXIT(C_Info)
{
	npc = Orc_8549_TradeOrc;
	condition = DIA_Orc_8549_TradeOrc_exit_condition;
	information = DIA_Orc_8549_TradeOrc_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_Orc_8549_TradeOrc_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8549_TradeOrc_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8549_TradeOrc_Trade(C_Info)
{
	npc = Orc_8549_TradeOrc;
	condition = DIA_Orc_8549_TradeOrc_Trade_condition;
	information = DIA_Orc_8549_TradeOrc_Trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};

func int DIA_Orc_8549_TradeOrc_Trade_condition()
{
	return TRUE;
};

func void DIA_Orc_8549_TradeOrc_Trade_info()
{
	AI_Output(other,self,"DIA_Camper01_TRADE_15_00");	//Ukaž mi své zboží.

	if(PlayerKnowsOrcLanguage == FALSE)
	{
		AI_Output(self,other,"DIA_Orc_8215_Kan_PreHello_01_03");	//DABAR KARAD GOR TAK NIR VAK.
		AI_StopProcessInfos(self);
	}
	else
	{
		if((OrcTradeDone_05 == FALSE) && (ORCRESPECT >= 90) && (other.guild != GIL_KDF) && (other.guild != GIL_KDM) && (other.guild != GIL_KDW) && (other.guild != GIL_GUR) && (other.guild != GIL_NOV) && (other.guild != GIL_NDW) && (other.guild != GIL_NDM) && (other.guild != GIL_DMT))
		{
			CreateInvItems(self,ItRu_ShadowMount,1);
			CreateInvItems(self,ItMw_Halleberde_Orc,1);
			OrcTradeDone_05 = TRUE;
		};
		if((OrcTradeDone_04 == FALSE) && (ORCRESPECT >= 70) && (ORCRESPECT < 90))
		{
			CreateInvItems(self,ITMI_QUICKSILVER,2);
			CreateInvItems(self,ItPl_Strength_Herb_01,1);
			CreateInvItems(self,ItMi_Sulfur,4);
			CreateInvItems(self,ITPO_XORCPOTION,1);
			CreateInvItems(self,ItAt_TrollFur,1);
			OrcTradeDone_04 = TRUE;
		};
		if((OrcTradeDone_03 == FALSE) && (ORCRESPECT >= 50) && (ORCRESPECT < 70))
		{
			CreateInvItems(self,ITRW_CROSSBOW_ORC,1);
			CreateInvItems(self,ItPl_Health_Herb_03,2);
			CreateInvItems(self,ItPl_Mushroom_01,5);
			CreateInvItems(self,ItMw_2H_OrcAxe_02,3);
			CreateInvItems(self,ITFO_ADDON_ORCRUM,1);
			CreateInvItems(self,ItAt_ShadowFur,2);
			OrcTradeDone_03 = TRUE;
		};
		if((OrcTradeDone_02 == FALSE) && (ORCRESPECT >= 30) && (ORCRESPECT < 50))
		{
			CreateInvItems(self,ITRW_CROSSBOW_ORC_LIGHT,1);
			CreateInvItems(self,ItMw_2H_OrcAxe_01,5);
			CreateInvItems(self,ITMI_NUGGET,2);
			CreateInvItems(self,ItMi_Coal,10);
			CreateInvItems(self,ItMi_Pitch,3);
			CreateInvItems(self,ItAt_ShadowHorn,2);
			OrcTradeDone_02 = TRUE;
		};
		if((OrcTradeDone_01 == FALSE) && (ORCRESPECT >= 10) && (ORCRESPECT < 30))
		{
			CreateInvItems(self,ItAt_WargFur,3);
			CreateInvItems(self,ItRw_Bolt,50);
			CreateInvItems(self,ItLsTorch,5);
			CreateInvItems(self,ITMI_SNUGGET,15);
			CreateInvItems(self,ItPl_Blueplant,3);
			CreateInvItems(self,ItFoMuttonRaw,10);
			OrcTradeDone_01 = TRUE;
		};
	};
};