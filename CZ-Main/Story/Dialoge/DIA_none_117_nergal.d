
instance NONE_117_NERGAL_EXIT(C_Info)
{
	npc = none_117_nergal;
	nr = 999;
	condition = none_117_nergal_exit_condition;
	information = none_117_nergal_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int none_117_nergal_exit_condition()
{
	return TRUE;
};

func void none_117_nergal_exit_info()
{
	AI_StopProcessInfos(self);
};


instance NONE_117_NERGAL_HALLO(C_Info)
{
	npc = none_117_nergal;
	condition = none_117_nergal_hallo_condition;
	information = none_117_nergal_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int none_117_nergal_hallo_condition()
{
	if(XARDASRITUALFAIL == TRUE)
	{
		return TRUE;
	};
};

func void none_117_nergal_hallo_info()
{
	self.name[0] = "Duše Nergala";
	B_GivePlayerXP(100);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("DEM_Warn");
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_01");	//(mrtvolně) SMRTELNÍKU... Měl bych ti poděkovat.
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_02");	//Za co?
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_03");	//Žes mě zbavil povinnosti odpovědět na otázky toho neschopného starého mága.
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_04");	//Za tvou službu bych tě měl odměnit... (mrtvolně) Dovolím ti zemřít!
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_06");	//No, když mě stejně zabiješ, mohl bys mi alespoň na něco odpovědět?
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_07");	//Chceš se na něco zeptat? Dobře tedy, ptej se.
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_08");	//Řekni mi, kde můžu najít Nekronomikon?
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_09");	//Nekronomikon?! Tys mě sem přivolal, aby ses dozvěděl, kde jsem ten pradávný artefakt ukryl?
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_10");	//Je pro tebe důležitý?
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_11");	//Ne, vůbec ne... Příčiny můžou být někdy různé, no výsledek je nakonec vždycky jenom jeden!
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_12");	//Zavři tlamu! Prostě mi odpověz.
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_13");	//Jsi nějaký drzý, jak vidím... To se mi líbí!
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_14");	//Dobrá tedy! Odpovím ti na tvou otázku, protože odpověď ti stejně k ničemu nebude.
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_15");	//Tu relikvii jsem skryl tam, kde se k ní žádný smrtelník jako ty nikdy nedostane...
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_17");	//Na vrchol temné věže Acheron!
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_18");	//Věž Acheron? A ta je kde?
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_19");	//Už si přesně nepamatuji... (nostalgicky) Je to už dávno...
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_20");	//Tím pádem mi tedy stačí najít tu věži a artefakt bude v mé moci.
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_21");	//Není to tak jednoduché, smrtelníku... Můj poklad střeží nemrtvé stvoření Temnoty, které nikdy neporazíš.
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_22");	//Určitě se o to už mnozí pokoušeli! A jsem si jistý, že jsou teď všichni mrtví.
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_23");	//Není žádný způsob, jak to stvoření zneškodnit?
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_24");	//Jistěže je! Ale neprozradím ti ho... Proto se na něj raději ani neptej!
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_25");	//Fajn, díky za odpovědi.
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_26");	//Nemáš za co! A teď se připrav na smrt... Teď tě zničím!
	B_LogEntry(TOPIC_XARDASTASKSFOUR,"Duše nekromanta Nergala se mnou začala mluvit a než se mě pokusila zabít, souhlasila, že mi odpoví na otázku ohledně Nekronomikonu. Jak vysvitlo, tenhle artefakt je momentálně ukrytý na vrcholu temné věže Acheron. Nergal si už ale přesně nepamatuje, kde tahle věž stojí. Vstup navíc střeží nesmrtelná bytost stvořena samotnou Temnotou! Je sice nemožné jí zabít, ale jeden způsob, jak ji přemoci, přeci jen existuje. Na tuhle otázku mi ale samozřejmě Nergal neodpověděl. Teď je nejdůležitější najít věži a pak si rozmyslet, jak můžu přemoci tu příšeru.");
	KNOWWHERENERCONOMICON = TRUE;
	Info_ClearChoices(none_117_nergal_hallo);
	Info_AddChoice(none_117_nergal_hallo,"Tak to tedy zkus.",none_117_nergal_hallo_ex1);
};

func void none_117_nergal_hallo_ex1()
{
	AI_Output(other,self,"NONE_117_Nergal_Hallo_Ex1_01_01");	//Tak to tedy zkus.
	AI_Output(self,other,"NONE_117_Nergal_Hallo_Ex1_01_02");	//Arrgh... (mrtvolně)
	self.flags = NPC_FLAG_NONE;
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
};


