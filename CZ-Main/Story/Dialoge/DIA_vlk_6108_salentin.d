
instance DIA_SALENTIN_EXIT(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 999;
	condition = dia_salentin_exit_condition;
	information = dia_salentin_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_salentin_exit_condition()
{
	return TRUE;
};

func void dia_salentin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SALENTIN_HALLO(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 1;
	condition = dia_salentin_hallo_condition;
	information = dia_salentin_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_salentin_hallo_condition()
{
	return TRUE;
};

func void dia_salentin_hallo_info()
{
	AI_Output(self,other,"DIA_Salentin_Hallo_01_00");	//Hej! CO TADY DĚLÁŠ?!... (udiveně) A jak se tu sakra dostal?!
	AI_Output(self,other,"DIA_Salentin_Hallo_01_01");	//Jestli tě paladinové uvidí, zabijou te!
	AI_Output(other,self,"DIA_Salentin_Hallo_01_02");	//Bez obav, řekněme, že se k nim potřebuji dostat.
	AI_Output(self,other,"DIA_Salentin_Hallo_01_03");	//COŽE?! VÍŠ VŮBEC KDE JSI?!
	AI_Output(self,other,"DIA_Salentin_Hallo_01_04");	//Ó, chlape, zmiz, než tě najdou... (soucitne)
	BEONETLU = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SALENTIN_BAUERNAUFSTAND(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 2;
	condition = dia_salentin_bauernaufstand_condition;
	information = dia_salentin_bauernaufstand_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_salentin_bauernaufstand_condition()
{
	return TRUE;
};

func void dia_salentin_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Salentin_Bauernaufstand_01_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_Salentin_Bauernaufstand_01_01");	//COŽE?! Ty jsi stále tady!... (nervózně)
	AI_Output(other,self,"DIA_Salentin_Bauernaufstand_01_03");	//Nebojte se! Jsem tady služebně.
	AI_Output(self,other,"DIA_Salentin_Bauernaufstand_01_04");	//A co je to za práci, že tě sem dostala?
	AI_Output(other,self,"DIA_Salentin_Bauernaufstand_01_05");	//Hledám jeden amulet. Přesněji - amulet Triramar. Víš o nem neco?
	AI_Output(self,other,"DIA_Salentin_Bauernaufstand_01_06");	//Jaké Triramar? Co to je?
	AI_Output(other,self,"DIA_Salentin_Bauernaufstand_01_08");	//Potřebuji ho a bez něj neodejdu.
	AI_Output(self,other,"DIA_Salentin_Bauernaufstand_01_09");	//(smích) Ty odsud už stejně nikam neodejdeš!
	AI_Output(self,other,"DIA_Salentin_Bauernaufstand_01_10");	//Jediný způsob, jak se dostat z tohoto ostrova - je použít magický portál v kapli na severu, ale ta je střežena paladiny.
	AI_Output(self,other,"DIA_Salentin_Bauernaufstand_01_11");	//Ale nemyslím si, že tě odsud pustí živího.
	AI_Output(self,other,"DIA_Salentin_Bauernaufstand_01_12");	//Ano chlapče, chytil ses!
};


instance DIA_SALENTIN_TRIRAMAR(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 2;
	condition = dia_salentin_triramar_condition;
	information = dia_salentin_triramar_info;
	permanent = FALSE;
	description = "A kde paladinové střeží ten amulet?";
};


func int dia_salentin_triramar_condition()
{
	if(Npc_KnowsInfo(other,dia_salentin_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_salentin_triramar_info()
{
	AI_Output(other,self,"DIA_Salentin_Triramar_01_00");	//Kaple, říkáš? (zamyšleně) a nemůže tam být ten amulet?
	AI_Output(self,other,"DIA_Salentin_Triramar_01_01");	//Nemám ponětí co je tam schované. Nepřibližuj se k ní na dosah střeli, jestli máš svůj život rád.
	AI_Output(other,self,"DIA_Salentin_Triramar_01_03");	//Přestaň mě strašit a řekni mě, kde je ta kaple.
	AI_Output(self,other,"DIA_Salentin_Triramar_01_04");	//Blázne, zešílel jsi.
	AI_Output(self,other,"DIA_Salentin_Triramar_01_06");	//Kaple se nachází sverně od mé chaty. A když už se tam chystáš, poprosím tě o jednu laskavost.
	AI_Output(self,other,"DIA_Salentin_Triramar_01_07");	//... postarej se ať tě nezabijou moc daleko ode mně - hodila by se mně tvoje výbava. (sarkasticky)
	AI_Output(other,self,"DIA_Salentin_Triramar_01_08");	//Koukám, že jsi veselá kopa. Řekni mě radši, kolik je v kapli paladinů?
	AI_Output(self,other,"DIA_Salentin_Triramar_01_11");	//Ne moc, většina je společně s velitelem v táboře ve východní části ostrova.
	AI_Output(other,self,"DIA_Salentin_Triramar_01_12");	//Pak se vplížím k nim do tábora.
	AI_Output(self,other,"DIA_Salentin_Triramar_01_13");	//Cože?! (přeskakuje mu hlas) Ach, ano, jo, běž, utíkej... ať se můžeš vydat za světlem.
};


instance DIA_SALENTIN_GETOUT(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 2;
	condition = dia_salentin_getout_condition;
	information = dia_salentin_getout_info;
	permanent = FALSE;
	description = "Jak jinak se dá dostat z tohoto ostrova?";
};


func int dia_salentin_getout_condition()
{
	if(Npc_KnowsInfo(other,dia_salentin_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_salentin_getout_info()
{
	AI_Output(other,self,"DIA_Salentin_GetOut_01_00");	//Jak jinak se dá dostat z tohoto ostrova?
	AI_Output(self,other,"DIA_Salentin_GetOut_02_01");	//Nijak. Myslíš, že bych jinak tady trčel tak dlouho!
	AI_Output(self,other,"DIA_Salentin_GetOut_04_03");	//Tenhle ostrov mě přivádí k šílenství.
	AI_Output(self,other,"DIA_Salentin_GetOut_05_04");	//Paladinové, chvála Innosovi, mě nechávají na pokoji. Ale k portálu mě taky nepustí.
};


instance DIA_SALENTIN_HOWIN(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 2;
	condition = dia_salentin_howin_condition;
	information = dia_salentin_howin_info;
	permanent = FALSE;
	description = "A jak ses sem dostal?";
};


func int dia_salentin_howin_condition()
{
	if(Npc_KnowsInfo(other,dia_salentin_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_salentin_howin_info()
{
	AI_Output(other,self,"DIA_Salentin_HowIn_01_00");	//A jak ses sem dostal?
	AI_Output(self,other,"DIA_Salentin_HowIn_01_04");	//Byl jsem námořníkem na jedné obchodní lodi. Přepravovali jsme magickou rudu z jedné bohem zapomenuté kolonie...
	AI_Output(self,other,"DIA_Salentin_HowIn_01_05");	//Když jsme se vraceli na pevninu, tak nás zastihla hrozná bouře. Loď to nepřežila, rozlomila se na dvě části a mě to smetlo do moře.
	AI_Output(self,other,"DIA_Salentin_HowIn_01_09");	//Probudil jsem se na ostrově a kolem mě spousta paladinů.
	AI_Output(other,self,"DIA_Salentin_HowIn_01_10");	//Proč tě nechali žít?
	AI_Output(self,other,"DIA_Salentin_HowIn_01_11");	//Nejsou to divoký zvířata. A já jsem se na jejich ostrov dostal nedobrovolně.
	AI_Output(self,other,"DIA_Salentin_HowIn_01_13");	//Dovolili mě žít na tomto ostrově - dali mě jídlo, nové oblečení a dokonce i nástroje.
	AI_Output(other,self,"DIA_Salentin_HowIn_01_14");	//A proč jsi nezůstal žít s nima?
	AI_Output(self,other,"DIA_Salentin_HowIn_01_15");	//Chlapče, je to vojenský tábor, ne hostinec.
	AI_Output(self,other,"DIA_Salentin_HowIn_01_23");	//Snažím se být jim co nejméně na očích a radím ti, udělej to také.
};


instance DIA_SALENTIN_CANPASS(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 1;
	condition = dia_salentin_canpass_condition;
	information = dia_salentin_canpass_info;
	permanent = FALSE;
	description = "Chodíš do tábora paladinů?";
};


func int dia_salentin_canpass_condition()
{
	if(Npc_KnowsInfo(other,dia_salentin_howin) && (MIS_BELIARHELPME == LOG_SUCCESS) && (CANUSEZIGOSMAGIC == TRUE) && (MEHASTRIRAVAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_salentin_canpass_info()
{
	AI_Output(other,self,"DIA_Salentin_CanPass_01_00");	//Chodíš do tábora paladinů?
	AI_Output(self,other,"DIA_Salentin_CanPass_01_01");	//Ano, několikrát za měsíc jim nosím ryby co nalovím.
	AI_Output(self,other,"DIA_Salentin_CanPass_01_02");	//Na oplátku mě dají maso a vodu. Tak co hlady tady neumřu.
	AI_Output(other,self,"DIA_Salentin_CanPass_01_03");	//Takže ti věří když máš povolenej vstup do tábora?
	AI_Output(self,other,"DIA_Salentin_CanPass_01_04");	//Ne že by mě důvěřovali, ale nepředstavuju pro ně žádné nebezpečí. Tak mě trpí.
	AI_Output(self,other,"DIA_Salentin_CanPass_01_05");	//A já se snažím je nenaštvat. A proč se ptáš?
	TELLSALENTINLAGER = TRUE;
	Info_ClearChoices(dia_salentin_canpass);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpass,"Myslím, že mě můžeš být užitečnej.",dia_salentin_canpass_yes);
	};
	Info_AddChoice(dia_salentin_canpass,"Jen se tak ptám.",dia_salentin_canpass_no);
};

func void dia_salentin_canpass_no()
{
	AI_Output(other,self,"DIA_Salentin_CanPass_No_01_00");	//Jen se tak ptám.
	AI_Output(self,other,"DIA_Salentin_CanPass_No_01_01");	//Hmmm...
	Info_ClearChoices(dia_salentin_canpass);
};

func void dia_salentin_canpass_yes()
{
	AI_Output(other,self,"DIA_Salentin_CanPass_Yes_01_00");	//Myslím, že mě můžeš být užitečnej.
	AI_Output(other,self,"DIA_Salentin_CanPass_Yes_01_01");	//Vzhledem k tomu, že ti věří - využiju tě abych se dostal k nim do tábora.
	AI_Output(self,other,"DIA_Salentin_CanPass_Yes_01_02");	//(opatrně) To znamená? Co máš za lubem?
	Info_ClearChoices(dia_salentin_canpass);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpass,"... GVAR SAX ESK SHATAR...!",dia_salentin_canpass_use);
	};
};

func void dia_salentin_canpass_use()
{
	B_GivePlayerXP(100);
	Snd_Play("DEM_WARN");
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(other,self,"DIA_Salentin_CanPass_Use_01_00");	//... GVAR SAX ESK SHATAR...
	AI_Output(other,self,"DIA_Salentin_CanPass_Use_01_01");	//Beliare, pane temnoty! Dej mi svou sílu, převzít tvar člověka.
	AI_Output(other,self,"DIA_Salentin_CanPass_Use_01_02");	//Teď dokončím to proč jsem tady!
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Salentin_CanPass_Use_01_03");	//O Innos! Kdo jsi? (v panice) Ty sloužíš Beliarovi?!
	AI_Output(self,other,"DIA_Salentin_CanPass_Use_01_04");	//A co je to za magii?! Innos, co se se mnou děje! Neee...
	USESALENTINAMULET = TRUE;
	Info_ClearChoices(dia_salentin_canpass);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpass,"(použít amulet)",dia_salentin_canpass_usedead);
	};
};

func void dia_salentin_canpass_usedead()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};


instance DIA_SALENTIN_CANPASSAGAIN(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 1;
	condition = dia_salentin_canpassagain_condition;
	information = dia_salentin_canpassagain_info;
	permanent = TRUE;
	description = "Mám pro tebe řešení.";
};


func int dia_salentin_canpassagain_condition()
{
	if((TELLSALENTINLAGER == TRUE) && (USESALENTINAMULET == FALSE) && (CANUSEZIGOSMAGIC == TRUE) && (MEHASTRIRAVAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_salentin_canpassagain_info()
{
	AI_Output(other,self,"DIA_Salentin_CanPassAgain_01_00");	//Mám pro tebe řešení.
	AI_Output(self,other,"DIA_Salentin_CanPassAgain_01_01");	//A jaké?
	Info_ClearChoices(dia_salentin_canpassagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpassagain,"Myslím, že mě můžeš být užitečnej.",dia_salentin_canpassagain_yes);
	};
	Info_AddChoice(dia_salentin_canpassagain,"Jen se tak ptám.",dia_salentin_canpassagain_no);
};

func void dia_salentin_canpassagain_no()
{
	AI_Output(other,self,"DIA_Salentin_CanPassAgain_No_01_00");	//Zapomeň na to
	AI_Output(self,other,"DIA_Salentin_CanPassAgain_No_01_01");	//Hnn... Dobře, jak říkáš.
	Info_ClearChoices(dia_salentin_canpassagain);
};

func void dia_salentin_canpassagain_yes()
{
	AI_Output(other,self,"DIA_Salentin_CanPass_Yes_01_00");	//Myslím, že mě můžeš být užitečnej.
	AI_Output(other,self,"DIA_Salentin_CanPass_Yes_01_01");	//Vzhledem k tomu, že ti věří - využiju tě abych se dostal k nim do tábora.
	AI_Output(self,other,"DIA_Salentin_CanPass_Yes_01_02");	//(opatrně) To znamená? Co máš za lubem?
	Info_ClearChoices(dia_salentin_canpassagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpassagain,"... GVAR SAX ESK SHATAR...!",dia_salentin_canpassagain_use);
	};
};

func void dia_salentin_canpassagain_use()
{
	B_GivePlayerXP(100);
	Snd_Play("DEM_WARN");
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(other,self,"DIA_Salentin_CanPass_Use_01_00");	//... GVAR SAX ESK SHATAR...!
	AI_Output(other,self,"DIA_Salentin_CanPass_Use_01_01");	//Beliare, pane temnoty! Dej mi svou sílu, převzít tvar člověka.
	AI_Output(other,self,"DIA_Salentin_CanPass_Use_01_02");	//Teď dokončím to proč jsem tady!
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Salentin_CanPass_Use_01_03");	//O Innos! Kdo jsi? (v panice) Ty sloužíš Beliarovi?!
	AI_Output(self,other,"DIA_Salentin_CanPass_Use_01_04");	//A co je to za magii?! Innos, co se se mnou děje! Neéé...
	USESALENTINAMULET = TRUE;
	Info_ClearChoices(dia_salentin_canpassagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_salentin_canpassagain,"(použít amulet)",dia_salentin_canpassagain_usedead);
	};
};

func void dia_salentin_canpassagain_usedead()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};


instance DIA_SALENTIN_ADVICE(C_Info)
{
	npc = vlk_6108_salentin;
	nr = 1;
	condition = dia_salentin_advice_condition;
	information = dia_salentin_advice_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_salentin_advice_condition()
{
	if(Npc_KnowsInfo(hero,dia_salentin_triramar) && (USESALENTINAMULET == FALSE) && Npc_KnowsInfo(hero,dia_salentin_howin))
	{
		return TRUE;
	};
};

func void dia_salentin_advice_info()
{
	AI_Output(self,other,"DIA_Salentin_Advice_01_00");	//Hej, počkej!
	AI_Output(other,self,"DIA_Salentin_Advice_01_01");	//Co ještě?
	AI_Output(self,other,"DIA_Salentin_Advice_01_02");	//Jestli opravdu chceš navštívit tábor paladinů,...
	AI_Output(self,other,"DIA_Salentin_Advice_01_04");	//Nechoď tam přes den- nebudeš mít jedinou šanci cokoliv udělat, bez ohledu na to co jsi měl za lubem.
	AI_Output(self,other,"DIA_Salentin_Advice_01_05");	//Nejlepší je to v noci, když všichni spí. Snad až na pár výjimek.
	AI_Output(other,self,"DIA_Salentin_Advice_01_07");	//Odkud tohle všechno víš?
	AI_Output(self,other,"DIA_Salentin_Advice_01_08");	//A není to jedno? Prostě si pamatuj co jsem ti řek.
};