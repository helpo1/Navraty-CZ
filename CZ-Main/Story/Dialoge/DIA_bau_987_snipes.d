
instance DIA_SNIPES_EXIT(C_Info)
{
	npc = bau_987_snipes;
	nr = 999;
	condition = dia_snipes_exit_condition;
	information = dia_snipes_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_snipes_exit_condition()
{
	return TRUE;
};

func void dia_snipes_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SNIPES_HALLO(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_hallo_condition;
	information = dia_snipes_hallo_info;
	permanent = FALSE;
	description = "Hej, Snipesi! Jak to jde?";
};


func int dia_snipes_hallo_condition()
{
	return TRUE;
};

func void dia_snipes_hallo_info()
{
	AI_Output(other,self,"DIA_Snipes_HALLO_01_00");	//Hej, Snipesi! Jak to jde?
	AI_Output(self,other,"DIA_Snipes_HALLO_01_01");	//Cože?... Kdo jsi?... (udiveně) Co ode mě chceš?
	AI_Output(other,self,"DIA_Snipes_HALLO_01_02");	//Mám tě pozdravovat od Vipera.
	AI_Output(self,other,"DIA_Snipes_HALLO_01_03");	//Od koho?!
	AI_Output(other,self,"DIA_Snipes_HALLO_01_04");	//Od Vipera! Myslím, že bys ho měl znát...
	AI_Output(self,other,"DIA_Snipes_HALLO_01_05");	//Hmm...? Vážně mi jméno toho chlapa nic neříká... (zamyšleně)
	AI_Output(self,other,"DIA_Snipes_HALLO_01_06");	//Můžeš mi připomenout, kde jsem se s ním mohl setkat. Co?!
	Info_AddChoice(dia_snipes_hallo,"Jak to mám vědět!",dia_snipes_hallo_answer1);
	Info_AddChoice(dia_snipes_hallo,"Seděli jste spolu v Hornickém údolí.",dia_snipes_hallo_answer2);
	Info_AddChoice(dia_snipes_hallo,"Je zvláštní, že si to nepamatuješ.",dia_snipes_hallo_answer3);
	Info_AddChoice(dia_snipes_hallo,"Zdá se, že máte ještě jeden nevyřízený obchod.",dia_snipes_hallo_answer4);
};

func void dia_snipes_hallo_answer1()
{
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer1_01_00");	//Jak to mám vědět!
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer1_01_01");	//A mě se ptáš!... (smích) Hmm... Očividně sis mě s někým spletl, chlape.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer1_01_02");	//Neznám a nikdy jsem neznal žádného Vipera. Nech mě pracovať!
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer1_01_04");	//Dobrá, jak si přeješ.
	Info_ClearChoices(dia_snipes_hallo);
};

func void dia_snipes_hallo_answer2()
{
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer2_01_00");	//Seděli jste spolu v Hornickém údolí.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer2_01_01");	//COŽE?!... Ha! Poslouchej, co ti řeknu...
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer2_01_03");	//Nemám tušení, kdo je ten Viper a proč s tím chodíš za mnou!... (podrážděně)
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer2_01_04");	//Tak mi nedávej takové hloupé otázky a nech mě pracovat.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer2_01_05");	//Dobře. Jak chceš!
	Info_ClearChoices(dia_snipes_hallo);
};

func void dia_snipes_hallo_answer3()
{
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer3_01_00");	//Je zvláštní, že si to nepamatuješ.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer3_01_01");	//Zajímavé, že Viper si tě pamatuje dokonale od dob, kdy jste spolu seděli ve Starém dole.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer3_01_02");	//Ve Starém dole?! O čem to mluvíš, chlape?!
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer3_01_03");	//Nemám tušení, kdo je ten Viper a proč s tím chodíš za mnou!... (tiše)
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer3_01_05");	//Víš co, vypadá to, že sis mě s někým spletl. To se stává! Myslím, že bude lepší, když mě necháš o samotě.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer3_01_10");	//Dobrá, dobrá... Jak si přeješ!
	AI_StopProcessInfos(self);
};

func void dia_snipes_hallo_answer4()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_00");	//Zdá se, že máte ještě jeden nevyřízený obchod.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_01");	//Ano?!... (nechápavě) O co se jedná?
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_02");	//Tento obchod souvisí s menším nákladem rudy.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_03");	//Rudy?! Jaké rudy?... (se zájmem)
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_04");	//Té, kterou jste podle Vipera vzali ze Starého dolu, když se zavalil.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_05");	//A určitě chápeš, že by mnohé zajímalo, co se s tím nákladem rudy stalo...
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_06");	//Hezký příběh! Ha, ha, ha... (smích) Kdybych tu rudu měl, myslíš, že bych se teď obtěžoval pracovat pro Lobarta?
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_07");	//A mimo to - myslíš, že bych se o něčem takovém bavil s cizencem jako jsi ty? (smích)
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_08");	//Ale já bych řekl, že už jsme se dříve také setkali.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_09");	//My?! Nepravděpodobné... (nedůvěřivě)
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_10");	//Možná se mýlím, ale vzpomínám si, že ses rád vysmíval strážím ve Starém dole. Klíč od Aaronovy truhly, pamatuješ?
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_13");	//Hmm... Dobrá, dobrá! Dostals mě. To jsem nečekal!
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_14");	//Takže říkáš, že se Viper ukázal... A pozdravuje mě. A já jsem myslel, že je mrtvý.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_15");	//Ne, všechno je v pořádku, je v krčmě v khoriniském přístavu.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_16");	//No, tak to je dobře!
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_17");	//A co ta ruda?
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_18");	//Hmm... To Viper ti o ní řekl?
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_19");	//No, kdo jiný! A taky mluvil o tom, jak jste unikli smrti, když se Starý důl zavalil.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_20");	//Hmm... Hm... (zamyšleně) Abych byl upřímný, taky bych rád věděl, kde ta ruda je!
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_22");	//Jak říkám. Ve skutečnosti vím o té rudě prakticky tolik, kolik ví i Viper.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_24");	//To bylo tak, Viper chtěl sledovat, jestli nás někdo nepronásleduje - já s Alephem jsme šli dál.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_2A");	//O něco později jsme narazili na jednu jeskyni a shodli jsme se, že by to bylo dobré místo, kde schovat naši rudu.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_25");	//Zůstal jsem stát u vchodu do té jeskyně, takže jsem hlídal...
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_26");	//A Aleph šel s rudou do jeskyně. A za několik minut došlo k nějakému výbuchu, který mě omráčil tak, že jsem se neudržel na nohou...
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_27");	//Když jsem padal, tak jsem se hlavou praštil o kámen a ztratil tak vědomí...
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_28");	//Zřejmě to byla kolabující magická bariéra.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_29");	//Jo, to bude ono!... Když jsem se probudil, tak jsem viděl, že vchod do jeskyně blokují kameny.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_30");	//Aleph nebyl nikde poblíž. Zřejmě zůstal uvnitř, v jeskyni - stejně tak ruda, kterou jsme takovou náhodou dostali do svých rukou...
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_31");	//Vstal jsem a vydal jsem se hledat Vipera. Když jsem dorazil na místo, kde jsme ho viděli naposled, už tam nebyl.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_34");	//Dostal jsem se do Khorinisu, pár dní vysedával v hostinci 'U Mrtvé harpyje' - najedl se normálním jídlem a pořádně se vyspal.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_36");	//A tak nevíš, kde ta ruda je...
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_37");	//Ne. Pokud to někdo ví - tak je to Aleph! Ale obávám se, že už není naživu.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_38");	//A kde je ta jeskyně, ve které jste chtěli nechat tu rudu.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_39");	//Snad ses nerozhodl jít do toho prokletého údolí?! Jsi blázen... To místo je plné skřetů!
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_40");	//Se skřety si nějak poradím. Tak kde je ta jeskyně?
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_41");	//Tvoje věc. Vzpomínám, že ta jeskyně byla po cestě do Starého tábora, poblíž Cavalornovy chatrče. Zkus se podívat tam.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_42");	//A ještě jedna věc. Pokud to najdeš, nezapomeň, že třetina té rudy patří mně!
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_52");	//Já taky býval trestanec. A my, bývalí vězni, bychom měli držet při sobě.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_53");	//Jo, máš pravdu! No a teď - je čas se znovu pustit do práce... (s odporem)
	B_LogEntry(TOPIC_VIPERNUGGETS,"Potkal jsem Snipese, pracovníka na Lobartově farmě. A byl to ten Snipes, který jednou se svými přáteli - Alephem a Viperem měli v rukou množství rudy. Naneštěstí, Snipes neví, kde ta ruda je. Jediná věc, s kterou mi pomohl, bylo popsání místa - přesněji jeskyně, kde, jak řek, se rozhodli s Alephem schovat rudu. Jeho slovy je ta jeskyně po cestě z Nového tábora do Starého tábora, poblíž Cavalornovy chatrče.");
	MEETSNIPS = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SNIPES_HOWWORK(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_howwork_condition;
	information = dia_snipes_howwork_info;
	permanent = TRUE;
	description = "Jak jde práce?";
};


func int dia_snipes_howwork_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_hallo) && (MEETSNIPS == FALSE) && (SNIPESRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_snipes_howwork_info()
{
	AI_Output(other,self,"DIA_Snipes_HowWork_01_00");	//Jak jde práce?
	AI_Output(self,other,"DIA_Snipes_HowWork_01_01");	//Odpal! Nepřerušuj mě v práci!
	AI_StopProcessInfos(self);
};


instance DIA_SNIPES_HOWWORKGOOD(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_howworkgood_condition;
	information = dia_snipes_howworkgood_info;
	permanent = TRUE;
	description = "Jak se máš, Snipesi?";
};

func int dia_snipes_howworkgood_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_hallo) && (MEETSNIPS == TRUE) && (SNIPESRECRUITEDDT == FALSE) && (MIS_VIPERNUGGETS == LOG_Running) && (SNIPSGETNUGGETS == FALSE) && (SNIPSGETNUGGETS == FALSE))
	{
		return TRUE;
	};
};

func void dia_snipes_howworkgood_info()
{
	AI_Output(other,self,"DIA_Snipes_HowWorkGood_01_00");	//Jak se máš, Snipesi?
	AI_Output(self,other,"DIA_Snipes_HowWorkGood_01_01");	//Zkus hádat. Od rána do večera to samé - beze smyslu.
	AI_Output(self,other,"DIA_Snipes_HowWorkGood_01_02");	//Snad brzo najdeš tu rudu. Potom - eeeh!... (smutný povzdech)
};


instance DIA_SNIPES_GETTREASURE(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_gettreasure_condition;
	information = dia_snipes_gettreasure_info;
	permanent = FALSE;
	description = "Hej, Snipesi! Něco pro tebe mám.";
};

func int dia_snipes_gettreasure_condition()
{
	if((MIS_VIPERNUGGETS == LOG_Running) && (Npc_HasItems(other,ItMi_Nugget) >= 200) && (SNIPSGETNUGGETS == FALSE) && (TALKTOALEF == TRUE))
	{
		return TRUE;
	};
};

func void dia_snipes_gettreasure_info()
{
	AI_Output(other,self,"DIA_Snipes_GetTreasure_01_00");	//Hej, Snipesi! Něco pro tebe mám.
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_01");	//Jediná věc, kterou potřebuji, je moje ruda.
	AI_Output(other,self,"DIA_Snipes_GetTreasure_01_02");	//Hmm... Uhádnuls!
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_03");	//CO?! Fakt?! Ale...?! Kde je?!... (nedočkavě)
	AI_Output(other,self,"DIA_Snipes_GetTreasure_01_04");	//Tady - vem si. Přesně 500 nugetů rudy!
	B_GiveInvItems(other,self,ItMi_Nugget,200);
	Npc_RemoveInvItems(self,ItMi_Nugget,Npc_HasItems(self,ItMi_Nugget));
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_05");	//Jak vzrušující! Miláčku!... (skoro zešílel)
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_08");	//Díky, chlape. Nikdy nezapomenu, co jsi pro mě udělal! Mimochodem, dozvěděl ses, co se stalo s Alephem?
	AI_Output(other,self,"DIA_Snipes_GetTreasure_01_11");	//Bohužel ti musím říct, že je mrtvý. Naneštěstí se mu nepovedlo uniknout skřetům v údolí.
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_12");	//Ach jo! Byl to docela dobrý chlap... (smutně)

	if(VIPERGETNUGGETS == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Snipes_GetTreasure_01_13");	//Řekni, co Viper?
		AI_Output(other,self,"DIA_Snipes_GetTreasure_01_14");	//Viperovi jsem už dal jeho část rudy. Řeknu ti, že už nemohl být šťastnější.
		AI_Output(self,other,"DIA_Snipes_GetTreasure_01_15");	//Hmm... To jsem rád!
		MIS_VIPERNUGGETS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_VIPERNUGGETS,LOG_SUCCESS);
		B_LogEntry(TOPIC_VIPERNUGGETS,"Dal jsem Snipesovi jeho podíl. Ze začátku ztrácel naději na štěstí, ale pak se to obrátilo a zahrnul mě díky.");
	}
	else
	{
		B_GivePlayerXP(50);
		AI_Output(self,other,"DIA_Snipes_GetTreasure_01_16");	//A co Viper?
		AI_Output(other,self,"DIA_Snipes_GetTreasure_01_17");	//Zatím jsem na to neměl čas. Ale myslím, že brzy dostane svůj podíl.
		AI_Output(self,other,"DIA_Snipes_GetTreasure_01_18");	//Hmm... To je dobře!
		B_LogEntry(TOPIC_VIPERNUGGETS,"Dal jsem Snipesovi jeho podíl. Ze začátku ztrácel naději na štěstí, ale pak se to obrátilo a zahrnul mě díky.");
	};

	if(SNIPESRECRUITEDDT == FALSE)
	{
		AI_Output(other,self,"DIA_Snipes_GetTreasure_01_19");	//Co budeš dělat teď?
		AI_Output(self,other,"DIA_Snipes_GetTreasure_01_20");	//Nejdřív asi zapadnu k Orlanovi a zpiju se pod obraz.
		AI_Output(self,other,"DIA_Snipes_GetTreasure_01_21");	//Pak nevím - ještě uvidíme.
	};

	AI_Output(other,self,"DIA_Snipes_GetTreasure_01_22");	//Rozumím. Dobrá, musím jít.
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_23");	//Stav se někdy, kámo! Rád tě opět uvidím. A ještě jednou díky!
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_24");	//Jo, ještě bych zapomněl. Vem si za odměnu tohle.
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_25");	//Určitě se ti bude hodit...
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	SNIPSGETNUGGETS = TRUE;
	AI_StopProcessInfos(self);

	if(SNIPESRECRUITEDDT == FALSE)
	{
		Npc_ExchangeRoutine(self,"GetNuggets");
	};
};


instance DIA_SNIPES_HOWLIFE(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_howlife_condition;
	information = dia_snipes_howlife_info;
	permanent = TRUE;
	description = "Je všechno v pořádku?";
};


func int dia_snipes_howlife_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_gettreasure))
	{
		return TRUE;
	};
};

func void dia_snipes_howlife_info()
{
	AI_Output(other,self,"DIA_Snipes_HowLife_01_00");	//Je všechno v pořádku?
	AI_Output(self,other,"DIA_Snipes_HowLife_01_01");	//Už to nemůže být lepší, příteli.
};


instance DIA_SNIPES_PICKPOCKET(C_Info)
{
	npc = bau_987_snipes;
	nr = 900;
	condition = dia_snipes_pickpocket_condition;
	information = dia_snipes_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_snipes_pickpocket_condition()
{
	return C_Beklauen(15,25);
};

func void dia_snipes_pickpocket_info()
{
	Info_ClearChoices(dia_snipes_pickpocket);
	Info_AddChoice(dia_snipes_pickpocket,Dialog_Back,dia_snipes_pickpocket_back);
	Info_AddChoice(dia_snipes_pickpocket,DIALOG_PICKPOCKET,dia_snipes_pickpocket_doit);
};

func void dia_snipes_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_snipes_pickpocket);
};

func void dia_snipes_pickpocket_back()
{
	Info_ClearChoices(dia_snipes_pickpocket);
};


instance DIA_SNIPES_HOWOREHUCK(C_Info)
{
	npc = bau_987_snipes;
	nr = 2;
	condition = dia_snipes_howorehuck_condition;
	information = dia_snipes_howorehuck_info;
	permanent = FALSE;
	description = "Snipesi! Ty jseš kopáč.";
};

func int dia_snipes_howorehuck_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_hallo) && (ABOUTSWBL == TRUE))
	{
		return TRUE;
	};
};

func void dia_snipes_howorehuck_info()
{
	AI_Output(other,self,"DIA_Snipes_HOWOREHUCK_01_00");	//Snipesi! Ty jseš kopáč. Mohl bys mi ukázat pár triků? 
	AI_Output(self,other,"DIA_Snipes_HOWOREHUCK_01_01");	//Samozřejmě, bejby! Víš kolik času jsem strávil ve starém dolu?
	AI_Output(other,self,"DIA_Snipes_HOWOREHUCK_01_02");	//Můžeš mě učit, jak těžit?
	AI_Output(self,other,"DIA_Snipes_HOWOREHUCK_01_03");	//Ano, můžu ti dát pár lekcí...
	AI_Output(other,self,"DIA_Snipes_HOWOREHUCK_01_04");	//Výborne. Nevíš náhodou kdo je schopen roztavit rudu?
	AI_Output(self,other,"DIA_Snipes_HOWOREHUCK_01_05");	//Viper celý život strávil pri tavící peci, možná něco i naučil.
	B_LogEntry(TOPIC_STEELDRAW,"Snipes mě může naučit, jak těžit rudu, Viper by zas mohl být schopen naučit mě ji tavit.");
};

instance DIA_SNIPES_LEARNABOUTERZHUNT(C_Info)
{
	npc = bau_987_snipes;
	nr = 2;
	condition = dia_snipes_learnabouterzhunt_condition;
	information = dia_snipes_learnabouterzhunt_info;
	permanent = TRUE;
	description = "Nauč mě těžit rudu.";
};

func int dia_snipes_learnabouterzhunt_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_howorehuck) && (HERO_HACKCHANCEORE < 50))
	{
		return TRUE;
	};
};

func void dia_snipes_learnabouterzhunt_info()
{
	if(KNOWHOWPICKORE == TRUE)
	{
		AI_Output(other,self,"DIA_SNIPES_LearnAboutErzHunt_01_10");	//Řekni mi víc o těžbě rudy.
	}
	else
	{
		AI_Output(other,self,"DIA_SNIPES_LearnAboutErzHunt_01_00");	//Nauč mě těžit rudu.
	};

	Info_ClearChoices(dia_snipes_learnabouterzhunt);
	Info_AddChoice(dia_snipes_learnabouterzhunt,Dialog_Back,dia_snipes_learnabouterzhunt_Back);
	Info_AddChoice(dia_snipes_learnabouterzhunt,b_buildlearnstringforerzhunt("Těžba rudy",B_GetLearnCostTalent(other,NPC_TALENT_ERZWORK,1)),dia_snipes_learnabouterzhunt_ERZWORK);
};

func void dia_snipes_learnabouterzhunt_Back()
{
	Info_ClearChoices(dia_snipes_learnabouterzhunt);
};

func void dia_snipes_learnabouterzhunt_ERZWORK()
{
	if(HERO_HACKCHANCEORE < 50)
	{
		if(b_teachplayertalenterzhunt(self,other,NPC_TALENT_ERZWORK))
		{
			if(GRIMESTEACHMOREORE == FALSE)
			{
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_01");	//Dobře! Pozorně poslouchej...
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_02");	//Pro začátek je třeba si dobre vybrat - to je polovina úspěchu!
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_03");	//Pak začnete zpracovávat rudnu žílu.
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_04");	//Není třeba trafiť na okraj žíly, ani přesně do středu... Stačí jeden silný úder a pak poněkud slabší.
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_05");	//Takto narušíš strukturu a dalším úderom určitě nějaký kus rudy získaš.
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_06");	//A to opakuješ znovu a znovu - ak sa nudíš. (směje se)
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_07");	//To je hlavní věc, kterou potřebujete vědět o těžbě rudy.
				AI_Output(other,self,"DIA_SNIPES_LearnAboutErzHunt_01_08");	//Dík!
				GRIMESTEACHMOREORE = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_09");	//Dobře! Pozorně poslouchej...
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_11");	//Já už tě naučil všechno, co si pamatuju. Musíš se podívat po jiném učiteli.
	};

	Info_ClearChoices(dia_snipes_learnabouterzhunt);
};

instance DIA_SNIPES_AskforDT(C_Info)
{
	npc = bau_987_snipes;
	nr = 6;
	condition = DIA_SNIPES_AskforDT_condition;
	information = DIA_SNIPES_AskforDT_info;
	permanent = FALSE;
	description = "Hledám zkušeného kopáče.";
};

func int DIA_SNIPES_askfordt_condition()
{
	if((HURRAYICANHIRE == TRUE) && (SearchOreMine == TRUE) && (MEETSNIPS == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SNIPES_AskforDT_info()
{
	AI_Output(other,self,"DIA_SNIPES_AskforDT_15_00");	//Hledám zkušeného kopáče.
	AI_Output(self,other,"DIA_SNIPES_AskforDT_17_01");	//Co? Myslíš že bych se chtěl znovu hrbit v dole?
	AI_Output(self,other,"DIA_SNIPES_AskforDT_17_02");	//Ne vážně. Už mám dolů dost.

	if(RhetorikSkillValue[1] >= 60)
	{
		Info_AddChoice(DIA_SNIPES_AskforDT,"(pokusit se přesvědčit)",DIA_SNIPES_AskforDT_yes);
	};
};

func void DIA_SNIPES_AskforDT_yes()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_00");	//Zadrž! Nemluvím o tom že bys musel celé dny rubat kámen.
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_01");	//Jen pár hodin deně. S dobrým platem, přístřeším a dostatkem jídla.
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_02");	//Myslím že pro tebe by to nebylo zlé.
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_03");	//Takže, ty bys mi dával plat?
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_04");	//Řekněme třicet zlatých denně.
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_05");	//Kolik? To není špatné. Je to dvakrát více než dá Lobart.
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_06");	//No vidíš. Říkám že to není zlé.
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_07");	//A kde to je?
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_08");	//V mém táboře. U staré věže nedaleko Onarovi farmy.
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_09");	//Ach jo... Myslím, že tohle místo znám. Tam jsem makal než mě hodili do kolonie.
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_10");	//Tys tam byl? Víš něco o tom místě?
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_11");	//Co říci... Důl jako důl. Není moc velký ale důležité je že je zcela suchý!
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_12");	//Nikdy tam nedošlo k závalu. Koneckonců to nebylo špatné místo k těžbě.
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_13");	//Tak proč to znovu nezkusit?
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_14");	//No... tak dobře. Horší to být nemůže a peníze budou dobré.
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_15");	//Kdy můžu začít?
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_16");	//Klidně hned. U vstupu řekni heslo - 'dračí poklad'.
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_17");	//Výborně.
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_18");	//Uvidíme se.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Snipes se stal mým kopáčem.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	SNIPESRECRUITEDDT = TRUE;

	if(DT_IRONGATHER_START == FALSE)
	{
		DT_IRONGATHER_START = TRUE;
		EVERYDAYDTIRON = Wld_GetDay();
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

func void DIA_SNIPES_AskforDT_no()
{
	AI_Output(other,self,"DIA_SNIPES_AskforDT_no_15_00");	//Jak myslíš.
	AI_StopProcessInfos(self);
};

instance DIA_SNIPES_INTOWER(C_Info)
{
	npc = bau_987_snipes;
	nr = 22;
	condition = DIA_SNIPES_intower_condition;
	information = DIA_SNIPES_intower_info;
	permanent = TRUE;
	description = "Jak to jde?";
};

func int DIA_SNIPES_intower_condition()
{
	if((SNIPESRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_SNIPES_intower_info()
{
	AI_Output(other,self,"DIA_Snipes_HowWork_01_00");	//Jak to jde?
	AI_Output(self,other,"DIA_SNIPES_InTower_OrcKap_01_01");	//Kopu pro tebe!
};