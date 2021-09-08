
instance DIA_GORN_LI_KAP5_EXIT(C_Info)
{
	npc = pc_fighter_li;
	nr = 999;
	condition = dia_gorn_li_kap5_exit_condition;
	information = dia_gorn_li_kap5_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gorn_li_kap5_exit_condition()
{
	return TRUE;
};

func void dia_gorn_li_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORN_LI_TEACH(C_Info)
{
	npc = pc_fighter_li;
	nr = 10;
	condition = dia_gorn_li_teach_condition;
	information = dia_gorn_li_teach_info;
	permanent = TRUE;
	description = "Potřebuji trénink.";
};


func int dia_gorn_li_teach_condition()
{
	return TRUE;
};

func void dia_gorn_li_teach_info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Teach_15_00");	//Potřebuji trénink.
	AI_Output(self,other,"DIA_Gorn_DI_Teach_12_01");	//To nemůže uškodit.
	Info_ClearChoices(dia_gorn_li_teach);
	Info_AddChoice(dia_gorn_li_teach,Dialog_Back,dia_gorn_li_teach_back);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gorn_li_teach_2h_5);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gorn_li_teach_2h_1);
};

func void dia_gorn_li_teach_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_1_12_00");	//Skvělé. Nyní jsi lepší než před tím.
	};
	Info_ClearChoices(dia_gorn_li_teach);
	Info_AddChoice(dia_gorn_li_teach,Dialog_Back,dia_gorn_li_teach_back);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gorn_li_teach_2h_5);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gorn_li_teach_2h_1);
};

func void dia_gorn_li_teach_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_5_12_00");	//Musíš držet zbraň výš. Přes tvoje krytí by se dostal i slepec svou holí.
	};
	Info_ClearChoices(dia_gorn_li_teach);
	Info_AddChoice(dia_gorn_li_teach,Dialog_Back,dia_gorn_li_teach_back);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gorn_li_teach_2h_5);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gorn_li_teach_2h_1);
};

func void dia_gorn_li_teach_back()
{
	Info_ClearChoices(dia_gorn_li_teach);
};


instance DIA_FIGHTER_LI_PICKPOCKET(C_Info)
{
	npc = pc_fighter_li;
	nr = 900;
	condition = dia_fighter_li_pickpocket_condition;
	information = dia_fighter_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_fighter_li_pickpocket_condition()
{
	return C_Beklauen(10,45);
};

func void dia_fighter_li_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_li_pickpocket);
	Info_AddChoice(dia_fighter_li_pickpocket,Dialog_Back,dia_fighter_li_pickpocket_back);
	Info_AddChoice(dia_fighter_li_pickpocket,DIALOG_PICKPOCKET,dia_fighter_li_pickpocket_doit);
};

func void dia_fighter_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_fighter_li_pickpocket);
};

func void dia_fighter_li_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_li_pickpocket);
};


instance DIA_GORN_LI_STORMFEAR(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_stormfear_condition;
	information = dia_gorn_li_stormfear_info;
	permanent = FALSE;
	description = "Co se děje?";
};


func int dia_gorn_li_stormfear_condition()
{
	return TRUE;
};

func void dia_gorn_li_stormfear_info()
{
	AI_Output(other,self,"DIA_Gorn_LI_StormFear_00_00");	//Co se děje?
	AI_Output(self,other,"DIA_Gorn_LI_StormFear_00_01");	//Mohlo by být lépe, příteli.
	AI_Output(self,other,"DIA_Gorn_LI_StormFear_00_02");	//Po té bouři je mi zle!
};


instance DIA_GORN_LI_BRINGFOOD(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_bringfood_condition;
	information = dia_gorn_li_bringfood_info;
	permanent = FALSE;
	description = "Je načase uklidnit se.";
};


func int dia_gorn_li_bringfood_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_li_stormfear))
	{
		return TRUE;
	};
};

func void dia_gorn_li_bringfood_info()
{
	AI_Output(other,self,"DIA_Gorn_LI_BringFood_00_00");	//Je načase uklidnit se.
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_01");	//Tobě se to snadno říká! Většinu cesty jsi proležel v bezvědomí.
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_02");	//Byla to hrůza s těmi vlnami!
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_03");	//Pokud mě teď něco dokáže uklidnit, pak jen pořádný dlabanec!
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_04");	//Nicméně...
	if(TorlofIsCaptain == TRUE)
	{
		AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_06");	//Podle Torlofa se naše zásoby velmi rychle tenčí.
	};
	if(JorgenIsCaptain == TRUE)
	{
		AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_07");	//Podle Jorgena se naše zásoby velmi rychle tenčí.
	};
	if(JackIsCaptain == TRUE)
	{
		AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_08");	//Podle Jacka se naše zásoby velmi rychle tenčí.
	};
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_09");	//Všichni si musí utáhnout opasky - ale mě to dá zabrat nejvíc!
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_13");	//Teď si nemůžu dát pořádnej žvanec!
	AI_Output(other,self,"DIA_Gorn_LI_BringFood_00_15");	//Mně se ale zdá, že na ostrově je zvěre docela hodně.
	AI_Output(other,self,"DIA_Gorn_LI_BringFood_00_16");	//Kdybychom začali lovit, možná by se naše zásoby zvětšily.
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_17");	//To máš recht, ale chlapi říkaj, že bychom z pobřeží chodit neměli.
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_18");	//Nikdo neví co tam může být.
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_19");	//A sám tam rozhodně nepůjdu!
};


instance DIA_GORN_LI_BRINGFOODPROGGRESS(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_bringfoodproggress_condition;
	information = dia_gorn_li_bringfoodproggress_info;
	permanent = FALSE;
	description = "Kolik jídla potřebujeme?";
};


func int dia_gorn_li_bringfoodproggress_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_li_bringfood))
	{
		return TRUE;
	};
};

func void dia_gorn_li_bringfoodproggress_info()
{
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggress_00_00");	//Kolik jídla potřebujeme?
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggress_00_01");	//Čím víc, tím líp! Nevíme jak dlouho tu ještě budem!
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggress_00_03");	//Hmmm... Myslím, že pro začátek by dva tucty fláků masa a dvacet jablek mělo stačit.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggress_00_05");	//Copak, rozhodnul ses jít na lov?
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggress_00_06");	//No, proč ne. Někdo stějne musí prozkoumat ostrov.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggress_00_12");	//Jestli jsi tedy rozhodnutý to udělat, tak tedy hodně štěstí.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggress_00_13");	//Ale pamatuj - zásoby sice potřebujem, ale dávej si pozor!
	MIS_BRINGFOOD = LOG_Running;
	Log_CreateTopic(TOPIC_BRINGFOOD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_Running);
	B_LogEntry(TOPIC_BRINGFOOD,"Gorn mi řekl, že zásoby na lodi se chýlí ke konci a proto si všichni chlapi musí utáhnout opasky, což zrovna k dobré náladě nepřispívá. Mám v pláně jít na lov do vnitrozemí a doplnit zásoby. Gorn říká, že pro začátek by 24 kusů masa a dvacet jablek mělo stačit.");
};


instance DIA_GORN_LI_BRINGFOODPROGGRESSTOEND(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_bringfoodproggresstoend_condition;
	information = dia_gorn_li_bringfoodproggresstoend_info;
	permanent = FALSE;
	description = "Mám čerstvé maso a jablka.";
};


func int dia_gorn_li_bringfoodproggresstoend_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 24) && (Npc_HasItems(hero,ItFo_Apple) >= 20))
	{
		return TRUE;
	};
};

func void dia_gorn_li_bringfoodproggresstoend_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggressToEnd_00_00");	//Mám to maso a jablka.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_01");	//Výborně příteli, teď jestli chcípnem, tak ne hladem.
	if(TorlofIsCaptain == TRUE)
	{
		AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_03");	//Myslím, že bys to měl zanést Torlofovi!
	};
	if(JorgenIsCaptain == TRUE)
	{
		AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_04");	//Myslím, že bys to měl zanést Jorgenovi!
	};
	if(JackIsCaptain == TRUE)
	{
		AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_05");	//Myslím, že bys to měl zanést Jackovi!
	};
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_06");	//On už bude vědět, co s tím.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_08");	//Počkej! (tiše) Ještě něco...
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggressToEnd_00_09");	//Co?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_10");	//Jak ho znám, tak kapitán určitě nebude tím jídlem zrovna rozhazovat, i když ho teď bude hodně.
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggressToEnd_00_12");	//Co tím chceš říct?
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_13");	//No, že... Pokud by náhodou někde pár z těch fláků masa ztratil...
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_14");	//... prostě mi část přines. V břiše mi kručí tak, že to je slyšet až do Khorinisu!
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_18");	//Odměním se ti, chlape, na to se spolehni.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_19");	//Jenom si pamatuj, že syrové maso je mi nanic!
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_20");	//Ale hezky propečené bych neodmítnul.
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggressToEnd_00_23");	//Kolik bys potřeboval?
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_24");	//Tak deset velkých, propečených, šťavnatých a křupavých kousků bude akorát dost.
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggressToEnd_00_25");	//No tak jo, kouknu se co se dá dělat.
	B_LogEntry(TOPIC_BRINGFOOD,"Mám to jídlo, ktoré po mně chtěl Gorn. Teď bych ho měl zanést kapitánovi a ten už zařídí zbytek.");
	Log_AddEntry(TOPIC_BRINGFOOD,"Mezitím mě Gorn požádal, jestli bych pro něj deset z těch kousků masa v lodní kuchyni neopekl. Ten ubožák by už od hladu snědl i vlastní boty.");
	GORNTELLABOUTMEAT = TRUE;
};


instance DIA_GORN_LI_BRINGFOODBEGINEND(C_Info)
{
	npc = pc_fighter_li;
	nr = 1;
	condition = dia_gorn_li_bringfoodbeginend_condition;
	information = dia_gorn_li_bringfoodbeginend_info;
	permanent = FALSE;
	description = "Tady máš pečené maso!";
};


func int dia_gorn_li_bringfoodbeginend_condition()
{
	if((GORNTELLABOUTMEAT == TRUE) && (NOTTHANKSTELLALLMEAT == TRUE) && (Npc_HasItems(hero,ItFoMutton) >= 10))
	{
		return TRUE;
	};
};

func void dia_gorn_li_bringfoodbeginend_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodBeginEnd_00_01");	//Tady máš pečené maso!
	B_GiveInvItems(other,self,ItFoMutton,10);
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_00_02");	//Díky chlape! Konečně utiším tu děsnou bolest!
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_00_06");	//Strašně moc ti děkuju.
	if(MIS_BRINGFOOD == LOG_Running)
	{
		B_LogEntry(TOPIC_BRINGFOOD,"Přinesl jsem Gornovi maso - má velkou radost!");
	};
	Info_ClearChoices(dia_gorn_li_bringfoodbeginend);
	if((MIS_MISSMYGOLD == LOG_Running) && (GORNTELLNONEABOUTGOLD == TRUE) && (Npc_HasItems(hero,itmi_misstorlofthing) == 0))
	{
		Info_AddChoice(dia_gorn_li_bringfoodbeginend,"Řekni mi, kde je mé ztracené zlato...",dia_gorn_li_bringfoodbeginend_missgold);
	};
	Info_AddChoice(dia_gorn_li_bringfoodbeginend,"Zlato postačí!",dia_gorn_li_bringfoodbeginend_gold);
	Info_AddChoice(dia_gorn_li_bringfoodbeginend,"Máš něco speciálního?",dia_gorn_li_bringfoodbeginend_special);
};

func void dia_gorn_li_bringfoodbeginend_missgold()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_00");	//Řekni mi, kde je mé ztracené zlato...
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_01");	//Jak jsi na tohle přišel?!
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_02");	//Já o tom přece nic nevím, co chceš slyšet?!
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_05");	//Dobrá, tak kdo z chlapů o tom něco ví?!
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_06");	//To přesně nevím! Ale vím, že kapitán má přehled o všem co se tu děje.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_07");	//Nemyslím, že by se tu zabýval prací, takže má čas vše sledovat a vím, čím bys z něj dostal odpověď.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_09");	//V průběhu bouře ztratil kompas a teď mluví jen o něm.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_10");	//Byl tím velmi otřesen - ten kousek měl pro něj velkou hodnotu!
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_15");	//To je vše.
	GORNTELLABOUTCOMPAS = TRUE;
	if(TorlofIsCaptain == TRUE)
	{
		B_LogEntry(TOPIC_MISSMYGOLD,"Gorn věří, že kdo by o mém zlatu věděl je kapitán. Ví prej o všem co se tu děje a poradil mi jak na něj - Torlof v průběhu bouře ztratil zlatý kompas, nějaký cenný kousek, který mu je velmi drahý! Když ho najdu, určitě si se mnou popovídá a řekne něco zajímavého!");
	};
	if(JorgenIsCaptain == TRUE)
	{
		B_LogEntry(TOPIC_MISSMYGOLD,"Gorn věří, že kdo by o mém zlatu věděl je kapitán. Ví prej o všem co se tu děje a poradil mi jak na něj - Jorgen v průběhu bouře ztratil zlatý kompas, nějaký cenný kousek, který mu je velmi drahý! Když ho najdu, určitě si se mnou popovídá a řekne něco zajímavého!");
	};
	if(JackIsCaptain == TRUE)
	{
		B_LogEntry(TOPIC_MISSMYGOLD,"Gorn věří, že kdo by o mém zlatu věděl je kapitán. Ví prej o všem co se tu děje a poradil mi jak na něj - Jack v průběhu bouře ztratil zlatý kompas, nějaký cenný kousek, který mu je velmi drahý! Když ho najdu, určitě si se mnou popovídá a řekne něco zajímavého!");
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(pc_fighter_li,"EatMeat");
};

func void dia_gorn_li_bringfoodbeginend_gold()
{
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodBeginEnd_Gold_00_00");	//Zlato postačí!
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_Gold_00_01");	//Když to říkáš - tak zde jsou dva tisíce zlatých!
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_Gold_00_04");	//A nyní promiň, ale jdu se nacpat!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(pc_fighter_li,"EatMeat");
};

func void dia_gorn_li_bringfoodbeginend_special()
{
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodBeginEnd_Special_00_00");	//Máš něco speciálního?
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_Special_00_01");	//Hmm... No, tenhle lektvar.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_Special_00_02");	//Vzal jsem si ho sebou na Irdorath, ale jaksi na něj nedošlo!
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_Special_00_03");	//Na, vem si ho.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_Special_00_05");	//Bezva - a teď mě omluv, jdu se nacpat!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(pc_fighter_li,"EatMeat");
};


instance DIA_GORN_LI_HALLO(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_hallo_condition;
	information = dia_gorn_li_hallo_info;
	permanent = TRUE;
	description = "Vše v pořádku?";
};


func int dia_gorn_li_hallo_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_li_bringfoodbeginend))
	{
		return TRUE;
	};
};

func void dia_gorn_li_hallo_info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Hallo_00_00");	//Vše v pořádku?
	AI_Output(self,other,"DIA_Gorn_DI_Hallo_00_01");	//Joo, jsem plnej.
	AI_Output(self,other,"DIA_Gorn_DI_Hallo_00_03");	//Protože je tu děsná nuda, chlape.
};


instance DIA_FIGHTER_LI_MISSMYGOLD(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_fighter_li_missmygold_condition;
	information = dia_fighter_li_missmygold_info;
	permanent = FALSE;
	description = "Kam se podělo mé zlato?";
};


func int dia_fighter_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_fighter_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Fighter_LI_MissMyGold_01_01");	//Kam se podělo mé zlato?
	AI_Output(self,other,"DIA_Fighter_LI_MissMyGold_01_04");	//Já nic nevím, zeptej se raději ostatních chlapů!
	GORNTELLNONEABOUTGOLD = TRUE;
	B_LogEntry(TOPIC_MISSMYGOLD,"Gorn říká, že o mém zlatu nic neví.");
};


instance DIA_FIGHTER_LI_AWAY(C_Info)
{
	npc = pc_fighter_li;
	nr = 3;
	condition = dia_fighter_li_away_condition;
	information = dia_fighter_li_away_info;
	permanent = FALSE;
	description = "Čas vrátit se na loď.";
};


func int dia_fighter_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (GORNLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_li_away_info()
{
	var int countpeopple;
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Fighter_LI_Away_01_01");	//Čas vrátit se na loď.
	AI_Output(self,other,"DIA_Fighter_LI_Away_01_02");	//Konečně opraveno?!
	AI_Output(other,self,"DIA_Fighter_LI_Away_01_03");	//Před chvílí se donočily poslední opravy a jsme připraveni odplout.
	AI_Output(self,other,"DIA_Fighter_LI_Away_01_04");	//Konečně, zde bychom dlouho nepřežili - nebo alepoň já bych nečinností chcípl.
	B_LogEntry(TOPIC_GATHERCREW,"Řekl jsem Gornovi, že zvedáme kotvy - šel na loď a je štěstím bez sebe!");
	GORNLIONBOARD = TRUE;
	if((GORNLIHERE == TRUE) && (GORNLIONBOARD == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((MILTENLIONBOARD == TRUE) && (MILTENLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((COUNTPEOPLEONBEACH <= countpeopple) && (LICREWONBOARD == FALSE))
	{
		LICREWONBOARD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_FIGHTER_LI_FINDMAGICORECAVE(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_fighter_li_findmagicorecave_condition;
	information = dia_fighter_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Našel jsem jeskyni s ložiskem magické rudy.";
};


func int dia_fighter_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Fighter_LI_FindMagicOreCave_01_01");	//Našel jsem jeskyni s ložiskem magické rudy.
	AI_Output(self,other,"DIA_Fighter_LI_FindMagicOreCave_01_02");	//Opravdu? Měl bys to říci kapitánovi.
	AI_Output(self,other,"DIA_Fighter_LI_FindMagicOreCave_01_03");	//Myslím, že by to měl slyšet.
	GOTOORECAPITAN = TRUE;
};


instance DIA_FIGHTER_LI_CHANGECOURSE(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_fighter_li_changecourse_condition;
	information = dia_fighter_li_changecourse_info;
	permanent = FALSE;
	description = "Měli bychom se vrátit na Khorinis.";
};


func int dia_fighter_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_fighter_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Fighter_LI_ChangeCourse_01_00");	//Měli bychom se vrátit na Khorinis.
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_01_01");	//Jak tě to napadlo, chlape?!
	Info_ClearChoices(dia_fighter_li_changecourse);
	Info_AddChoice(dia_fighter_li_changecourse,"Chci paladiny informovat o ložisku na ostrově.",dia_fighter_li_changecourse_ore);
	Info_AddChoice(dia_fighter_li_changecourse,"Jde tu o zlato.",dia_fighter_li_changecourse_gold);
};

func void dia_fighter_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Fighter_LI_ChangeCourse_Ore_01_01");	//Chci paladiny informovat o ložisku na ostrově.
	AI_Output(other,self,"DIA_Fighter_LI_ChangeCourse_Ore_01_04");	//Ta ruda jim dá mnohem větší šanci na vítězství ve válce proti skřetům.
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Ore_01_05");	//Hmm... Khorinis je daleko a kvůli paladinům se mi do pekla vracet nechce!
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Ore_01_07");	//Je jedno jestli mají rudu nebo ne - prostě je jich na vítězství málo!
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Ore_01_08");	//Jestli se vrátím na Khorinis, tak jen kvůli měšťanům a rozlousknu pár skřetích lebek.
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Ore_01_09");	//Jsem si jistý, že situaci paladinů už nic nezlepší - kašlu na paladiny.
	AI_Output(other,self,"DIA_Fighter_LI_ChangeCourse_Ore_01_11");	//Bojíš se snad?!
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Ore_01_12");	//Tak ty takhle!... Dobrá, bude mi potěšením zabít pár těch nestvůr!
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Ore_01_13");	//Však uvidíš co já a má sekera dokážeme.
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Ore_01_15");	//Ehh... Tak dobrá, ale donutil jsi mě!
	B_LogEntry(TOPIC_CHANGECOURSE,"Gorn prý kašle na paladiny, ale nakonec se mnou pojede.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Mluvil jsem se všemi chlapi, teď bych měl za kapitánem.");
	};
	Info_ClearChoices(dia_fighter_li_changecourse);
};

func void dia_fighter_li_changecourse_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Fighter_LI_ChangeCourse_Gold_01_01");	//Jde tu o zlato - chci prodat paladinům rudu z ostrova.
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Gold_01_02");	//Tak to jdu s tebou!
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Gold_01_03");	//Už dlouho jsem nezabil skřeta a zlato se taky hodí.
	B_LogEntry(TOPIC_CHANGECOURSE,"Gorn neodolal volání zlata a vrací se, se mnou na Khorinis.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Mluvil jsem se všemi chlapi, teď bych měl za kapitánem.");
	};
	Info_ClearChoices(dia_fighter_li_changecourse);
};

