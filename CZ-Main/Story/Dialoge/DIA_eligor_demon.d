
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
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_00");	//Už žádný démon nepříjde na tvoje zavolani, smrtelníku. Runa stratila silu.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_01");	//Ty sám znáš pravidla... (Vrčí)
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_02");	//Takže ty jsi mocný Eligor - pán legie démonů z Langu. Děláš na mě dojem!
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_03");	//Dovol mi se tě na něco zeptat - proč jsi sem ke mě došel?
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_04");	//Přišel sem na tvoji výzvu abych ti nabídl jednu věc která tě může hodně zajímat smrtelníku. 
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_05");	//Co přesně mi chceš nabídnout?
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_06");	//Pravděpodobně si měl už čest přesvědčit se o síle legie a tom, že démoni Langu nemají žádného soupeře!
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_07");	//Můžeš i nadále využívat služeb démonů mé legie. Ale pod jednou podmínkou...
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_08");	//Jakou podmínkou?
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_09");	//Pokaždé když budeš chtít vyvolat jednoho z mých démonů, budeš muset obětovat malou část své životní síly.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_10");	//Není to příliš velká cena ve srovnání s výkonem co démon předvede!
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_11");	//Není to trochu moc za vyvolání démona?!
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_12");	//Je to jenom obchod. Máš právo se rozhodnout jak chceš.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_13");	//Přemyšlej o tom, pak můžeš používát mou legii démonů kolikrát chceš.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_14");	//Ale pamatuj si: Já nabizím jen jednou - takže si dobře rozmysli co mi odpovíš.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_15");	//Takže, jaké je tvoje rozhodnutí?
	Info_ClearChoices(dia_eligor_demon_hello);
	Info_AddChoice(dia_eligor_demon_hello,"Dobře, beru to!",dia_eligor_demon_hello_ok);
	Info_AddChoice(dia_eligor_demon_hello,"Ne tohle je příliš vysoká cena.",dia_eligor_demon_hello_no);
};

func void dia_eligor_demon_hello_ok()
{
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN");
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_16");	//Dobře, beru to!
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_17");	//Upřímně jsem tohle nečekal. Teď jsou démoni Langu pod tvojím plným velením.
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
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_18");	//Ne tohle je příliš vysoká cena.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_19");	//Cokoliv řekneš, smrtelníku. Náš rozhovor je u konce. Sbohem!
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
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_01");	//KDO MĚ PŘIVOLAL?! KDO SE OPOVÁŽÍL RUŠIT MŮJ KLID?!
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_02");	//To já jsem tě povolal.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_03");	//(zaujatě si mě prohlíží) Tvoje tvář mě je povědomá, smrtelníku.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_04");	//Konečně, už jsem si vzpomněl.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_05");	//Ty jsi ten kdo zabil vyvoleného Beliara, v Irdorathských síních! 
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_06");	//Podle mě, to byl úctyhodnej výkon.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_07");	//Poslal jsem na onen svět spoustu Beliarových nohsledů.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_08");	//Nicméně, ne každý z nich byl tak silný, jako nemrtví drak!
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_09");	//Ale dost už řečí. (vrčení) Mluv, co chceš?
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
		AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_99");	//Víš co jsi dostal! Nemám pravdu?
	};

	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_15");	//Nyní si můžem artefakty vyměnit!
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_16");	//(smích) Mýlíš se, smrtelníku.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_17");	//To byl jen malý poplatek, za to, že se mnou nyní smíš hovořit.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_18");	//Nic víc. Řekni, proč potřebuješ můj artefakt?
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_19");	//Pomůže mi porazit jednoho za starších démonů tohoto světa - Spáče!
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_20");	//Hmmm... (zamyšleně) Tak to je ten důvod! Je to všechno o něm.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_21");	//Kdysi byl silný, jako já! Ale nyní pro mě není soupeřem.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_22");	//Pro tebe možná. Ale já se k němu ani nedostanu díky jeho magii.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_23");	//Proto tě žádám o korunu démonů.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_24");	//Samo sebou...(směje se) To by mě nenapadlo.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_25");	//Nicméně měl bys pochopit, že se jí jen tak nevzdám. Budeš za ní muset zaplatit.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_26");	//A kolik zlata potřebuješ?
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_27");	//Zlato mě vůbec nezajímá. Budeš muset zaplatit svým životem!
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_28");	//Chystáš se mě zabít?
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_29");	//Ne. (smích) Žádám po tobě jen polovinu tvé životní energie.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_30");	//Hmmm... Možná, existuje nějaký jiný způsob?
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_31");	//(důrazně) Nebudu s tebou vyjednávat, smrtelníku!
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_32");	//Buď přijmeš mé podmínky, nebo s touto konverzací končíme.
	Info_ClearChoices(DIA_Eligor_Demon_OW_Hello);
	Info_AddChoice(DIA_Eligor_Demon_OW_Hello,"Dobře! Vezmi si moji životní sílu.",DIA_Eligor_Demon_OW_Hello_Health);
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
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_Health_01_01");	//(vrčení) Dobře. Dohoda je dohoda! Koruna démonů je tvoje.
	B_GiveInvItems(self,other,ItAr_Helm_G3_06,1);
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_Health_01_02");	//Doufám, že nelituješ, rozhodnutí, které jsi přijal.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_Health_01_03");	//Co se stalo, to se stalo.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_Health_01_04");	//Jak jsi řek, člověče! Naše setkání je u konce... sbohem.
	B_LogEntry(TOPIC_SLEEPERBACK,"Eligor ode mně požadoval, část mé životní síly. Neměl jsem na výběr. Musel jsem to obětovat, abych získal jeho artefakt!");
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
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_00");	//Čo ťa tu privádza, smrtelník? Čo tu hladáš?
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_01");	//Hmmm... Takže tie fámy boli pravdivé. Na tomto majáku naozaj straší!
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_02");	//Nebol si oklamaný. Je to skutočne pravda. Teraz mi odpovedz na moju otázku.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_03");	//Hladám Stefana, správcu tohto majáka. Bol tu zabitý.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_04");	//A čo od neho chceš?
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_05");	//Chcem odstrániť kliatbu čo zužuje toto miesto a preto potrebujem vedieť, čo presne sa tu stalo.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_06");	//Som prekvapený tvojím želaním smrtelník. Ludia sa tomuto miestu vyhýbajú...
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_07");	//A ty si tu prišiel a hovoríš, že mi chceš ponúknuť pomoc.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_08");	//Takže ty si Stefan? Povedz mi teda, prečo si bol zabitý?
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_09");	//Za moju milosť a súcit pre ludí. To bol celý problém.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_10");	//Raz som pomohol osobe v núdzi. Za to sa mi odvďačil tým, že ma zabil.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_11");	//Kto to bol?
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_12");	//Nepoznám jeho skutočné meno. Chcel aby som ho volal Kelevra.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_13");	//Kelevra? Asi jeho prezývka. Možno dokonca pirátska.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_14");	//Myslím, že to bol pirát. Mal so sebou pirátsku šablu.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_15");	//A ako sa dostal ku majáku?
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_16");	//V ten deň bola na mori búrka. Vyšplhal som na vrch majáku aby som doplnil olej do ohně a vtedy som uvidel ako jeho telo bolo vyhodené vlnami na pobrežie.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_17");	//Pravdepodobne stroskotal. Odniesol som ho do majáku.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_18");	//Trvalo dlho kým sa mu vrátilo vedomie. Viackrát som musel som ísť do mesta po lieky pretože mal horúčku. Ale nakoniec sa jeho stav zlepšil.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_19");	//A čo sa stalo potom?
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_20");	//Jeden deň mi povedal, že odchádza a že potrebuje moju loď.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_21");	//Ale ja som mu nemohol dať moju loď, lebo som ju potreboval. A tak som mu ponúkol, že ho zaveziem do Khorinisu.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_22");	//V tom momente sa mi zdalo, že bol trochu nervózny a nesvoj.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_23");	//Povedal mi, že mi z vrchu majáku ukáže kde ho mám doviesť na pobrežie.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_24");	//A keď sme sa dotali na vrchol, tak ma prepichol svojou šablou so slovami, že tú loď potrebuje sám.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_25");	//Odišiel, nechajúc ma umrieť v kaluži vlastnej krvi.
	B_LogEntry(TOPIC_HauntedLighthouse,"Stefanov duch mi povedal ako zomrel. Bol zabitý Kelevrom, ktorý bol asi pirát.");
};

instance DIA_Skeleton_Stefan_How(C_Info)
{
	npc = Skeleton_Stefan;
	nr = 1;
	condition = DIA_Skeleton_Stefan_How_condition;
	information = DIA_Skeleton_Stefan_How_info;
	permanent = FALSE;
	description = "Ako odstránim kliatbu z tohto miesta?";
};

func int DIA_Skeleton_Stefan_How_condition()
{
	return TRUE;
};

func void DIA_Skeleton_Stefan_How_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(other,self,"DIA_Skeleton_Stefan_How_01_00");	//Ako odstránim kliatbu z tohto miesta? Som si istý, že vela ludí v Khorinise by potešilo, keby sa tento maják vrátil do služby.
	AI_Output(self,other,"DIA_Skeleton_Stefan_How_01_01");	//Už predsa majú dávno nový. Načo by im bol druhý?
	AI_Output(other,self,"DIA_Skeleton_Stefan_How_01_02");	//Neviem. Ale duchovia nepatria medzi ludí. To by si mal vedieť.
	AI_Output(self,other,"DIA_Skeleton_Stefan_How_01_03");	//Chápem. Ale nemám ti ako pomoct. Prepáč...
	DealStoryDLH = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Vyzerá to, že zasa potrebujem pomoc od Xardasa. On bude určite vedieť ako túto kliatbu odstrániť.");
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
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_00");	//Prišiel si ma navštíviť znova, smrtelník. A tentokrát nie sám...
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_01_01");	//Poznávaš mojho spoločníka?
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_02");	//Poznávam. Aj keď už poriadne zostarol za ten čas.
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_01_03");	//Jack prišiel žiadať odpustenie za svoj zlý skutok.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_04");	//Nemusíš pokračovať. Presne viem, prečo tu je. Cítil som to akonáhle sem priplával.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_05");	//Nemyslel som si, že bude mať dosť odvahy na to aby sem prišiel.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_06");	//Ale keď už je tu... Myslím, že sa máme o čom porozprávať. Ty choď zapáliť svetlo na majáku.
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_01_07");	//Prečo by som to robil?
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_08");	//Tak chceš toto miesto zbaviť kliatby alebo nie?
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_01_09");	//Chcem, ale...
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_10");	//Tak počúvaj a rob čo ti hovorím!
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_11");	//Prítomnosť tejto osoby a sila kliatby spojená s ňou priláka ďalších duchov.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_12");	//A svetlo majáku ich na chvílu zastaví! Preto musíš ísť hore a zapáliť to svetlo.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_13");	//A ponáhlaj sa, sú blízko...
	JackMeetGhost = TRUE;
	Info_ClearChoices(DIA_Skeleton_Stefan_FinalMeet);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(DIA_Skeleton_Stefan_FinalMeet,"Potom mi musíš niečo slúbiť.",DIA_Skeleton_Stefan_FinalMeet_Promise);
	};

	Info_AddChoice(DIA_Skeleton_Stefan_FinalMeet,"Nie, to neurobím.",DIA_Skeleton_Stefan_FinalMeet_No);
	Info_AddChoice(DIA_Skeleton_Stefan_FinalMeet,"Dobre, zapálim ho.",DIA_Skeleton_Stefan_FinalMeet_Yes);
};

func void DIA_Skeleton_Stefan_FinalMeet_Promise()
{
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_00");	//Potom mi musíš niečo slúbiť.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_01");	//O čom to hovoríš?
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_02");	//Kým budem hore, Jack nesmie zomrieť. Už bolo preliatej dosť krvi.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_03");	//Mŕtvi sa nezodpovedajú živým!
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_04");	//Prisahaj, že nezomrie! Inak budeš prekliaty do konca časov.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_05");	//Dobre... Prisahám, že nezomrie.
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_06");	//Tak to je lepšie.
	JackDontDie = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Duch slúbil, že Jack nezomrie. Hádam dodrží svoje slovo...");
};

func void DIA_Skeleton_Stefan_FinalMeet_No()
{
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_No_01_00");	//Nie to neurobím.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_No_01_01");	//Ako hovoríš, smrtelník. Prepáč, ale to znamená, že tu obaja zomriete...
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
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Yes_01_00");	//Dobre, zapálim ho.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_Yes_01_01");	//Tak neváhaj.
	VLK_444_Jack.aivar[AIV_PARTYMEMBER] = FALSE;
	LeaveMeetGhost = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"JackTalk");
	B_StartOtherRoutine(VLK_444_Jack,"JackTalk");
};