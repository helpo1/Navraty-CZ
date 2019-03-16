
const int BONUSSTR = 15;
const int BONUSDEX = 15;
const int BONUSMAN = 100;
const int BONUSHEA = 150;

instance DMT_1297_STONNOS_EXIT(C_Info)
{
	npc = dmt_1297_stonnos;
	nr = 999;
	condition = dmt_1297_stonnos_exit_condition;
	information = dmt_1297_stonnos_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1297_stonnos_exit_condition()
{
	if((GUARDIANADEPT == TRUE) && (CHOOSENATUREISDONE == FALSE))
	{
		return FALSE;
	};
	return TRUE;
};

func void dmt_1297_stonnos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1297_STONNOS_HELLO(C_Info)
{
	npc = dmt_1297_stonnos;
	condition = dmt_1297_stonnos_hello_condition;
	information = dmt_1297_stonnos_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1297_stonnos_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (WAKON_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1297_stonnos_hello_info()
{
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_00");	//Tak se konečně potkáváme, smrtelníku!... (vznešeně)
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_01");	//Nebudu skrývat, že jsem byl na naše setkání velmi zvědav.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_02");	//Také myslím, že víš, kdo jsem a co dělám zde... Nebo snad ne?!
	AI_Output(other,self,"DMT_1297_Stonnos_Hello_03");	//Myslím, že ty budeš Strážce Stonnos - vládce elementů a hlava Strážců.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_04");	//(potěšeně) Vše správně, člověče... Takže nemusíme ztrácet čas s mým představením.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_07");	//Přišel čas ukončit cestu na kterou jsi vstoupil a stát se jedním z nás.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_08");	//Ale nejdříve budeš muset stejně jako u ostatních Strážců splnit zkoušku!
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_09");	//Když ho splníš, dostaneš příležitost stát se součástí našich posvátných plánů.
	Info_ClearChoices(dmt_1297_stonnos_hello);
	Info_AddChoice(dmt_1297_stonnos_hello,"A jakou zkoušku mi dáš, mistře?",dmt_1297_stonnos_hello_test);
};

func void dmt_1297_stonnos_hello_test()
{
	AI_Output(other,self,"DMT_1297_Stonnos_Hello_11");	//A jakou zkoušku mi dáš, mistře?
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_12");	//Poslouchej pozorně, člověče... Musíš nalézt a přinést mi čtyři prastaré artefakty zvané Sféry!
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_13");	//Jsou zdrojem magie každého elementu.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_14");	//Nicméně narozdíl od naší magie jsou Sféry čistě přírodního původu. Jejich síla je jedinečná!
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_15");	//Těchto artefaktů je ve světě málo a sami se vytvářejí v příhodných podmínkách.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_20");	//Zničil jsi bariéru, zapudil Spáče - jednoduše jsi stvořil tak silný magický výboj, že ve vhodných prostředích na místě Hornického údolí se utvořili podmínky pro vznik Sfér.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_24");	//Prameny, kde se nyní sféry vyskytují jsou často mimo dosah lidí. A každá Sféra přetváří život kolem sebe, aby přišla stvoření, která by je chránila.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_28");	//No, nyní jdi a pamatuj, že tvé činy budou mít vliv na budoucnost.
	AI_StopProcessInfos(self);
	MIS_STONNOSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_STONNOSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_STONNOSTEST,LOG_Running);
	B_LogEntry(TOPIC_STONNOSTEST,"Potkal jsem Strážce Stonnose. Dal mi poslední zkoušku po které mě již přijme do kruhu Strážců. Můj úkol spočívá v nalezení artefaktů jménem Sféry. Najít je bude extrémě nebezpečné. Ale pro mě...");
};


instance DMT_1297_STONNOS_TESTFAIL(C_Info)
{
	npc = dmt_1297_stonnos;
	nr = 1;
	condition = dmt_1297_stonnos_testfail_condition;
	information = dmt_1297_stonnos_testfail_info;
	permanent = FALSE;
	description = "Ohledně toho úkolu, mistře...";
};


func int dmt_1297_stonnos_testfail_condition()
{
	if((MIS_STONNOSTEST == LOG_Running) && (CRESTNATUREISDONE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1297_stonnos_testfail_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DMT_1297_Stonnos_TestFail_00");	//Ohledně toho úkolu, mistře...
	AI_Output(self,other,"DMT_1297_Stonnos_TestFail_01");	//Ano, člověče, poslouchám pozorně.
	AI_Output(other,self,"DMT_1297_Stonnos_TestFail_02");	//Bojím se, že ti Sféry nemohu donést, prostě již nejsou na tomto ostrově!
	AI_Output(other,self,"DMT_1297_Stonnos_TestFail_04");	//Použil jsem je k vytvoření runy, která mi měla pomoci zapudit mocného démona jménem Senyak.
	AI_Output(self,other,"DMT_1297_Stonnos_TestFail_05");	//Senyak?! Toho arcidémona? Myslíš to vážně, člověče?!
	AI_Output(self,other,"DMT_1297_Stonnos_TestFail_07");	//(zamyšleně) No musím uznat že je to docela nečekaný zvrat situace.
	AI_Output(self,other,"DMT_1297_Stonnos_TestFail_08");	//Ale abych řekl pravdu, nechápu, jak člověk může užít tak silnou runu.
	AI_Output(other,self,"DMT_1297_Stonnos_TestFail_10");	//Promiň mistře, že jsem tě zklamal, ale věř, že to nebyla lehká volba.
	AI_Output(other,self,"DMT_1297_Stonnos_TestFail_12");	//Ale co teď bude s mojim úkolem?!
	AI_Output(self,other,"DMT_1297_Stonnos_TestFail_13");	//Hmmm... Zklamal jsi mě!
	AI_Output(self,other,"DMT_1297_Stonnos_TestFail_14");	//Ale když se na to všechno podíváme z jiného pohledu, tak možná, důsledky tvého vlastního výběru nám ukázali tvoji skutečnou sílu.
	AI_Output(self,other,"DMT_1297_Stonnos_TestFail_15");	//Takže po malém zamyšlení musím říct... Že jsi svůj úkol splnil.
	MIS_STONNOSTEST = LOG_SUCCESS;
	MIS_GUARDIANSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_STONNOSTEST,LOG_SUCCESS);
	Log_SetTopicStatus(TOPIC_GUARDIANSTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_STONNOSTEST,"Nehledě na to, že jsem nebyl schopen donést sféry Strážci Stonnosovi - je přesvědčený, že jsem stále schopen dokončit Zkoušku víry.");
	Log_AddEntry(TOPIC_GUARDIANSTEST,"Prošel jsem všemi zkouškami Strážců. Myslím, že teď konečně mám tu čest, stát se učedníkem božské Kruhu Strážců!");
	Info_ClearChoices(dmt_1297_stonnos_testfail);
	Info_AddChoice(dmt_1297_stonnos_testfail,"Znamená to, že teď můžu vstoupit do kruhu Strážců?",dmt_1297_stonnos_testdone_pass);
};

instance DMT_1297_STONNOS_TESTDONE(C_Info)
{
	npc = dmt_1297_stonnos;
	nr = 1;
	condition = dmt_1297_stonnos_testdone_condition;
	information = dmt_1297_stonnos_testdone_info;
	permanent = FALSE;
	description = "Mám ty Sféry elementů, mistře.";
};

func int dmt_1297_stonnos_testdone_condition()
{
	if((MIS_STONNOSTEST == LOG_Running) && (CRESTNATUREISDONE == FALSE) && (Npc_HasItems(other,itmi_fireshpere) >= 1) && (Npc_HasItems(other,itmi_watershpere) >= 1) && (Npc_HasItems(other,itmi_stoneshpere) >= 1) && (Npc_HasItems(other,itmi_darkshpere) >= 1))
	{
		return TRUE;
	};
};

func void dmt_1297_stonnos_testdone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DMT_1297_Stonnos_TestDone_00");	//Mám ty Sféry elementů, mistře.
	Npc_RemoveInvItems(other,itmi_fireshpere,1);
	Npc_RemoveInvItems(other,itmi_watershpere,1);
	Npc_RemoveInvItems(other,itmi_stoneshpere,1);
	Npc_RemoveInvItems(other,itmi_darkshpere,1);
	b_giveinvitemsmanythings(other,self);
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_03");	//Ano, jsou všechny, božské artefakty čisté síly.
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_07");	//Ohledně tvé zkoušky... Myslím, že jsi prošel!
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_08");	//A já si myslím, že jsi připraven stát se jedním z nás.
	MISSSHEPREFOREVER = TRUE;
	MIS_STONNOSTEST = LOG_SUCCESS;
	MIS_GUARDIANSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GUARDIANSTEST,LOG_SUCCESS);
	Log_SetTopicStatus(TOPIC_STONNOSTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_STONNOSTEST,"Poté, co jsem Strážci Stonnosovi přinesl Sféry, řekl, že jsem splnil jeho úkol...");
	Log_AddEntry(TOPIC_GUARDIANSTEST,"Prošel jsem zkoušky od všech Strážců, takže teď bych se mohl stát jedním z nich!");
	Info_ClearChoices(dmt_1297_stonnos_testdone);
	Info_AddChoice(dmt_1297_stonnos_testdone,"Znamená to, že teď můžu vstoupit do kruhu Strážců?!",dmt_1297_stonnos_testdone_pass);
};

func void dmt_1297_stonnos_testdone_pass()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DMT_1297_Stonnos_TestDone_Pass_01");	//Znamená to, že teď můžu vstoupit do kruhu Strážců?!
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_Pass_02");	//Tak to je, člověče... Je to vá volba!
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_Pass_03");	//Z moci mě svěřené nálezci světa, já, Strážce Stonnos, hlavní strážce hal Chaosu a ochránce posvátného kamene...
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_Pass_04");	//... Ti umožňuji vstup do našeho posvátného kruhu!
	B_GiveInvItems(self,other,itri_guardians_02,1);
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_Pass_05");	//Tvůj osud bude svázán s námi, jestli-že si vybereš následovat naši cestu.
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_Pass_06");	//A jestli se rozhodneš, tak jako temné řeky Huronu, věř - Je to znamení božského Kamene Amshora!
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_Pass_07");	//ERRAT KNAR KHAK... (vznešeně) A je to!
	B_LogEntry(TOPIC_GUARDIANS,"Strážce Stonnos mě přijmul do jejich posvátného kruhu! Nicméně co bude dál, nevím...");
	STONNOS_AGREE = TRUE;
	ADEPTGUARDIAN = TRUE;
};


instance DMT_1297_STONNOS_CHOOSENATURE(C_Info)
{
	npc = dmt_1297_stonnos;
	nr = 1;
	condition = dmt_1297_stonnos_choosenature_condition;
	information = dmt_1297_stonnos_choosenature_info;
	permanent = TRUE;
	description = "To je vše, jsem jeden z vás?!";
};


func int dmt_1297_stonnos_choosenature_condition()
{
	if((ADEPTGUARDIAN == TRUE) && (CHOOSENATUREISDONE == FALSE))
	{
		return TRUE;
	};
};

func void dmt_1297_stonnos_choosenature_info()
{
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_01");	//To je vše, jsem jeden z vás?!
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_02");	//Správně, člověče - byl jsi zvolen!
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_07");	//Než vyrazíš na svoji cestu, je třeba ještě jedna věc.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_09");	//Když jsi teď jedním z nás, měl by sis vybrat svůj element.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_10");	//Jak jistě víš, jsou čtyři... (vážně) - Oheň, Voda, Kámen a Temnota.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_11");	//Každý z nich ti může dát něco, co ostatní nemohou! Nicméně volbu můžeš udělat jen jednou.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_12");	//Tak, rozhodni se.
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"Ještě nejsem rozhodnut, mistře.",dmt_1297_stonnos_choosenature_later);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"Vybírám Temnotu, mistře.",dmt_1297_stonnos_choosenature_dark);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"Vybírám Kámen, mistře.",dmt_1297_stonnos_choosenature_stone);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"Vybírám Vodu, mistře.",dmt_1297_stonnos_choosenature_water);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"Vybírám Oheň, mistře.",dmt_1297_stonnos_choosenature_fire);
};

func void dmt_1297_stonnos_choosenature_later()
{
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
};

func void dmt_1297_stonnos_choosenature_dark()
{
	CHOOSEDARK = TRUE;
	CHOOSENATUREISDONE = TRUE;
	AI_Print(PRINT_BONUSDARK);
	hero.protection[PROT_MAGIC] += 20;
	REALPROTMAGIC += 20;

	if(hero.guild == GIl_KDM)
	{
		if(RealMode[2] == TRUE)
		{
			CountLearnSpell += 15;		
		}
		else
		{
			CountLearnSpell += 20;
		};
	};

	Wld_PlayEffect("SPELLFX_INCOVATION_VIOLET",hero,hero,0,0,0,FALSE);
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Dark_01_00");	//Vybírám Temnotu, mistře.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_01");	//Dobrá, smrtelníku - udělal jsi konečnou volbu!
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_02");	//Od této chvíle bude tvůj osud spojen pouze s tímto elementem a všechny tvé činy a myšlenky budou pro jeho dobro.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_04");	//Naše setkání je u konce, člověče. Nyní budeš následovat cestu, kterou sis vybral.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_07");	//Jdi za Strážcem Dagothem - jako mistr Temnoty bude tvůj učitel a instruktor.
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Dark_01_08");	//A kde ho mám hledat?!
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_09");	//Na, vem si zde tuto runu teleportace - přemístí tě na místo, kde se dozvíš vše potřebné.
	B_GiveInvItems(self,other,itru_teleportdagot,1);
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_11");	//Sbohem, smrtelníku. Ať tě elementy ochraňují!
	B_LogEntry(TOPIC_GUARDIANS,"Strážce Stonnos mi řekl, abych si vybral svůj element, se kterým propojím svůj osud, tak jsem si vybral Temnotu!");
	Log_AddEntry(TOPIC_GUARDIANS,"Stonnos mi také dal runu vedoucí do kláštera Strážců, kde vyhledám svého nového učitele, Strážce Dagotha.");
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"... (KONEC)",dmt_1297_stonnos_test_end);
};

func void dmt_1297_stonnos_choosenature_stone()
{
	CHOOSESTONE = TRUE;
	CHOOSENATUREISDONE = TRUE;
	AI_Print(PRINT_BONUSSTONE);
	hero.protection[PROT_EDGE] += 10;
	hero.protection[PROT_BLUNT] += 10;
	hero.protection[PROT_POINT] += 10;
	hero.protection[PROT_FLY] += 50;
	Npc_ChangeAttribute(hero,ATR_HITPOINTS_MAX,BONUSHEA);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + BONUSHEA;

	if(hero.guild == GIl_GUR)
	{
		if(RealMode[2] == TRUE)
		{
			CountLearnSpell += 15;		
		}
		else
		{
			CountLearnSpell += 20;
		};
	};

	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Stone_01_00");	//Vybírám Kámen, mistře.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_01");	//Dobrá, smrtelníku - udělal jsi konečnou volbu!
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_02");	//Od této chvíle bude tvůj osud spojen pouze s tímto elementem a všechny tvé činy a myšlenky budou pro jeho dobro.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Stone_01_04");	//Jako Strážce Kamene se stanu tvým lektorem a ukážu ti tajemství tohoto elementu.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Stone_01_05");	//Nicméně to bude později... Nyní je nezbytné, abys vstoupil do našeho kláštera, kde mě vyhledáš a začneme s tvou výukou.
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Stone_01_06");	//A kde ten klášter najdu?
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_09");	//Na, vem si zde tuto runu teleportace - přemístí tě na místo, kde se dozvíš vše potřebné.
	B_GiveInvItems(self,other,itru_teleportdagot,1);
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_11");	//Sbohem, člověče. Vyhledej mě co nejdříve!
	B_LogEntry(TOPIC_GUARDIANS,"Strážce Stonnos mi řekl, abych si vybral svůj element, se kterým propojím svůj osud, tak jsem si vybral Kámen!");
	Log_AddEntry(TOPIC_GUARDIANS,"Stonnos mi také dal runu vedoucí do kláštera Strážců, kde ho vyhledám a stanu se jeho žákem.");
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"... (KONEC)",dmt_1297_stonnos_test_end);
};

func void dmt_1297_stonnos_choosenature_water()
{
	CHOOSEWATER = TRUE;
	CHOOSENATUREISDONE = TRUE;
	AI_Print(PRINT_BONUSWATER);
	NPC_DAM_DIVE_TIME = 10000000;
	Npc_ChangeAttribute(hero,ATR_MANA_MAX,BONUSMAN);
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + BONUSMAN;

	if(hero.guild == GIl_KDW)
	{
		if(RealMode[2] == TRUE)
		{
			CountLearnSpell += 15;		
		}
		else
		{
			CountLearnSpell += 20;
		};
	};

	Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Water_01_00");	//Vybírám Vodu, mistře.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_01");	//Dobrá, smrtelníku - udělal jsi konečnou volbu!
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_02");	//Od této chvíle bude tvůj osud spojen pouze s tímto elementem a všechny tvé činy a myšlenky budou pro jeho dobro.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_04");	//Nyní budeš následovat cestu, kterou sis vybral.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Water_01_07");	//Jdi za Strážcem Wakonem - jako mistr Vody bude tvůj učitel a instruktor.
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Dark_01_08");	//A kde ho mám hledat?!
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_09");	//Na, vem si zde tuto runu teleportace - přemístí tě na místo, kde se dozvíš vše potřebné.
	B_GiveInvItems(self,other,itru_teleportdagot,1);
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_11");	//Sbohem, smrtelníku. Ať tě elementy ochraňují!
	B_LogEntry(TOPIC_GUARDIANS,"Strážce Stonnos mi řekl, abych si vybral svůj element, se kterým propojím svůj osud, tak jsem si vybral Vodu!");
	Log_AddEntry(TOPIC_GUARDIANS,"Stonnos mi také dal runu vedoucí do kláštera Strážců, kde vyhledám svého nového učitele, Strážce Wakona.");
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"... (KONEC)",dmt_1297_stonnos_test_end);
};

func void dmt_1297_stonnos_choosenature_fire()
{
	CHOOSEFIRE = TRUE;
	CHOOSENATUREISDONE = TRUE;
	AI_Print(PRINT_BONUSFIRE);
	hero.protection[PROT_FIRE] += 20;
	REALPROTFIRE += 20;

	if(hero.guild == GIl_KDF)
	{
		if(RealMode[2] == TRUE)
		{
			CountLearnSpell += 15;		
		}
		else
		{
			CountLearnSpell += 20;
		};
	};

	Wld_PlayEffect("SPELLFX_INCOVATION_FIRE",hero,hero,0,0,0,FALSE);
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Fire_01_00");	//Vybírám Oheň, mistře.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_01");	//Dobrá, smrtelníku - udělal jsi konečnou volbu!
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_02");	//Od této chvíle bude tvůj osud spojen pouze s tímto elementem a všechny tvé činy a myšlenky budou pro jeho dobro.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_04");	//Nyní budeš následovat cestu, kterou sis vybral.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Fire_01_07");	//Jdi za Strážcem Keliosem - jako mistr Ohně bude tvůj učitel a instruktor.
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Dark_01_08");	//A kde ho mám hledat?!
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_09");	//Na, vem si zde tuto runu teleportace - přemístí tě na místo, kde se dozvíš vše potřebné.
	B_GiveInvItems(self,other,itru_teleportdagot,1);
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_11");	//Sbohem, smrtelníku. Ať tě elementy ochraňují!
	B_LogEntry(TOPIC_GUARDIANS,"Strážce Stonnos mi řekl, abych si vybral svůj element, se kterým propojím svůj osud, tak jsem si vybral Oheň!");
	Log_AddEntry(TOPIC_GUARDIANS,"Stonnos mi také dal runu vedoucí do kláštera Strážců, kde vyhledám svého nového učitele, Strážce Keliose.");
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"... (KONEC)",dmt_1297_stonnos_test_end);
};

func void dmt_1297_stonnos_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};