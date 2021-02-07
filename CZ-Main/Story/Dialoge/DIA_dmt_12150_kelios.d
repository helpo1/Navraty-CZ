/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(6x) CanLearnMagicCircleNext_ABCZ - upraveny podmínky učení se magických kruhů (na žádost hráčů)

*/



instance DMT_12150_KELIOS_EXIT(C_Info)
{
	npc = dmt_12150_kelios;
	nr = 999;
	condition = dmt_12150_kelios_exit_condition;
	information = dmt_12150_kelios_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_12150_kelios_exit_condition()
{
	return TRUE;
};

func void dmt_12150_kelios_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_12150_KELIOS_HELLO(C_Info)
{
	npc = dmt_12150_kelios;
	condition = dmt_12150_kelios_hello_condition;
	information = dmt_12150_kelios_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12150_kelios_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE) && (TELLWELCOMEDONE == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12150_kelios_hello_info()
{
	if(TELLWHATDONE == FALSE)
	{
		TELLWHATDONE = TRUE;
		if(CHOOSEDARK == TRUE)
		{
			AI_Output(self,other,"DMT_12150_Kelios_Hello_01");	//Jdi za Strážcem Dagothem!
			AI_Output(self,other,"DMT_12150_Kelios_Hello_02");	//Nyní bude on tvým instruktorem.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_03");	//Já ti více nepomohu.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_04");	//Jdi!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other,"DMT_12150_Kelios_Hello_05");	//Jdi za Strážcem Stonnosem!
			AI_Output(self,other,"DMT_12150_Kelios_Hello_02");	//Nyní bude on tvým instruktorem.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_03");	//Já ti více nepomohu.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_04");	//Jdi!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other,"DMT_12150_Kelios_Hello_09");	//Jdi za Strážcem Wakonem!
			AI_Output(self,other,"DMT_12150_Kelios_Hello_02");	//Nyní bude on tvým instruktorem.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_03");	//Já ti více nepomohu.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_04");	//Jdi!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other,"DMT_12150_Kelios_Hello_13");	//Takže jsi zde... Vítej v našem klášteře, hrdino!
			AI_Output(self,other,"DMT_12150_Kelios_Hello_14");	//Jak jsi jistě porozuměl, já budu tvým instruktorem.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_15");	//Ostatní Strážci budou také sledovat tvůj osud, ale ne tak pozorně jako já!
			AI_Output(self,other,"DMT_12150_Kelios_Hello_16");	//Nyní je jen Oheň, nic jiného tě teď nemusí zajímat, jasné?!
			AI_Output(other,self,"DMT_12150_Kelios_Hello_17");	//Ano, mistře! Všemu rozumím.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_18");	//Dobrá...
			TELLWELCOMEDONE = TRUE;
		};
	}
	else if(CHOOSEFIRE == TRUE)
	{
		AI_Output(self,other,"DMT_12150_Kelios_Hello_19");	//Takže jsi zde... Vítej v našem klášteře, hrdino!
		AI_Output(self,other,"DMT_12150_Kelios_Hello_20");	//Jak jsi jistě porozuměl, já budu tvým instruktorem.
		AI_Output(self,other,"DMT_12150_Kelios_Hello_21");	//Ostatní Strážci budou také sledovat tvůj osud, ale ne tak pozorně jako já!
		AI_Output(self,other,"DMT_12150_Kelios_Hello_22");	//Nyní je jen Oheň, nic jiného tě teď nemusí zajímat, jasné!
		AI_Output(other,self,"DMT_12150_Kelios_Hello_23");	//Ano, mistře! Všemu rozumím.
		TELLWELCOMEDONE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DMT_12150_Kelios_Hello_28");	//Nyní víš, kdo tě zde bude učit.
		AI_Output(self,other,"DMT_12150_Kelios_Hello_04");	//Jdi!
		AI_StopProcessInfos(self);
	};
};


instance DMT_12150_KELIOS_WHATTEACH(C_Info)
{
	npc = dmt_12150_kelios;
	condition = dmt_12150_kelios_whatteach_condition;
	information = dmt_12150_kelios_whatteach_info;
	permanent = TRUE;
	description = "Můžu se od tebe učit?";
};


func int dmt_12150_kelios_whatteach_condition()
{
	if((CHOOSEFIRE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == FALSE) && (GUARDIANTEACHMEWAR == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12150_kelios_whatteach_info()
{
	AI_Output(other,self,"DMT_12150_Kelios_WhatTeach_00");	//Můžu se od tebe učit?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
	{
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_01");	//No, jako mága... (zamyšleně) Tě můžu cvičit magii svého elementu.
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_03");	//Magie Ohně... Nemá žádné jméno... (vážně) Ale to je nedůležité! Hlavní věc je, že tyto znalosti jsou nám posvátné a jen velmi málo lidí o nich něco ví.
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_04");	//Jen vyvolení a ti nejlepší z nejlepších mohou porozumět této síle a čeká tě dlouhá cesta, jestli jí chceš porozumět i ty!
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_06");	//Přirozeně... (úsměv) Nicméně rozuměj, že nestačí být pouze mág, abys je mohl použít, ale musíš také být schopen pohltit takové síly, abys tuto magii mohl užívat.
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_24");	//Nyní jsi součástí naší společnosti, našeho kruhu. Přijmi tohle roucho novice, jako symbol našeho řádu.
		CreateInvItems(self,itar_haradrimmage,1);
		B_GiveInvItems(self,other,itar_haradrimmage,1);
		GUARDIANTEACHMEMAGIC = TRUE;
		B_LogEntry(TOPIC_GUARDIANS,"Strážce Stonnos mě může naučit magii Strážců - mám za ním kdykoliv přijít a promluvit si na toto téma.");
		AI_StopProcessInfos(self);
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG) || (hero.guild == GIL_SLD) || (hero.guild == GIL_TPL) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_10");	//No, jako vojáka... Si nemyslím, že bych tě měl zatěžovat magií.
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_11");	//Nicméně, můžeš si promluvit s Tarinaksem - je to instruktor Asgardů, vojáků elementů.
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_12");	//Myslím, že ti pomůže s tvým výcvikem.
		AI_Output(other,self,"DMT_12150_Kelios_WhatTeach_13");	//Dobrá, zajdu za ním.
		GUARDIANTEACHMEWAR = TRUE;
		B_LogEntry(TOPIC_GUARDIANS,"Ohledně tréninku bych měl promluvit s instruktorem Asgardů, vojáků elementů.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_14");	//Ale ještě nejsi připraven poznat vědění Strážců!
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_15");	//Protože jsi stále příliš slabý, vrať se, až budeš připraven porozumět vědění Strážců.
	};
};


instance DMT_12150_KELIOS_HELLOBACK(C_Info)
{
	npc = dmt_12150_kelios;
	condition = dmt_12150_kelios_helloback_condition;
	information = dmt_12150_kelios_helloback_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12150_kelios_helloback_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TELLWELCOMEDONE == TRUE) && (CHOOSENATUREISDONE == TRUE) && (GUARDIANTEACHMEWAR == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12150_kelios_helloback_info()
{
	AI_Output(self,other,"DMT_12150_Kelios_HelloBack_01");	//Už víš, co máš dělat.
	AI_Output(self,other,"DMT_12150_Kelios_Hello_04");	//Jdi!
	AI_StopProcessInfos(self);
};


instance DMT_12150_KELIOS_EXPLAINCIRCLES(C_Info)
{
	npc = dmt_12150_kelios;
	condition = dmt_12150_kelios_explaincircles_condition;
	information = dmt_12150_kelios_explaincircles_info;
	permanent = FALSE;
	description = "Prosím, odhalíš mi tajemství kruhů magie?";
};


func int dmt_12150_kelios_explaincircles_condition()
{
	if((CHOOSEFIRE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12150_kelios_explaincircles_info()
{
	AI_Output(other,self,"DMT_12150_Kelios_EXPLAINCIRCLES_Info_15_01");	//Prosím, odhalíš mi tajemství kruhů magie?
	AI_Output(self,other,"DMT_12150_Kelios_EXPLAINCIRCLES_Info_14_02");	//S potěšením, kruhy jsou symboly tvého porozumění magii.
	AI_Output(self,other,"DMT_12150_Kelios_EXPLAINCIRCLES_Info_14_03");	//Určují úroveň tvých znalostí, které ti umožní používat další runy.
	AI_Output(self,other,"DMT_12150_Kelios_EXPLAINCIRCLES_Info_14_04");	//Musíš projít každým kruhem, než budeš moci následovat další.
	AI_Output(self,other,"DMT_12150_Kelios_EXPLAINCIRCLES_Info_14_05");	//Dlouhé hodiny tréninku a mnoho zkušeností budeš potřebovat při učení.
	AI_Output(self,other,"DMT_12150_Kelios_EXPLAINCIRCLES_Info_14_06");	//Ale i přesto, že budeš moci sesílat mocná kouzla, kruhy znamenají mnohem více. Jsou částí tvého života a ty jsi jejich část!
	AI_Output(self,other,"DMT_12150_Kelios_EXPLAINCIRCLES_Info_14_07");	//K porozumění jejich síle musíš nejdříve poznat sebe.
	EXPLAINCIRCLEMEAN = TRUE;
};


var int dia_dmt_12150_kelios_circle_noperm;

instance DIA_DMT_12150_KELIOS_CIRCLE(C_Info)
{
	npc = dmt_12150_kelios;
	nr = 99;
	condition = dia_dmt_12150_kelios_circle_condition;
	information = dia_dmt_12150_kelios_circle_info;
	permanent = TRUE;
	description = "Chci pochopit podstatu magie.";
};


func int dia_dmt_12150_kelios_circle_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) <= 6) && (CHOOSEFIRE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (DIA_DMT_12150_KELIOS_CIRCLE_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dmt_12150_kelios_circle_info()
{
	AI_Output(other,self,"DIA_DMT_12150_Kelios_CIRCLE_15_00");	//Chci pochopit podstatu magie.
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
	Info_AddChoice(DIA_DMT_12150_Kelios_CIRCLE,Dialog_Back,DIA_DMT_12150_Kelios_CIRCLE_Back);

	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1) && (CanLearnMagicCircleNext_ABCZ(1) == TRUE))
	{
		Info_AddChoice(DIA_DMT_12150_Kelios_CIRCLE,"1. kruh magie (VB: 20)",DIA_DMT_12150_Kelios_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1) && (CanLearnMagicCircleNext_ABCZ(2) == TRUE))
	{
		Info_AddChoice(DIA_DMT_12150_Kelios_CIRCLE,"2. kruh magie (VB: 30)",DIA_DMT_12150_Kelios_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2) && (CanLearnMagicCircleNext_ABCZ(3) == TRUE))
	{
		Info_AddChoice(DIA_DMT_12150_Kelios_CIRCLE,"3. kruh magie (VB: 40)",DIA_DMT_12150_Kelios_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3) && (CanLearnMagicCircleNext_ABCZ(4) == TRUE))
	{
		Info_AddChoice(DIA_DMT_12150_Kelios_CIRCLE,"4. kruh magie (VB: 60)",DIA_DMT_12150_Kelios_CIRCLE_4);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4) && (CanLearnMagicCircleNext_ABCZ(5) == TRUE))
	{
		Info_AddChoice(DIA_DMT_12150_Kelios_CIRCLE,"5. kruh magie (VB: 80)",DIA_DMT_12150_Kelios_CIRCLE_5);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5) && (CanLearnMagicCircleNext_ABCZ(6) == TRUE))
	{
		Info_AddChoice(DIA_DMT_12150_Kelios_CIRCLE,"6. kruh magie (VB: 100)",DIA_DMT_12150_Kelios_CIRCLE_6);
	}
	else
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_42");	//Ještě nejsi připraven! Vrať se později.
	};
};

func void DIA_DMT_12150_Kelios_CIRCLE_Back()
{
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
};

func void DIA_DMT_12150_Kelios_CIRCLE_1()
{
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_0A");	//Takže jsi připraven následovat cestu kruhů?
		AI_Output(other,self,"DIA_DMT_12150_Kelios_CIRCLE_15_01");	//Jsem připraven vstoupit do prvního kruhu.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_01");	//V prvním kruhu se naučíš používat magické runy.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_02");	//Každá runa má svou vlastní strukturu kouzla.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_03");	//Užitím své magické síly můžeš kouzlo osvobodit z runy.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_04");	//Ale narozdíl od svitků můžeš magii run uvolňovat neomezeně, nikdy se nevybyjí.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_05");	//Každá runa obsahuje sílu, která dokáže spoutat kouzlo, abys ho vypustil užitím své síly ducha.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_06");	//Stejně jako v průběhu použití svitku se při použití runy odčerpává tvá síla ducha.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_07");	//S každým novým kruhem se můžeš naučit více runové magie.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_08");	//Užij jejich sílu k jejich poznání.
	};
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
};

func void DIA_DMT_12150_Kelios_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_0A");	//Takže jsi připraven vstoupit do kruhu magie?
		AI_Output(other,self,"DIA_DMT_12150_Kelios_CIRCLE_15_02");	//Jsem připraven vstoupit do druhého kruhu.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_09");	//Už umíš porozumět runám. Nyní je čas rozšířit tvé znalosti.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_10");	//Ve druhém kruhu se naučíš mocná bojová kouzla.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_11");	//Ale ke skutečnému odhalení moci musíš ještě dlouho studovat.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_12");	//Víš jak používat runy vícekrát, ale také si uvědom, že tak čerpají tvou sílu ducha - více než svitky.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_13");	//Ale než něco uděláš, vždy si to promysli, protože tvé jednání by mohlo přinést smrt a zkázu.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_14");	//Pravý mág užívá svou sílu jen když je to nezbytné.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_15");	//Porozuměj situaci a porozumíš hlubšímu významu run.
	};
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
};

func void DIA_DMT_12150_Kelios_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_0A");	//Takže jsi připraven vstoupit do dalšího kruhu magie?
		AI_Output(other,self,"DIA_DMT_12150_Kelios_CIRCLE_15_03");	//Jaké znalosti zahrnují třetí kruh?
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_16");	//Třetí kruh je jedním z nejdůležitějších etap v životě mága.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_17");	//Už jsi doopravdy překročil hranici umění kruhů. Nyní již znáš vše ohledně používání run.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_18");	//Ale tyto znalosti jsou jen začátkem tvé cesty. Nauč se své runy používat efektivněji.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_19");	//Můžeš je buď používat, nebo ne - volba je na tobě.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_20");	//Učiň rozhodnutí a pociť jejich sílu.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_21");	//Najdi cestu jak těžit ze síly tvého rozhodnutí.
	};
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
};

func void DIA_DMT_12150_Kelios_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_0A");	//Jseš připraven následovat další kruh?
		AI_Output(other,self,"DIA_DMT_12150_Kelios_CIRCLE_15_04");	//Jsem připraven vstoupit do čtvrtého kruhu.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_22");	//Úspěšně jsi již prošel třemi kruhy a nyní je čas porozumět hlubším tajemstvím moci.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_23");	//Základ magie run je runový kámen. Kámen z magické rudy.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_24");	//Je to ta ruda, která se těži v dolech - ve chrámech je potom přeměněna na tyto kameny.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_25");	//Nyní víš o znalostech, které tyto chrámy skrývají.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_27");	//Poznej magii a ona pro tebe otevře tajemství moci.
	};
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
};

func void DIA_DMT_12150_Kelios_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_0A");	//Jsi připraven vstoupit do dalšího kruhu?
		AI_Output(other,self,"DIA_DMT_12150_Kelios_CIRCLE_15_05");	//Jsem připraven vstoupit do pátého kruhu.
		AI_Output(other,self,"DIA_DMT_12150_Kelios_CIRCLE_15_5A");	//Ať se tak stane, otěvřu ti znalosti pátého kruhu.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_31");	//Poznej limit tvých možností a naučíš se tajemství síly.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_32");	//Kouzla, která se nyní můžeš naučit jsou velice destruktivní.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_33");	//Takže musíš poznat, kdy přestat jejich síly využívat.
	};
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
};

func void DIA_DMT_12150_Kelios_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_34");	//Můžu tě již zasvětit do šestého kruhu.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_35");	//Jen velmi málo z mocných mágů může vstoupit do tohoto kruhu - jejich život se nyní změní.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_38");	//Jak již víš, tvá podstata je Oheň!
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_39");	//Šestý kruh ti umožní použít jakékoliv kouzlo run.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_40");	//Ale nezapomeň - nestaň se vězením síly, ale jejím zdrojem.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_41");	//Prozři své činy!
		DIA_DMT_12150_KELIOS_CIRCLE_NOPERM = TRUE;
	};
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
};

instance DIA_DMT_12150_KELIOS_TEACH_MANA(C_Info)
{
	npc = dmt_12150_kelios;
	nr = 10;
	condition = dia_dmt_12150_kelios_teach_mana_condition;
	information = dia_dmt_12150_kelios_teach_mana_info;
	permanent = TRUE;
	description = "Chci zvýšit svou sílu ducha.";
};


func int dia_dmt_12150_kelios_teach_mana_condition()
{
	if((CHOOSEFIRE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (hero.attribute[ATR_MANA_MAX] < T_MEGA))
	{
		return TRUE;
	};
};

func void dia_dmt_12150_kelios_teach_mana_info()
{
	AI_Output(other,self,"DIA_DMT_12150_Kelios_TEACH_MANA_15_00");	//Chci zvýšit svou sílu ducha.
	Info_ClearChoices(dia_dmt_12150_kelios_teach_mana);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,Dialog_Back,dia_dmt_12150_kelios_teach_mana_back);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12150_kelios_teach_mana_1);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12150_kelios_teach_mana_5);
};

func void dia_dmt_12150_kelios_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_TEACH_MANA_05_00");	//Jsi na hranici možností!
	};
	Info_ClearChoices(dia_dmt_12150_kelios_teach_mana);
};

func void dia_dmt_12150_kelios_teach_mana_1()
{
	b_teachattributepointstarinaks(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_dmt_12150_kelios_teach_mana);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,Dialog_Back,dia_dmt_12150_kelios_teach_mana_back);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12150_kelios_teach_mana_1);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12150_kelios_teach_mana_5);
};

func void dia_dmt_12150_kelios_teach_mana_5()
{
	b_teachattributepointstarinaks(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_dmt_12150_kelios_teach_mana);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,Dialog_Back,dia_dmt_12150_kelios_teach_mana_back);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12150_kelios_teach_mana_1);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12150_kelios_teach_mana_5);
};


instance DIA_DMT_12150_KELIOS_TEACH(C_Info)
{
	npc = dmt_12150_kelios;
	nr = 3;
	condition = dia_dmt_12150_kelios_teach_condition;
	information = dia_dmt_12150_kelios_teach_info;
	permanent = TRUE;
	description = "Nauč mě magii run Ohně.";
};


func int dia_dmt_12150_kelios_teach_condition()
{
	if((CHOOSEFIRE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_12150_kelios_teach_info()
{
	AI_Output(other,self,"DIA_DMT_12150_Kelios_TEACH_15_00");	//Nauč mě magii run Ohně.
	AI_Output(self,other,"DIA_DMT_12150_Kelios_TEACH_15_01");	//Dobře, že jsi tu. Co bys chtěl umět?
	Info_ClearChoices(dia_dmt_12150_kelios_teach);
	Info_AddChoice(dia_dmt_12150_kelios_teach,Dialog_Back,dia_dmt_12150_kelios_teach_back);

	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_Firebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firebolt)),dia_dmt_12150_kelios_teach_firebolt);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),dia_dmt_12150_kelios_teach_instantfireball);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_RapidFirebolt] == FALSE) && (LegoSpells == TRUE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_RapidFirebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_RapidFirebolt)),dia_dmt_12150_kelios_teach_RapidFirebolt);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_Firestorm] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_Firestorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firestorm)),dia_dmt_12150_kelios_teach_firestorm);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[80] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_SUMMONFIREGOLEM,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONFIREGOLEM)),dia_dmt_12150_kelios_teach_summonfiregolem);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_MagicCage] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_MagicCage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MagicCage)),dia_dmt_12150_kelios_teach_MagicCage);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),dia_dmt_12150_kelios_teach_chargefireball);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[93] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_FIRELIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FIRELIGHT)),dia_dmt_12150_kelios_teach_firelight);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),dia_dmt_12150_kelios_teach_pyrokinesis);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_Explosion] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_Explosion,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Explosion)),dia_dmt_12150_kelios_teach_Explosion);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),dia_dmt_12150_kelios_teach_firerain);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_FireMeteor] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_FireMeteor,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FireMeteor)),dia_dmt_12150_kelios_teach_firemeteor);
	};
};

func void dia_dmt_12150_kelios_teach_back()
{
	Info_ClearChoices(dia_dmt_12150_kelios_teach);
};

func void dia_dmt_12150_kelios_teach_firebolt()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Firebolt);
};

func void dia_dmt_12150_kelios_teach_instantfireball()
{
	b_teachplayertalentrunesguardians(self,other,SPL_InstantFireball);
};

func void dia_dmt_12150_kelios_teach_RapidFirebolt()
{
	b_teachplayertalentrunesguardians(self,other,SPL_RapidFirebolt);
};

func void dia_dmt_12150_kelios_teach_Explosion()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Explosion);
};

func void dia_dmt_12150_kelios_teach_MagicCage()
{
	b_teachplayertalentrunesguardians(self,other,SPL_MagicCage);
};

func void dia_dmt_12150_kelios_teach_chargefireball()
{
	b_teachplayertalentrunesguardians(self,other,SPL_ChargeFireball);
};

func void dia_dmt_12150_kelios_teach_firelight()
{
	CreateInvItems(self,itwr_firelight,1);
	B_GiveInvItems(self,other,itwr_firelight,1);
	b_teachplayertalentrunesguardians(self,other,SPL_FIRELIGHT);
};

func void dia_dmt_12150_kelios_teach_pyrokinesis()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Pyrokinesis);
};

func void dia_dmt_12150_kelios_teach_firestorm()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Firestorm);
};

func void dia_dmt_12150_kelios_teach_summonfiregolem()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SUMMONFIREGOLEM);
};

func void dia_dmt_12150_kelios_teach_firerain()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Firerain);
};

func void dia_dmt_12150_kelios_teach_firemeteor()
{
	b_teachplayertalentrunesguardians(self,other,SPL_FireMeteor);
};


instance DIA_DMT_12150_KELIOS_GIVEARMORGUARDIANS(C_Info)
{
	npc = dmt_12150_kelios;
	condition = dia_dmt_12150_kelios_givearmorguardians_condition;
	information = dia_dmt_12150_kelios_givearmorguardians_info;
	permanent = FALSE;
	description = "Chci jít do Irdorathských síní!";
};


func int dia_dmt_12150_kelios_givearmorguardians_condition()
{
	if((CHOOSEFIRE == TRUE) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_12150_kelios_givearmorguardians_info()
{
	AI_Output(other,self,"DIA_DMT_12150_Kelios_GiveArmorGuardians_01_01");	//Chci jít do Irdorathských síní! Můžu od tebe dostat nějakou pomoc?
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveArmorGuardians_01_02");	//Hmmm... (zamyšlený) Strážci pracují s božskými sférami a podobnými věcmi. A ty to dobře víš!
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveArmorGuardians_01_03");	//Nicméně nemůžeme přehlédnout, že tvůj osud je rozdílný - po tom všem, jsi přece jeden z nás!
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveArmorGuardians_01_04");	//Každopádně na důkaz naší dobré vůle přijmi tento dar.
	B_GiveInvItems(self,other,ItPo_GuardiansElixir,1);
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveArmorGuardians_01_06");	//Není toho málo co ti můžeme nabídnout a toto je jen část - jestli někdy získáš další je jen na tom, jak nám budeš sloužit!
	AI_Output(other,self,"DIA_DMT_12150_Kelios_GiveArmorGuardians_01_07");	//Díky, mistře.
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveArmorGuardians_01_08");	//Nyní jdi, mistře elementů, naše požehnání tě provází po zemi.
	AI_StopProcessInfos(self);
};


instance DIA_DMT_12150_KELIOS_GIVEELIGORRUNE(C_Info)
{
	npc = dmt_12150_kelios;
	condition = dia_dmt_12150_kelios_giveeligorrune_condition;
	information = dia_dmt_12150_kelios_giveeligorrune_info;
	permanent = FALSE;
	description = "To vše se můžu naučit i u jiných mágů.";
};


func int dia_dmt_12150_kelios_giveeligorrune_condition()
{
	if((CHOOSEFIRE == TRUE) && (DemonologSkill[0] == 6) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4))
	{
		return TRUE;
	};
};

func void dia_dmt_12150_kelios_giveeligorrune_info()
{
	AI_Output(other,self,"DIA_DMT_12150_Kelios_GiveEligorRune_01_01");	//To vše se můžu naučit i u jiných mágů.
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_02");	//Co tím chceš říct?!... (vážně)
	AI_Output(other,self,"DIA_DMT_12150_Kelios_GiveEligorRune_01_03");	//Že chci vědět více. O opravdových znalostech, které mě Strážci mohou naučit, chci vědět více!
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_06");	//První věc ohledně elementů, které bys měl porozumět je to, že každý z nich je základem veškerých pevných látek na zemi.
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_07");	//A tyto bytosti jsou zcela podřízeny svým tvůrcům. My Strážci jsme taky předmětem této síly!
	AI_Output(other,self,"DIA_DMT_12150_Kelios_GiveEligorRune_01_08");	//A mohu ji zvládnout?
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_09");	//No ano...(zamyšleně)... Pravda o těchto tvorech je... Dobrá...(potichu)... vezmi si runu, a nevyzrazuj o nás NIC...
	CreateInvItems(self,itru_eligordemons,1);
	B_GiveInvItems(self,other,itru_eligordemons,1);
	AI_Output(other,self,"DIA_DMT_12150_Kelios_GiveEligorRune_01_10");	//Co je to za runu?!
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_11");	//S její pomocí můžeš do tohoto světa povolat bytosti z jiných dimenzí.
	AI_Output(other,self,"DIA_DMT_12150_Kelios_GiveEligorRune_01_12");	//Kdo jsou ty bytosti?!
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_13");	//Démoni!... (vážně) Démoni z legie Eligora, vládce Langu.
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_14");	//Tyto bytosti nám slouží už celá milénia. Nyní budou sloužit tobě!
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_15");	//Nicméně pamatuj, že tato runa je tak mocná, že když ji budeš používat ty, její moc bude s každým použitím vyprchávat.
	AI_StopProcessInfos(self);
};


instance DMT_12150_KELIOS_TASKS(C_Info)
{
	npc = dmt_12150_kelios;
	condition = dmt_12150_kelios_tasks_condition;
	information = dmt_12150_kelios_tasks_info;
	permanent = FALSE;
	description = "Nemáš pro mě nějakou práci?";
};


func int dmt_12150_kelios_tasks_condition()
{
	if((CHOOSEFIRE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12150_kelios_tasks_info()
{
	AI_Output(other,self,"DMT_12150_Kelios_Tasks_01_01");	//Nemáš pro mě nějakou práci?
	AI_Output(self,other,"DMT_12150_Kelios_Tasks_01_02");	//Myslím, že nic... (vážně) Všechno co bys měl udělat jsi již udělal!
	AI_Output(self,other,"DMT_12150_Kelios_Tasks_01_03");	//A to ostatní ještě není připraveno.
	AI_Output(self,other,"DMT_12150_Kelios_Tasks_01_04");	//Nicméně brzy přijde čas, kdy tě zavoláme.
};

