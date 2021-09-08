/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

func void dia_hun_745_raffa_TrueShot_info - sjednoceny podmínky učení

*/



instance DIA_HUN_745_RAFFA_EXIT(C_Info)
{
	npc = hun_745_raffa;
	nr = 999;
	condition = dia_hun_745_raffa_exit_condition;
	information = dia_hun_745_raffa_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hun_745_raffa_exit_condition()
{
	return TRUE;
};

func void dia_hun_745_raffa_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HUN_745_RAFFA_R(C_Info)
{
	npc = hun_745_raffa;
	nr = 1;
	condition = dia_hun_745_raffa_r_condition;
	information = dia_hun_745_raffa_r_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_hun_745_raffa_r_condition()
{
	if(HEROISHUNTER == FALSE)
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_r_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(other,self,"DIA_HUN_745_R_01_00");	//Kdo jsi?
		AI_Output(self,other,"DIA_HUN_745_R_01_01");	//Moje jméno je Raffa.
		AI_Output(other,self,"DIA_HUN_745_R_01_02");	//Ty jsi také lovec?
		AI_Output(self,other,"DIA_HUN_745_R_01_03");	//Jo.
		AI_Output(other,self,"DIA_HUN_745_R_01_04");	//Ty toho moc nenamluvíš, co?
		AI_Output(self,other,"DIA_HUN_745_R_01_05");	//Nerad mluvím, když nemusím.
		AI_Output(self,other,"DIA_HUN_745_R_01_06");	//Takže jestli si chceš popovídat, Falk toho namluví víc.
	}
	else
	{
		AI_Output(other,self,"DIA_HUN_745_R_01_07");	//Kdo jsi?
		AI_Output(self,other,"DIA_HUN_745_R_01_08");	//Kdo si myslíš, že jsem?
		AI_Output(other,self,"DIA_HUN_745_R_01_09");	//Jsi lovec?
		AI_Output(self,other,"DIA_HUN_745_R_01_10");	//To není tvá věc.
		AI_Output(other,self,"DIA_HUN_745_R_01_12");	//Moc nemluvíš, co?
		AI_Output(self,other,"DIA_HUN_745_R_01_13");	//Jo.
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_745_RAFFA_GREET(C_Info)
{
	npc = hun_745_raffa;
	nr = 1;
	condition = dia_hun_745_raffa_greet_condition;
	information = dia_hun_745_raffa_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_745_raffa_greet_condition()
{
	if((HEROISHUNTER == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_greet_info()
{
	AI_Output(self,other,"DIA_HUN_745_Greet_01_00");	//Áá, nyní jsi jeden z nás!
};


instance DIA_HUN_745_RAFFA_NEWS(C_Info)
{
	npc = hun_745_raffa;
	nr = 3;
	condition = dia_hun_745_raffa_news_condition;
	information = dia_hun_745_raffa_news_info;
	permanent = TRUE;
	description = "Nějaké zajímavé novinky?";
};

func int dia_hun_745_raffa_news_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_news_info()
{
	AI_Output(other,self,"DIA_HUN_745_News_01_00");	//Nějaké zajímavé novinky?

	if((Kapitel >= 1) && (MIS_INSLUKER == FALSE))
	{
		AI_Output(self,other,"DIA_HUN_745_News_01_01");	//Nějaké zajímavé novinky se najdou vždycky... (úsměv)
		AI_Output(self,other,"DIA_HUN_745_News_01_02");	//Například teď nedávno jsem lovil číhavce.
		AI_Output(self,other,"DIA_HUN_745_News_01_07");	//Víš, už dlouho se snažím získat nějaké jejich vejce. Jenže to má jeden háček.
		AI_Output(self,other,"DIA_HUN_745_News_01_09");	//Číhavec pro zkušeného lovce obvykle není nijak vážným protivníkem.
		AI_Output(self,other,"DIA_HUN_745_News_01_10");	//Nicméně, když jde o jejich potomky, číhavci velmi přísně střeží své hnízdo a zběsile ho brání proti vetřelcům.
		AI_Output(self,other,"DIA_HUN_745_News_01_11");	//Ukázalo se, že číhavec, který klade vejce, je extrémně silná a nebezpečná potvora!
		AI_Output(self,other,"DIA_HUN_745_News_01_12");	//Pokusil jsem se jednoho takového sundat, ale prostě to nešlo.
		AI_Output(self,other,"DIA_HUN_745_News_01_13");	//Představ si, to zvíře bylo tak silné, že jsem měl vážné problémy vůbec ho zranit.
		MIS_INSLUKER = LOG_Running;
		Log_CreateTopic(TOPIC_INSLUKER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSLUKER,LOG_Running);
		B_LogEntry(TOPIC_INSLUKER,"Raffa mi povědel neco o číhavcích. Vypadá to, že když chce nekdo vybrat jejich hnízdo, dokáží být opravdu silní. Během jednoho nedávného lovu to Raffa zkusil na vlastní kůži. Chtěl z hnízda sebrat nějaká vejce, ale objevil se jejich strážce, který ho málem zabil. Pokud se do podobné situace dostanu, měl bych si raději dávat pozor.");
		Wld_InsertNpc(egglurker,"FP_ROAM_NW_HUNTEGGLURKER_01");
		Wld_InsertItem(itat_lukeregg,"FP_NW_ITEM_EGGLURKER_01");
	}
	else if((Kapitel >= 2) && (MIS_INSSHADOWBEAST == FALSE) && (MIS_INSLUKER == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_HUN_745_News_01_20");	//Říká se, že se na Lobartově farmě nachází jedno neuvěřitelně velké a podivně vypadající zvíře.
		AI_Output(self,other,"DIA_HUN_745_News_01_21");	//Podle podrobného popisu mi to připomíná stínovou šelmu... (přemýšlí) velmi neobvyklou stínovku.
		AI_Output(other,self,"DIA_HUN_745_News_01_22");	//To je trochu zvláštní?
		AI_Output(self,other,"DIA_HUN_745_News_01_23");	//Jo! Duch stínové šelmy, noční lovec! (vzrušeně) Slyšel jsi někdy o něm?
		AI_Output(other,self,"DIA_HUN_745_News_01_24");	//No. A jaký druh tvora to je?
		AI_Output(self,other,"DIA_HUN_745_News_01_25");	//Je to skoro legenda - silná jako trol a hbytá jako panter!
		AI_Output(self,other,"DIA_HUN_745_News_01_26");	//Je zázrak vidět ji. Hlavne proto, že vetšinou pak už neuvidíš nic...
		AI_Output(self,other,"DIA_HUN_745_News_01_27");	//Zatím ji nikdo neulovil.
		AI_Output(self,other,"DIA_HUN_745_News_01_28");	//Její hlavní znak je, že loví pouze v noci.
		AI_Output(self,other,"DIA_HUN_745_News_01_29");	//Kvůli tomu také dostala svou přezdívku!
		AI_Output(other,self,"DIA_HUN_745_News_01_30");	//Takže ji nikdo nikdy nesundal?
		AI_Output(self,other,"DIA_HUN_745_News_01_31");	//Hodně lidí to zkoušelo, ale nakonec skončila jako banda nešťastníků!
		AI_Output(self,other,"DIA_HUN_745_News_01_32");	//Silnějšího protivníka na zemi jen tak nenajdeš!
		AI_Output(other,self,"DIA_HUN_745_News_01_33");	//A ty sám jsi ji nikdy lovit nezkoušel?
		AI_Output(self,other,"DIA_HUN_745_News_01_34");	//Přemýšlel jsem o tom! Ale ještě mne neomrzel život.
		AI_Output(self,other,"DIA_HUN_745_News_01_35");	//A tobě bych to také neradil.
		AI_Output(self,other,"DIA_HUN_745_News_01_36");	//Netahej smrti za knír, jinak můžeš skončit už nadobro.
		MIS_INSSHADOWBEAST = LOG_Running;
		Log_CreateTopic(TOPIC_INSSHADOWBEAST,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSSHADOWBEAST,LOG_Running);
		B_LogEntry(TOPIC_INSSHADOWBEAST,"Podle Raffy někdo videl za Lobartovou farmou v údolí zvláštní stínovou šelmu. Sám Raffa myslí, že je to přízračná stínová šelma - Lovec Noci! Podle Raffy je prakticky nemožné ji ulovit! Až ji ulovím, mohl bych se ho zeptat na definici slova nemožné...");
		Wld_InsertNpc(nighthunter,"FP_ROAM_NW_HUNTBLOODBEAST_01");
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_745_News_01_39");	//Ne, příteli!
	};
};


instance DIA_HUN_745_RAFFA_INSLUKER(C_Info)
{
	npc = hun_745_raffa;
	nr = 2;
	condition = dia_hun_745_raffa_insluker_condition;
	information = dia_hun_745_raffa_insluker_info;
	permanent = FALSE;
	description = "Mám číhavčí vejce.";
};


func int dia_hun_745_raffa_insluker_condition()
{
	if((MIS_INSLUKER == LOG_Running) && (Npc_HasItems(other,itat_lukeregg) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_insluker_info()
{
	AI_Output(other,self,"DIA_HUN_745_InsLuker_01_00");	//Mám číhavčí vejce.
	AI_Output(self,other,"DIA_HUN_745_InsLuker_01_01");	//Opravdu?!
	B_GiveInvItems(other,self,itat_lukeregg,1);
	Npc_RemoveInvItems(self,itat_lukeregg,1);
	AI_Output(self,other,"DIA_HUN_745_InsLuker_01_03");	//Ukh!... (opatrně) Opravdu, ale jak jsi ho získal?!
	AI_Output(other,self,"DIA_HUN_745_InsLuker_01_04");	//To není důležité!
	AI_Output(other,self,"DIA_HUN_745_InsLuker_01_05");	//Nicméně jsem potkal jednoho velmi velkého číhavce.
	AI_Output(self,other,"DIA_HUN_745_InsLuker_01_06");	//Ty jsi s ním bojoval?!... (udiveně)
	MIS_INSLUKER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSLUKER,LOG_SUCCESS);

	if(Npc_IsDead(egglurker))
	{
		AI_Output(other,self,"DIA_HUN_745_InsLuker_01_07");	//A zabil.
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_08");	//Ha!... Takže je po něm!
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_09");	//Nemyslel jsem, že to bude v tvých silách.
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_11");	//Pak přijmi tuto skromnou odměnu.
		B_GiveInvItems(self,other,ItPo_Perm_Health,1);
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_12");	//Myslím, že si ji zasloužíš.
		AI_Output(other,self,"DIA_HUN_745_InsLuker_01_13");	//Díky!
		B_GivePlayerXP(200);
		B_LogEntry(TOPIC_INSLUKER,"Raffa mi poděkoval za vajíčko číhavce elixírem života.");
	}
	else
	{
		AI_Output(other,self,"DIA_HUN_745_InsLuker_01_14");	//Ne, sotva jsem utekl.
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_15");	//To se ani nedivím, spíše se divím, že se ti vůbec podařilo ukořistit to vejce.
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_16");	//Inu, ne každý boj je jednoduchý.
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_17");	//Přijmi malou odměnu.
		B_GiveInvItems(self,other,ItPo_Health_03,3);
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_18");	//Myslím, že si ji zasloužíš.
		AI_Output(other,self,"DIA_HUN_745_InsLuker_01_19");	//Díky!
		B_GivePlayerXP(100);
		B_LogEntry(TOPIC_INSLUKER,"Raffa mi poděkoval za vejce číhavce.");
	};
};


instance DIA_HUN_745_RAFFA_INSSHADOWBEAST(C_Info)
{
	npc = hun_745_raffa;
	nr = 2;
	condition = dia_hun_745_raffa_insshadowbeast_condition;
	information = dia_hun_745_raffa_insshadowbeast_info;
	permanent = FALSE;
	description = "Přízračná stínová šelma je mrtvá.";
};


func int dia_hun_745_raffa_insshadowbeast_condition()
{
	if((MIS_INSSHADOWBEAST == LOG_Running) && Npc_IsDead(nighthunter) && (Npc_HasItems(other,itat_nighthunterfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_insshadowbeast_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_HUN_745_InsShadowBeast_01_00");	//Přízračná stínová šelma je mrtvá.
	AI_Output(self,other,"DIA_HUN_745_InsShadowBeast_01_01");	//Cože? To nejde!
	AI_Output(other,self,"DIA_HUN_745_InsShadowBeast_01_02");	//Tady máš kůži, jak mi teď definuješ význam slova nejde?!
	B_GiveInvItems(other,self,itat_nighthunterfur,1);
	Npc_RemoveInvItems(self,itat_nighthunterfur,1);
	AI_Output(self,other,"DIA_HUN_745_InsShadowBeast_01_03");	//Nemožné!... (šok) Tomu nemůžu uvěřit!
	AI_Output(self,other,"DIA_HUN_745_InsShadowBeast_01_04");	//Porazil jsi Nočního Lovce... Ale jak?! Vžyť to tolik lidí nepřežilo.
	AI_Output(other,self,"DIA_HUN_745_InsShadowBeast_01_06");	//Tvůj Lovec byl neuvěřitelne silný a rychlý, ale moc mu to nepomohlo!
	AI_Output(self,other,"DIA_HUN_745_InsShadowBeast_01_07");	//Pak potřebuji ještě jednu vec - nazvat te nejlepším lovcem v tomhle posranym rajónu!
	AI_Output(self,other,"DIA_HUN_745_InsShadowBeast_01_08");	//Ani Falk ji nedokázal ulovit, tvrdil že to nešlo!
	AI_Output(self,other,"DIA_HUN_745_InsShadowBeast_01_09");	//Gratuluji, chlape. Jsi nejlepší!
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	MIS_INSSHADOWBEAST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSSHADOWBEAST,LOG_SUCCESS);
	B_LogEntry(TOPIC_INSSHADOWBEAST,"Raffa byl otřesen mým úspěchem! I když pochyboval o mých slovech, přestal, když jsem mu ukázal kůži a prohlásil me nejvetším lovcem na Khorinisu!");
};


instance DIA_HUN_745_RAFFA_RESPECT(C_Info)
{
	npc = hun_745_raffa;
	nr = 4;
	condition = dia_hun_745_raffa_respect_condition;
	information = dia_hun_745_raffa_respect_info;
	permanent = FALSE;
	description = "Chci se stát nejlepším lovcem v táboře.";
};


func int dia_hun_745_raffa_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (RAFFA_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_respect_info()
{
	AI_Output(other,self,"DIA_HUN_745_Respect_01_00");	//Chci se stát nejlepším lovcem v táboře.
	AI_Output(other,self,"DIA_HUN_745_Respect_01_01");	//Mohl bys mi dát svůj hlas?!
	AI_Output(self,other,"DIA_HUN_745_Respect_01_02");	//Hmm... (smích) Ten si musíš zasloužit.
	AI_Output(self,other,"DIA_HUN_745_Respect_01_03");	//Duel s Falkem pak ukáže, kdo je nejlepší.

	if(MIS_INSSHADOWBEAST == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_745_Respect_01_04");	//Nicméně nepochybuji o tom, že máš velkou šanci.
		AI_Output(self,other,"DIA_HUN_745_Respect_01_05");	//Sám jsi složil přízračnou stínovou šelmu!
		AI_Output(self,other,"DIA_HUN_745_Respect_01_06");	//Jsem pro, kdyby se Falk ptal.
		B_LogEntry(TOPIC_HUNTERSWORK,"Raffa mi dal svůj hlas, zato že jsem zabil přízračnou stínovou šelmu.");
		RAFFA_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_745_Respect_01_08");	//Ale nedám ti ho.
		AI_Output(other,self,"DIA_HUN_745_Respect_01_09");	//Proč?!
		AI_Output(self,other,"DIA_HUN_745_Respect_01_10");	//Nejsem si jistý tvými zkušenostmi!
		AI_Output(self,other,"DIA_HUN_745_Respect_01_11");	//Promiň, ale ne!
	};
};


instance DIA_HUN_745_RAFFA_RESPECTDONE(C_Info)
{
	npc = hun_745_raffa;
	nr = 4;
	condition = dia_hun_745_raffa_respectdone_condition;
	information = dia_hun_745_raffa_respectdone_info;
	permanent = TRUE;
	description = "Co řekneš teď?";
};


func int dia_hun_745_raffa_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_745_raffa_respect) && (CANHUNTERCHALLANGE == TRUE) && (RAFFA_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_respectdone_info()
{
	AI_Output(other,self,"DIA_HUN_745_RespectDone_01_00");	//Co řekneš teď?

	if(MIS_INSSHADOWBEAST == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_745_RespectDone_01_02");	//Dám ti svůj hlas!
		AI_Output(self,other,"DIA_HUN_745_RespectDone_01_03");	//Sám jsi složil přízračnou stínovou šelmu!
		B_LogEntry(TOPIC_HUNTERSWORK,"Raffa mi dal svůj hlas, zato že jsem zabil přízračnou stínovou šelmu.");
		RAFFA_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_745_RespectDone_01_05");	//To, co předtím.
	};
};


instance DIA_HUN_745_RAFFA_F(C_Info)
{
	npc = hun_745_raffa;
	nr = 2;
	condition = dia_hun_745_raffa_f_condition;
	information = dia_hun_745_raffa_f_info;
	permanent = FALSE;
	description = "Můžeš mě neco naučit?";
};


func int dia_hun_745_raffa_f_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_f_info()
{
	AI_Output(other,self,"DIA_HUN_745_F_01_00");	//Můžeš mě neco naučit?
	AI_Output(self,other,"DIA_HUN_745_F_01_01");	//No, jako jednomu z nás...
	AI_Output(self,other,"DIA_HUN_745_F_01_02");	//... ti pomohu s lukem.
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry(TOPIC_HUNTERTEACHERS,"Raffa mi pomůže s lukem.");
};


instance DIA_HUN_745_RAFFA_BOW(C_Info)
{
	npc = hun_745_raffa;
	nr = 3;
	condition = dia_hun_745_raffa_bow_condition;
	information = dia_hun_745_raffa_bow_info;
	permanent = TRUE;
	description = "Chci umět lépe střílet.";
};


func int dia_hun_745_raffa_bow_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_745_raffa_f))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_bow_info()
{
	AI_Output(other,self,"DIA_HUN_745_Bow_01_00");	//Chci umět lépe střílet.
	AI_Output(self,other,"DIA_HUN_745_Bow_01_01");	//Dobrá, ale nebude to zadarmo.
	AI_Output(self,other,"DIA_HUN_745_Bow_01_02");	//Nedívej se tak na mě, potřebuji také neco jíst!
	Info_ClearChoices(dia_hun_745_raffa_bow);
	Info_AddChoice(dia_hun_745_raffa_bow,Dialog_Back,dia_hun_745_raffa_bow_back);
	Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_hun_745_raffa_bow_1);
	Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_hun_745_raffa_bow_5);
};

func void dia_hun_745_raffa_bow_back()
{
	Info_ClearChoices(dia_hun_745_raffa_bow);
};

func void dia_hun_745_raffa_bow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90))
	{
		if(RAFFATEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_745_Bow_1_01_01");	//Přesnost záleží na tvé obratnosti.
			AI_Output(self,other,"DIA_HUN_745_Bow_1_01_02");	//A tvá manipulace s lukem na vzdálenosti, na kterou dostřelíš.
			AI_Output(self,other,"DIA_HUN_745_Bow_1_01_03");	//Jen tak se staneš dobrým lučištníkem.
			RAFFATEACHFT = TRUE;
		};
		if((RAFFATEACHST == FALSE) && (other.HitChance[NPC_TALENT_BOW] >= 60))
		{
			AI_Output(self,other,"DIA_HUN_745_Bow_1_01_04");	//Jsi dobrý lovec, ale přišel čas naučit se to, co nevíš.
			AI_Output(self,other,"DIA_HUN_745_Bow_1_01_05");	//Přesnost záleží na tvé obratnosti.
			AI_Output(self,other,"DIA_HUN_745_Bow_1_01_06");	//A tvá manipulace s lukem na vzdálenosti, na kterou dostřelíš!
			AI_Output(self,other,"DIA_HUN_745_Bow_1_01_07");	//Už jsi velmi dobrý, jdi vyzkoušet co umíš.
			RAFFATEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_745_raffa_bow);
		Info_AddChoice(dia_hun_745_raffa_bow,Dialog_Back,dia_hun_745_raffa_bow_back);
		Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_hun_745_raffa_bow_1);
		Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_hun_745_raffa_bow_5);
	};
};

func void dia_hun_745_raffa_bow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90))
	{
		if(RAFFATEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_745_Bow_5_01_01");	//Přesnost záleží na tvé obratnosti.
			AI_Output(self,other,"DIA_HUN_745_Bow_5_01_02");	//A tvá manipulace s lukem na vzdálenosti, na kterou dostřelíš.
			AI_Output(self,other,"DIA_HUN_745_Bow_5_01_03");	//Jen tak se staneš dobrým lučištníkem.
			RAFFATEACHFT = TRUE;
		};
		if((RAFFATEACHST == FALSE) && (other.HitChance[NPC_TALENT_BOW] >= 60))
		{
			AI_Output(self,other,"DIA_HUN_745_Bow_5_01_04");	//Pokud jsi dobrý lovec, nastal čas se dozvědět něco víc.
			AI_Output(self,other,"DIA_HUN_745_Bow_5_01_05");	//Aby ses stal dobrým lukostřelcem potřebuješ zručnost. Je důležité pochopit co to obnáší.
			AI_Output(self,other,"DIA_HUN_745_Bow_5_01_06");	//Zde je dobré vzít si úvahu: míříš okem a natahuješ tětivu, šípem musíš zasáhnout cíl. Ale co je nejdůležiťejší, být vždy ve střehu.
			AI_Output(self,other,"DIA_HUN_745_Bow_5_01_07");	//Tyto techniky ovládáš, jdi si je vyzkoušet.
			RAFFATEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_745_raffa_bow);
		Info_AddChoice(dia_hun_745_raffa_bow,Dialog_Back,dia_hun_745_raffa_bow_back);
		Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_hun_745_raffa_bow_1);
		Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_hun_745_raffa_bow_5);
	};
};


instance DIA_HUN_745_RAFFA_BOWNEED(C_Info)
{
	npc = hun_745_raffa;
	nr = 1;
	condition = dia_hun_745_raffa_bowneed_condition;
	information = dia_hun_745_raffa_bowneed_info;
	permanent = FALSE;
	description = "Jsi něčím zaskočen?";
};


func int dia_hun_745_raffa_bowneed_condition()
{
	if((Kapitel >= 1) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_bowneed_info()
{
	AI_Output(other,self,"DIA_HUN_745_BowNeed_01_00");	//Jsi něčím zaskočen?
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_01");	//Eh, chlape. Mým lukem.
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_03");	//Při posledním lovu se mi zlomil!
	AI_Output(other,self,"DIA_HUN_745_BowNeed_01_06");	//Proč sis nekoupil nový?!
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_07");	//Dlouho jsem nebyl ve měste a bez luku odsud neodejdu!
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_08");	//Nemám se jak bránit proti bestiím po cestě a banditům.
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_12");	//A luk mi už tolikrát zachránil kůži, zatraceně!
	AI_Output(other,self,"DIA_HUN_745_BowNeed_01_13");	//Můžu ti nějak pomoci získat nový?
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_16");	//To bys opravdu udělal?!... (s nadejí) To by od tebe bylo přinejmenším šlechetné!
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_17");	//Nicméně potřebuji jeden určitý luk!
	AI_Output(other,self,"DIA_HUN_745_BowNeed_01_18");	//A jaký pak to je?
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_19");	//Hmm... Z těch, které ovládám by mohl být lehko získatelný skládaný luk.
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_20");	//Je složen z několika druhů dřeva!
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_21");	//Jestli bys mi ho opravdu přinesl, budu ti vděčný!
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_25");	//Nespěchám na tebe, ale prosím, zkus to rychle.
	MIS_RAFFABOW = LOG_Running;
	Log_CreateTopic(TOPIC_RAFFABOW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RAFFABOW,LOG_Running);
	B_LogEntry(TOPIC_RAFFABOW,"Raffa si zlomil svůj starý luk. Potřebuje skládaný luk, aby mohl vyjít na lov. Mohl by ho mít nějaký obchodník anebo se porozhlédnu v přírode.");
	AI_StopProcessInfos(self);
};


instance DIA_HUN_745_RAFFA_BOWDONE(C_Info)
{
	npc = hun_745_raffa;
	nr = 1;
	condition = dia_hun_745_raffa_bowdone_condition;
	information = dia_hun_745_raffa_bowdone_info;
	permanent = FALSE;
	description = "Mám ten luk.";
};


func int dia_hun_745_raffa_bowdone_condition()
{
	if((HEROISHUNTER == TRUE) && (MIS_RAFFABOW == LOG_Running) && (Npc_HasItems(other,ItRw_Bow_M_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_bowdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_745_BowDone_01_00");	//Mám ten luk.
	AI_Output(self,other,"DIA_HUN_745_BowDone_01_01");	//Opravdu?!... Ukaž mi ho!
	AI_Output(other,self,"DIA_HUN_745_BowDone_01_02");	//Tady.
	B_GiveInvItems(other,self,ItRw_Bow_M_01,1);
	AI_Output(self,other,"DIA_HUN_745_BowDone_01_03");	//Výborně! Nyní můžu opet lovit!
	EquipItem(self,ItRw_Bow_M_01);
	AI_Output(other,self,"DIA_HUN_745_BowDone_01_05");	//Ukážeš mi nějaký trik s lukem?
	AI_Output(self,other,"DIA_HUN_745_BowDone_01_06");	//Jistě, poslouchej!
	AI_Output(self,other,"DIA_HUN_745_BowDone_01_07");	//Při příští střelbě zkus držet dráhu střely v jednom smeru.
	AI_Output(self,other,"DIA_HUN_745_BowDone_01_08");	//Je velmi nepřesné střílet obloukem, takže napni luk více a střel.
	AI_Output(self,other,"DIA_HUN_745_BowDone_01_09");	//Neboj se, luk to vydrží, ale zas ho nepřepínej!
	AI_Output(self,other,"DIA_HUN_745_BowDone_01_10");	//Jdi si to zkusit!
	MIS_RAFFABOW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RAFFABOW,LOG_SUCCESS);
	B_LogEntry(TOPIC_RAFFABOW,"Raffa byl tak vděčný, že mi pomohl vylepšit mou střelbu.");
	b_teachfighttalentpercentfree(self,other,NPC_TALENT_BOW,5,100);
};


instance DIA_HUN_745_RAFFA_PICKPOCKET(C_Info)
{
	npc = hun_745_raffa;
	nr = 900;
	condition = dia_hun_745_raffa_pickpocket_condition;
	information = dia_hun_745_raffa_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_hun_745_raffa_pickpocket_condition()
{
	return C_Beklauen(100,350);
};

func void dia_hun_745_raffa_pickpocket_info()
{
	Info_ClearChoices(dia_hun_745_raffa_pickpocket);
	Info_AddChoice(dia_hun_745_raffa_pickpocket,Dialog_Back,dia_hun_745_raffa_pickpocket_back);
	Info_AddChoice(dia_hun_745_raffa_pickpocket,DIALOG_PICKPOCKET,dia_hun_745_raffa_pickpocket_doit);
};

func void dia_hun_745_raffa_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_hun_745_raffa_pickpocket);
};

func void dia_hun_745_raffa_pickpocket_back()
{
	Info_ClearChoices(dia_hun_745_raffa_pickpocket);
};


instance DIA_HUN_745_RAFFA_TRADEBOW(C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_tradebow_condition;
	information = dia_hun_745_raffa_tradebow_info;
	permanent = FALSE;
	description = "Kde seženu nějaký lepší luk?";
};


func int dia_hun_745_raffa_tradebow_condition()
{
	if((HEROISHUNTER == TRUE) && (MIS_RAFFABOW == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_tradebow_info()
{
	AI_Output(other,self,"DIA_HUN_745_TradeBow_01_00");	//Kde seženu nějaký lepší luk?
	AI_Output(self,other,"DIA_HUN_745_TradeBow_01_01");	//Náhodou tu nějaké mám, pojď, vybereme ti neco!
	Log_CreateTopic(TOPIC_HUNTERTRADES,LOG_NOTE);
	B_LogEntry(TOPIC_HUNTERTRADES,"Raffa prodává luky a šípy.");
	RAFFACANTRADE = TRUE;
};


instance DIA_HUN_745_RAFFA_TRADE(C_Info)
{
	npc = hun_745_raffa;
	nr = 775;
	condition = dia_hun_745_raffa_trade_condition;
	information = dia_hun_745_raffa_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi, co máš na skladě.";
};


func int dia_hun_745_raffa_trade_condition()
{
	if((RAFFACANTRADE == TRUE) && Wld_IsTime(8,0,23,0))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_HUN_745_Trade_01_01");	//Ukaž mi, co máš na skladě.

	if((HunBelt_01 == FALSE) && (HEROISHUNTER == TRUE))
	{
		CreateInvItems(self,ItBe_Addon_Custom_01,1);
		HunBelt_01 = TRUE;
	};
	if((HunBelt_02 == FALSE) && (HEROISHUNTER == TRUE) && (Know_HuntArmor_01 == TRUE) && (MIS_LETTERFALK == LOG_SUCCESS))
	{
		CreateInvItems(self,ItBe_Addon_Custom_02,1);
		HunBelt_02 = TRUE;
	};
	if((HunBelt_03 == FALSE) && (HEROISHUNTER == TRUE) && (Know_HuntArmor_02 == TRUE) && (MIS_INSSHADOWBEAST == LOG_SUCCESS))
	{
		CreateInvItems(self,ItBe_Addon_Custom_03,1);
		HunBelt_03 = TRUE;
	};
	if((HunBelt_04 == FALSE) && (HEROISHUNTER == TRUE) && (Know_HuntArmor_03 == TRUE) && (MIS_HUNTERCHALLANGE == LOG_SUCCESS))
	{
		CreateInvItems(self,ItBe_Addon_Custom_04,1);
		HunBelt_04 = TRUE;
	};
	if((HunBelt_05 == FALSE) && (HEROISHUNTER == TRUE) && (Know_HuntArmor_04 == TRUE) && (Kapitel >= 4))
	{
		CreateInvItems(self,ItBe_Addon_BT_01,1);
		HunBelt_05 = TRUE;
	};

	B_GiveTradeInv(self);
	RAFFATELLSPECIAL = TRUE;
};


instance DIA_HUN_745_RAFFA_RAFFATELLSPECIAL(C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_raffatellspecial_condition;
	information = dia_hun_745_raffa_raffatellspecial_info;
	permanent = FALSE;
	description = "Máš velmi dobrou nabídku luků!";
};


func int dia_hun_745_raffa_raffatellspecial_condition()
{
	if(RAFFATELLSPECIAL == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_raffatellspecial_info()
{
	AI_Output(other,self,"DIA_HUN_745_TellSpecial_01_00");	//Máš velmi dobrou nabídku luků!
	AI_Output(self,other,"DIA_HUN_745_TellSpecial_01_01");	//Díky, ale podobné najdeš i u ostatních obchodníků...
	AI_Output(self,other,"DIA_HUN_745_TellSpecial_01_02");	//Zajímavější jsou luky, které jsou z jiných materiálů než dřevo.
	AI_Output(other,self,"DIA_HUN_745_TellSpecial_01_03");	//Co tím myslíš?
	AI_Output(self,other,"DIA_HUN_745_TellSpecial_01_04");	//No, třeba luky a kuše, které nejsou podobné těm bežným!
	AI_Output(self,other,"DIA_HUN_745_TellSpecial_01_05");	//Jestli nějakou takovou zbraň najdeš, určitě ji od tebe koupím.
	AI_Output(self,other,"DIA_HUN_745_TellSpecial_01_06");	//Samozřejmě za velmi dobrou cenu!
	MIS_RAFFATELLSPECIAL = LOG_Running;
	Log_CreateTopic(TOPIC_RAFFATELLSPECIAL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RAFFATELLSPECIAL,LOG_Running);
	B_LogEntry(TOPIC_RAFFATELLSPECIAL,"Raffa mi dobře zaplatí za jakýkoli luk a kuši, které budou oproti ostatním výjimečné.");
};


instance DIA_HUN_745_RAFFA_RAFFATELLSPECIALDONE(C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_raffatellspecialdone_condition;
	information = dia_hun_745_raffa_raffatellspecialdone_info;
	permanent = TRUE;
	description = "Mám pro tebe opravdu výjimečnou zbraň.";
};


func int dia_hun_745_raffa_raffatellspecialdone_condition()
{
	if((MIS_RAFFATELLSPECIAL == LOG_Running) && (Npc_HasItems(other,itrw_addon_magiccrossbow_shv) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_raffatellspecialdone_info()
{
	AI_Output(other,self,"DIA_HUN_745_TellSpecialDone_01_00");	//Mám pro tebe opravdu výjimečnou zbraň.
	AI_Output(self,other,"DIA_HUN_745_TellSpecialDone_01_01");	//Skutečně? Ukaž!
	Info_ClearChoices(dia_hun_745_raffa_raffatellspecialdone);
	Info_AddChoice(dia_hun_745_raffa_raffatellspecialdone,Dialog_Back,dia_hun_745_raffa_raffatellspecialdone_back);
	if(Npc_HasItems(other,itrw_addon_magiccrossbow_shv) >= 1)
	{
		Info_AddChoice(dia_hun_745_raffa_raffatellspecialdone,"(dát 'Exekutora')",dia_hun_745_raffa_raffatellspecialdone_magiccrossbowextro);
	};
};

func void dia_hun_745_raffa_raffatellspecialdone_back()
{
	Info_ClearChoices(dia_hun_745_raffa_raffatellspecialdone);
};

func void dia_hun_745_raffa_raffatellspecialdone_magiccrossbowextro()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_01");	//Vezmu jed, že něco takového jsi ještě nikdy neviděl.
	B_GiveInvItems(other,self,itrw_addon_magiccrossbow_shv,1);
	AI_Output(self,other,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_02");	//(fascinovaně) Neuvěřitelné. Taková zbraň!
	AI_Output(self,other,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_03");	//Musí být prastará, dívej na ty nápisy! I když v jazyku, kterému nerozumím.
	AI_Output(self,other,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_07");	//Co říkáš na 2000 zlatých?
	AI_Output(self,other,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_09");	//Samozřejmě, že je mnohem dražší! Ale víc už nemůžu nabídnout.
	AI_Output(self,other,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_10");	//To je všechno zlato, co mám!
	AI_Output(other,self,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_11");	//Dobrá.
	AI_Output(self,other,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_12");	//Tak tady máš, vem si ho.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,itrw_addon_magiccrossbow_shv,1);
	B_LogEntry(TOPIC_RAFFATELLSPECIAL,"Dal jsem Raffovi prastarou zbraň jménem 'Exekutor', kterou jsem našel ve Městě mrtvých.");
	MIS_RAFFATELLSPECIAL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RAFFATELLSPECIAL,LOG_SUCCESS);
	Info_ClearChoices(dia_hun_745_raffa_raffatellspecialdone);
};

var int RaffaCanTeachTrueShot;

instance DIA_HUN_745_RAFFA_TrueShot(C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_TrueShot_condition;
	information = dia_hun_745_raffa_TrueShot_info;
	permanent = FALSE;
	description = "Potřebuji tvou radu!";
};

func int dia_hun_745_raffa_TrueShot_condition()
{
	if((HEROISHUNTER == TRUE) && (MIS_RAFFABOW == LOG_SUCCESS) && (RaffaCanTeachTrueShot == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_TrueShot_info()
{
	AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_01_00");	//Potřebuji tbou radu!
	AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_01");	//Co je to?
	AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_01_02");	//Víš, někdy se mi nepodaří způsobit sebemenší poškození.
	AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_03");	//Ach, to je to co... (smích) Nemůžu pokračovat! Už je mi vše jasné.
	AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_04");	//Tohle je velký problém toho, kdo používá výhradně luky.
	AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_05");	//Nicméně, existuje několik způsobů natažení, ve kterých budou tvoje střely prorážet všechny zbroje i kůže.
	AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_01_06");	//A učit mě můžete?

 	if((hero.attribute[ATR_DEXTERITY] >= 125) && (hero.HitChance[NPC_TALENT_BOW] >= 50))
	{
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_07");	//Zajímavé... Můžu ti to ukázat! Ale budeš muset mít nějaké zkušenosti se střelnými zbraňemi.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_08");	//A zlato si taky neodpírávám.
		AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_01_09");	//Chápu.
		RaffaCanTeachTrueShot = TRUE;
		B_LogEntry(TOPIC_HUNTERTEACHERS,"Raffa mě může učit speciální techniky lukostřelby.");
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_10");	//A to proč?... (vzrušeně) 
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_11");	//Nechceš dojem muže, který radši bojuje v boji s lukem místo meče.
		AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_01_12");	//A cože?!
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_13");	//Víš, s takovýma jako ty nebudu ztrácet čas. Nemám ho moc!
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_14");	//Lepší je se naučit pořádně ovládat luk, zvýšit svou obratnost. A až pak mluvit!
	};
};

instance DIA_HUN_745_RAFFA_TrueShot_Again(C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_TrueShot_Again_condition;
	information = dia_hun_745_raffa_TrueShot_Again_info;
	permanent = TRUE;
	description = "Teď už střílím dobře?";
};

func int dia_hun_745_raffa_TrueShot_Again_condition()
{
	if(Npc_KnowsInfo(other,DIA_HUN_745_raffa_TrueShot) && (RaffaCanTeachTrueShot == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_TrueShot_Again_info()
{
	AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_Again_01_00");	//Teď už střílím dobře?
	AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_01");	//Hmmm... (zamyšleně)

	if((hero.attribute[ATR_DEXTERITY] >= 125) && (hero.HitChance[NPC_TALENT_BOW] >= 50))
	{
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_02");	//Teď je opravdu vidět že přede mnou stojí muž chytrý a ví, jak zacházet s lukem.
		AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_Again_01_03");	//Takže mě už koněčne ty techniky naučíte?
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_04");	//Zajímavé... Můžu ti to ukázat! Ale budeš muset mít nějaké zkušenosti se střelnými zbraňemi.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_05");	//A zlato si taky neodpírávám.
		RaffaCanTeachTrueShot = TRUE;
		B_LogEntry(TOPIC_HUNTERTEACHERS,"Raffa mě může učit speciální techniky lukostřelby.");
	}
	else
	{
	 	if(hero.HitChance[NPC_TALENT_BOW] < 50)
		{
			AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_07");	//Ne, ty jsi pouhý začátečník!
			AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_08");	//Takže přijď později až budeš zručnější.
			Print("Vyžadována dovednost ve střelbě z luku alespoň na úrovni 50%...");
		}
		else if(hero.attribute[ATR_DEXTERITY] < 125)
		{
			AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_09");	//S lukem to sice umíš ale tvá obratnost je mizerná!
			AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_10");	//Takže přijď později až budeš obratnější.
			Print("Vyžadováno alespoň 125 bodů obratnosti...");
		};
	};
};

instance DIA_HUN_745_RAFFA_TrueShotTeach(C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_TrueShotTeach_condition;
	information = dia_hun_745_raffa_TrueShotTeach_info;
	permanent = TRUE;
	description = "Nauč mě střelecké techniky. (VB: 25, cena: 10000 zlatých)";
};

func int dia_hun_745_raffa_TrueShotTeach_condition()
{
	if((RaffaCanTeachTrueShot == TRUE) && (TrueShot == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_TrueShotTeach_info()
{
	AI_Output(other,self,"DIA_HUN_745_raffa_TrueShotTeach_01_00");	//Nauč mě střelecké techniky.

	if((hero.lp >= 25) && (Npc_HasItems(other,ItMi_Gold) >= 10000))
	{
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_01");	//Dobře, soustřeď se.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_02");	//Není důležité zasáhnout cíl. Hlavní je - technika střelby!
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_03");	//Každá bytost má svou slabinu. Využij ji.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_04");	//Zpočátku to možná půjde blbě, ale se zkušenostmi na to člověk přijde.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_05");	//Nezapomínej stále cvičit a vylepšovat své schopnosti. 
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_06");	//A pak nebude protivníka!
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_07");	//Uvědom si taky že vše zavisí na vzdálenosti tebe a cíle.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_08");	//Pokud šíp poletí příliš dlouho ke svému cíli, nezpůsobí tak mnoho škod.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_09");	//Čím je blíže, tím větší škodu může způsobit. Jasné?
		AI_Output(other,self,"DIA_HUN_745_raffa_TrueShotTeach_01_10");	//Ano, vypadá že jo.
		hero.lp = hero.lp - 25;
		RankPoints = RankPoints + 25;
		Npc_RemoveInvItems(hero,ItMi_Gold,10000);
		TrueShot = TRUE;
		AI_Print("Naučeno: Průrazná střela");
		Snd_Play("LevelUP");
	}
	else
	{
		if(hero.lp < 25)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_08");	//Je mi líto kámo! Vrať se až budeš mít víc zkušeností.
		}
		else
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_09");	//Je mi líto kámo! Ale nebudu tě učit.
		};
	};
};