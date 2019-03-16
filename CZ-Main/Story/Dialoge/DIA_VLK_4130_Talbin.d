
instance DIA_Talbin_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_EXIT_Condition;
	information = DIA_Talbin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Talbin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Talbin_Runs;

instance DIA_Talbin_HALLO(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 5;
	condition = DIA_Talbin_HALLO_Condition;
	information = DIA_Talbin_HALLO_Info;
	important = TRUE;
};


func int DIA_Talbin_HALLO_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Talbin_HALLO_Info()
{
	AI_Output(self,other,"DIA_Talbin_HALLO_07_00");	//Stůj! Ani hnout!
	AI_Output(other,self,"DIA_Talbin_HALLO_15_01");	//Jo! Jenom klid!
	AI_Output(self,other,"DIA_Talbin_HALLO_07_02");	//No to mě podrž! Další ztracená ovečka, co? Nejdřív jsem tě měl za jednoho z těch zlejch bastardů, co tu pořád vopruzujou.
	AI_Output(self,other,"DIA_Talbin_HALLO_07_03");	//Ale vidím, že k nim nejspíš nepatříš. Na to působíš až moc neškodně!
};


instance DIA_Talbin_WASMACHTIHR(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 6;
	condition = DIA_Talbin_WASMACHTIHR_Condition;
	information = DIA_Talbin_WASMACHTIHR_Info;
	description = "Vypadáš jak lovec, který neví, co s časem!";
};


func int DIA_Talbin_WASMACHTIHR_Condition()
{
	if(Talbin_Runs == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Talbin_WASMACHTIHR_Info()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_15_00");	//Vypadáš jak lovec, který neví, co s časem!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_01");	//Ha-ha! Jo - jedna nula pro tebe. Ale co mám dělat - přes průsmyk se vrátit nemůžu!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_02");	//Tak tu prostě trčím a dělám co se dá.
	if(Npc_IsDead(Engrom) == FALSE)
	{
		AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_03");	//Je mi ale líto mýho kámoše Engroma.
	};
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_04");	//Pojď blíž k ohni a ohřej se.
	Info_ClearChoices(DIA_Talbin_WASMACHTIHR);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR,Dialog_Back,DIA_Talbin_WASMACHTIHR_back);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR,"Ale nevypadáš, že by se ti dařilo nějak špatně.",DIA_Talbin_WASMACHTIHR_gut);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR,"Ty jsi bývalý trestanec, který byl uvržen za bariéru?",DIA_Talbin_WASMACHTIHR_strf);
};

func void DIA_Talbin_WASMACHTIHR_back()
{
	Info_ClearChoices(DIA_Talbin_WASMACHTIHR);
};

func void DIA_Talbin_WASMACHTIHR_strf()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_00");	//Ty jsi bývalý trestanec, který byl uvržen za bariéru?
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_01");	//Ne, kdepak! Co si myslíš? Vlastně jsem se tady chtěl jenom trochu napakovat.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_02");	//Někdo mi napovídal, že v těchhle končinách najdu spoustu věcí.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_03");	//Požehnaný kraj, jestli víš, co myslím.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_04");	//Ale ood tý doby, co se tu objevili ti zatracení skřeti, tu můžeš dostat tak akorát sekyrou do hlavy, když náhodou popojdeš trochu dál!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_05");	//A já pitomec těm idiotům uveřil.
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_06");	//Takové vtipálky moc dobře znám!
};

func void DIA_Talbin_WASMACHTIHR_gut()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_gut_15_00");	//Ale nevypadáš, že by se ti dařilo nějak špatně.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_01");	//No, mohlo to být horší - myslím, že si nemůžu stěžovat. I přes ty zatracený skřety je oblast kolem řeky docela bezpečná.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_02");	//Vypadá to, že si netroufají moc blízko k vodě, ale možná je to jenom náhoda.
};


instance DIA_Talbin_SORRYFORENGROM(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 7;
	condition = DIA_Talbin_SORRYFORENGROM_Condition;
	information = DIA_Talbin_SORRYFORENGROM_Info;
	description = "Proč je ti Engroma líto?";
};


func int DIA_Talbin_SORRYFORENGROM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WASMACHTIHR) && (Npc_IsDead(Engrom) == FALSE) && (Talbin_FollowsThroughPass == 0) && (Kapitel <= 3) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_SORRYFORENGROM_Info()
{
	AI_Output(other,self,"DIA_Talbin_SORRYFORENGROM_15_00");	//Proč je ti Engroma líto?
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_01");	//Protože šel se mnou, a to úplně bez řečí.
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_02");	//A teď jsme se dostali do tohohle srabu. Chamtivost se holt nevyplácí.
};


instance DIA_Talbin_WASJAGDIHR(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 8;
	condition = DIA_Talbin_WASJAGDIHR_Condition;
	information = DIA_Talbin_WASJAGDIHR_Info;
	description = "Co tady u řeky lovíš?";
};


func int DIA_Talbin_WASJAGDIHR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WASMACHTIHR) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_WASJAGDIHR_Info()
{
	AI_Output(other,self,"DIA_Talbin_WASJAGDIHR_15_00");	//Co tady u řeky lovíš?
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_01");	//To je ale otázka! Jen se projdi podél koryta a uvidíš, co tu asi tak můžu lovit. Číhavce, samozřejmě!
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_02");	//Ty potvory se nechytaj zrovna snadno, ale chutnaj mnohem líp, než se lověj.
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_03");	//Jednou za čas narazím i na mrchožrouta. A ani nad ním nevohrnuju nos!
};


instance DIA_Talbin_ENGROMANGRY(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 9;
	condition = DIA_Talbin_ENGROMANGRY_Condition;
	information = DIA_Talbin_ENGROMANGRY_Info;
	description = "Myslím, že tvůj kámoš je trošku vystresovaný.";
};


func int DIA_Talbin_ENGROMANGRY_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Engrom_WhatAboutLeaving) && Npc_KnowsInfo(other,DIA_Talbin_SORRYFORENGROM) && (Npc_IsDead(Engrom) == FALSE) && (Talbin_FollowsThroughPass == 0) && (Kapitel <= 3) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_ENGROMANGRY_Info()
{
	AI_Output(other,self,"DIA_Talbin_ENGROMANGRY_15_00");	//Myslím, že tvůj kámoš je trošku vystresovaný.
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_01");	//Nech si toho. Radši ho vůbec neprovokuj, nebo mě připraví o hlavu. V téhle věci už prostě nemužu nic dělat.
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_02");	//Něco ale vymyslím!
};


instance DIA_Talbin_AskTeacher(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 10;
	condition = DIA_Talbin_AskTeacher_Condition;
	information = DIA_Talbin_AskTeacher_Info;
	description = "Mužeš mě naučit něco o lovu?";
};


func int DIA_Talbin_AskTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WASJAGDIHR) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_AskTeacher_Info()
{
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_00");	//Mužeš mě naučit něco o lovu?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_01");	//Takže jsi dostal taky chuť lovit. No dobře, ale bude tě to něco stát!
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_02");	//Co za to chceš?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_03");	//Nemáš náhodou k jídlu něco jinýho než číhavčí maso? Třeba kus sejra. Jo, dal bych království za kus sejra...
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_04");	//Uvidím, co se dá dělat.
	Log_CreateTopic(TOPIC_Teacher,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher,"Talbin mě naučí, jak ze zvířat získávat trofeje.");
};


instance DIA_Talbin_PayTeacher(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 11;
	condition = DIA_Talbin_PayTeacher_Condition;
	information = DIA_Talbin_PayTeacher_Info;
	permanent = TRUE;
	description = "Tady máš ten sýr. Budeš mě teď učit?";
};


var int DIA_Talbin_PayTeacher_noPerm;

func int DIA_Talbin_PayTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_AskTeacher) && (DIA_Talbin_PayTeacher_noPerm == FALSE) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_PayTeacher_Info()
{
	if(B_GiveInvItems(other,self,ItFo_Cheese,1))
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_00");	//Tady máš ten sýr. Budeš mě teď učit?
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_01");	//Fakt jsi ňejakej sehnal? Páni, chlape, už je to celý věky, kdy jsem baštil něco takovýho. Díky. No a co teď... aha. Nojo. Jasně!
		Talbin_TeachAnimalTrophy = TRUE;
		DIA_Talbin_PayTeacher_noPerm = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_02");	//Teď u sebe zrovna žádný sýr nemám!
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_03");	//Věděl jsem, že je to moc dobrý, aby to byla pravda. Ale určitě mi dej vědět, až ňákej seženeš!
	};
};

var int TalbinTeachAll;

instance DIA_Talbin_TEACHHUNTING(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 12;
	condition = DIA_Talbin_TEACHHUNTING_Condition;
	information = DIA_Talbin_TEACHHUNTING_Info;
	permanent = TRUE;
	description = "Co mě mužeš naučit?";
};


func int DIA_Talbin_TEACHHUNTING_Condition()
{
	if((Talbin_TeachAnimalTrophy == TRUE) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE) && (TalbinTeachAll == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_TEACHHUNTING_Info()
{
	AI_Output(other,self,"DIA_Talbin_TEACHHUNTING_15_00");	//Co mě mužeš naučit?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_01");	//Co bys rád věděl?
		Info_AddChoice(DIA_Talbin_TEACHHUNTING,Dialog_Back,DIA_Talbin_TEACHHUNTING_BACK);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání drápů",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),DIA_Talbin_TEACHHUNTING_Claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,b_buildlearnstringforsmithhunt("Stahování kůží",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Talbin_TEACHHUNTING_Fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání rohů stínových šelem",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),DIA_Talbin_TEACHHUNTING_ShadowHorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING,b_buildlearnstringforsmithhunt("Vyjímání srdcí",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),DIA_Talbin_TEACHHUNTING_Heart);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_02");	//Musím tě zklamat. Už znáš všechno, co bych tě mohl naučit. Ale i tak ešte jednou děkuju za ten sýr!
		TalbinTeachAll = TRUE;
	};
};

func void DIA_Talbin_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_00");	//Drápy vyndáš poměrně jednoduše. Prostě každej popadneš přímo za kloub a přitlačíš dolu.
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_01");	//A pak už ho jenom opatrně vodřízneš nožem.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_00");	//Kůži nejsnáze stáhneš tak, že uděláš dlouhej řez podél břicha...
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_01");	//... pak škubneš za zadní nohy a celou kůži vodzadu dopředu z tý potvory strhneš.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_ShadowHorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00");	//Rohy stínovejch šelem jsou pořádně tvrdý - vyráběj se z nich hlavně sošky a ruzný nástroje.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Heart()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Heart_07_00");	//Srdce magickejch tvoru jsou setsakramentsky vzácný a získáš je fakt těžko. Když to zkusíš, buď pořádně vopatrnej, zvlášť když jde vo golemy.
	};
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};


instance DIA_Talbin_KAP3_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP3_EXIT_Condition;
	information = DIA_Talbin_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP4_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP4_EXIT_Condition;
	information = DIA_Talbin_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP4_WASNEUES(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 13;
	condition = DIA_Talbin_KAP4_WASNEUES_Condition;
	information = DIA_Talbin_KAP4_WASNEUES_Info;
	description = "Nevšiml sis, že by tudy někdo prošel?";
};


func int DIA_Talbin_KAP4_WASNEUES_Condition()
{
	if((Kapitel >= 4) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_WASNEUES_Info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASNEUES_15_00");	//Nevšiml sis, že by tudy někdo prošel?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASNEUES_07_01");	//Jo, nedávno tudy proběhlo pár takovejch divnejch chlápků. Vykračovali si v těch svých naleštěných zbrojích jak pávi a chovali se, jako kdyby sežrali všecku moudrost světa.
};


instance DIA_Talbin_KAP4_WASWOLLTENDJG(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 14;
	condition = DIA_Talbin_KAP4_WASWOLLTENDJG_Condition;
	information = DIA_Talbin_KAP4_WASWOLLTENDJG_Info;
	description = "A co tady ti 'divní chlápkové' chtěli?";
};


func int DIA_Talbin_KAP4_WASWOLLTENDJG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_KAP4_WASNEUES) && (Kapitel >= 4) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_WASWOLLTENDJG_Info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASWOLLTENDJG_15_00");	//A co tady ti 'divní chlápkové' chtěli?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_01");	//Chtěli po mně proviant a vybavení. Chlape, dyk já mám sotva dost pro sebe!
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_02");	//Prý zabíjejí draky a tak. Buhví vodkuď ti hošani přišli, ale nevypadali moc důvěryhodně!
	if(Kapitel == 4)
	{
		B_LogEntry(TOPIC_Dragonhunter,"U sídla lovce Talbina se zastavilo nekolik drakobijců. Popis na ně celkem pasoval.");
	};
};


instance DIA_Talbin_WOENGROM(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 15;
	condition = DIA_Talbin_WOENGROM_Condition;
	information = DIA_Talbin_WOENGROM_Info;
	description = "Ty jsi tu v téhle chvíli sám?";
};


func int DIA_Talbin_WOENGROM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WASMACHTIHR) && (Kapitel >= 4) && (Talbin_FollowsThroughPass == 0) && (EngromIsGone == TRUE) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_WOENGROM_Info()
{
	AI_Output(other,self,"DIA_Talbin_WOENGROM_15_00");	//Ty jsi tu v téhle chvíli sám
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_01");	//Jo. Muj přítel Engrom odešel. Včera řekl, že měl nějakou vizi. Někdo k němu promluvil.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_02");	//Já ale neslyšel ani ťuk. Prostě jsem si myslel, že už se totálne zcvoknul a...
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_03");	//... a pak byl najednou pryč. Nemám tušení, kam se vytratil.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_04");	//Kdybys Engroma náhodou někde zahlídl, tak mu vyřiď, že mi ten hajzl ještě furt dluží kůži z číhavce.
	if(Npc_KnowsInfo(other,DIA_Engrom_WhatAboutLeaving))
	{
		AI_Output(other,self,"DIA_Talbin_WOENGROM_15_05");	//Měl jsem ale dojem, že se odsud nechce hnout, dokud nebudou pryč všichni skřeti.
		AI_Output(self,other,"DIA_Talbin_WOENGROM_07_06");	//Jak jsem řek - je v tom něco divnýho.
	};
	MIS_Tabin_LookForEngrom = LOG_Running;
};


instance DIA_Talbin_FOUNDENGROM(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 16;
	condition = DIA_Talbin_FOUNDENGROM_Condition;
	information = DIA_Talbin_FOUNDENGROM_Info;
	description = "Našel jsem tvého kámoše Engroma.";
};


func int DIA_Talbin_FOUNDENGROM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_WOENGROM) && ((NpcObsessedByDMT_Engrom == TRUE) || Npc_HasItems(other,ItAt_TalbinsLurkerSkin)) && (Kapitel >= 4) && (Talbin_FollowsThroughPass == 0) && (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_FOUNDENGROM_Info()
{
	AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_00");	//Našel jsem tvého kámoše Engroma.
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_01");	//Fakt? A kde je?
	if(Npc_IsDead(Engrom))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_02");	//Je mrtvý.
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_03");	//Ani sem nedoufal, že ho ještě někdy uvidím.
	};
	if(B_GiveInvItems(other,self,ItAt_TalbinsLurkerSkin,1))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_04");	//Tumáš - měl u sebe tuhle číhavčí kuži.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_05");	//Posedli ho Pátrači.
		AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_06");	//Pátrači? A kdo to má jako bejt?
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_07");	//Služebníci Beliara. To oni ve skutečnosti velí všem těm skřetům.
	};
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_08");	//U Innosove! Musím se vocaď dostat, i kdyby mě to mělo stát krk! Teď nebo nikdy!
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_Talbin_Runs,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Talbin_Runs,LOG_Running);
	B_LogEntry(TOPIC_Talbin_Runs,"Talbin, lovec z Hornického údolí, proběhl přes prusmyk, i když měl v patách celé roje krvavých much. Myslím, že míří do Khorinisu.");
	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self,"FleePass");
	Wld_InsertNpc(Snapper,"START");
	Talbin_Runs = TRUE;
};


instance DIA_Talbin_WOHIN(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 17;
	condition = DIA_Talbin_WOHIN_Condition;
	information = DIA_Talbin_WOHIN_Info;
	permanent = TRUE;
	description = "Kam máš namířeno?";
};

func int DIA_Talbin_WOHIN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_FOUNDENGROM) && (Talbin_FollowsThroughPass == 0))
	{
		return TRUE;
	};
};

func void DIA_Talbin_WOHIN_Info()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_15_00");	//Kam máš namířeno?

	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_01");	//Proveď mě průsmykem! Prosím!
		Info_ClearChoices(DIA_Talbin_WOHIN);
		Info_AddChoice(DIA_Talbin_WOHIN,"Nemám na tebe čas.",DIA_Talbin_WOHIN_);
		Info_AddChoice(DIA_Talbin_WOHIN,"Běž dál a prostě projdi.",DIA_Talbin_WOHIN_durch);
		Info_AddChoice(DIA_Talbin_WOHIN,"Dobrá.",DIA_Talbin_WOHIN_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_02");	//Musím se vocaď dostat.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Talbin_WOHIN_ok()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_ok_15_00");	//Dobrá.
	AI_Output(self,other,"DIA_Talbin_WOHIN_ok_07_01");	//Díky ti - proste běž napřed a já půdu za tebou.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"IntoPass");
	Talbin_FollowsThroughPass = LOG_Running;
};

func void DIA_Talbin_WOHIN_durch()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_durch_15_00");	//Běž dál a prostě projdi.
	AI_Output(self,other,"DIA_Talbin_WOHIN_durch_07_01");	//Je tam taková tma - nikdy bych se tam sám nevodvážil.
};

func void DIA_Talbin_WOHIN_()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_schwein_15_00");	//Nemám na tebe čas.
	AI_Output(self,other,"DIA_Talbin_WOHIN_schwein_07_01");	//Takže ty mě tu necháš, aby mě sežraly bestie? Za tohle se budeš smažit v pekle!
	Talbin_FollowsThroughPass = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_VERSCHWINDE(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 15;
	condition = DIA_Talbin_VERSCHWINDE_Condition;
	information = DIA_Talbin_VERSCHWINDE_Info;
	permanent = TRUE;
	description = "Hej.";
};


func int DIA_Talbin_VERSCHWINDE_Condition()
{
	if(Talbin_FollowsThroughPass == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Talbin_VERSCHWINDE_Info()
{
	AI_Output(other,self,"DIA_Talbin_VERSCHWINDE_15_00");	//Hej.
	AI_Output(self,other,"DIA_Talbin_VERSCHWINDE_07_01");	//Zmizni. Zvládnu to i bez tebe ty parchante!
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP5_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP5_EXIT_Condition;
	information = DIA_Talbin_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_KAP6_EXIT(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 999;
	condition = DIA_Talbin_KAP6_EXIT_Condition;
	information = DIA_Talbin_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Talbin_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Talbin_PICKPOCKET(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 900;
	condition = DIA_Talbin_PICKPOCKET_Condition;
	information = DIA_Talbin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Talbin_PICKPOCKET_Condition()
{
	return C_Beklauen(40,25);
};

func void DIA_Talbin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
	Info_AddChoice(DIA_Talbin_PICKPOCKET,Dialog_Back,DIA_Talbin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Talbin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Talbin_PICKPOCKET_DoIt);
};

func void DIA_Talbin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
};

func void DIA_Talbin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
};

instance DIA_Talbin_LostPaladins(C_Info)
{
	npc = VLK_4130_Talbin;
	nr = 10;
	condition = DIA_Talbin_LostPaladins_Condition;
	information = DIA_Talbin_LostPaladins_Info;
	description = "Neviděl jsi náhodou skupinu paladinů?";
};

func int DIA_Talbin_LostPaladins_Condition()
{
	if(MIS_LostPaladins == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Talbin_LostPaladins_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Talbin_LostPaladins_01_00");	//Neviděl jsi náhodou skupinu paladinů?
	AI_Output(self,other,"DIA_Talbin_LostPaladins_01_01");	//Jo viděl, ale těžko tomu říkat skupina.
	AI_Output(other,self,"DIA_Talbin_LostPaladins_01_02");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Talbin_LostPaladins_01_03");	//Viděl jsem jenom jednoho paladina! Tam, na druhé straně řeky. A vypadal těžce raněn.
	AI_Output(other,self,"DIA_Talbin_LostPaladins_01_04");	//A kam šel?
	AI_Output(self,other,"DIA_Talbin_LostPaladins_01_05");	//Šel po řece směrem k hradu. Ale to podle mě nebyl dobrý nápad.
	AI_Output(other,self,"DIA_Talbin_LostPaladins_01_06");	//Proč?
	AI_Output(self,other,"DIA_Talbin_LostPaladins_01_07");	//Ta oblast se jenom hemží skřety! Jistě ho už chytili.
	AI_Output(other,self,"DIA_Talbin_LostPaladins_01_08");	//Chápu.
	HintVenzelOrcs_01 = TRUE;
	B_LogEntry(TOPIC_LostPaladins,"Lovec Talbin viděl na druhé straně řeky zraněného paladina. Možná to byl někdo z Wenzelovi skupiny. Paladin mířil podél řeky smeřem k hradu, ale podle Talbina ho pravděpodobně zajali skřěti.");
};