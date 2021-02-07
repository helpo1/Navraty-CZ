
instance DIA_DRAGON_BLACK_EXIT(C_Info)
{
	npc = dragon_black;
	nr = 999;
	condition = dia_dragon_black_exit_condition;
	information = dia_dragon_black_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dragon_black_exit_condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_black_exit_info()
{
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_BLACK_HELLO(C_Info)
{
	npc = dragon_black;
	nr = 5;
	condition = dia_dragon_black_hello_condition;
	information = dia_dragon_black_hello_info;
	important = TRUE;
};


func int dia_dragon_black_hello_condition()
{
	if((DRAGONBLACKMEET == FALSE) && (AZGOLORAPPEAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_dragon_black_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_00");	//Člověk?!... (Vrčí) Myslel jsem, že jsem zničil všechny ubohé lidi!
	AI_Output(other,self,"DIA_Dragon_Black_Hello_01_01");	//Jak vidíš, trochu ses zmýlil. Mám však dojem, že to byla tvá poslední chyba.
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_05");	//Arrrgh... (Vrčí) Chceš snad říct, že mne zrovna ty zbavíš mých starostí?! Pouhý smrtelník?
	AI_Output(other,self,"DIA_Dragon_Black_Hello_01_03");	//Přesně tak, draku. Přišel jsem, abych srazil tvou odpornou hlavu!
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_07");	//(Vrčí) Pokud ses dostal až ke mně, pak můj věrný služebník Dakat očividně selhal.
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_08");	//Hlupák jeden! Teď to musím dokončit sám!
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_09");	//Vyrvu ti srdce z těla, vezmu ti duši a roztrhám tvé maso na malé kousky!
	AI_Output(other,self,"DIA_Dragon_Black_Hello_01_10");	//Uvidíme, kdo vytrhne čí srdce! Pozdravuje tě Ur-Thrall!
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_14");	//Ur-Thrall? Ach ano, pamatuju si toho slimáka. Copak sám se mě neodváží vyzvat? No, co už.

	if(MEETURGROM == 4)
	{
		AI_Output(self,other,"DIA_Dragon_Black_Hello_01_19");	//Vidím, že sis přivedl mocného Ur-Groma!
		AI_Output(self,other,"DIA_Dragon_Black_Hello_01_20");	//Jeho duše je moje, stejně tak jako všech těch odporných lidí!
	};
	if(Npc_HasItems(other,itrw_addon_magiccrossbow_shv) >= 1)
	{
		AI_Output(self,other,"DIA_Dragon_Black_Hello_01_21");	//Ó, ty jsi našel Exekutora - zbraň bojových duchů!
		AI_Output(self,other,"DIA_Dragon_Black_Hello_01_22");	//Vážně naivně věříš, že ti pomůže mě porazit?
	};

	AI_Output(other,self,"DIA_Dragon_Black_Hello_01_17");	//Dost už klábosení! Je čas začít mluvit skutky!
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_18");	//(Pohrdavě) Dostal jsem chuť na tvou krev, připrav sa na smrt, hrdino!
	AI_PlayAni(self,"T_WARN");
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_23");	//MOJE ZUBY - MEČE! MÉ DRÁPY - KOPÍ! MÁ KŘÍDLA - HURIKÁNY! 
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_24");	//JÁ SÁM JSEM PLAMENEM! JÁ JSEM... SMRT!
	B_LogEntry(TOPIC_URNAZULRAGE,"Velký Stín - Azgalor, je tady! Oko hněvu probudilo černého draka a on přišel do Údolí stínů, veden voláním tohoto mocného artefaktu. Stalo se tak, jak jsem chtěl. Bylo to vše marné? Odpověď mi dá už jen můj meč...
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	DRAGONBLACKMEET = TRUE;
	self.flags = 0;
	self.aivar[AIV_EnemyOverride] = FALSE;
};

