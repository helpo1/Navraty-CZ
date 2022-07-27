
instance DIA_SHEMRON_DEMON_EXIT(C_Info)
{
	npc = shemron_demon;
	nr = 999;
	condition = dia_shemron_demon_exit_condition;
	information = dia_shemron_demon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_shemron_demon_exit_condition()
{
	if(SHEMRON_TALK == TRUE)
	{
		return TRUE;
	};
};

func void dia_shemron_demon_exit_info()
{
	AI_StopProcessInfos(self);
	self.flags = 0;
};


instance DIA_SHEMRON_DEMON_HELLO(C_Info)
{
	npc = shemron_demon;
	nr = 1;
	condition = dia_shemron_demon_hello_condition;
	information = dia_shemron_demon_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_shemron_demon_hello_condition()
{
	if((SHEMRON_TALK == FALSE) && (KNOWDEMENTORLANGUAGE == TRUE) && (Npc_HasItems(other,itmi_darkshpere) >= 1))
	{
		return TRUE;
	};
};

func void dia_shemron_demon_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_00");	//Člověk?!... (vrčí) Myslel jsem si to - kdo jsi, že se opovažuješ rušit můj klid!
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_01");	//Tím, že si sem přišel, i když to ještě nevíš ses dostal do pasti...
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_02");	//Ale brzy na to přijdeš... (hrozivě)
	AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_03");	//Kdo jsi stvůro z temnoty?! Jen další posluhovač Beliara?
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_04");	//Hloupý smrtelníku!... (směje se) Můj tvůrce není Temný bůh!
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_06");	//Já - Shemron, pátý démon Eligorovy legie, věrný ochránce Strážců božské Temnoty, jejichž moudrost vládne noci!
	self.name[0] = CZ_NAME_Monster_DemonLord_Shemron;
	SHEMRONKNOWS = TRUE;
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_07");	//Já hájím jejich zájmy a ty jsi ubohý zloděj, který kradl.
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_08");	//A nyní se postarám o to, aby se to už nikdy znovu neopakovalo... (vrčí)
	if(GUARDIAN_WAY == TRUE)
	{
		AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_09");	//Počkej chvíli... Řekl jsi Strážců?! Chceš mi říct, že ty - démon, sloužíš těmto Strážcům?!
		AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_11");	//Hmm, to je mi, ale překvapení... Strážci se nikdy nezmínili, že mají takového služebníka.
		AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_13");	//Hmm... Nechtěj mi namluvit, že jsi rozuměl alespoň troše z toho, co jsem ti řekl ty ubohý slabochu!
		if(ADEPTGUARDIAN == TRUE)
		{
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_14");	//Víš, já - zasvěcený v posvátném kruhu Strážců, jsem jejich stoupenec.
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_15");	//Myslím si, že by se jim nelíbilo, kdyby se mi z nenadání něco špatného stalo...
		}
		else
		{
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_16");	//Setkal jsem se se Strážci a ti mi určili cestu, kterou nyní následují.
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_17");	//I přesto, že ještě nejsem jejich stoupenec, myslím si, že by se jim nelíbilo, kdyby se mi z nenadání něco špatného stalo...
		};
		AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_18");	//To nemůže byt pravda, nevěřím jedinému tvému slovu, ubohý člověče!
		AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_19");	//To není možné, že Strážci elementů spočinuli jejich zrak na takovém odporném červu, jako ty... (vrčí)
		AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_20");	//Mluvím pravdu!
		AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_21");	//Jak si jinak myslíš, že bych s tebou mohl mluvit. Strážci mě naučili jazyku démonů.
		AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_22");	//Ano... je velmi pozoruhodné, že ovládáš tuto schopnost. Ale to pořád nestačí k tomu, abych ti to uvěřil.
		AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_24");	//Jestli budeš schopen dokázat, že jsi ten za koho se vydáváš...
		AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_25");	//... Pak možná neroztrhám tvé tělo na kousíčky. Ačkoli bych to udělal velice rád!... (vrčí)
		if(Npc_HasItems(other,itri_guardians_01) >= 1)
		{
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_26");	//Mám tento prsten. Dal mi ho Strážce Dagoth při našem prvním setkání.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_27");	//... (vrčí) Prsten Baalův!... Jenom Strážce ti mohl dát takovou věc.
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_28");	//Nyní už mi věříš?
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_29");	//Ano. Tento důkaz je dostatečný!
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_30");	//Ušetřím tvůj život, člověče. Ale to, co jsi vzal - zůstává zde.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_31");	//Element temnot opustí toto místo jen tehdy, pokud si to Strážci budou přát.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_32");	//Děj mi ho.
			Info_ClearChoices(dia_shemron_demon_hello);
			Info_AddChoice(dia_shemron_demon_hello,"Dobrá! Tady, vezmi si ho.",dia_shemron_demon_hello_ok);
			Info_AddChoice(dia_shemron_demon_hello,"Já to ale potřebuji.",dia_shemron_demon_hello_no);
			if(MIS_STONNOSTEST == LOG_Running)
			{
				Info_AddChoice(dia_shemron_demon_hello,"Tento element je pro Strážce Stonnose velmi důležitý...",dia_shemron_demon_hello_stonnos);
			};
		}
		else if(Npc_HasItems(other,itri_guardians_02) >= 1)
		{
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_33");	//Mám tento prsten stoupence posvátného kruhu. Strážce Stonnos mi ho dal při mém zasvěcení.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_34");	//... (vrčí) Prsten elementů!... Jenom Strážce ti mohl dát takovou věc.
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_35");	//Nyní už mi věříš?
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_36");	//Ano. Tento důkaz je dostatečný!
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_37");	//Ušetřím tvůj život, člověče. Ale to, co jsi vzal - zůstává zde.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_38");	//Element temnoty opustí toto místo jen tehdy, pokud si to Strážci budou přát.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_39");	//Děj mi ho.
			Info_ClearChoices(dia_shemron_demon_hello);
			Info_AddChoice(dia_shemron_demon_hello,"Dobrá! Tady, vezmi si ho.",dia_shemron_demon_hello_ok);
			Info_AddChoice(dia_shemron_demon_hello,"Já to ale potřebuji.",dia_shemron_demon_hello_no);
			if(MIS_STONNOSTEST == LOG_Running)
			{
				Info_AddChoice(dia_shemron_demon_hello,"Tento element je pro Strážce Stonnose velmi důležitý...",dia_shemron_demon_hello_stonnos);
			};
		}
		else if(Npc_HasItems(other,itri_narus) >= 1)
		{
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_40");	//Mám tento prsten. Dal mi ho Strážce Wakon při našem prvním setkání.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_41");	//... (vrčí) Prsten vody!... Jenom Strážce ti mohl dát takovou věc.
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_42");	//Nyní už mi věříš?
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_43");	//Ano. Tento důkaz je dostatečný!
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_44");	//Ušetřím tvůj život, člověče. Ale to, co jsi vzal - zůstává zde.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_45");	//Jednal si chytře člověče! Jinak bys už byl mrtvý.
			Info_ClearChoices(dia_shemron_demon_hello);
			Info_AddChoice(dia_shemron_demon_hello,"Dobrá! Tady, vezmi si ho.",dia_shemron_demon_hello_ok);
			Info_AddChoice(dia_shemron_demon_hello,"Já to ale potřebuji.",dia_shemron_demon_hello_no);
			if(MIS_STONNOSTEST == LOG_Running)
			{
				Info_AddChoice(dia_shemron_demon_hello,"Tento element je pro Strážce Stonnose velmi důležitý...",dia_shemron_demon_hello_stonnos);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_47");	//Nyní, si běž svou cestou! Naše cesty se možná v budoucnu opět protnou.
			AI_StopProcessInfos(self);
			Snd_Play("MFX_FEAR_CAST");
			B_Attack(self,other,AR_SuddenEnemyInferno,1);
			SHEMRON_TALK = TRUE;
			SHEMRON_FIGHT = TRUE;
			self.start_aistate = ZS_MM_AllScheduler;
		};
	}
	else
	{
		AI_StopProcessInfos(self);
		Snd_Play("MFX_FEAR_CAST");
		B_Attack(self,other,AR_SuddenEnemyInferno,1);
		SHEMRON_TALK = TRUE;
		SHEMRON_FIGHT = TRUE;
		self.start_aistate = ZS_MM_AllScheduler;
	};
};

func void dia_shemron_demon_hello_stonnos()
{
	AI_Output(other,self,"DIA_Shemron_Demon_Hello_Stonnos_01_01");	//Tento element je pro Strážce Stonnose velmi důležitý a já mám v plánu mu ho doručit za každou cenu.
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_Stonnos_01_03");	//Stonnos?! Hmmm... (vrčí) Jestliže je tomu tak, tak boj není na místě člověče.
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_Stonnos_01_04");	//Pokud vše, co říkáš je pravda a byl jsi sem poslán vrchním Strážcem Stonnosem - Nebudu ti nadále bránit v jeho vlastnictví!
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_Stonnos_01_05");	//Můžeš odejít i s elementem a pokračovat ve své cestě!
	GIVESHEPHRESHEMRONBACK = TRUE;
	AI_StopProcessInfos(self);
	SHEMRON_TALK = TRUE;
	SHEMRON_FIGHT = FALSE;
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.start_aistate = zs_mm_rtn_demonrest;
};

func void dia_shemron_demon_hello_ok()
{
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_44");	//Ušetřím tvůj život, člověče. Ale to, co jsi vzal - zůstává zde.
	B_GiveInvItems(other,self,itmi_darkshpere,1);
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_45");	//Jednal si chytře člověče! Jinak bys už byl mrtvý.
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_47");	//Nyní, si běž svou cestou! Naše cesty se možná v budoucnu opět protnou.
	AI_StopProcessInfos(self);
	SHEMRON_TALK = TRUE;
	SHEMRON_FIGHT = FALSE;
	GIVESHEPHRESHEMRON = TRUE;
	self.aivar[AIV_EnemyOverride] = FALSE;
};

func void dia_shemron_demon_hello_no()
{
	AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_48");	//Já to ale potřebuji.
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_49");	//Inu, uvidíme.
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_51");	//Ha, ha, ha... Ty (vrčí) jsi pravděpodobně zručný válečník, ale mě se vyrovnat nemůžeš!
	AI_StopProcessInfos(self);
	Snd_Play("MFX_FEAR_CAST");
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	SHEMRON_TALK = TRUE;
	SHEMRON_FIGHT = TRUE;
	self.start_aistate = ZS_MM_AllScheduler;
};


instance DIA_SHEMRON_DEMON_BACKSHEPHRE(C_Info)
{
	npc = shemron_demon;
	nr = 1;
	condition = dia_shemron_demon_backshephre_condition;
	information = dia_shemron_demon_backshephre_info;
	permanent = FALSE;
	description = "Element temnoty je pro Strážce Stonnose velmi důležitý!";
};


func int dia_shemron_demon_backshephre_condition()
{
	if((MIS_STONNOSTEST == LOG_Running) && (GIVESHEPHRESHEMRON == TRUE) && (GIVESHEPHRESHEMRONBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_shemron_demon_backshephre_info()
{
	AI_Output(other,self,"DIA_Shemron_Demon_BackShephre_01_01");	//Element temnoty je pro Strážce Stonnose velmi důležitý! A já mám v plánu vyhovět jeho rozkazu za každou cenu.
	AI_Output(self,other,"DIA_Shemron_Demon_BackShephre_01_03");	//Stonnos?! Hmmm... (vrčí) Jestliže je tomu tak, tak boj není na místě člověče.
	AI_Output(self,other,"DIA_Shemron_Demon_BackShephre_01_04");	//Jestliže vše, co hovoříš je pravda, a ty jsi byl sem poslán hlavním představeným posvátného kruhu - pak si ho tedy ode mě můžeš vzít bez potíží!
	AI_Output(self,other,"DIA_Shemron_Demon_BackShephre_01_05");	//Zde, vezmi tento magický artefakt a odnes ho vrchnímu Strážci!
	B_GiveInvItems(self,other,itmi_darkshpere,1);
	GIVESHEPHRESHEMRONBACK = TRUE;
	AI_StopProcessInfos(self);
	SHEMRON_TALK = TRUE;
	SHEMRON_FIGHT = FALSE;
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.start_aistate = zs_mm_rtn_demonrest;
};

