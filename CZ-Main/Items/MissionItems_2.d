/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void UseBloodMIS - upraveny výpisy
func void UseDiofant_Paper - opravena hádanka

*/




instance ItMi_StoneOfKnowlegde_MIS(C_Item)
{
	name = "Kámen vědění";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
	inv_animate = 1;
};

instance ItMi_ParlanRelic_MIS(C_Item)
{
	name = "Prastará relikvie";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 1000;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
	text[4] = "Tahle relikvie zřejmě patřila mágovi Ohně...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItWr_PaladinLetter_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePaladinLetter;
	scemeName = "MAP";
	description = "Dopis lordu Hagenovi";
	text[4] = "Tenhle dopis napsal Garond, velitel paladinského oddílu...";
	inv_animate = 1;
};


func void UsePaladinLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Lorde Hagene!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Expedice do Hornického údolí selhala. Utrpěli jsme těžké ztráty a ti, kteří přežili, jsou nyní uvězněni na hradě a obklíčeni skřety. Také na nás mnohokrát zaútočili draci. Zničili a spálili veškeré území v okolí hradu. S Innosovou pomocí snad vytrváme, dokud nedorazí posily. Stejně nám nic jiného nezbývá, neboť žádný výpad podniknout nemůžeme.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Garond");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_LetterForGorn_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezN.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLetterForGorn;
	scemeName = "MAP";
	description = "Miltenův odkaz";
	inv_animate = 1;
};

func void UseLetterForGorn()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Gorne!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Garond souhlasil, že tě propustí - za 1000 zlatých. Takže jestli máš někde ulitý nějaký zlato, bylo by načase se s ním vytasit.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Milten");
	Doc_Show(nDocID);
};

instance ItMi_GornsTreasure_MIS(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 1;
	visual = "ItMi_Pocket_Medium.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = UseGornsTreasure;
	description = "Gornův měšec";
	text[4] = "Tenhle měšec očividně patřil žoldáku Gornovi...";
	inv_animate = 1;
};


func void UseGornsTreasure()
{
	B_PlayerFindItem(ItMi_Gold,250);
	Gorns_Beutel = TRUE;
};


instance ItWr_Silvestro_MIS(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseItwr_Silvestro;
	scemeName = "MAP";
	description = "Zpráva od Silvestra";
	inv_animate = 1;
};


func void UseItwr_Silvestro()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Trápí mě jakési neblahé tušení, takže radši všechnu rudu někam schovám. Diego to tady jako jediný z nás zná. Určitě ty bedny ukryje někam do bezpečí. Rudu musíme ochránit za každou cenu, a tak s ním posílám ještě dva rytíře.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"		Silvestro");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItAt_ClawLeader(C_Item)
{
	name = "Chňapavčí drápy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 150;
	visual = "ItAt_Claw_Sky.3DS";
	material = MAT_LEATHER;
	description = "Chňapavčí drápy";
	text[4] = "Tyhle hrůzostrašné drápy patřily vůdci smečky chňapavců...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_CLAWBLACKSNAPPER(C_Item)
{
	name = "Chňapavčí drápy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 200;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = "Drápy černého chňapavce";
	text[4] = "Tyhle hrůzostrašné drápy patřily černému chňapavci...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_VEPRFUR(C_Item)
{
	name = "Kůže divočáka";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 300;
	visual = "ItAt_VeprFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Tuhle kůži jsem stáhl divočákovi, kterého jsem skolil...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_NIGHTHUNTERFUR(C_Item)
{
	name = "Kůže přízračné stínové šelmy";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItAt_TrollBlackFur_New.3DS";
	material = MAT_LEATHER;
	description = name;
	text[4] = "Tuhle kůži jsem stáhl přízračné stínové šelmě, kterou jsem skolil...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ITAT_LUKEREGG(C_Item)
{
	name = "Vejce číhavce";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 150;
	visual = "G3_Item_Scavanger_Egg_01.3ds";
	material = MAT_LEATHER;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};

instance ItSe_Olav(C_Item)
{
	name = "Měšec";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 1;
	visual = "ItMi_Pocket_Small.3ds";
	scemeName = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = UseOlav;
	description = "Olavův měšec";
	text[4] = "V měšci cinká několik mincí...";
	inv_animate = 1;
};

func void UseOlav()
{
	B_PlayerFindItem(ItMi_Gold,25);
};


instance ItMi_Plate_MISGold(C_Item)
{
	name = "Zlatý talíř";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_GoldPlate;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[4] = "";
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


instance ItWr_Bloody_MIS(C_Item)
{
	name = "Poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseBloodMIS;
	scemeName = "MAP";
	description = "Jed krvavé mouchy";
	inv_animate = 1;
};


func void UseBloodMIS()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Žihadlo krvavé mouchy obsahuje prudký jed, a proto se ho nikdo, kdo má všech pět pohromadě, nedotýká. Pokud tedy nezná tajemství, jak je spolehlivě vyjmout. Žihadlo lze čistě otevřít, pokud je ostrým nožem po délce opatrně naříznete a sloupnete svrchní kůži. Pak už jen stačí odstranit tkáň kolem jedových žláz.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Damarok");
	Doc_Show(nDocID);
	if(Knows_Bloodfly == FALSE)
	{
		Knows_Bloodfly = TRUE;
		AI_Print("Naučeno: Extrakce sekretu ze žihadel");
		Log_CreateTopic(Topic_Bonus,LOG_NOTE);
		B_LogEntry(Topic_Bonus,"Nyní vím, jak ze žihadel krvavých much získat léčivý sekret.");
		B_GivePlayerXP(XP_Ambient);
	};
};


instance ItWr_Pfandbrief_MIS(C_Item)
{
	name = "Zástavní smlouva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Ordr.3DS";
	material = MAT_LEATHER;
	on_state[0] = UsePfandbrief;
	scemeName = "MAP";
	description = name;
	text[4] = "Zástavní smlouva kupce Lutera...";
	inv_animate = 1;
};


func void UsePfandbrief()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Za účelem splacení nevyrovnaných pohledávek budiž přijat do zástavy předmět, jehož hodnota zmíněné pohledávky vyrovnává.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"V zástavě:");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"- zdobený zlatý kalich ze sbírky Krvavých kalichů");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Lutero, kupec");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Lehmar, věritel");
	Doc_Show(nDocID);
};


instance ITWR_LUTEROLOAN(C_Item)
{
	name = "Dluhopis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Ordr.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_luteroloan;
	scemeName = "MAP";
	description = name;
	text[4] = "Dluhopis kupce Lutera lichváři Lehmarovi...";
	inv_animate = 1;
};


func void use_luteroloan()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_ORDER.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Já, Lutero, si půjčuji u lichváře Lehmara obnos pět tisíc zlatých a zavazuji se tenhle dluh včetně patřičných úroků v dohodnuté lhůtě splatit.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Lutero, kupec");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Lehmar, věřitel");
	Doc_Show(nDocID);
};


instance ITWR_MAP_OLDWORLD_OREMINES_MIS_1(C_Item)
{
	name = "Garondova mapa Hornického údolí";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItMw_MapClosed_New_01.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = Use_Map_OldWorld_Oremines;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	inv_animate = 1;
};


func void Use_Map_OldWorld_Oremines()
{
	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document,1);
	Doc_SetPage(Document,0,"Map_OldWorld_Oremines.tga",TRUE);
	Doc_SetLevel(Document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document,-78500,47500,54000,-53000);
	Doc_Show(Document);
};


instance ItWr_Manowar(C_Item)
{
	name = "Svitek";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseManowar;
	scemeName = "MAP";
	description = "Texty písní";
	inv_animate = 1;
};


func void UseManowar()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Dominiquovo volání");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Budeme opěvovat Jeho slávu");
	Doc_PrintLines(nDocID,0,"Innos stojí při mně a mých bratrech");
	Doc_PrintLines(nDocID,0,"Můj meč slouží jen Jemu samotnému");
	Doc_PrintLines(nDocID,0,"A dnes se bude Jeho jméno všude rozléhat");
	Doc_PrintLines(nDocID,0,"Každého, kdo se mi postaví");
	Doc_PrintLines(nDocID,0,"Vlastní rukou skolím");
	Doc_PrintLines(nDocID,0,"Neboť já jsem Innosovým válečníkem!");
	Doc_Show(nDocID);
};


instance ItWr_KDWLetter(C_Item)
{
	name = "Zpráva";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Olds.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseKDWLetter;
	scemeName = "MAP";
	description = "Zpráva";
	inv_animate = 1;
};


func void UseKDWLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Opustili jsme tábor. Teď, když bariéra padla, vyhledáme místo, kde celá ta zkáza začala. Možná tam najdeme odpovědi, po kterých se pídíme už po dlouhá léta. Jen Adanos ví, kam nás cesta zavede.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Adanos nás provázej!");
	Doc_PrintLine(nDocID,0,"Saturas");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItWr_GilbertLetter(C_Item)
{
	name = "Poznámka";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_Note.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseGilbertLetter;
	scemeName = "MAP";
	description = "Poznámka";
	inv_animate = 1;
};


func void UseGilbertLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_OLD_NOTE.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Začíná mě to pěkně štvát. Už jsem se tu schovával dost dlouho a jestli jsem dobře slyšel, bariéra konečně padla. Teď už mě nikdo nebude hledat. Mám plný zuby týhle hnusný jeskyně i toho zatracenýho údolí. Je načase vrátit se domů.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Gilbert");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_Show(nDocID);
};


instance ItRi_Tengron(C_Item)
{
	name = NAME_Ring;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = Value_Ri_Hp;
	visual = "ItMi_Ring_Silver_New_Named.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Tengron;
	on_unequip = UnEquip_ItRi_Tengron;
	wear = WEAR_EFFECT;
	description = NAME_ADDON_TengronsRing;
	text[2] = NAME_Bonus_HpMax;
	count[2] = Ri_Hp;
	text[4] = "Tenhle prsten patřil paladinovi jménem Tengron...";
	text[5] = NAME_Value;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
	inv_animate = 1;
};


func void Equip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + Ri_Hp;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + Ri_Hp;
};

func void UnEquip_ItRi_Tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - Ri_Hp;
	if(self.attribute[ATR_HITPOINTS] > (Ri_Hp + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - Ri_Hp;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};

instance ItWr_Diofant_Paper(C_Item)
{
	name = "Prach Diofantův";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scrl_RezO.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseDiofant_Paper;
	scemeName = "MAP";
	description = "Svitek se zápisky";
	inv_animate = 1;
};


func void UseDiofant_Paper()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"LETTER_REZEPT_OLD.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chceš ty o někom zjistit-li,");
	Doc_PrintLine(nDocID,0,"zdali um jeho bystrý jest,");
	Doc_PrintLine(nDocID,0,"hádanku nech ho rozluštit.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Prach Diofantův");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Diofantos tu spočívá;");
	Doc_PrintLines(nDocID,0,"zhlédni ty kámen náhrobní");
	Doc_PrintLines(nDocID,0,"a ten svým moudrým uměním");
	Doc_PrintLines(nDocID,0,"zesnulého věk odhalí.");
	Doc_PrintLines(nDocID,0,"Dík vůli bohů šestinu");
	Doc_PrintLines(nDocID,0,"bytí svého jak dítě žil,");
	Doc_PrintLines(nDocID,0,"půl šestiny pak prožíval");
	Doc_PrintLines(nDocID,0,"s chomáčem stáří na tvářích.");
	Doc_PrintLines(nDocID,0,"Sedmina další ubyla,");
	Doc_PrintLines(nDocID,0,"než s milou on se oženil;");
	Doc_PrintLines(nDocID,0,"ta po letech svadby pěti");
	Doc_PrintLines(nDocID,0,"syna krásného povila.");
	Doc_PrintLines(nDocID,0,"Jen půli let otce svého");
	Doc_PrintLines(nDocID,0,"chlapeček na světě zůstal,");
	Doc_PrintLines(nDocID,0,"než od svých drahých rodičů");
	Doc_PrintLines(nDocID,0,"odloučen až na věčnost byl.");
	Doc_PrintLines(nDocID,0,"Dva kráte léta dvě ještě");
	Doc_PrintLines(nDocID,0,"Diofantos ho oplakal,");
	Doc_PrintLines(nDocID,0,"než i sám velký učenec");
	Doc_PrintLines(nDocID,0,"za bohy svými se pobral.");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"(Správná odpověď - 84 let.)");
	Doc_PrintLines(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"(* I když původně tady stálo 64. - pozn. překl. *)");
	Doc_PrintLines(nDocID,0,"");
	Doc_Show(nDocID);
};

instance ItWr_LukasLetter(C_Item)
{
	name = NAME_Letter;
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 1;
	visual = "ItWr_Scroll_02_Sky.3DS";
	material = MAT_LEATHER;
	on_state[0] = UseLukasLetter;
	scemeName = "MAP";
	description = "Velikému převorovi";
	text[4] = "Tenhle dopis napsal Luka, Haniarův přisluhovač...";
	inv_animate = 1;
};

func void UseLukasLetter()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"letters.TGA",0);
	Doc_SetFont(nDocID,-1,FONT_Book_Letter);
	Doc_SetMargins(nDocID,-1,50,50,50,50,1);
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Mistře Haniare!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLines(nDocID,0,"Už jistou dobu na váš rozkaz sleduji toho nového murida.");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"Chodí kolem, do všeho se plete a zřejmě si hledá spojence.");
	Doc_PrintLine(nDocID,0,"Tedy na nováčka nedělá nic nezvyklého...");
	Doc_PrintLine(nDocID,0,"Ale přesto se na nás usmálo štěstí. S poslední dodávkou jídla jsme získali také hromadu zbytečností,");
	Doc_PrintLine(nDocID,0,"mezi kterými se nachází kromě jiného i portrét toho murida.");
	Doc_PrintLine(nDocID,0,"Vypadá to, že na něj mají spadeno banditi.");
	Doc_PrintLine(nDocID,0,"Sám velice dobře víte, že v poslední době jsme z venkovního světa nedostali žádné nové posily.");
	Doc_PrintLine(nDocID,0,"To znamená, že ten člověk není asasín, to je prostě vyloučené!");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"");
	Doc_PrintLine(nDocID,0,"			Váš navždy oddaný sluha");
	Doc_PrintLine(nDocID,0,"            Luka");
	Doc_Show(nDocID);
};