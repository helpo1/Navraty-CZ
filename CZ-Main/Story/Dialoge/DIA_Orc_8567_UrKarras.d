instance DIA_Orc_8567_UrKarras_EXIT(C_Info)
{
	npc = Orc_8567_UrKarras;
	nr = 999;
	condition = DIA_Orc_8567_UrKarras_Exit_Condition;
	information = DIA_Orc_8567_UrKarras_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Orc_8567_UrKarras_Exit_Condition()
{
	return TRUE;
};

func void DIA_Orc_8567_UrKarras_Exit_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8567_UrKarras_Hello(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Hello_Condition;
	information = DIA_Orc_8567_UrKarras_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Orc_8567_UrKarras_Hello_Condition()
{
	if(MIS_Orcwayhero == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Hello_Info()
{
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hello_01_01");	//Ur-Karras nevěrit svým očím, přícházet člověk... (překvapeně) Co velíký šaman chtít ve měste skřetů?
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hello_01_02");	//Řekněme, že tady mám nějakou práci.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hello_01_03");	//Ur-Karras nepamatovat kdy naposled lidská noha vstoupit do našeho města. Být překvapen že bratři sem vpustit člověk. 
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hello_01_04");	//Mám Ulu-Mulu! Určite víš, že jeho vlastník si zasluhuje váš respekt.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hello_01_05");	//Pravda. Ale Ur-Karras varovat veliký šaman aby on neudělat nic špatné ve měste.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hello_01_06");	//Jinak skřeti rozhněvat a pak ani Ulu-Mulu nepomůže!
};

instance DIA_Orc_8567_UrKarras_Town(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Town_Condition;
	information = DIA_Orc_8567_UrKarras_Town_Info;
	permanent = FALSE;
	description = "Proč jsi zůstal ve měste?";
};

func int DIA_Orc_8567_UrKarras_Town_Condition()
{
	if(MIS_Orcwayhero == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Town_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Town_01_01");	//Proč jsi zůstal ve měste?
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Town_01_02");	//Myslel jsem, že všichni skřeti šli obléhat pevnost paladinů.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Town_01_03");	//Člověk mít pravdu. Ale místo pro Ur-Karras pořád tady. Tak říct jemu Ur-Thrall!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Town_01_04");	//Proč?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Town_01_05");	//Ur-Karras být vojevůdce velikého náčelníka a zajistit ve měste pořádek.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Town_01_06");	//Všichni válčníci být podřízení. Dělat jak Ur-Karras poroučet.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Town_01_07");	//Sám Ur-Karras být podřízen velikému vůdci a jenom od něj přijímat nové rozkazy.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Town_01_08");	//To znamená, že jsi taky něco jako velitel stráže?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Town_01_09");	//Ur-Karras nerozumí co člověk ríkat.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Town_01_10");	//Ale myslí že člověk pořád neví proč Ur-Karras být zde.
};

instance DIA_Orc_8567_UrKarras_Chief(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Chief_Condition;
	information = DIA_Orc_8567_UrKarras_Chief_Info;
	permanent = FALSE;
	description = "Ur-Thrall je váš náčelník?";
};

func int DIA_Orc_8567_UrKarras_Chief_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8567_UrKarras_Town) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Chief_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Chief_01_01");	//Ur-Thrall je váš náčelník?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Chief_01_02");	//Ano, on být veliký náčelník skřetů! Být velmi mocný válečník a velice moudrý.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Chief_01_03");	//Říkáš nejsilnejší?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Chief_01_04");	//Člověk nemít pochyb! Všíchni bratři mít strach i ctít Ur-Thrall.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Chief_01_05");	//Synové ducha ríkat že sám Beliar mu dát ochranu.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Chief_01_06");	//Člověk neskoušet zabít Ur-Thrall. Člověk rychle umřít!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Chief_01_07");	//Na to bych ani nepomyslel!
};

instance DIA_Orc_8567_UrKarras_Clanname(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Clanname_Condition;
	information = DIA_Orc_8567_UrKarras_Clanname_Info;
	important = FALSE;
	permanent = FALSE;
	description = "Jak se jmenuje tvůj klan?";
};

func int DIA_Orc_8567_UrKarras_Clanname_Condition()
{
	return TRUE;
};

func void DIA_Orc_8567_UrKarras_Clanname_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Clanname_01_01");	//Jak se jmenuje tvůj klan?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Clanname_01_02");	//(hrdě) Nazývat Černý drak! Být nejmocnejší klan skřetů v téhle zemi!

	if(Npc_KnowsInfo(hero,DIA_ORC_8550_URNAZUL_HELLO) == TRUE)
	{
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_Clanname_01_03");	//Jasně. A myslím, že taky tuším odkud má to jméno.
	}
	else
	{
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_Clanname_01_04");	//Působivé!
	};
};


instance DIA_Orc_8567_UrKarras_WhatInteres(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_WhatInteres_Condition;
	information = DIA_Orc_8567_UrKarras_WhatInteres_Info;
	permanent = FALSE;
	description = "Co zajímavého můžu vidět ve vašem měste?";
};

func int DIA_Orc_8567_UrKarras_WhatInteres_Condition()
{
	return TRUE;
};

func void DIA_Orc_8567_UrKarras_WhatInteres_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_WhatInteres_01_01");	//Co zajímavého můžu vidět ve vašem měste?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_WhatInteres_01_02");	//Ur-Karras myslet že člověk zde nenajde nic zajímavé.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_WhatInteres_01_03");	//A neměl by ve měste zůstávat příliš dlouho, bratři se pak rozhněvat!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_WhatInteres_01_04");	//Chceš říct, že nemám očekávat příliš mnoho pohostinnosti?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_WhatInteres_01_05");	//Člověk pochopit správně.
};

instance DIA_Orc_8567_UrKarras_UrTrall(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_UrTrall_Condition;
	information = DIA_Orc_8567_UrKarras_UrTrall_Info;
	important = FALSE;
	permanent = FALSE;
	description = "Kde bych našel velikého vůdce?";
};

func int DIA_Orc_8567_UrKarras_UrTrall_Condition()
{
	if(MeetFarrok == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_UrTrall_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_UrTrall_01_01");	//Kde bych našel velikého vůdce?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_UrTrall_01_02");	//Jeskyňe velikého vůdce Ur-Thrall být ve středě města. Člověk jít mírne nahoru od hlavního vchodu.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_UrTrall_01_03");	//Ale člověka dál nepustí, musí mít důležíté spravý pro Ur-Thrall.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_UrTrall_01_04");	//Pokud veliký šaman skusí vejít jenom tak, skřeti sa rozhněvat a zabít člověk.
};


//---------------------Kvesty Ur-Karrasa-----------------------------------------------------


instance DIA_Orc_8567_UrKarras_HelpRespect(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_HelpRespect_Condition;
	information = DIA_Orc_8567_UrKarras_HelpRespect_Info;
	important = FALSE;
	permanent = FALSE;
	description = "Můžeš mi pomoct dostat se k Ur-Thrallovi?";
};

func int DIA_Orc_8567_UrKarras_HelpRespect_Condition()
{
	if((MIS_HeroOrcJoin == LOG_Running) && (HeroOrcJoinStart == FALSE) && (PASSORKCHAMBER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_HelpRespect_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_HelpRespect_01_01");	//Můžeš mi pomoct dostat se k Ur-Thrallovi?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_HelpRespect_01_02");	//Hmmm... Farrok tě nepustí k velikému vůdci dokud nezískáš respekt bratrů.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_HelpRespect_01_03");	//A jak to mám udělat?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_HelpRespect_01_04");	//Člověk by měl pomoct bratrům nebo jít do boje ve velké skřetí aréně! Dosáhnout Mor Dar jako Ur-Karras.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_HelpRespect_01_05");	//A jak mám si zasloužit tvoji důvěru?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_HelpRespect_01_06");	//Ur-Karras může dát člověku několik úkolů. Když je splnit, braři budou člověka více vážit!
	B_LogEntry(TOPIC_HeroOrcJoin,"Ur-Karras mi pomůže získat respekt skřetů když pro něj udelám nějakou práci. Nebo můžu jít do arény a vyhrát jejich přízeň svým mečem.");
	HeroOrcJoinStart = TRUE;
};

instance DIA_Orc_8567_UrKarras_FirstTask(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_FirstTask_Condition;
	information = DIA_Orc_8567_UrKarras_FirstTask_Info;
	important = FALSE;
	permanent = FALSE;
	description = "Řekni mi, co mám udělat.";
};

func int DIA_Orc_8567_UrKarras_FirstTask_Condition()
{
	if((MIS_HeroOrcJoin == LOG_Running) && (HeroOrcJoinStart == TRUE) && (PASSORKCHAMBER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_FirstTask_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_01");	//Řekni mi, co mám udělat.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_02");	//Dobrá. Člověk dobře poslouchat Ur-Karras.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_03");	//Když člověk potkal Ur-Karras, zeptat se co Ur-Karras dělat v zemi lidí.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_04");	//Nyní Ur-Karras odpověďet. Můj skupina sem jít získat velmi vzácnou trofej pro Ur-Thrall.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_05");	//To je zajímavé. A jakou trofej?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_06");	//Ur-Karras měl pro vůdce získat jedovatý tesák Muritana.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_07");	//Muritana?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_08");	//Být obrovská a dravá šelma. Být velmi vzácná a nebezpečná!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_09");	//Takže jste sem přišli lovit toto monstrum?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_10");	//Člověk mít pravdu. Naši zvědi vidět to velké zvíře v Khorinisu.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_11");	//Ur-Karras vzít pět nejlepších lovců našeho klanu a vyrazit po jeho stopách.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_12");	//V noci přejít hory a pokračovat kudy zvědi naposledy vidět Muritana.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_13");	//A co se stalo pak?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_14");	//My chteli připravit léčku... bohužel sami sebe stát kořistí.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_15");	//Monstrum napadnout nás náhle a okamžitě zabít dva lovce skřetů.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_16");	//Pouze Ur-Karras zůstat naživu z celá skupina, být těžce zraněn.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_17");	//Kdyby nebylo člověka, jed Muritana by ho nakonec taky zabil!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_18");	//Ur-Karras být velmi smutný, že nesplnit příkaz vůdce... Ale možná to udělat člověk?
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_19");	//Myslíš, že já sám se dokážu vypořádat s tím, co se nepodařilo celému tvému oddílu?!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_20");	//Ur-Karras chce aby člověk skusit.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_23");	//V pořádku, půjdu zabít tu tvou bestii. Kde ji mám hledat?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_24");	//Ur-Karras myslí, že člověk najde Muritana v lese nedaleko města lidí.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_25");	//Někde ve skále být veliká a hluboká jeskyně. Tam monstrum zabít všechny bratry Ur-Karras!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_26");	//Pokusím se to místo najít.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_27");	//Jestli člověk dokáže zabít Muritana, neměl by zapomenout přinést Ur-Karras jeho tesáky.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_28");	//Ale pozor - jeho jed může snadno zabít člověka!


	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == TRUE)
	{
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_29");	//Neboj se! V lovu se dobře vyznám.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_30");	//Pak Ur-Karras přeje člověku dobrý lov a počkat zde na něj.
	}
	else
	{
		UrKarrasCanTeach = TRUE;
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_32");	//Vypadá to, že se to nejdříve budu muset naučit.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_33");	//Pokud člověk chce, Ur-Karras mu ukázat, jak vyjmout tesáky bestie.
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTask_01_34");	//No, budu o tom přemýšlet.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTask_01_35");	//Pak Ur-Karras přeje člověku dobrý lov a počkat zde na něj.
	};

	MIS_HeroOrcJoin_T1 = LOG_Running;
	MuritanS1 = TRUE;
	Log_CreateTopic(TOPIC_HeroOrcJoin_T1,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HeroOrcJoin_T1,LOG_Running);
	B_LogEntry(TOPIC_HeroOrcJoin_T1,"První Ur-Karrasův úkol není nejlehčí. Mám v Khorinisu najít nebezpečného tvora - Muritana - a vyrvat mu z tlamy jeho jedovaté tesáky. Tuto trofej chce získat nejvyšší vůdce Ur-Thrall, takže jsem neměl ani moc o čem přemýšlet. Skřetí skauti viděli toto monstrum nedaleko města, na dně rokle s obrovskou jeskyní.");
};

instance DIA_Orc_8567_UrKarras_Teeth(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Teeth_Condition;
	information = DIA_Orc_8567_UrKarras_Teeth_Info;
	permanent = FALSE;
	description = "Ukaž mi, jak zvěři vytáhnout zuby.";
};

func int DIA_Orc_8567_UrKarras_Teeth_Condition()
{
	if((UrKarrasCanTeach == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Teeth_Info()
{
	Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAnimalTrophy,"Nyní dokážu:");
	PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
	AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání zubů'");
	B_LogEntry_Quiet(TOPIC_TalentAnimalTrophy,"... vyjímat zuby a tesáky.");
	Npc_SetTalentSkill(other,NPC_TALENT_TAKEANIMALTROPHY,1);
	Snd_Play("LevelUP");
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Teeth_01_01");	//Ukaž mi, jak zvěři vytáhnout zuby.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Teeth_01_02");	//To není příliš těžké, člověče.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Teeth_01_03");	//Dát nůž kolem středu zubu nebo klu, a pak jemně vypáčit - aby se neporušil.
};

instance DIA_Orc_8567_UrKarras_Hunt(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_Hunt_Condition;
	information = DIA_Orc_8567_UrKarras_Hunt_Info;
	permanent = FALSE;
	description = "A proč poslal hledat Muritana právě tebe?";
};

func int DIA_Orc_8567_UrKarras_Hunt_Condition()
{
	if(MIS_HeroOrcJoin_T1 != FALSE)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_Hunt_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hunt_01_01");	//A proč poslal hledat Muritana právě tebe?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_02");	//Tag-Nor tehdy nebýt ve městě skřetů... Takže šéf poslat Ur-Karras!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hunt_01_04");	//Kdo je Tag-Nor?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_05");	//Být nejlepší z lovců mezi skřety! Už po mnoho zim lovit divokou zvěř, přinést bratrům hodně kořisti.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hunt_01_06");	//A kde ho najdu?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_07");	//Tag-Nor obvykle u vchodu do železného dolu skřetů. Tam člověk hledat.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_08");	//Ur-Karras jen dát člověku jednu radu, jestli on jít k němu.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hunt_01_09");	//Jakou radu?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_10");	//Tag-Nor nebude mluvit s člověk. Musí získat jeho respekt.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hunt_01_11");	//A jak to mám udělat?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_12");	//Člověk nejdříve zabít Muritana!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_13");	//Muritan mít dva jedovaté tesáky. Jeden člověk může dát Ur-Karras, a druhý přinést pro Tag-Nor!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_14");	//Tag-Nor pak respektovat člověk a mluvit s ním.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_Hunt_01_15");	//A jinak by to nešlo?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_Hunt_01_16");	//Tag-Nor také velmi cenit kůži velikého černého trola! Člověk může přinést i to.
	TagNorTell = TRUE;
};

instance DIA_Orc_8567_UrKarras_FirstTaskDone(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_FirstTaskDone_Condition;
	information = DIA_Orc_8567_UrKarras_FirstTaskDone_Info;
	permanent = TRUE;
	description = "Ohledně Muritana...";
};

func int DIA_Orc_8567_UrKarras_FirstTaskDone_Condition()
{
	if(MIS_HeroOrcJoin_T1 == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_FirstTaskDone_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_01");	//Ohledně Muritana...
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_02");	//Člověk má co říct Ur-Karras?

	if(Npc_HasItems(other,ItAt_BuritanTooth) >= 1)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_03");	//Dokázal jsem získat trofej, kterou chce váš vůdce.
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_04");	//Tady, vezmi si ji.
		B_GiveInvItems(other,self,ItAt_BuritanTooth,1);
		Npc_RemoveInvItems(self,ItAt_BuritanTooth,1);

		if(Trophy_MuritanTooth  == TRUE)
		{
			if((Npc_HasItems(other,ItAt_PW_MuritanTooth) == FALSE) && (Npc_HasItems(other,ItAt_BuritanTooth) == FALSE))
			{
				Ext_RemoveFromSlot(other,"BIP01 PELVIS");
				Npc_RemoveInvItems(other,ItUt_MuritanTooth,Npc_HasItems(other,ItUt_MuritanTooth));
				Trophy_MuritanTooth  = FALSE;
			};
		};

		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_05");	//Arrgh!... člověk dokázal zabít Muritana! Být velmi dobře.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_06");	//Nyní Ur-Karras vidět, že to nebýt chyba když poslal člověka zabít Muritana.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_07");	//Za to Ur-Karras respektovat člověk ještě víc a myslet že ostatní skřeti taky.

		if(SBMODE == TRUE)
		{
			AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_08");	//Nevíš proč váš vůdce potřebuje ten tesák?
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_09");	//Ur-Thrall to neříct Ur-Karras. Člověk se ho může zkusit na to zeptat sám.
			UrTrallTalkTooth = TRUE;
		};

		T1_OrcTask_Done = TRUE;
		ORCRESPECT = ORCRESPECT + 10;

		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Respekt u skřetů + 10");
		};

		MIS_HeroOrcJoin_T1 = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin_T1,LOG_SUCCESS);
		B_LogEntry(TOPIC_HeroOrcJoin_T1,"Přinesl jsem Ur-Karrasovi tesák Muritana. Byl velmi potěšen a řekl, že to určitě zvýší mou váženost mezi skřety. Myslím, že jsem na správné cestě...");

	}
	else if(MuritanS3 == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_11");	//Mám pro tebe špatnou zprávu.
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_12");	//Vystopoval jsem a zabil Muritana, ale nemohl jsem vzít jeho jedovaté tesáky.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_13");	//Arrgh... Člověk nepřinést tesák pro Ur-Karras?! To velmi špatné!
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_14");	//Ostatní skřeti nevěřit člověku že zabít netvora když nemá trofej.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_15");	//Bratři nebudou respektovat člověk!
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_16");	//A co mám teď dělat?
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_17");	//Ur-Karras neví. Ale myslet, že člověk by měl dál pomáhat skřetům aby získal jejich důvěru.
		MIS_HeroOrcJoin_T1 = LOG_FAILED;
		T1_OrcTask_Done = TRUE;
		B_LogEntry_Failed(TOPIC_HeroOrcJoin_T1);
	}
	else
	{
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_19");	//Zatím ne.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_FirstTaskDone_01_20");	//Pak člověk nestrácet čas a jít zabít Muritana!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Orc_8567_UrKarras_SecondTask(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_SecondTask_Condition;
	information = DIA_Orc_8567_UrKarras_SecondTask_Info;
	important = FALSE;
	permanent = FALSE;
	description = "Máš pro mě ještě jinou práci?";
};

func int DIA_Orc_8567_UrKarras_SecondTask_Condition()
{
	if((MIS_HeroOrcJoin == LOG_Running) && (T1_OrcTask_Done == TRUE) && (OrcsClan_CHK_01 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_SecondTask_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTask_01_01");	//Máš pro mě ještě jinou práci?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_02");	//Brat člověk chtít znovu pomoct skřetům? Ur-Karras může dát jiný úkol.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTask_01_03");	//Pak přejdi k věci. Co potřebuješ?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_04");	//Člověk by měl jít do údolí, kde veliká pevnost paladinů.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_05");	//Vysoko v horách na severu být velký klan skřetů Vysoké skály.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_06");	//Ur-Karras mít velmi důležitou zprávu pro jejich vůdce. Člověk mu ji musí předat!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTask_01_07");	//To je vše?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_08");	//Zatím všechno. Je to pro člověka dost?
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTask_01_09");	//Čekal jsem, že to bude něco víc vzrušující.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_10");	//Ur-Karras rozumí, co brat člověk myslí. Ale měl by vědět, že to být pro skřety velmi důležité!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTask_01_11");	//No tak jo, dej mi tu zprávu.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_12");	//Tady! Člověk vzít tenhle svitek a přinést ho vůdci Vysoké skály.
	B_GiveInvItems(self,other,ItWr_UrKarrasLetter,1);
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_13");	//Pak se vrátit k Ur-Karras s jeho odpovědí.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_14");	//Člověk teď jít. Ur-Karras na něj počkat tady.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTask_01_15");	//Brzy se vrátím.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTask_01_16");	//Arrgh... (souhlasně)
	MIS_HeroOrcJoin_T2 = LOG_Running;
	Log_CreateTopic(TOPIC_HeroOrcJoin_T2,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HeroOrcJoin_T2,LOG_Running);
	B_LogEntry(TOPIC_HeroOrcJoin_T2,"Ur-Karras mi dal další úkol. Je třeba jít do Hornického údolí a najít tam vůdce klanu Vysoké skály abych mu předal Ur-Karrasovu zprávu.");
};

instance DIA_Orc_8567_UrKarras_SecondTaskDone(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_SecondTaskDone_Condition;
	information = DIA_Orc_8567_UrKarras_SecondTaskDone_Info;
	permanent = FALSE;
	description = "Co se týče tvé zprávy...";
};

func int DIA_Orc_8567_UrKarras_SecondTaskDone_Condition()
{
	if((MIS_HeroOrcJoin_T2 == LOG_Running) && ((OrcTraitor == TRUE) || (OrcClanBossLetterDeliver == TRUE) || (OrcFailInvte == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_SecondTaskDone_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_01");	//Co se týče tvé zprávy...

	if(OrcClanBossLetterDeliver == TRUE)
	{
		B_GivePlayerXP(500);
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_02");	//Ur-Karras pozorně naslouchat co člověk ríct.
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_03");	//Doručil jsem tvou zprávu vůdci klanu Vysoké skály.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_04");	//A jaká odpovědět vůdce?
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_05");	//Řekl, že jeho klan souhlasí s tvým návrhem. Pravda neupřesnil s jakým...
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_06");	//Arrgh... (souhlasně) Ur-Karras být velmi spokojen s touto zprávou! Brat člověk to udělat správně.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_07");	//Za to skřeti k němu budou mít ještě větší respekt!
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_08");	//Ur-Karras teď potřebuje hodně času na přemýšlení. Bratr člověk může jít.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_09");	//Kdyby potřeboval Ur-Karras pro něj znovu poslat.
		ORCRESPECT = ORCRESPECT + 15;
		if(MIS_HeroOrcJoin == LOG_Running)
		{
			AI_Print("Respekt u skřetů + 15");
		};
		T2_OrcTask_Done = TRUE;
		MIS_HeroOrcJoin_T2 = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin_T2,LOG_SUCCESS);
		B_LogEntry(TOPIC_HeroOrcJoin_T2,"Přinesl jsem Ur-Karrasovi odpověď vůdce. Zdá se, že byl velice spokojený.");
		AI_StopProcessInfos(self);
	};
	if(OrcFailInvte == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_11");	//Ur-Karras pozorně naslouchat co člověk ríct.
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_12");	//Nemohl jsem doručit tvou zprávu vůdci klanu Vysoké skály, protože je mrtvý.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_13");	//Arrgh... To velmi špatné! Ur-Karras velice sklamaný, že člověk nemohl splnit úkol.
		AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_14");	//A co bude teď?
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_15");	//Ur-Karras teď potřebují hodně času na přemýšlení. Bratr člověk může jít.
		AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_16");	//Kdyby potřeboval Ur-Karras pro něj znovu poslat.
		MIS_HeroOrcJoin_T2 = LOG_Success;
		T2_OrcTask_Done = TRUE;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin_T2,LOG_SUCCESS);
		B_LogEntry(TOPIC_HeroOrcJoin_T2,"Řekl jsem Ur-Karrasovi, že jsem nemohl doručit jeho zprávu vůdci klanu Vysoké skály, protože byl po smrti. Byl tou novinou hodně rozrušený.");
		AI_StopProcessInfos(self);
	};
	if(OrcTraitor == TRUE)
	{
		if(UrKarrasGonezIsDead == TRUE)
		{
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_18");	//Ur-Karras pozorně naslouchat co člověk ríct.
			AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_19");	//Nedokázal jsem doručit tvou zprávu pro vůdce klanu Vysoké skály.
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_20");	//Arrgh... To velmi špatné! Ur-Karras velice sklamaný, že člověk nemohl splnit úkol.
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_21");	//Ale co jemu zabránit aby tak učinil?
			AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_22");	//Ehm... náhodou jsem ji ztratil.
			AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_23");	//Ale můžeš mi dát další dopis. Slibuji, že tentokrát o něj nepřijdu!
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_24");	//Ne... (výhružně) Ur-Karras již nemůže riskovat.
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_25");	//Ur-Karras teď potřebuje hodně času na přemýšlení. Člověk může jít.
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_26");	//Kdyby potřeboval Ur-Karras pro něj znovu poslat.
			AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_27");	//Tak já radši půjdu.
			MIS_HeroOrcJoin_T2 = LOG_Success;
			T2_OrcTask_Done = TRUE;
			Log_SetTopicStatus(TOPIC_HeroOrcJoin_T2,LOG_SUCCESS);
			B_LogEntry(TOPIC_HeroOrcJoin_T2,"Kurňa! Ur-Karras se dozvěděl o mém kontaktu s paladiny. Obvinil mě ze zrady a už se mnou nechce nic mít.");
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_28");	//Chodíš sem zbytečně člověče... (výhružně) Ur-Karras už vědet všechno!
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_29");	//Mí zvědové říct že ty být v pevnosti paladinů, místo toho abys mluvil s vůdcem Vysoké skály.
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_30");	//Myset, že člověk zradit Ur-Karras i jeho bratry!
			AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_31");	//Che... Opravdu jsi myslel, že bych pomáhl vám - odporným bestiím?
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_32");	//Arrgh... (rozzlobeně) Člověka bude mrzet, že nás zradil!
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_33");	//Ur-Karras neříct svým bratrům aby zabili člověk.
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_34");	//Vzpomněl si že člověk udělat něco pro něj. Ale od teď, člověk již nebýt jeho bratr!
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_35");	//Pokud Ur-Karras opět vidět člověka ve městě, on zemřít!
			AI_Output(other,self,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_36");	//(sarkasticky) Jsi tak velkorysý, skřete.
			AI_Output(self,other,"DIA_Orc_8567_UrKarras_SecondTaskDone_01_36");	//Arrgh... (naštvaně)
			MIS_HeroOrcJoin_T2 = LOG_Failed;
			B_LogEntry_Failed(TOPIC_HeroOrcJoin_T2);
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Orc_8567_UrKarras_PaladinGoods(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_PaladinGoods_Condition;
	information = DIA_Orc_8567_UrKarras_PaladinGoods_Info;
	permanent = FALSE;
	description = "Máš pro mě nějakou další práci?";
};

func int DIA_Orc_8567_UrKarras_PaladinGoods_Condition()
{
	if((T2_OrcTask_Done == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_PaladinGoods_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_01_01");	//Máš pro mě nějakou další práci?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_01_02");	//Ur-Karras myslet že ne... aniž by člověk chtěl pomoct bratrům bojovat proti lidem.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_01_03");	//Co máš na mysli?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_01_04");	//Člověk jít do pevnosti paladinů. Najít jejich sklad jídla a zničit ho.
	Info_ClearChoices(DIA_Orc_8567_UrKarras_PaladinGoods);
	Info_AddChoice(DIA_Orc_8567_UrKarras_PaladinGoods,"Ne, to není nic pro mě.",DIA_Orc_8567_UrKarras_PaladinGoods_No);
	Info_AddChoice(DIA_Orc_8567_UrKarras_PaladinGoods,"Dobře, udělám to.",DIA_Orc_8567_UrKarras_PaladinGoods_Yes);
};

func void DIA_Orc_8567_UrKarras_PaladinGoods_Yes()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_01");	//Dobře, udělám to.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_02");	//(překvapeně) Být trochu překvapen, že člověk souhlasí.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_03");	//Bratům hodně pomoct, když paladinové zůstat bez jídla.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_04");	//Když nemůžeme porazit zvenku, je třeba skusit zevnitř!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_05");	//Možná, že lidi pak pozabíjet navzájem.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_06");	//Ale být opatrný, jinak paladinové na to přijít.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_07");	//Ur-Karras myslí že oni důverovat člověku. Bude v pořádku!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_08");	//Pochopil jsem, Ur-Karrasi. Vyrazím okamžitě.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Yes_01_09");	//Ur-Karras přát hodně štěstí, člověče!
	MIS_PaladinGoods = LOG_Running;
	Log_CreateTopic(TOPIC_PaladinGoods,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PaladinGoods,LOG_Running);
	B_LogEntry(TOPIC_PaladinGoods,"Zdá se, že se v Hornickém údolí situace začne zhoršovat. Ur-Karras touží zlomit odpor paladinů v pevnosti, ale protože všechny předchozí pokusy o dobytí hradu selhali, rozhodl se jednat jinak. Můj další úkol je zničit paladinům zásoby potravin. Ur-Karras věří, že hladomor oslabí jejich obranu. Myslím, že se s tím nejlíp vypořádám pomocí ohně...");
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8567_UrKarras_PaladinGoods_No()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_No_01_01");	//Ne, to není nic pro mě.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_No_01_02");	//Ur-Karras rozumí, proč člověk odmítnout! Nechce zradit své lidi.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_No_01_03");	//Ur-Karras proto nezlobit. Respektovat člověk pořád stejně.
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8567_UrKarras_PaladinGoods_Done(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_PaladinGoods_Done_Condition;
	information = DIA_Orc_8567_UrKarras_PaladinGoods_Done_Info;
	permanent = FALSE;
	description = "V pevnosti paladinů zakrátko nastane hladomor.";
};

func int DIA_Orc_8567_UrKarras_PaladinGoods_Done_Condition()
{
	if((MIS_PaladinGoods == LOG_Running) && (PaladinGoodsBurned == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_PaladinGoods_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_01");	//V pevnosti paladinů zakrátko nastane hladomor.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_02");	//NIKAR CHETAG. Výborně!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_03");	//Lidi brzy zeslábnout, my pak obsadit jejich pevnost!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_04");	//Na vašem místě bych nebyl tak nadšený, Ur-Karrasi.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_05");	//Víra paladinů je pořád dost silná na to aby je nezlomil obyčejný hlad.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_06");	//Navíc, magie kterou jím propůjčil Innos je pořad s nimi.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_07");	//Ano, člověk mít pravdu. Ale plán skřetů být obsadit tuto pevnost za každou cenu!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinGoods_Done_01_08");	//Ur-Karras děkovat že člověk splnit jeho žádost.
	ORCRESPECT = ORCRESPECT + 20;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Respekt u skřetů + 20");
	};

	MIS_PaladinGoods = LOG_Success;
	Log_SetTopicStatus(TOPIC_PaladinGoods,LOG_SUCCESS);
	B_LogEntry(TOPIC_PaladinGoods,"Ohlásil jsem Ur-Karrasovi, že zásoby potravin v pevnosti paladinů byli zničeny. Byl s touto zprávou spokojen.");
};

instance DIA_Orc_8567_UrKarras_PaladinCamp(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_PaladinCamp_Condition;
	information = DIA_Orc_8567_UrKarras_PaladinCamp_Info;
	important = FALSE;
	permanent = FALSE;
	description = "Potřebuješ ještě mou pomoc?";
};

func int DIA_Orc_8567_UrKarras_PaladinCamp_Condition()
{
	if((MIS_PaladinGoods == LOG_Success) && (PaladinCampCostDestroyed == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_PaladinCamp_Info()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinCamp_01_01");	//Potřebuješ ještě mou pomoc?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_01_02");	//Ur-Karras myslet, že ano... Ale to být poslední úkol.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_01_03");	//Když ho člověk splnit, získat u skřetů plný respekt.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinCamp_01_04");	//Tak mluv, v čem ten úkol spočívá.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_01_05");	//Zvědové říkat Ur-Karras, že v blízkosti pobřeží vidět malou četu paladinů.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_01_06");	//Ur-Karras neznat jejich plány. Ale měl by jim zabránit vrátit se zpátky do hradu!
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinCamp_01_07");	//A co navrhuješ?
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_01_08");	//(lstivě) Člověk neví? Člověk je najít a celou četu zabít.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_01_09");	//Ur-Karras říct dost. Zbytek rozhodnout pouze člověk.
	Info_ClearChoices(DIA_Orc_8567_UrKarras_PaladinCamp);
	Info_AddChoice(DIA_Orc_8567_UrKarras_PaladinCamp,"Ne, to je příliš mnoho.",DIA_Orc_8567_UrKarras_PaladinCamp_No);
	Info_AddChoice(DIA_Orc_8567_UrKarras_PaladinCamp,"Vyřídím si to s nimi!",DIA_Orc_8567_UrKarras_PaladinCamp_Yes);
};


func void DIA_Orc_8567_UrKarras_PaladinCamp_No()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinCamp_No_01_01");	//Ne, to je příliš mnoho.
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_No_01_02");	//Dobře! Pak Ur-Karras žádné další úkoly pro člověk.
	Info_ClearChoices(DIA_Orc_8567_UrKarras_PaladinCamp);
};

func void DIA_Orc_8567_UrKarras_PaladinCamp_Yes()
{
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinCamp_Yes_01_01");	//Vyřídím si to s nimi!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_Yes_01_02");	//Hodně štěstí, člověče!
	MIS_PaladinCamp = LOG_Running;
	Log_CreateTopic(TOPIC_PaladinCamp,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PaladinCamp,LOG_Running);
	B_LogEntry(TOPIC_PaladinCamp,"Ur-Karras mi dal poslední prácičku. Musím najít a zničit četu paladinů, která táboří v blízkosti pobřeží. Snad mě pak nebude příliš trápit svědomí...");
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8567_UrKarras_PaladinCamp_Done(C_Info)
{
	npc = Orc_8567_UrKarras;
	condition = DIA_Orc_8567_UrKarras_PaladinCamp_Done_Condition;
	information = DIA_Orc_8567_UrKarras_PaladinCamp_Done_Info;
	important = FALSE;
	permanent = FALSE;
	description = "Četa paladinů byla zničena!";
};

func int DIA_Orc_8567_UrKarras_PaladinCamp_Done_Condition()
{
	if((MIS_PaladinCamp == LOG_Running) && (ALBERTISDEAD == TRUE) && (PAL_7518_ISDEAD == TRUE) && (PAL_7519_ISDEAD == TRUE) && (PAL_7520_ISDEAD == TRUE) && (PAL_7521_ISDEAD == TRUE) && (PAL_7522_ISDEAD == TRUE) && (PAL_7524_ISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8567_UrKarras_PaladinCamp_Done_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinCamp_Done_01_01");	//Četa paladinů byla zničena, přesně jak si chtěl.
	AI_PlayAni(self,"T_GREETGRD");
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_Done_01_02");	//Člověk dokázat, že je hoden našeho respektu!
	AI_Output(self,other,"DIA_Orc_8567_UrKarras_PaladinCamp_Done_01_03");	//Ur-Karras sklonit před velikým válečníkem, jakým se zdá být člověk.
	AI_Output(other,self,"DIA_Orc_8567_UrKarras_PaladinCamp_Done_01_04");	//Jsem krajně polichocen.
	ORCRESPECT = ORCRESPECT + 25;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Respekt u skřetů + 25");
	};

	MIS_PaladinCamp = LOG_Success;
	Log_SetTopicStatus(TOPIC_PaladinCamp,LOG_SUCCESS);
	B_LogEntry(TOPIC_PaladinCamp,"Přijel jsem k Ur-Karrasovi se zprávou, že četa paladinů byla zničila. Vojevůdce skřetů byl se mnou velmi spokojen.");
	AI_StopProcessInfos(self);
};