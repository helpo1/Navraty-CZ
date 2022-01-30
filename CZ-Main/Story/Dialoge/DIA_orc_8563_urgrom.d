
instance DIA_ORC_8563_URGROM_EXIT(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_exit_condition;
	information = dia_orc_8563_urgrom_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8563_urgrom_exit_condition()
{
	return TRUE;
};

func void dia_orc_8563_urgrom_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8563_URGROM_HELLO_WAIT(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_hello_wait_condition;
	information = dia_orc_8563_urgrom_hello_wait_info;
	important = FALSE;
	permanent = TRUE;
	description = "Vypadá to, že tě znám, duchu!";
};


func int dia_orc_8563_urgrom_hello_wait_condition()
{
	if((MEETURGROM == FALSE) && (BLKDRAGNISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_hello_wait_info()
{
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_01");	//Vypadá to, že tě znám, duchu! Tvá tvář... Vzpomínám si.
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_02");	//Ty jsi... pravděpodobně... ehm... samozřejmě! Ur-Grom!
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_03");	//... Člověk, který mluví o Ur-Gromovi? Jak zná moje jméno?
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_04");	//Tvůj bratr Ur-Thrall mi o tobě vyprávěl.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_05");	//Bratr Ur-Grom... bratr... bratr... Ur-Thrall... (přemýšlí)
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_06");	//Ano myslím, že ano.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_07");	//Mám bratra. Ur-Grom pamatuje bratra Ur-Thralla!
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_08");	//Ur-Grom a bratr spolu bojují proti svým nepřátelům a bojují proti zlému démonu.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_09");	//Člověk, ty potkat bratra Ur-Groma?
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_10");	//Ano, potkal jsem tvého bratra. Je to ten, který mě přivedl k tobě.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_11");	//Proč sem člověk přišel?
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_12");	//Jsem tady, protože Ur-Thrall se chce pomstít a odpravit Azgalora. Pomstít se za tvůj lid, pomstít se za tebe a za sebe!
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_13");	//Pamatuješ si na toho strašného démona?
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_14");	//Bratr ho přijde zabít?
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_15");	//Ne, Ur-Thrall nemůže přijít do údolí kvůli kletbě, kterou Azgalor uvrhl.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_16");	//Sám člověk chce zabít démona?
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_18");	//Ur-Grom si myslí, že člověk je velmi statečný válečník. Ale sám člověk nemůže porazit démona.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_19");	//Jak člověk zemře, démon si vezme jeho duši. Démon je velmi silný, velmi zlý!
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_20");	//Často jsem musel bojovat s podobnými příšerami. Tentokrát to zvládnu taky.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_21");	//Neznáš moc démona! Myslíš, že démon je slabý. Myslíš si, že jsi silnější než démon.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_22");	//Ur-Grom říká, že člověk je slabý! Mnoho bratrů chtělo zabít démona, ale všichni jsou mrtví, všichni mu nyní slouží.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_23");	//Člověk potřebuje pomoc. Jeden umírá!
	B_LogEntry(TOPIC_URNAZULRAGE,"V opuštěném táboře skřetů jsem se setkal s Ur-Gromem. Podle něj je černý drak Azgalor - velmi silná bestie a sám se s ním nemůžu rovnat.");
	self.name[0] = CZ_NAME_Orc_Unique_Urgrom_Title;
	MEETURGROM = TRUE;
};


instance DIA_ORC_8563_URGROM_HELLO_HELP(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_hello_help_condition;
	information = dia_orc_8563_urgrom_hello_help_info;
	important = FALSE;
	permanent = TRUE;
	description = "Pomůžeš mi zničit toho zmetka?";
};


func int dia_orc_8563_urgrom_hello_help_condition()
{
	if((MEETURGROM == TRUE) && (MEETURGROMNEXT == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_hello_help_info()
{
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_01");	//Pomůžeš mi zničit toho zmetka?
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_02");	//Ur-Grom si myslí, že může pomoci člověčina...
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_03");	//Chceš bojovat, člověk proti démonovi! (rozzlobeně) Pomstíš se!
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_04");	//Ale to nemůžeš. Azgalor vzal duši Ur-Groma a Ur-Grom zemřít, jestli jít proti démonu.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_05");	//člověk potřebuje jiného pomocníka... Člověk potřebuje najít DVARTAZDAKH.
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_06");	//A co to je - DVARTAZDAKH?
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_07");	//Je to starověká zbraň! Zbraň velkého ducha válečníka!
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_08");	//S ním může člověk porazit démona.
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_09");	//Kde najdu tu zbraň?
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_10");	//Ur-Grom přesně neví. Slyšel o ni jednou od synů duchů, ale on sám je nikdy neviděl.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_11");	//Člověk najde DVARTAZDAKH, přinese je k Ur-Gromovi a pak půjde do boje proti démonovi.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_12");	//POKUD najdeš DVARTAZDAKH, přines je k Ur-Gromovi. Pak půjdeš do boje proti zlu.
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_13");	//No, zkusím to najít... Jak se jmenuje ta zbraň?
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_14");	//DVARTAZDAKH!
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_15");	//... přesně, to je ono.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_16");	//Pak jdi člověče, Ur-Grom ho čeká.
	B_LogEntry(TOPIC_URNAZULRAGE,"Ur-Grom mi řekl, že někde v údolí je skryta dávná zbraň duchů, zbraň se nazývá DVARTAZDAKH. Ta zbraň, podle Ur-Groma může způsobit Azgalorovi vážné zranění.");
	MEETURGROMNEXT = TRUE;
};


instance DIA_ORC_8563_URGROM_HELLO_FIND(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_hello_find_condition;
	information = dia_orc_8563_urgrom_hello_find_info;
	important = FALSE;
	permanent = TRUE;
	description = "A není to náhodou zbraň, o které jsi mluvil?";
};


func int dia_orc_8563_urgrom_hello_find_condition()
{
	if((Npc_HasItems(other,itrw_addon_magiccrossbow_shv) >= 1) && (MEETURGROMNEXT == TRUE) && (MEETURGROMCOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_hello_find_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Find_01_01");	//A není to náhodou zbraň, o které jsi mluvil?
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Find_01_02");	//Ur-Grom si myslí, že člověk našel DVARTAZDAKH!
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Find_01_03");	//Teď jdi zabít démona! Pomstít bratry!
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Find_01_04");	//Tak já jdu.
	B_LogEntry(TOPIC_URNAZULRAGE,"Našel jsem DVARTAZDAKH, přesněji Exekutor - Starobylou zbraň bojových duchů, kteří kdysi žili v těchto místech...");
	AI_StopProcessInfos(self);
	MEETURGROMCOME = TRUE;
	Npc_ExchangeRoutine(self,"UrGromGoBattle");
};


instance DIA_ORC_8563_URGROM_AZGOLOR_WAIT(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_azgolor_wait_condition;
	information = dia_orc_8563_urgrom_azgolor_wait_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_orc_8563_urgrom_azgolor_wait_condition()
{
	if((AZGOLORAPPEAR == TRUE) && (MEETURGROMCOME == TRUE) && (MEETURGROMEND == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_azgolor_wait_info()
{
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Azgolor_Wait_01_01");	//Démon už tady čeká na toho člověka.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Azgolor_Wait_01_02");	//Člověk bude pokračovat a setká se s démonem...
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Azgolor_Wait_01_03");	//Ur-Grom si myslí, že člověk může zabít démona.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Azgolor_Wait_01_04");	//Člověk nesmí zapomenout nést DVARTAZDAKH!
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Azgolor_Wait_01_05");	//Samozřejmě.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Azgolor_Wait_01_06");	//Ur-Grom přeje člověku úspěšný lov.
	self.flags = 0;
	MEETURGROMEND = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8563_URGROM_AZGOLOR_WAIT_AGAIN(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_azgolor_wait_again_condition;
	information = dia_orc_8563_urgrom_azgolor_wait_again_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_orc_8563_urgrom_azgolor_wait_again_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MEETURGROMEND == TRUE) && (BLKDRAGNISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_azgolor_wait_again_info()
{
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Azgolor_Wait_Again_01_01");	//Člověk půjde zabít démona. Ur-Grom počká zde!
	AI_StopProcessInfos(self);
};

