/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(6x) CanLearnMagicCircleNext_ABCZ - upraveny podmínky učení se magických kruhů (na žádost hráčů)

*/



instance DMT_12120_DAGOT_EXIT(C_Info)
{
	npc = dmt_12120_dagot;
	nr = 999;
	condition = dmt_12120_dagot_exit_condition;
	information = dmt_12120_dagot_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_12120_dagot_exit_condition()
{
	return TRUE;
};

func void dmt_12120_dagot_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_12120_DAGOT_HELLO(C_Info)
{
	npc = dmt_12120_dagot;
	condition = dmt_12120_dagot_hello_condition;
	information = dmt_12120_dagot_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12120_dagot_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE) && (TELLWELCOMEDONE == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12120_dagot_hello_info()
{
	if(TELLWHATDONE == FALSE)
	{
		TELLWHATDONE = TRUE;

		if(CHOOSEDARK == TRUE)
		{
			AI_Output(self,other,"DMT_12120_Dagot_Hello_01");	//Takže jsi tu... Vítej, hrdino!
			AI_Output(self,other,"DMT_12120_Dagot_Hello_02");	//Od této chvíle jsem tvým učitelem.
			AI_Output(self,other,"DMT_12120_Dagot_Hello_03");	//Zbývající Strážci budou rovněž sledovat tvůj osud. Ale nic víc.
			AI_Output(self,other,"DMT_12120_Dagot_Hello_04");	//Do této chvíle byl tvůj život temný ale nyní se můžeš začít učit. Pamatuj si to!
			AI_Output(other,self,"DMT_12120_Dagot_Hello_05");	//Ano.
			AI_Output(self,other,"DMT_12120_Dagot_Hello_06");	//No dobře...
			TELLWELCOMEDONE = TRUE;
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other,"DMT_12120_Dagot_Hello_07");	//Měl bys kontaktovat Strážce Stonose.
			AI_Output(self,other,"DMT_12120_Dagot_Hello_08");	//Nyní to bude tvůj učitel.
			AI_Output(self,other,"DMT_12120_Dagot_Hello_09");	//Já už ti nemůžu pomoci.
			AI_Output(self,other,"DMT_12120_Dagot_Hello_10");	//Do toho!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other,"DMT_12120_Dagot_Hello_11");	//Měl bys kontaktovat Strážce Wakona.
			AI_Output(self,other,"DMT_12120_Dagot_Hello_08");	//Nyní to bude tvůj učitel.
			AI_Output(self,other,"DMT_12120_Dagot_Hello_09");	//Já už ti nemůžu pomoci.
			AI_Output(self,other,"DMT_12120_Dagot_Hello_10");	//Do toho!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other,"DMT_12120_Dagot_Hello_15");	//Měl bys kontaktovat Strážce Keliose.
			AI_Output(self,other,"DMT_12120_Dagot_Hello_08");	//Nyní to bude tvůj učitel.
			AI_Output(self,other,"DMT_12120_Dagot_Hello_09");	//Já už ti nemůžu pomoci.
			AI_Output(self,other,"DMT_12120_Dagot_Hello_10");	//Do toho!
			AI_StopProcessInfos(self);
		};
	}
	else if(CHOOSEDARK == TRUE)
	{
		AI_Output(self,other,"DMT_12120_Dagot_Hello_19");	//Takže jsi tu... Vítej hrdino!
		AI_Output(self,other,"DMT_12120_Dagot_Hello_20");	//Od této chvíle jsem tvým učitelem.
		AI_Output(self,other,"DMT_12120_Dagot_Hello_21");	//Zbývající Strážci budou rovněž sledovat tvůj osud. Ale nic víc.
		AI_Output(self,other,"DMT_12120_Dagot_Hello_22");	//Do této chvíle byl tvůj život temný ale nyní se můžeš začít učit. Pamatuj si to!
		AI_Output(other,self,"DMT_12120_Dagot_Hello_23");	//Ano.
		TELLWELCOMEDONE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DMT_12120_Dagot_Hello_24");	//Teď víš co máš dělat.
		AI_Output(self,other,"DMT_12120_Dagot_Hello_10");	//Do toho!
		AI_StopProcessInfos(self);
	};
};


instance DMT_12120_DAGOT_WHATTEACH(C_Info)
{
	npc = dmt_12120_dagot;
	condition = dmt_12120_dagot_whatteach_condition;
	information = dmt_12120_dagot_whatteach_info;
	permanent = TRUE;
	description = "Co se od tebe mohu naučit?";
};


func int dmt_12120_dagot_whatteach_condition()
{
	if((CHOOSEDARK == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == FALSE) && (GUARDIANTEACHMEWAR == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12120_dagot_whatteach_info()
{
	AI_Output(other,self,"DMT_12120_Dagot_WhatTeach_00");	//Co se mohu od tebe naučit?

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
	{
		AI_Output(self,other,"DMT_12120_Dagot_WhatTeach_01");	//No, protože jsi mág mohu tě naučit kouzlo které mi dal stvořitel.
		AI_Output(self,other,"DMT_12120_Dagot_WhatTeach_03");	//Temnou magii... jeho jméno není důležité! Hlavní je že tuto magii moc lidí neovládá...
		AI_Output(self,other,"DMT_12120_Dagot_WhatTeach_04");	//... ale jak asi víš budeš muset být nejen mág ale také budeš muset mít dost many na použití kouzla.
		AI_Output(self,other,"DMT_12120_Dagot_WhatTeach_06");	//Navíc budeš muset umět kruhy magie. Volba je jen na tobě. Dej mi vědět a já ti to tajemství řeknu.
		AI_Output(self,other,"DMT_12120_Dagot_WhatTeach_24");	//A ještě něco přijmi odemne tento dar. Oděv novice.
		CreateInvItems(self,itar_haradrimmage,1);
		B_GiveInvItems(self,other,itar_haradrimmage,1);
		GUARDIANTEACHMEMAGIC = TRUE;
		B_LogEntry(TOPIC_GUARDIANS,"Strážce Dagoth mě může naučit magii Temnoty. Stačí se jen rozhodnout.");
		AI_StopProcessInfos(self);
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG) || (hero.guild == GIL_SLD) || (hero.guild == GIL_TPL) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DMT_12120_Dagot_WhatTeach_10");	//Protože jsi válečník nemohu tě naučit kouzlo od stvořitele.
		AI_Output(self,other,"DMT_12120_Dagot_WhatTeach_11");	//Promluv si s Tarinaksem.
		AI_Output(self,other,"DMT_12120_Dagot_WhatTeach_12");	//Myslím že ti pomůže s tréninkem.
		AI_Output(other,self,"DMT_12120_Dagot_WhatTeach_13");	//Dobře.
		GUARDIANTEACHMEWAR = TRUE;
		B_LogEntry(TOPIC_GUARDIANS,"Chci-li začít svůj trénink mám promluvit s Tarinaksem.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DMT_12120_Dagot_WhatTeach_14");	//Ještě nejsi připraven...
		AI_Output(self,other,"DMT_12120_Dagot_WhatTeach_15");	//Jsi příliš slabý! Vrať se a já ti to tajemství svěřím.
	};
};


instance DMT_12120_DAGOT_HELLOBACK(C_Info)
{
	npc = dmt_12120_dagot;
	condition = dmt_12120_dagot_helloback_condition;
	information = dmt_12120_dagot_helloback_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12120_dagot_helloback_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TELLWELCOMEDONE == TRUE) && (CHOOSENATUREISDONE == TRUE) && (GUARDIANTEACHMEWAR == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12120_dagot_helloback_info()
{
	AI_Output(self,other,"DMT_12120_Dagot_HelloBack_01");	//Ty víš co máš udělat.
	AI_Output(self,other,"DMT_12120_Dagot_Hello_10");	//Jdi!
	AI_StopProcessInfos(self);
};


instance DMT_12120_DAGOT_EXPLAINCIRCLES(C_Info)
{
	npc = dmt_12120_dagot;
	condition = dmt_12120_dagot_explaincircles_condition;
	information = dmt_12120_dagot_explaincircles_info;
	permanent = FALSE;
	description = "Řekneš mi něco o kruzích magie?";
};


func int dmt_12120_dagot_explaincircles_condition()
{
	if((CHOOSEDARK == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12120_dagot_explaincircles_info()
{
	AI_Output(other,self,"DMT_12120_Dagot_EXPLAINCIRCLES_Info_15_01");	//Řekneš mi něco o kruzích magie?
	AI_Output(self,other,"DMT_12120_Dagot_EXPLAINCIRCLES_Info_14_02");	//Jistě. Kruhy představují tvou znalost magie.
	AI_Output(self,other,"DMT_12120_Dagot_EXPLAINCIRCLES_Info_14_03");	//Zároveň ukazují úroveň tvé znalosti a dovednosti učení se nových kouzel.
	AI_Output(self,other,"DMT_12120_Dagot_EXPLAINCIRCLES_Info_14_04");	//Budeš muset projít všemi kruhy abys mohl jít na další.
	AI_Output(self,other,"DMT_12120_Dagot_EXPLAINCIRCLES_Info_14_05");	//Učení vyžaduje spoustu času a taky mnoho zkušeností.
	AI_Output(self,other,"DMT_12120_Dagot_EXPLAINCIRCLES_Info_14_06");	//Tvé úsilí bude vždy odměněno mocnými kouzly. V každém případě kruhy znamenají víc.
	AI_Output(self,other,"DMT_12120_Dagot_EXPLAINCIRCLES_Info_14_07");	//Abys to pochopil budeš muset znát sebe sama.
	EXPLAINCIRCLEMEAN = TRUE;
};

var int dia_dmt_12120_dagot_circle_noperm;

instance DIA_DMT_12120_DAGOT_CIRCLE(C_Info)
{
	npc = dmt_12120_dagot;
	nr = 99;
	condition = dia_dmt_12120_dagot_circle_condition;
	information = dia_dmt_12120_dagot_circle_info;
	permanent = TRUE;
	description = "Chci pochopit podstatu magie.";
};

func int dia_dmt_12120_dagot_circle_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) <= 6) && (CHOOSEDARK == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (DIA_DMT_12120_DAGOT_CIRCLE_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dmt_12120_dagot_circle_info()
{
	AI_Output(other,self,"DIA_DMT_12120_Dagot_CIRCLE_15_00");	//Chci pochopit podstatu magie.
	Info_ClearChoices(DIA_DMT_12120_DAGOT_CIRCLE);
	Info_AddChoice(DIA_DMT_12120_DAGOT_CIRCLE,Dialog_Back,DIA_DMT_12120_DAGOT_CIRCLE_Back);

	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1) && (CanLearnMagicCircleNext_ABCZ(1) == TRUE))
	{
		Info_AddChoice(DIA_DMT_12120_DAGOT_CIRCLE,"1. kruh magie (VB: 20)",DIA_DMT_12120_DAGOT_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1) && (CanLearnMagicCircleNext_ABCZ(2) == TRUE))
	{
		Info_AddChoice(DIA_DMT_12120_DAGOT_CIRCLE,"2. kruh magie (VB: 30)",DIA_DMT_12120_DAGOT_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2) && (CanLearnMagicCircleNext_ABCZ(3) == TRUE))
	{
		Info_AddChoice(DIA_DMT_12120_DAGOT_CIRCLE,"3. kruh magie (VB: 40)",DIA_DMT_12120_DAGOT_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3) && (CanLearnMagicCircleNext_ABCZ(4) == TRUE))
	{
		Info_AddChoice(DIA_DMT_12120_DAGOT_CIRCLE,"4. kruh magie (VB: 60)",DIA_DMT_12120_DAGOT_CIRCLE_4);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4) && (CanLearnMagicCircleNext_ABCZ(5) == TRUE))
	{
		Info_AddChoice(DIA_DMT_12120_DAGOT_CIRCLE,"5. kruh magie (VB: 80)",DIA_DMT_12120_DAGOT_CIRCLE_5);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5) && (CanLearnMagicCircleNext_ABCZ(6) == TRUE))
	{
		Info_AddChoice(DIA_DMT_12120_DAGOT_CIRCLE,"6. kruh magie (VB: 100)",DIA_DMT_12120_DAGOT_CIRCLE_6);
	}
	else
	{
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_42");	//Ještě nejsi připraven! Vrať se později.
	};
};

func void DIA_DMT_12120_Dagot_CIRCLE_Back()
{
	Info_ClearChoices(DIA_DMT_12120_Dagot_CIRCLE);
};

func void DIA_DMT_12120_Dagot_CIRCLE_1()
{
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_0A");	//Jsi připraven na vstup do dalšího kruhu?
		AI_Output(other,self,"DIA_DMT_12120_Dagot_CIRCLE_15_01");	//Ano jsem.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_01");	//Při vstupu do prvního kruhu se naučíš používat runy.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_02");	//Každá runa má svou speciální strukturu kouzla.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_03");	//Jen mág znalý kruhů magie může používat runy.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_04");	//Narozdíl od svitků runy lze používat stále do kola.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_05");	//Každá runa je plná magické síly, kterou můžeš použít kdykoliv.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_06");	//Ovšem bude tě stát její použití více magické energie!
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_07");	//S každým novým kruhem se dozvíš něco více o runách.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_08");	//Použij sílu abys poznal sám sebe.
	};
	Info_ClearChoices(DIA_DMT_12120_Dagot_CIRCLE);
};

func void DIA_DMT_12120_Dagot_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_0A");	//Jsi připraven na vstup do dalšího kruhu?
		AI_Output(other,self,"DIA_DMT_12120_Dagot_CIRCLE_15_02");	//Ano jsem.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_09");	//Naučil ses používat runy. Je na čase prohloubit tvé znalosti.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_10");	//Nyní budeš opět o něco vzdělanější!
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_11");	//Abys pochopil tajemství magie musíš se toho hodně naučit.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_12");	//Víš, že runy můžeš použít tolikrát kolik jen budeš chtít...
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_13");	//Ale jen dokud ti bude stačit mana!
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_14");	//Skutečný mág používá kouzla jen v nezbytných případech.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_15");	//Nauč se posuzovat situaci a zažiješ skutečnou sílu run.
	};
	Info_ClearChoices(DIA_DMT_12120_Dagot_CIRCLE);
};

func void DIA_DMT_12120_Dagot_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_0A");	//Jsi připraven na vstup do dalšího kruhu?
		AI_Output(other,self,"DIA_DMT_12120_Dagot_CIRCLE_15_03");	//Jaké znalosti mě naučíš ve třetím kruhu?
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_16");	//Třetí kruh je jedním z nejdůležitějších etap v životě mága.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_17");	//Už jsi překročil významný krok! Jsi na cestě magie.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_18");	//Tato znalost bude tvořit základ pro tvé další kroky. Používej runy opatrně.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_19");	//Můžeš je použít nebo ne ale musíš zvážit situaci.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_20");	//Jakmile se rozhodneš, využij magii bez váhání.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_21");	//Poznej svou sílu!
	};
	Info_ClearChoices(DIA_DMT_12120_Dagot_CIRCLE);
};

func void DIA_DMT_12120_Dagot_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_0A");	//Jsi připraven na vstup do dalšího kruhu?
		AI_Output(other,self,"DIA_DMT_12120_Dagot_CIRCLE_15_04");	//Ano jsem.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_22");	//Dokončil jsi tři kruhy magie. Je na čase, abys pochopil tajemství magie.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_23");	//Základem runy je kámen, který se získává z magické rudy.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_24");	//Dále se pak zpracovává u runového stolu...
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_25");	//... kde z něj vznikne mocná runa.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_27");	//Poznej kouzlo, a objevíš tajemství moci.
	};
	Info_ClearChoices(DIA_DMT_12120_Dagot_CIRCLE);
};

func void DIA_DMT_12120_Dagot_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_0A");	//Jsi připraven na vstup do dalšího kruhu?
		AI_Output(other,self,"DIA_DMT_12120_Dagot_CIRCLE_15_05");	//Jsem připraven vstoupit do pátého kruhu.
		AI_Output(other,self,"DIA_DMT_12120_Dagot_CIRCLE_15_5A");	//Budiž. Řeknu ti pravý význam pátého kruhu.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_31");	//Pouze ti nejmocnější mágové jsou schopni psychicky i fyzicky používat kouzla posledních dvou kruhů. Jejich význam je jasný: Zničit nepřítele, a léčit majitele.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_32");	//Kouzla která se naučíš mohou být velmi zničující.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_33");	//Jdi, a čiň ve jménu svého boha!
	};
	Info_ClearChoices(DIA_DMT_12120_Dagot_CIRCLE);
};

func void DIA_DMT_12120_Dagot_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_34");	//Budu tě učit i šestému kruhu.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_35");	//Šestému kruhu se naučili jen ti nejmocnější mágové které kdy tento svět poznal.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_38");	//Jak již víš, tvá podstata je temnost.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_39");	//Šestý kruh ti umožní použít jakékoliv kouzlo run.
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_40");	//S tímto kruhem magie jsi dokonalý arcimág. Čiň vůli svého boha!
		AI_Output(self,other,"DIA_DMT_12120_Dagot_CIRCLE_14_41");	//Nechť moudré a rozumné jsou tvoje skutky.
		DIA_DMT_12120_DAGOT_CIRCLE_NOPERM = TRUE;
	};
	Info_ClearChoices(DIA_DMT_12120_Dagot_CIRCLE);
};

instance DIA_DMT_12120_DAGOT_TEACH_MANA(C_Info)
{
	npc = dmt_12120_dagot;
	nr = 10;
	condition = dia_dmt_12120_dagot_teach_mana_condition;
	information = dia_dmt_12120_dagot_teach_mana_info;
	permanent = TRUE;
	description = "Chtěl bych zvýšit sílu své magie.";
};


func int dia_dmt_12120_dagot_teach_mana_condition()
{
	if((CHOOSEDARK == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (hero.attribute[ATR_MANA_MAX] < T_MEGA))
	{
		return TRUE;
	};
};

func void dia_dmt_12120_dagot_teach_mana_info()
{
	AI_Output(other,self,"DIA_DMT_12120_Dagot_TEACH_MANA_15_00");	//Chtěl bych zvýšit sílu své magie.
	Info_ClearChoices(dia_dmt_12120_dagot_teach_mana);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,Dialog_Back,dia_dmt_12120_dagot_teach_mana_back);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12120_dagot_teach_mana_1);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12120_dagot_teach_mana_5);
};

func void dia_dmt_12120_dagot_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_DMT_12120_Dagot_TEACH_MANA_05_00");	//Jsi blíž k limitu.
	};
	Info_ClearChoices(dia_dmt_12120_dagot_teach_mana);
};

func void dia_dmt_12120_dagot_teach_mana_1()
{
	b_teachattributepointstarinaks(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_dmt_12120_dagot_teach_mana);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,Dialog_Back,dia_dmt_12120_dagot_teach_mana_back);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12120_dagot_teach_mana_1);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12120_dagot_teach_mana_5);
};

func void dia_dmt_12120_dagot_teach_mana_5()
{
	b_teachattributepointstarinaks(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_dmt_12120_dagot_teach_mana);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,Dialog_Back,dia_dmt_12120_dagot_teach_mana_back);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12120_dagot_teach_mana_1);
	Info_AddChoice(dia_dmt_12120_dagot_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12120_dagot_teach_mana_5);
};


instance DIA_DMT_12120_DAGOT_RUNEN(C_Info)
{
	npc = dmt_12120_dagot;
	nr = 99;
	condition = dia_dmt_12120_dagot_runen_condition;
	information = dia_dmt_12120_dagot_runen_info;
	permanent = TRUE;
	description = "Nauč mě používat magické runy.";
};


func int dia_dmt_12120_dagot_runen_condition()
{
	if((CHOOSEDARK == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_12120_dagot_runen_info()
{
	AI_Output(other,self,"DIA_DMT_12120_Dagot_Runen_15_00");	//Nauč mě používat magické runy.
	AI_Output(self,other,"DIA_DMT_12120_Dagot_Runen_15_01");	//Co přesně chceš vědět.
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,"6. kruh magie",dia_dmt_12120_dagot_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,"5. kruh magie",dia_dmt_12120_dagot_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,"4. kruh magie",dia_dmt_12120_dagot_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,"3. kruh magie",dia_dmt_12120_dagot_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,"2. kruh magie",dia_dmt_12120_dagot_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,"1. kruh magie",dia_dmt_12120_dagot_runen_1);
	};
};

func void dia_dmt_12120_dagot_runen_back()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
};

func void dia_dmt_12120_dagot_runen_dem()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);
	if((PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE) && (XARDASTEACHCASTDEMON == TRUE))
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),dia_dmt_12120_dagot_runen_circle_4_spl_summondemon);
	};
};

func void dia_dmt_12120_dagot_runen_1()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Deathbolt] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_Deathbolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Deathbolt)),dia_dmt_12120_dagot_runen_circle_1_spl_deathbolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_SummonGoblinSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGoblinSkeleton)),dia_dmt_12120_dagot_runen_circle_1_spl_summongoblinskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Rage] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_Rage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Rage)),dia_dmt_12120_dagot_runen_circle_1_spl_Rage);
	};
};

func void dia_dmt_12120_dagot_runen_2()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_ManaForLife] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_ManaForLife,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ManaForLife)),dia_dmt_12120_dagot_runen_circle_2_spl_suckenergy);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonZombie] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_SummonZombie,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonZombie)),dia_dmt_12120_dagot_runen_circle_2_spl_summonzombie);
	};
	if(PLAYER_TALENT_RUNES[SPL_Lacerate] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_Lacerate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Lacerate)),dia_dmt_12120_dagot_runen_circle_2_spl_Lacerate);
	};
};

func void dia_dmt_12120_dagot_runen_3()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Swarm] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_Swarm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Swarm)),dia_dmt_12120_dagot_runen_circle_3_spl_swarm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_SummonSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonSkeleton)),dia_dmt_12120_dagot_runen_circle_3_spl_summonskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Energyball] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_BeliarsRage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Energyball)),dia_dmt_12120_dagot_runen_circle_4_spl_energyball);
	};
};

func void dia_dmt_12120_dagot_runen_4()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Deathball] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_Deathball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Deathball)),dia_dmt_12120_dagot_runen_circle_5_spl_deathball);
	};
};

func void dia_dmt_12120_dagot_runen_5()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),dia_dmt_12120_dagot_runen_circle_5_spl_armyofdarkness);
	};
};

func void dia_dmt_12120_dagot_runen_6()
{
	Info_ClearChoices(dia_dmt_12120_dagot_runen);
	Info_AddChoice(dia_dmt_12120_dagot_runen,Dialog_Back,dia_dmt_12120_dagot_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_MassDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),dia_dmt_12120_dagot_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_Skull] == FALSE)
	{
		Info_AddChoice(dia_dmt_12120_dagot_runen,B_BuildLearnString(NAME_SPL_Skull,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Skull)),dia_dmt_12120_dagot_runen_circle_6_spl_skull);
	};
};


func void dia_dmt_12120_dagot_runen_circle_1_spl_Rage()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Rage);
};

func void dia_dmt_12120_dagot_runen_circle_2_spl_Lacerate()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Lacerate);
};

func void dia_dmt_12120_dagot_runen_circle_1_spl_deathbolt()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Deathbolt);
};

func void dia_dmt_12120_dagot_runen_circle_1_spl_summongoblinskeleton()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SummonGoblinSkeleton);
};

func void dia_dmt_12120_dagot_runen_circle_2_spl_suckenergy()
{
	b_teachplayertalentrunesguardians(self,other,SPL_ManaForLife);
};

func void dia_dmt_12120_dagot_runen_circle_2_spl_summonzombie()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SummonZombie);
};

func void dia_dmt_12120_dagot_runen_circle_3_spl_swarm()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Swarm);
};

func void dia_dmt_12120_dagot_runen_circle_3_spl_summonskeleton()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SummonSkeleton);
};

func void dia_dmt_12120_dagot_runen_circle_4_spl_energyball()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Energyball);
};

func void dia_dmt_12120_dagot_runen_circle_4_spl_summondemon()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SummonDemon);
};

func void dia_dmt_12120_dagot_runen_circle_5_spl_deathball()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Deathball);
};

func void dia_dmt_12120_dagot_runen_circle_5_spl_armyofdarkness()
{
	b_teachplayertalentrunesguardians(self,other,SPL_ArmyOfDarkness);
};

func void dia_dmt_12120_dagot_runen_circle_6_spl_massdeath()
{
	b_teachplayertalentrunesguardians(self,other,SPL_MassDeath);
};

func void dia_dmt_12120_dagot_runen_circle_6_spl_skull()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Skull);
};


instance DIA_DMT_12120_DAGOT_GIVEARMORGUARDIANS(C_Info)
{
	npc = dmt_12120_dagot;
	condition = dia_dmt_12120_dagot_givearmorguardians_condition;
	information = dia_dmt_12120_dagot_givearmorguardians_info;
	permanent = FALSE;
	description = "Půjdu do Irdorathských síní!";
};


func int dia_dmt_12120_dagot_givearmorguardians_condition()
{
	if((CHOOSEDARK == TRUE) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_12120_dagot_givearmorguardians_info()
{
	AI_Output(other,self,"DIA_DMT_12120_Dagot_GiveArmorGuardians_01_01");	//Půjdu do Irdorathských síní. Můžu se spoléhat na vaší pomoc?
	AI_Output(self,other,"DIA_DMT_12120_Dagot_GiveArmorGuardians_01_02");	//Hmmm... Strážci nemají zasahovat do průběhu duchovního boje. A ty to víš!
	AI_Output(self,other,"DIA_DMT_12120_Dagot_GiveArmorGuardians_01_03");	//Nicméně musíme tě chápat vždyť jsi vlastně skoro jedním z nás.
	AI_Output(self,other,"DIA_DMT_12120_Dagot_GiveArmorGuardians_01_04");	//Proto přijmi ode mě tento dar jako dobrou vůli.
	B_GiveInvItems(self,other,ItPo_GuardiansElixir,1);
	AI_Output(self,other,"DIA_DMT_12120_Dagot_GiveArmorGuardians_01_06");	//Není to mnoho... Zbytek záleží na tobě.
	AI_Output(other,self,"DIA_DMT_12120_Dagot_GiveArmorGuardians_01_07");	//Děkuji.
	AI_Output(self,other,"DIA_DMT_12120_Dagot_GiveArmorGuardians_01_08");	//Nyní jdi. A udělej něco dobrého pro svět.
	AI_StopProcessInfos(self);
};


instance DIA_DMT_12120_DAGOT_GIVEELIGORRUNE(C_Info)
{
	npc = dmt_12120_dagot;
	condition = dia_dmt_12120_dagot_giveeligorrune_condition;
	information = dia_dmt_12120_dagot_giveeligorrune_info;
	permanent = FALSE;
	description = "To je vše.";
};


func int dia_dmt_12120_dagot_giveeligorrune_condition()
{
	if((CHOOSEDARK == TRUE) && (DemonologSkill[0] == 6) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4))
	{
		return TRUE;
	};
};

func void dia_dmt_12120_dagot_giveeligorrune_info()
{
	AI_Output(other,self,"DIA_DMT_12120_Dagot_GiveEligorRune_01_01");	//To je vše co se můžu naučit?
	AI_Output(self,other,"DIA_DMT_12120_Dagot_GiveEligorRune_01_02");	//(vážně) A co ještě chceš vědět?
	AI_Output(other,self,"DIA_DMT_12120_Dagot_GiveEligorRune_01_03");	//Očekával jsem toho více! To je vše co vy Strážci mi můžete nabídnout?
	AI_Output(self,other,"DIA_DMT_12120_Dagot_GiveEligorRune_01_06");	//Ano protože božský původ dokáže čerpat energii Stvořitele! Musíš pochopit, že každá příšera tohoto světa byla stvořena určitým bohem.
	AI_Output(self,other,"DIA_DMT_12120_Dagot_GiveEligorRune_01_07");	//A tyto bytosti jsou zcela podřízeny svým tvůrcům. My Strážci jsme taky předmětem této síly!
	AI_Output(other,self,"DIA_DMT_12120_Dagot_GiveEligorRune_01_08");	//A mohu ji zvládnout?
	AI_Output(self,other,"DIA_DMT_12120_Dagot_GiveEligorRune_01_09");	//No ano... (zamyšleně) Pravda o těchto tvorech je... Dobrá... (potichu) Vezmi si runu, a nevyzraď o nás NIC...
	CreateInvItems(self,itru_eligordemons,1);
	B_GiveInvItems(self,other,itru_eligordemons,1);
	AI_Output(other,self,"DIA_DMT_12120_Dagot_GiveEligorRune_01_10");	//Jaký druh runy?
	AI_Output(self,other,"DIA_DMT_12120_Dagot_GiveEligorRune_01_11");	//S ní můžeš přivolat na pomoc bytosti, jejichž síle se nic nevyrovná!
	AI_Output(other,self,"DIA_DMT_12120_Dagot_GiveEligorRune_01_12");	//Kdo jsou ti tvorové?
	AI_Output(self,other,"DIA_DMT_12120_Dagot_GiveEligorRune_01_13");	//Démoni!... (vážně) Démoni z legie Eligora, vládce Langu.
	AI_Output(self,other,"DIA_DMT_12120_Dagot_GiveEligorRune_01_14");	//Tyto bytosti nám slouží už celá milénia. Nyní budou sloužit tobě!
	AI_Output(self,other,"DIA_DMT_12120_Dagot_GiveEligorRune_01_15");	//Ale pamatuj každá moc jednou skončí. Neber to jako varování ale pouze radu.
	AI_StopProcessInfos(self);
};


instance DMT_12120_DAGOT_TASKS(C_Info)
{
	npc = dmt_12120_dagot;
	condition = dmt_12120_dagot_tasks_condition;
	information = dmt_12120_dagot_tasks_info;
	permanent = FALSE;
	description = "Nemáš pro mě další pokyny?";
};


func int dmt_12120_dagot_tasks_condition()
{
	if((CHOOSEDARK == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12120_dagot_tasks_info()
{
	AI_Output(other,self,"DMT_12120_Dagot_Tasks_01_01");	//Nemáš pro mě další pokyny?
	AI_Output(self,other,"DMT_12120_Dagot_Tasks_01_02");	//Myslím, že nic... (vážně) Všechno co bys měl udělat jsi již udělal!
	AI_Output(self,other,"DMT_12120_Dagot_Tasks_01_03");	//A to ostatní ještě není připraveno.
	AI_Output(self,other,"DMT_12120_Dagot_Tasks_01_04");	//Nicméně brzy přijde čas, kdy tě zavoláme.
};

