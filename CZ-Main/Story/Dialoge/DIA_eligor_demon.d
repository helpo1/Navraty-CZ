/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

CZ_SkillCheckCondition - přidáno zobrazování skill checků

*/



instance DIA_ELIGOR_DEMON_EXIT(C_Info)
{
	npc = eligor_demon;
	nr = 999;
	condition = dia_eligor_demon_exit_condition;
	information = dia_eligor_demon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_eligor_demon_exit_condition()
{
	if(SHEMRON_TALK == TRUE)
	{
		return TRUE;
	};
};

func void dia_eligor_demon_exit_info()
{
	AI_StopProcessInfos(self);
	self.flags = 0;
};


instance DIA_ELIGOR_DEMON_HELLO(C_Info)
{
	npc = eligor_demon;
	nr = 1;
	condition = dia_eligor_demon_hello_condition;
	information = dia_eligor_demon_hello_info;
	important = TRUE;
};


func int dia_eligor_demon_hello_condition()
{
	return TRUE;
};

func void dia_eligor_demon_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_00");	//Už žádný démon na tvé zavolání nepříjde, smrtelníku. Runa ztratila svou sílu.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_01");	//Ty sám znáš pravidla... (vrčí)
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_02");	//Takže ty jsi mocný Eligor - pán legie démonů z Langu. Děláš na mě dojem!
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_03");	//Dovol mi se tě na něco zeptat - proč jsi za mnou přišel?
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_04");	//Přišel jsem k tvému volání, abych ti nabídl něco, co by tě mohlo hodně zajímat, smrtelníku. 
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_05");	//Co přesně mi chceš nabídnout?
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_06");	//Pravděpodobně jsi měl už tu čest přesvědčit se o síle legie a o tom, že démoni Langu nemají žádného soupeře.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_07");	//Můžeš i nadále využívat služeb démonů mé legie. Avšak pod jednou podmínkou...
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_08");	//Jakou podmínkou?
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_09");	//Pokaždé, když budeš chtít vyvolat jednoho z mých démonů, budeš muset obětovat malou část své životní síly.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_10");	//Uznej sám, cena není příliš velká ve srovnání se silou získanou od démona.
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_11");	//Není to trochu moc za vyvolání démona?!
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_12");	//Je to jen nabídka. Máš právo se rozhodnout jak chceš.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_13");	//Přemyšlej o tom - pak můžeš používát mou legii démonů tolikrát, kolikrát jen budeš chtít.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_14");	//Ale pamatuj si: Nabízím pouze jednou - takže si dobře rozmysli, co mi odpovíš.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_15");	//Takže, jaké je tvé rozhodnutí?
	Info_ClearChoices(dia_eligor_demon_hello);
	Info_AddChoice(dia_eligor_demon_hello,"Dobře, beru to!",dia_eligor_demon_hello_ok);
	Info_AddChoice(dia_eligor_demon_hello,"Ne, cena je příliš velká.",dia_eligor_demon_hello_no);
};

func void dia_eligor_demon_hello_ok()
{
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN");
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_16");	//Dobře, beru to!
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_17");	//Čekal jsem, že budeš souhlasit. Nyní jsou ti démoni plně k dispozici.
	AI_StopProcessInfos(self);
	ELIGOR_FOREVER = TRUE;
	ELIGOR_TALK = TRUE;
	ELIGORSUM01 = FALSE;
	ELIGORSUM02 = FALSE;
	ELIGORSUM03 = FALSE;
	ELIGORSUM04 = FALSE;
	ELIGORSUM05 = FALSE;
	ELIGORSUM06 = FALSE;
	ELIGORSUM07 = FALSE;
	ELIGORSUM08 = FALSE;
	ELIGORSUM09 = FALSE;
	ELIGORSUM10 = FALSE;
	self.start_aistate = zs_mm_rtn_demonrest;
};

func void dia_eligor_demon_hello_no()
{
	Snd_Play("MYSTERY_04");
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_18");	//Ne, cena je příliš velká.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_19");	//Jak si přeješ, smrtelníku. Náš rozhovor je u konce. Sbohem!
	AI_StopProcessInfos(self);
	ELIGOR_TALK = TRUE;
	self.start_aistate = zs_mm_rtn_demonrest;
};

//---------------------------------------------Eligor 7 glava---------------------------------------------------------

instance DIA_ELIGOR_DEMON_OW_EXIT(C_Info)
{
	npc = eligor_demon_ow;
	nr = 999;
	condition = dia_eligor_demon_ow_exit_condition;
	information = dia_eligor_demon_ow_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_eligor_demon_ow_exit_condition()
{
	return TRUE;
};

func void dia_eligor_demon_ow_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ELIGOR_DEMON_OW_HELLO(C_Info)
{
	npc = eligor_demon_ow;
	nr = 1;
	condition = dia_eligor_demon_ow_hello_condition;
	information = dia_eligor_demon_ow_hello_info;
	important = TRUE;
};

func int dia_eligor_demon_ow_hello_condition()
{
	return TRUE;
};

func void dia_eligor_demon_ow_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_01");	//KDO MĚ PŘIVOLAL?! KDO SE OPOVÁŽIL RUŠIT MŮJ KLID?!
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_02");	//To jsem byl já.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_03");	//Tvoje tvář je mi povědomá, smrtelníku.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_04");	//Konečně, už jsem si vzpomněl.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_05");	//Ty jsi ten, kdo zabil vyvoleného Beliara v Irdorathských síních! 
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_06");	//Podle mě to byl úctyhodný výkon.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_07");	//Poslal jsem na onen svět spoustu Beliarových nohsledů.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_08");	//Nicméně, ne každý z nich byl tak silný, jako drak!
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_09");	//Ale dost už řečí... (vrčení) Mluv, co chceš?
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_10");	//Potřebuji korunu démonů! Dáš mi ji?
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_11");	//Proč bych to dělal, smrtelníku?

	if(HasSleeperDefence == 1)
	{
		AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_12");	//Dostal jsi masku Spáče! Nemám pravdu?
	}
	else if(HasSleeperDefence == 2)
	{
		AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_13");	//Dostal jsi korunu ledu! Nemám pravdu?
	}
	else if(HasSleeperDefence == 3)
	{
		AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_14");	//Dostal jsi Innosovo oko! Nemám pravdu?
	}
	else
	{
		AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_99");	//Vždyť jsi něco dostal! Nemám pravdu?
	};

	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_15");	//Nyní si můžem artefakty vyměnit!
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_16");	//(smích) Mýlíš se, smrtelníku.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_17");	//To byl jen malý poplatek za to, že se mnou nyní smíš hovořit.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_18");	//Nic víc. Řekni, proč chceš můj artefakt?
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_19");	//Pomůže mi porazit jednoho ze starších démonů tohoto světa - Spáče!
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_20");	//(zamyšleně) Tak to je ten důvod! Je to všechno o něm.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_21");	//Kdysi byl stejně silný, jako já! Ale teď už pro mě není soupeř.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_22");	//Pro tebe - možná. Ale já se k němu kvůli jeho magii nemohu ani dostat.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_23");	//Proto tě žádám o korunu démonů.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_24");	//Samozřejmě... (směje se) Že mě to hned nenapadlo.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_25");	//Nicméně musíš pochopit, že se jí jen tak nevzdám. Budeš za ni muset zaplatit.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_26");	//A kolik zlata za ni chceš?
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_27");	//Zlato mě vůbec nezajímá. Budeš muset zaplatit svým životem!
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_28");	//Chystáš se mě zabít?
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_29");	//Ne. (smích) Vezmu si jen polovinu tvé životní energie.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_30");	//Hmm... Existuje nějaký jiný způsob?
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_31");	//(důrazně) Nebudu s tebou vyjednávat, smrtelníku!
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_32");	//Buďto přijmeš mé podmínky, nebo s touto konverzací končíme.
	Info_ClearChoices(DIA_Eligor_Demon_OW_Hello);
	Info_AddChoice(DIA_Eligor_Demon_OW_Hello,"Dobře! Vezmi si mou životní sílu.",DIA_Eligor_Demon_OW_Hello_Health);
};

func void DIA_Eligor_Demon_OW_Hello_Health()
{
	var int HalfLife;

	HalfLife = hero.attribute[ATR_HITPOINTS_MAX] / 2;
	EligorPrice = hero.attribute[ATR_HITPOINTS_MAX] / 2;
	AI_Wait(self,4);
	Snd_Play("MYSTERY_04");
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
	B_RaiseAttributeQuet(hero,ATR_HITPOINTS_MAX,-HalfLife);
	Npc_ChangeAttribute(hero,ATR_HITPOINTS,ATR_HITPOINTS_MAX);
	AI_Wait(hero,1);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AI_Wait(hero,1);
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_Health_01_01");	//Dobře. Dohoda je dohoda! Koruna démonů je tvá.
	B_GiveInvItems(self,other,ItAr_Helm_G3_06,1);
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_Health_01_02");	//Doufám, že nyní nelituješ svého rozhodnutí.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_Health_01_03");	//Co se stalo, stalo se.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_Health_01_04");	//Jak říkáš, smrtelníku. Naše setkání je u konce... Sbohem.
	B_LogEntry(TOPIC_SLEEPERBACK,"Eligor ode mne požadoval část mé životní síly. Neměl jsem na výběr. Musel jsem se obětovat, abych získal jeho artefakt!");
	AI_StopProcessInfos(self);
	ELIGOR_OW_TALK = TRUE;
	self.start_aistate = zs_mm_rtn_demonrest;
};

//-----------------------------prizrak mayaka------------------

instance DIA_Skeleton_Stefan_EXIT(C_Info)
{
	npc = Skeleton_Stefan;
	nr = 999;
	condition = DIA_Skeleton_Stefan_EXIT_condition;
	information = DIA_Skeleton_Stefan_EXIT_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Skeleton_Stefan_EXIT_condition()
{
	return TRUE;
};

func void DIA_Skeleton_Stefan_EXIT_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Skeleton_Stefan_Hello(C_Info)
{
	npc = Skeleton_Stefan;
	nr = 1;
	condition = DIA_Skeleton_Stefan_Hello_condition;
	information = DIA_Skeleton_Stefan_Hello_info;
	important = TRUE;
};

func int DIA_Skeleton_Stefan_Hello_condition()
{
	if(MIS_HauntedLighthouse == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Skeleton_Stefan_Hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_00");	//Co tě sem přivádí, smrtelníku? Co tady hledáš?
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_01");	//Hmm... Takže ty pověsti byly pravdivé. Na tomto majáku opravdu straší!
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_02");	//Nelhali ti - je to pravda. Nyní mi odpověz na mou otázku.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_03");	//Hledám Stefana, strážce tohoto majáku. Byl zde zabit před mnoha lety.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_04");	//A co od něj chceš?
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_05");	//Chci odstranit kletbu, která zužuje toto místo, a proto potřebuju vědět, co přesně se tu stalo.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_06");	//Jsem překvapen tvým konáním, smrtelníku. Obvykle se žijící lidé snaží tomuto místu vyhýbat.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_07");	//A ty jsi tu přišel a říkáš, že mi chceš nabídnout pomoc.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_08");	//Takže ty jsi Stefan? Pověz mi tedy, proč jsi byl zabit?
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_09");	//Za mou milost a soucit k lidem. To byl celý problém.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_10");	//Jednou jsem pomohl člověku v nesnázích. Za to se mi odvděčil tím, že mne zabil.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_11");	//Kdo to byl?
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_12");	//Neznám jeho skutečné jméno. Chtěl, abych mu říkal Kelevra.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_13");	//Kelevra? Nejspíš je to jeho přezdívka. Možná dokonce pirátská.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_14");	//Mám dojem, že to byl pirát. Měl s sebou pirátskou šavli.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_15");	//Jak se dostal k majáku?
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_16");	//V ten den byla na moři silná bouře. Vyšplhal jsem na horní část majáku, abych doplnil palivo do ohně a pak jsem uviděl, jak se jeho tělo vyplavilo k pobřeží.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_17");	//Zřejmě se jeho loď potopila. Zvedl jsem jeho téměř bezvládné tělo a odnesl jej k majáku.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_18");	//Trvalo dlouho, než se mu vrátilo vědomí. Několikrát jsem musel jít do města pro léky, jelikož měl horečku. Ale nakonec se jeho stav zlepšil.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_19");	//A co se pak stalo?
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_20");	//Jednoho dne mi řekl, že odchází a potřebuje mou loď.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_21");	//Ale já mu ji dát nemohl, sám jsem ji potřeboval. A tak jsem mu nabídl, že ho zavezu do Khorinisu.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_22");	//V tu chvíli jsem měl dojem, že je trochu nervózní a nesvůj.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_23");	//Řekl mi, že mi z vrchu majáku ukáže, kde ho mám dovézt na pobřeží.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_24");	//A když jsme se dostali na vrchol majáku, tak mne probodl šavlí se slovy, že tu loď potřebuje tak či tak.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_25");	//Odešel a nechal mě umřít v mé vlastní kaluži krve.
	B_LogEntry(TOPIC_HauntedLighthouse,"Duch Stefana, který žil v majáku, mi vyprávěl příběh o své smrti. Byl zabit člověkem říkajíc si Kelevra, který byl s velkou pravděpodobností pirát.");
};

instance DIA_Skeleton_Stefan_How(C_Info)
{
	npc = Skeleton_Stefan;
	nr = 1;
	condition = DIA_Skeleton_Stefan_How_condition;
	information = DIA_Skeleton_Stefan_How_info;
	permanent = FALSE;
	description = "Jak odstraním kletbu z tohoto místa?";
};

func int DIA_Skeleton_Stefan_How_condition()
{
	return TRUE;
};

func void DIA_Skeleton_Stefan_How_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(other,self,"DIA_Skeleton_Stefan_How_01_00");	//Jak odstraním kletbu z tohoto místa? Jsem si jistý, že by hodně lidí z Khorinisu rádo vidělo maják opět v provozu.
	AI_Output(self,other,"DIA_Skeleton_Stefan_How_01_01");	//Už přece mají nový. Na co potřebují ještě jeden?
	AI_Output(other,self,"DIA_Skeleton_Stefan_How_01_02");	//Netuším. Avšak duchové mezi lidi nepatří. Určitě mi rozumíš.
	AI_Output(self,other,"DIA_Skeleton_Stefan_How_01_03");	//Rozumím. Ale nemůžu ti pomoct. Promiň.
	DealStoryDLH = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Vypadá to, že znovu potřebuji Xardasovu pomoc. Určitě bude vědět, jak kletbu odstranit.");
	AI_StopProcessInfos(self);
};

instance DIA_Skeleton_Stefan_FinalMeet(C_Info)
{
	npc = Skeleton_Stefan;
	nr = 1;
	condition = DIA_Skeleton_Stefan_FinalMeet_condition;
	information = DIA_Skeleton_Stefan_FinalMeet_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Skeleton_Stefan_FinalMeet_condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (JackMeetLHGhost == TRUE) && (Npc_GetDistToWP(hero,"NW_SOUL_LH_01") <= 600) && (Npc_GetDistToWP(VLK_444_Jack,"NW_SOUL_LH_01") <= 600))
	{
		return TRUE;
	};
};

func void DIA_Skeleton_Stefan_FinalMeet_info()
{
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(250);
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_00");	//Znovu jsi za mnou přišel, smrtelníku. A tentokrát ne sám...
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_01_01");	//Poznáváš mého společníka?
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_02");	//Ano. I přesto, že za tu dobu hodně zestárnul.
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_01_03");	//Jack přišel požádat o odpuštění za to, co provedl.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_04");	//Nemusíš pokračovat. Přesně vím, proč tady je. Cítím to od chvíle, kdy připlul.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_05");	//Netušil jsem, že bude mít dostatek odvahy, aby sem přišel.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_06");	//Ale když už je tady... Myslím, že si máme o čem povídat. Mezitím běž zapálit světlo na majáku.
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_01_07");	//Proč bych to dělal?
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_08");	//Tak chceš toto místo zbavit kletby nebo ne?
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_01_09");	//Chci, ale...
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_10");	//Tak poslouchej a udělej co se ti řekne!
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_11");	//Přítomnost této osoby a síla kletby s ní spojená přiláká další duchy.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_12");	//Světlo majáku je na chvíli zastaví! Proto musíš jít nahoru a rozsvítit maják!
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_13");	//A pospěš si, už jsou blížko...
	JackMeetGhost = TRUE;
	Info_ClearChoices(DIA_Skeleton_Stefan_FinalMeet);

	// if(RhetorikSkillValue[1] >= 50)
	// {
		Info_AddChoice(DIA_Skeleton_Stefan_FinalMeet,
			ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 50, TRUE), "Pak mi však musíš něco slíbit."),
			// "Pak mi však musíš něco slíbit.",
			DIA_Skeleton_Stefan_FinalMeet_Promise);
	// };

	Info_AddChoice(DIA_Skeleton_Stefan_FinalMeet,"Ne, to neudělám.",DIA_Skeleton_Stefan_FinalMeet_No);
	Info_AddChoice(DIA_Skeleton_Stefan_FinalMeet,"Dobře, rozsvítím ho.",DIA_Skeleton_Stefan_FinalMeet_Yes);
};

func void DIA_Skeleton_Stefan_FinalMeet_Promise()
{
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_00");	//Pak mi však musíš něco slíbit.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_01");	//O čem to mluvíš?
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_02");	//Jakmile budu nahoře, Jack nesmí umřít. Krve bylo prolito až příliš.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_03");	//Mrtví se nezodpovídají živým!
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_04");	//Přísahej, že nezemře! Jinak budeš zatracen do konce věků.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_05");	//Dobrá... (klidně) Přísahám ti, že nezemře.
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_06");	//Tak je to lepší.
	JackDontDie = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Duch slíbil, že Jacka nezabije. Doufám, že dodrží své slovo...");
};

func void DIA_Skeleton_Stefan_FinalMeet_No()
{
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_No_01_00");	//Ne, to neudělám.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_No_01_01");	//Jak myslíš, smrtelníku. Je mi líto, ale to znamená, že tu oba zemřete...
	AI_StopProcessInfos(self);
	LeaveMeetGhost = TRUE;
	StefanCanFight = TRUE;
	self.flags = 0;
	self.aivar[AIV_EnemyOverride] = FALSE;
	VLK_444_Jack.aivar[AIV_PARTYMEMBER] = FALSE;
	B_StartOtherRoutine(VLK_444_Jack,"JackFight");
	Wld_InsertNpc(Ghost_LH,"NW_SOUL_LH_03");
	Wld_InsertNpc(Ghost_LH,"NW_SOUL_LH_04");
	Wld_InsertNpc(Ghost_LH,"NW_SOUL_LH_05");
	Wld_InsertNpc(Ghost_LH,"NW_SOUL_LH_06");
};

func void DIA_Skeleton_Stefan_FinalMeet_Yes()
{
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Yes_01_00");	//Dobře, rozsvítím ho.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_Yes_01_01");	//Tak neváhej.
	VLK_444_Jack.aivar[AIV_PARTYMEMBER] = FALSE;
	LeaveMeetGhost = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"JackTalk");
	B_StartOtherRoutine(VLK_444_Jack,"JackTalk");
};
