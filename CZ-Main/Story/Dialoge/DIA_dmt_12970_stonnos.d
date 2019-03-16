
instance DMT_12970_STONNOS_EXIT(C_Info)
{
	npc = dmt_12970_stonnos;
	nr = 999;
	condition = dmt_12970_stonnos_exit_condition;
	information = dmt_12970_stonnos_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_12970_stonnos_exit_condition()
{
	return TRUE;
};

func void dmt_12970_stonnos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_12970_STONNOS_HELLO(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dmt_12970_stonnos_hello_condition;
	information = dmt_12970_stonnos_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12970_stonnos_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE) && (TELLWELCOMEDONE == FALSE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12970_stonnos_hello_info()
{
	if(TELLWHATDONE == FALSE)
	{
		TELLWHATDONE = TRUE;
		if(CHOOSEDARK == TRUE)
		{
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_01");	//Ty! Jdi teď za Strážcem Dagothem!
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_02");	//On nyní bude tvůj instruktor.
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_03");	//Já ti již více pomáhat nebudu.
			AI_StopProcessInfos(self);
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_05");	//Tak, jsi tady... (tajemně) Tak, vítej v našem klášteře, hrdino!
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_06");	//Jak jsi jistě srozuměl, já nyní budu tvůj instruktor.
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_07");	//Ostatní Strážci budou na tvůj osud dohlížet také, ale ne jako já!
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_08");	//Teď tě zajímá jen Kámen, je tvým osudem a budeš jí sloužit, to je to jediné, co tě teď bude zajímat!
			AI_Output(other,self,"DMT_12970_Stonnos_Hello_09");	//Ano mistře, všemu rozumím.
			TELLWELCOMEDONE = TRUE;
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_11");	//Tvá cesta vede ke Strážci Wakonovi, jdi za ním!
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_02");	//On teď bude tvůj instruktor.
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_03");	//Já už ti více nepomohu.
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_15");	//Tvá cesta vede ke Strážci Keliosovi, jdi za ním!
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_02");	//On teď bude tvůj instruktor.
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_03");	//Já už ti více nepomohu.
			AI_StopProcessInfos(self);
		};
	}
	else if(CHOOSESTONE == TRUE)
	{
		AI_Output(self,other,"DMT_12970_Stonnos_Hello_19");	//Takže jsi tady... Vítej v našem klášteře, hrdino!
		AI_Output(self,other,"DMT_12970_Stonnos_Hello_20");	//Jak jsi jistě pochopil, od tohoto okamžiku budu tvůj instruktor.
		AI_Output(self,other,"DMT_12970_Stonnos_Hello_21");	//Ostatní Strážci budou také nahlížet na tvůj osud, ale ne jako já!
		AI_Output(self,other,"DMT_12970_Stonnos_Hello_22");	//Zajímá tě pouze Kámen, který je nyní tvým osudem, tvou modlou a jedinou věcí, která tě zde bude zajímat!
		AI_Output(other,self,"DMT_12970_Stonnos_Hello_23");	//Ano, mistře, všemu rozumím.
		TELLWELCOMEDONE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DMT_12970_Stonnos_Hello_28");	//Už víš co máš dělat.
		AI_StopProcessInfos(self);
	};
};


instance DMT_12970_STONNOS_WHATTEACH(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dmt_12970_stonnos_whatteach_condition;
	information = dmt_12970_stonnos_whatteach_info;
	permanent = TRUE;
	description = "Co se u tebe můžu naučit?";
};


func int dmt_12970_stonnos_whatteach_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == FALSE) && (GUARDIANTEACHMEWAR == FALSE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12970_stonnos_whatteach_info()
{
	AI_Output(other,self,"DMT_12970_Stonnos_WhatTeach_00");	//Co se u tebe můžu naučit?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
	{
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_01");	//No, jako mága... (zamyšleně) Tě můžu cvičit magii svého elementu.
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_03");	//Nemá žádné jméno... (vážně) Ale to je nedůležité! Hlavní věc je, že tyto znalosti jsou nám posvátné a jen velmi málo lidí o nich něco ví.
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_04");	//Jen vyvolení a ti nejlepší z nejlepších mohou porozumět této síle a čeká tě dlouhá cesta, jestli jí chceš porozumět i ty!
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_06");	//Ohledně kruhů magie - tyto znalosti ovládneš bez desetiletí studia jen tehdy, když porozumíš i kruhům magie. V nich tě také můžu pocvičit!
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_24");	//Nyní jsi součástí naší společnosti, našeho kruhu. Přijmi tohle roucho novice, jako symbol našeho řádu.
		CreateInvItems(self,itar_haradrimmage,1);
		B_GiveInvItems(self,other,itar_haradrimmage,1);
		GUARDIANTEACHMEMAGIC = TRUE;
		B_LogEntry(TOPIC_GUARDIANS,"Strážce Stonnos mě může naučit magii Strážců - mám za ním kdykoliv přijít a promluvit si na toto téma.");
		AI_StopProcessInfos(self);
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG) || (hero.guild == GIL_SLD) || (hero.guild == GIL_TPL) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_10");	//No, jako vojáka... Si nemyslím, že bych tě měl zatěžovat magií.
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_11");	//Nicméně, můžeš si promluvit s Tarinaksem - je to instruktor Asgardů, vojáků elementů.
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_12");	//Myslím, že ti pomůže s tvým výcvikem.
		AI_Output(other,self,"DMT_12970_Stonnos_WhatTeach_13");	//Dobrá, zajdu za ním.
		GUARDIANTEACHMEWAR = TRUE;
		B_LogEntry(TOPIC_GUARDIANS,"Ohledně tréninku bych měl promluvit s instruktorem Asgardů, vojáků elementů.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_14");	//Ale ještě nejsi připraven poznat vědění Strážců!
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_15");	//Protože jsi stále příliš slabý, vrať se, až budeš připraven porozumět vědění Strážců.
	};
};


instance DMT_12970_STONNOS_HELLOBACK(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dmt_12970_stonnos_helloback_condition;
	information = dmt_12970_stonnos_helloback_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12970_stonnos_helloback_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE) && (GUARDIANTEACHMEWAR == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12970_stonnos_helloback_info()
{
	AI_Output(self,other,"DMT_12970_Stonnos_HelloBack_01");	//Už víš, co máš dělat.
	AI_StopProcessInfos(self);
};


instance DMT_12970_STONNOS_EXPLAINCIRCLES(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dmt_12970_stonnos_explaincircles_condition;
	information = dmt_12970_stonnos_explaincircles_info;
	permanent = FALSE;
	description = "Prosím, odhalíš mi tajemství kruhů magie?";
};


func int dmt_12970_stonnos_explaincircles_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12970_stonnos_explaincircles_info()
{
	AI_Output(other,self,"DMT_12970_Stonnos_EXPLAINCIRCLES_Info_15_01");	//Prosím, odhalíš mi tajemství kruhů magie?
	AI_Output(self,other,"DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_02");	//S potěšením, kruhy jsou symboly tvého porozumění magii.
	AI_Output(self,other,"DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_03");	//Určují úroveň tvých znalostí, které ti umožní používat další runy.
	AI_Output(self,other,"DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_04");	//Musíš projít každým kruhem, než budeš moci následovat další.
	AI_Output(self,other,"DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_05");	//Dlouhé hodiny tréninku a mnoho zkušeností budeš potřebovat při učení kruhů.
	AI_Output(self,other,"DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_06");	//Ale i přesto, že budeš moci sesílat mocná kouzla, kruhy znamenají mnohem více.
	AI_Output(self,other,"DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_07");	//K porozumění jejich síle musíš nejdříve poznat sebe.
	EXPLAINCIRCLEMEAN = TRUE;
};


var int dia_dmt_12970_stonnos_circle_noperm;

instance DIA_DMT_12970_STONNOS_CIRCLE(C_Info)
{
	npc = dmt_12970_stonnos;
	nr = 99;
	condition = dia_dmt_12970_stonnos_circle_condition;
	information = dia_dmt_12970_stonnos_circle_info;
	permanent = TRUE;
	description = "Chci zvýšit svou magickou dovednost.";
};

func int dia_dmt_12970_stonnos_circle_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) <= 6) && (CHOOSESTONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (DIA_DMT_12970_STONNOS_CIRCLE_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_circle_info()
{
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_CIRCLE_15_00");	//Chci zvýšit svou magickou dovednost.
	Info_ClearChoices(DIA_DMT_12970_STONNOS_CIRCLE);
	Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,Dialog_Back,DIA_DMT_12970_STONNOS_CIRCLE_Back);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,"1. kruh magie (VB: 20)",DIA_DMT_12970_STONNOS_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,"2. kruh magie (VB: 30)",DIA_DMT_12970_STONNOS_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{
		Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,"3. kruh magie (VB: 40)",DIA_DMT_12970_STONNOS_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,"4. kruh magie (VB: 60)",DIA_DMT_12970_STONNOS_CIRCLE_4);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4) && (Kapitel >= 5))
	{
		Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,"5. kruh magie (VB: 80)",DIA_DMT_12970_STONNOS_CIRCLE_5);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5) && (Kapitel >= 5) && (MIS_DarkOrden == LOG_Success) && (MIS_JarCurse == LOG_Success) && (MIS_URNAZULRAGE == LOG_SUCCESS))
	{
		Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,"6. kruh magie (VB: 100)",DIA_DMT_12970_STONNOS_CIRCLE_6);
	}
	else
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_42");	//Ještě nejsi připraven! Vrať se pozděj!
	};
};

func void DIA_DMT_12970_Stonnos_CIRCLE_Back()
{
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_1()
{
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_0A");	//Takže jsi připraven následovat cestu kruhů?
		AI_Output(other,self,"DIA_DMT_12970_Stonnos_CIRCLE_15_01");	//Jsem připraven vstoupit do prvního kruhu.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_01");	//V prvním kruhu se naučíš používat magické runy.
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_0A");	//Takže jsi připraven vstoupit do kruhu magie?
		AI_Output(other,self,"DIA_DMT_12970_Stonnos_CIRCLE_15_02");	//Jsem připraven vstoupit do druhého kruhu.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_09");	//Už umíš porozumět runám. nyní je čas rozšířit tvé znalosti.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_10");	//Ale tyto znalosti jsou jen začátkem tvé cesty. Máš se stále ještě co učit.
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_0A");	//Takže jsi připraven vstoupit do dalšího kruhu magie?
		AI_Output(other,self,"DIA_DMT_12970_Stonnos_CIRCLE_15_03");	//Jaké znalosti zahrnují třetí kruh?
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_16");	//Třetí kruh je zlomový bod v životě každého mága, přestáváš být hledačem.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_17");	//Už jsi doopravdy překročil hranici umění kruhů. Nyní již znáš vše ohledně používání run.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_18");	//Ale tyto znalosti jsou jen začátkem tvé cesty. Nauč se své runy používat efektivněji.
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_0A");	//Jseš připraven následovat další kruh?
		AI_Output(other,self,"DIA_DMT_12970_Stonnos_CIRCLE_15_04");	//Jsem připraven vstoupit do čtvrtého kruhu.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_22");	//Úspěšně jsi již prošel třemi kruhy a nyní je čas porozumět hlubším tajemstvím moci.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_23");	//Základ magie run je runový kámen. Kámen z magické rudy.
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_0A");	//Jsi připraven vstoupit do dalšího kruhu?
		AI_Output(other,self,"DIA_DMT_12970_Stonnos_CIRCLE_15_05");	//Jsem připraven vstoupit do pátého kruhu.
		AI_Output(other,self,"DIA_DMT_12970_Stonnos_CIRCLE_15_5A");	//Staniž se, otěvřu ti znalosti pátého kruhu.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_31");	//Poznej limit tvých možností a naučíš se tajemství síly.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_32");	//Kouzla, která se nyní můžeš naučit jsou velice destruktivní.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_33");	//Takže musíš poznat, kdy přestat jejich síly využívat...
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_34");	//Můžu tě již zasvětit do šestého kruhu.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_35");	//Jen velmi málo z mocných mágů může vstoupit do tohoto kruhu - jejich život se nyní změní.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_39");	//Šestý kruh ti již umožní používat jakékoli runy.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_40");	//Ale nezapomeň - nestaň se vězením síly, ale jejím zdrojem.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_41");	//Prozři své činy!
		DIA_DMT_12970_STONNOS_CIRCLE_NOPERM = TRUE;
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

instance DIA_DMT_12970_STONNOS_TEACH_MANA(C_Info)
{
	npc = dmt_12970_stonnos;
	nr = 10;
	condition = dia_dmt_12970_stonnos_teach_mana_condition;
	information = dia_dmt_12970_stonnos_teach_mana_info;
	permanent = TRUE;
	description = "Chci zvýšit svou sílu ducha.";
};


func int dia_dmt_12970_stonnos_teach_mana_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (hero.attribute[ATR_MANA_MAX] < T_MEGA))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_teach_mana_info()
{
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_TEACH_MANA_15_00");	//Chci zvýšit svou sílu ducha.
	Info_ClearChoices(dia_dmt_12970_stonnos_teach_mana);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,Dialog_Back,dia_dmt_12970_stonnos_teach_mana_back);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12970_stonnos_teach_mana_1);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12970_stonnos_teach_mana_5);
};

func void dia_dmt_12970_stonnos_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_TEACH_MANA_05_00");	//Jsi na hranici možností!
	};
	Info_ClearChoices(dia_dmt_12970_stonnos_teach_mana);
};

func void dia_dmt_12970_stonnos_teach_mana_1()
{
	b_teachattributepointstarinaks(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_dmt_12970_stonnos_teach_mana);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,Dialog_Back,dia_dmt_12970_stonnos_teach_mana_back);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12970_stonnos_teach_mana_1);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12970_stonnos_teach_mana_5);
};

func void dia_dmt_12970_stonnos_teach_mana_5()
{
	b_teachattributepointstarinaks(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_dmt_12970_stonnos_teach_mana);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,Dialog_Back,dia_dmt_12970_stonnos_teach_mana_back);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12970_stonnos_teach_mana_1);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12970_stonnos_teach_mana_5);
};


instance DIA_DMT_12970_STONNOS_RUNEN(C_Info)
{
	npc = dmt_12970_stonnos;
	nr = 99;
	condition = dia_dmt_12970_stonnos_runen_condition;
	information = dia_dmt_12970_stonnos_runen_info;
	permanent = TRUE;
	description = "Nauč mě magii.";
};


func int dia_dmt_12970_stonnos_runen_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_runen_info()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen,"6. kruh magie",dia_dmt_12970_stonnos_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen,"5. kruh magie",dia_dmt_12970_stonnos_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen,"4. kruh magie",dia_dmt_12970_stonnos_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen,"3. kruh magie",dia_dmt_12970_stonnos_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen,"2. kruh magie",dia_dmt_12970_stonnos_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen,"1. kruh magie",dia_dmt_12970_stonnos_runen_1);
	};
};

func void dia_dmt_12970_stonnos_runen_back()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
};

func void dia_dmt_12970_stonnos_runen_1()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Sleep)),dia_dmt_12970_stonnos_runen_circle_1_spl_sleep);
	};
	if(PLAYER_TALENT_RUNES[95] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_BERZERK,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_BERZERK)),dia_dmt_12970_stonnos_runen_circle_3_spl_berzerk);
	};
};

func void dia_dmt_12970_stonnos_runen_2()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_GreenTentacle] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_GreenTentacle,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_GreenTentacle)),dia_dmt_12970_stonnos_runen_circle_2_spl_greententacle);
	};
	if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),dia_dmt_12970_stonnos_runen_circle_2_spl_windfist);
	};
};

func void dia_dmt_12970_stonnos_runen_3()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Fear] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Fear)),dia_dmt_12970_stonnos_runen_circle_3_spl_fear);
	};

	if(PLAYER_TALENT_RUNES[SPL_Charm] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Charm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Charm)),dia_dmt_12970_stonnos_runen_circle_1_spl_charm);
	};

	if(PLAYER_TALENT_RUNES[SPL_Extricate] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Extricate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Extricate)),dia_dmt_12970_stonnos_runen_circle_3_spl_Extricate);
	};
};

func void dia_dmt_12970_stonnos_runen_4()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(PLAYER_TALENT_RUNES[100] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONSWAMPGOLEM,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONSWAMPGOLEM)),dia_dmt_12970_stonnos_runen_circle_5_spl_summonswampgolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_Acid] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Acid,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Acid)),dia_dmt_12970_stonnos_runen_circle_5_spl_Acid);
	};
	if((PLAYER_TALENT_RUNES[SPL_Elevate] == FALSE) && (LegoSpellElevate == TRUE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Elevate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Elevate)),dia_dmt_12970_stonnos_runen_circle_4_spl_Elevate);
	};
};

func void dia_dmt_12970_stonnos_runen_5()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(PLAYER_TALENT_RUNES[96] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_SEVEREFETIDITY,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SEVEREFETIDITY)),dia_dmt_12970_stonnos_runen_circle_4_spl_severefetidity);
	};
	if(PLAYER_TALENT_RUNES[SPL_Whirlwind] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Whirlwind,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Whirlwind)),dia_dmt_12970_stonnos_runen_circle_4_spl_whirlwind);
	};
};

func void dia_dmt_12970_stonnos_runen_6()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(HEROKNOWS_RECEPT_GURU == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_GuruRage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_GuruWrath)),dia_dmt_12970_stonnos_runen_circle_6_recept_guru);
	};
	if(PLAYER_TALENT_RUNES[SPL_Quake] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Quake,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Quake)),dia_dmt_12970_stonnos_runen_circle_6_spl_Quake);
	};
};

func void dia_dmt_12970_stonnos_runen_circle_3_spl_Extricate()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Extricate);
};

func void dia_dmt_12970_stonnos_runen_circle_4_spl_Elevate()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Elevate);
};

func void dia_dmt_12970_stonnos_runen_circle_5_spl_Acid()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Acid);
};

func void dia_dmt_12970_stonnos_runen_circle_6_spl_Quake()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Quake);
};

func void dia_dmt_12970_stonnos_runen_circle_1_spl_sleep()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Sleep);
};

func void dia_dmt_12970_stonnos_runen_circle_1_spl_charm()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Charm);
};

func void dia_dmt_12970_stonnos_runen_circle_2_spl_greententacle()
{
	b_teachplayertalentrunesguardians(self,other,SPL_GreenTentacle);
};

func void dia_dmt_12970_stonnos_runen_circle_2_spl_windfist()
{
	b_teachplayertalentrunesguardians(self,other,SPL_WindFist);
};

func void dia_dmt_12970_stonnos_runen_circle_3_spl_fear()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Fear);
};

func void dia_dmt_12970_stonnos_runen_circle_3_spl_berzerk()
{
	b_teachplayertalentrunesguardians(self,other,SPL_BERZERK);
};

func void dia_dmt_12970_stonnos_runen_circle_4_spl_severefetidity()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SEVEREFETIDITY);
};

func void dia_dmt_12970_stonnos_runen_circle_4_spl_whirlwind()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Whirlwind);
};

func void dia_dmt_12970_stonnos_runen_circle_5_spl_summonswampgolem()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SUMMONSWAMPGOLEM);
};

func void dia_dmt_12970_stonnos_runen_circle_6_recept_guru()
{
	b_teachplayertalentrunesguardians(self,other,SPL_GuruWrath);
};

instance DIA_DMT_12970_STONNOS_GIVEARMORGUARDIANS(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dia_dmt_12970_stonnos_givearmorguardians_condition;
	information = dia_dmt_12970_stonnos_givearmorguardians_info;
	permanent = FALSE;
	description = "Chci jít do Irdorathských síní!";
};

func int dia_dmt_12970_stonnos_givearmorguardians_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_givearmorguardians_info()
{
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_01");	//Chci jít do Irdorathských síní! Můžu od tebe dostat nějakou pomoc?
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_02");	//Hmmm... Strážci nemají zasahovat do průběhu duchovního boje. A ty to víš!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_03");	//Nicméně nemůžeme přehlédnout, že tvůj osud je rozdílný - po tom všem, jsi přece jeden z nás!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_04");	//Každopádně na důkaz naší dobré vůle přijmi tento dar...
	B_GiveInvItems(self,other,ItPo_GuardiansElixir,1);
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_07");	//Díky, mistře.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_08");	//Nyní jdi, mistře elementů, naše požehnání tě provází po zemi.
	AI_StopProcessInfos(self);
};

instance DIA_DMT_12970_STONNOS_GIVEELIGORRUNE(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dia_dmt_12970_stonnos_giveeligorrune_condition;
	information = dia_dmt_12970_stonnos_giveeligorrune_info;
	permanent = FALSE;
	description = "To vše se můžu naučit i u jiných mágů.";
};

func int dia_dmt_12970_stonnos_giveeligorrune_condition()
{
	if((CHOOSESTONE == TRUE) && (DemonologSkill[0] == 6) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_giveeligorrune_info()
{
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_01");	//To vše se můžu naučit i u jiných mágů.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_02");	//Co tím chceš říct?!... (vážně)
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_03");	//Že chci vědět více. O opravdových znalostech, které mě Strážci mohou naučit, chci vědět více!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_04");	//Samozřejmě, že naše tajemství nemůžeš nikdy zcela pochopit. Dokonce jen stěží budeš schopen pochopit některé z nich.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_05");	//Něco, co by tě opravdu zajímalo.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_06");	//Božský původ dokáže čerpat energii Stvořitele! Musíš pochopit, že každá příšera tohoto světa byla stvořena určitým bohem.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_07");	//A tyto bytosti jsou zcela podřízeny svým tvůrcům. My Strážci jsme taky předmětem této síly!
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_08");	//A mohu ji zvládnout?
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_09");	//No ano...(zamyšleně)... Pravda o těchto tvorech je... Dobrá...(potichu)... Na, vem si tuto runu! Chrání magii o které neví nikdo kromě nás.
	CreateInvItems(self,itru_eligordemons,1);
	B_GiveInvItems(self,other,itru_eligordemons,1);
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_10");	//Co je to za runu?!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_11");	//S její pomocí můžeš do tohoto světa povolat bytosti z jiných dimenzí.
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_12");	//Kdo jsou ty bytosti?!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_13");	//Démoni!... (vážně) Démoni z legie Eligora, vládce Langu.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_14");	//Tyto bytosti nám slouží už celá milénia. Nyní budou sloužit tobě!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_15");	//Nicméně pamatuj, že tato runa je tak mocná, že když ji budeš používat ty, její moc bude s každým použitím vyprchávat.
	AI_StopProcessInfos(self);
};


instance DIA_DMT_12970_STONNOS_TASKS(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dia_dmt_12970_stonnos_tasks_condition;
	information = dia_dmt_12970_stonnos_tasks_info;
	permanent = FALSE;
	description = "Nemáš pro mě nějakou práci?";
};


func int dia_dmt_12970_stonnos_tasks_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_tasks_info()
{
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_Tasks_01_01");	//Nemáš pro mě nějakou práci?
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_Tasks_01_02");	//Myslím, že nic... (vážně) Všechno co jsi měl udělat jsi již udělal!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_Tasks_01_03");	//A to ostatní ještě není připraveno.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_Tasks_01_04");	//Nicméně brzy přijde čas, kdy tě zavoláme.
};

instance DMT_12971_STONNOS_EXIT(C_Info)
{
	npc = dmt_12971_stonnos;
	nr = 999;
	condition = dmt_12971_stonnos_exit_condition;
	information = dmt_12971_stonnos_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dmt_12971_stonnos_exit_condition()
{
	return TRUE;
};

func void dmt_12971_stonnos_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DMT_12971_STONNOS_ENDGUARDIANS(C_Info)
{
	npc = dmt_12971_stonnos;
	condition = dia_dmt_12971_stonnos_endguardians_condition;
	information = dia_dmt_12971_stonnos_endguardians_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_dmt_12971_stonnos_endguardians_condition()
{
	if(ALLGUARDIANSNOLEADERISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_dmt_12971_stonnos_endguardians_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_00");	//(panovačně) STŮJ, SMRTELNÍKU!... Zůstaň, kde jsi!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_01");	//Předtím, než se mě vší svou sílou a mocí pokusíš zničit, musím ti něco říct.
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_EndGuardians_01_02");	//A co jako?!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_03");	//Už jsi toho dosáhl hodně, a věřím, že bohové tohoto světa se nezmýlili, když si tě vybrali za svého obránce.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_04");	//Nicméně musíš pochopit, že se ti nikdy nepovede nás porazit. Jsme přece nesmrtelní!
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_EndGuardians_01_05");	//Už jsem to téměř udělal. Zůstává jen doladit detaily.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_06");	//(směje se) Ano, teď je vše trochu jiné.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_07");	//Samozřejmě kvůli tobě teď budeme muset opustit tyhle prostory a ukrýt se v posvátných Vakhanských síních, ve kterých jsme byli stvořeni.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_08");	//Ale povedlo se ti jen oddálit rozsudek smrti pro tenhle svět. Tak si nenamýšlej, že je po všem!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_09");	//Jednou se vrátíme a pokusíme se opět zmařit plány Tvůrců - a ty s tím nic nenaděláš.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_10");	//Takže tohle naše setkání zcela zřejmě nebude poslední, jak by se ti mohlo zdát. Určitě se ještě setkáme, vyvolený!
	B_LogEntry(TOPIC_GUARDIANS,"Když už jsem skoro zvítězil nad Strážci, poslední z nich - Stonnos - se na mne obrátil! Z jeho slov bylo zřejmé, že i když je teď porazím, nic se nezmění. Někdy v budoucnu se Strážci opět vrátí do tohoto světa a pokusí se dokončit své plány. Takže tohle naše setkání zcela zřejmě nebude poslední. Nicméně nějak brzy se to rozhodně nestane.");
	Info_ClearChoices(dia_dmt_12971_stonnos_endguardians);
	Info_AddChoice(dia_dmt_12971_stonnos_endguardians,Dialog_Ende,dia_dmt_12971_stonnos_endguardians_ok);
};

func void dia_dmt_12971_stonnos_endguardians_ok()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};