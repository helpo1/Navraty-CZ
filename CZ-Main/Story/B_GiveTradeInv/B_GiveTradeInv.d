/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

ItMi_ParlanRelic_MIS - zamezeno nesplnitelnosti úkolu

*/




func void B_GiveTradeInv(var C_Npc slf)
{
	var C_Npc Trd_Cronos_NW;
	var C_Npc Trd_Cronos_ADW;
	var C_Npc Trd_Martin;
	var C_Npc Trd_Garett;
	var C_Npc Trd_Fisk;
	var C_Npc Trd_Huno;
	var C_Npc Trd_Erol;
	var C_Npc Trd_Juan;
	var C_Npc Trd_Lucia;
	var C_Npc Trd_Samuel;
	var C_Npc Trd_Miguel;
	var C_Npc Trd_Scatty;
	var C_Npc Trd_Engor;
	var C_Npc Trd_Matteo;
	var C_Npc Trd_Halvor;
	var C_Npc Trd_Bosper;
	var C_Npc Trd_Harad;
	var C_Npc Trd_Brian;
	var C_Npc Trd_Brahim;
	var C_Npc Trd_Constantino;
	var C_Npc Trd_Kardif;
	var C_Npc Trd_Zuris;
	var C_Npc Trd_Baltram;
	var C_Npc Trd_Canthar;
	var C_Npc Trd_Sarah;
	var C_Npc Trd_Jora;
	var C_Npc Trd_Hakon;
	var C_Npc Trd_Coragon;
	var C_Npc Trd_Gorax;
	var C_Npc Trd_Orlan;
	var C_Npc Trd_Bennet;
	var C_Npc Trd_Bennet_DI;
	var C_Npc Trd_Elena;
	var C_Npc Trd_Sagitta;
	var C_Npc Trd_Kjorn;
	var C_Npc Trd_Rethon;
	var C_Npc Trd_Rosi;
	var C_Npc Trd_Ignaz;
	var C_Npc Trd_Milten_DI;
	var C_Npc Trd_Vatras_DI;
	var C_Npc Trd_Diego_DI;
	var C_Npc Trd_Tandor;
	var C_Npc Trd_Sengrath;
	var C_Npc Trd_Isgaroth;
	var C_Npc Trd_Fenia;
	var C_Npc Trd_Khaled;
	var C_Npc Trd_Karras;
	var C_Npc Trd_Salandril;
	var C_Npc Trd_Gaertner;
	var C_Npc Trd_Lutero;
	var C_Npc trd_isidro;
	var C_Npc trd_darrion;
	var C_Npc trd_hasan;
	var C_Npc trd_xardas;
	var C_Npc trd_baaltyon;
	var C_Npc trd_joru;
	var C_Npc trd_talas;
	var C_Npc trd_taliasan;
	var C_Npc trd_valeran;
	var C_Npc trd_nigel;
	var C_Npc trd_raffa;
	var C_Npc trd_gornakosh;
	var C_Npc Trd_Farim;
	var C_Npc Trd_Lehmar;
	var C_Npc Trd_Rupert;
	var C_Npc Trd_Cipher;
	var C_Npc Trd_Sengrat;
	var C_Npc Trd_Mortis;
	var C_Npc Trd_Ramirez;
	var C_Npc Trd_Thorben;
	var C_Npc trd_Fregeal;
	var C_Npc trd_NetBek;
	var C_Npc Trd_Assasin;
	var C_Npc Trd_Rengaru;
	var C_Npc Trd_Neoras;
	var C_Npc Trd_Holger;
	var C_Npc Trd_Igaraz;

	var C_Item weaphear;
	var int valuehear;
	var int valuedistant;
	var int valueweaponmelee;
	var int valueweaponranged;
	var int valuesubject;

	Trd_Igaraz = Hlp_GetNpc(NOV_601_Igaraz);
	Trd_Holger = Hlp_GetNpc(nov_11114_holger);
	Trd_Neoras = Hlp_GetNpc(KDF_506_Neoras);
	Trd_Rengaru = Hlp_GetNpc(VLK_492_Rengaru);
	Trd_Assasin = Hlp_GetNpc(Ass_183_Adept);
	Trd_NetBek = Hlp_GetNpc(xbs_7507_netbek);
	Trd_Thorben = Hlp_GetNpc(VLK_462_Thorben);
	Trd_Mortis = Hlp_GetNpc(Mil_314_Mortis);
	Trd_Ramirez = Hlp_GetNpc(VLK_445_Ramirez);
	Trd_Rupert = Hlp_GetNpc(VLK_458_Rupert);
	Trd_Cipher = Hlp_GetNpc(Sld_803_Cipher);
	Trd_Sengrat = Hlp_GetNpc(PAL_267_Sengrath);
	Trd_Lehmar = Hlp_GetNpc(VLK_484_Lehmar);
	trd_taliasan = Hlp_GetNpc(vlk_6027_taliasan);
	trd_valeran = Hlp_GetNpc(vlk_6134_valeran);
	trd_nigel = Hlp_GetNpc(vlk_6110_nigel);
	trd_baaltyon = Hlp_GetNpc(gur_8003_tyon);
	Trd_Cronos_NW = Hlp_GetNpc(KDW_1401_Addon_Cronos_NW);
	Trd_Cronos_ADW = Hlp_GetNpc(KDW_14010_Addon_Cronos_ADW);
	Trd_Martin = Hlp_GetNpc(Mil_350_Addon_Martin);
	Trd_Garett = Hlp_GetNpc(PIR_1357_Addon_Garett);
	Trd_Huno = Hlp_GetNpc(BDT_1099_Addon_Huno);
	Trd_Erol = Hlp_GetNpc(VLK_4303_Addon_Erol);
	Trd_Juan = Hlp_GetNpc(BDT_10017_Addon_Juan);
	Trd_Lucia = Hlp_GetNpc(BDT_1091_Addon_Lucia);
	Trd_Samuel = Hlp_GetNpc(PIR_1351_Addon_Samuel);
	trd_talas = Hlp_GetNpc(sek_8012_talas);

	if(Kapitel < 5)
	{
		Trd_Miguel = Hlp_GetNpc(BDT_10022_Addon_Miguel);
	}
	else
	{
		Trd_Miguel = Hlp_GetNpc(vlk_6026_miguel);
	};
	if(Kapitel < 5)
	{
		Trd_Fisk = Hlp_GetNpc(BDT_1097_Addon_Fisk);
	}
	else
	{
		Trd_Fisk = Hlp_GetNpc(vlk_6021_fisk);
	};

	Trd_Farim = Hlp_GetNpc(VLK_4301_Addon_Farim);
	Trd_Scatty = Hlp_GetNpc(BDT_1086_Addon_Scatty);
	Trd_Engor = Hlp_GetNpc(VLK_4108_Engor);
	Trd_Matteo = Hlp_GetNpc(VLK_416_Matteo);
	Trd_Halvor = Hlp_GetNpc(VLK_469_Halvor);
	Trd_Bosper = Hlp_GetNpc(VLK_413_Bosper);
	Trd_Harad = Hlp_GetNpc(VLK_412_Harad);
	Trd_Brian = Hlp_GetNpc(VLK_457_Brian);
	Trd_Brahim = Hlp_GetNpc(VLK_437_Brahim);
	Trd_Constantino = Hlp_GetNpc(VLK_417_Constantino);
	Trd_Kardif = Hlp_GetNpc(VLK_431_Kardif);
	Trd_Zuris = Hlp_GetNpc(VLK_409_Zuris);
	Trd_Baltram = Hlp_GetNpc(VLK_410_Baltram);
	Trd_Canthar = Hlp_GetNpc(VLK_468_Canthar);
	Trd_Sarah = Hlp_GetNpc(VLK_470_Sarah);
	Trd_Jora = Hlp_GetNpc(VLK_408_Jora);
	Trd_Hakon = Hlp_GetNpc(VLK_407_Hakon);
	Trd_Coragon = Hlp_GetNpc(VLK_420_Coragon);
	Trd_Gorax = Hlp_GetNpc(KDF_508_Gorax);
	Trd_Orlan = Hlp_GetNpc(BAU_970_Orlan);
	Trd_Bennet = Hlp_GetNpc(SLD_809_Bennet);
	Trd_Bennet_DI = Hlp_GetNpc(SLD_809_Bennet_DI);
	Trd_Elena = Hlp_GetNpc(BAU_911_Elena);
	Trd_Sagitta = Hlp_GetNpc(BAU_980_Sagitta);
	Trd_Kjorn = Hlp_GetNpc(DJG_710_Kjorn);
	Trd_Rethon = Hlp_GetNpc(DJG_709_Rethon);
	Trd_Rosi = Hlp_GetNpc(BAU_936_Rosi);
	Trd_Ignaz = Hlp_GetNpc(VLK_498_Ignaz);
	Trd_Milten_DI = Hlp_GetNpc(PC_Mage_DI);
	Trd_Vatras_DI = Hlp_GetNpc(VLK_439_Vatras_DI);
	Trd_Diego_DI = Hlp_GetNpc(PC_Thief_DI);
	Trd_Tandor = Hlp_GetNpc(PAL_260_Tandor);
	Trd_Sengrath = Hlp_GetNpc(PAL_267_Sengrath);
	Trd_Isgaroth = Hlp_GetNpc(KDF_509_Isgaroth);
	Trd_Fenia = Hlp_GetNpc(VLK_476_Fenia);
	Trd_Khaled = Hlp_GetNpc(SLD_823_Khaled);
	Trd_Karras = Hlp_GetNpc(KDF_503_Karras);
	Trd_Salandril = Hlp_GetNpc(VLK_422_Salandril);
	Trd_Gaertner = Hlp_GetNpc(VLK_411_Gaertner);
	Trd_Lutero = Hlp_GetNpc(VLK_404_Lutero);
	trd_isidro = Hlp_GetNpc(xbs_7501_camper);
	trd_darrion = Hlp_GetNpc(xbs_7513_darrion);
	trd_hasan = Hlp_GetNpc(vlk_6009_hasan);
	trd_joru = Hlp_GetNpc(sek_8013_joru);
	trd_raffa = Hlp_GetNpc(hun_745_raffa);
	trd_gornakosh = Hlp_GetNpc(tpl_8005_gornakosh);
	trd_Fregeal = Hlp_GetNpc(NONE_1192_Fregeal);

	if(Kapitel < 5)
	{
		trd_xardas = Hlp_GetNpc(NONE_100_Xardas);
	}
	else
	{
		trd_xardas = Hlp_GetNpc(none_102_kreol);
	};

	B_ClearRuneInv(slf);

	if(slf.guild <= GIL_SEPERATOR_HUM)
	{
		B_ClearJunkTradeInvOrc(slf);
	};
	if(Npc_HasItems(slf,ItSl_GoldPocket_None) > 0)
	{
		Npc_RemoveInvItems(slf,ItSl_GoldPocket_None,Npc_HasItems(slf,ItSl_GoldPocket_None));
	};
	if(Npc_HasItems(slf,ItSl_GoldPocket_Low) > 0)
	{
		Npc_RemoveInvItems(slf,ItSl_GoldPocket_Low,Npc_HasItems(slf,ItSl_GoldPocket_Low));
	};
	if(Npc_HasItems(slf,ItSl_GoldPocket_Medium) > 0)
	{
		Npc_RemoveInvItems(slf,ItSl_GoldPocket_Medium,Npc_HasItems(slf,ItSl_GoldPocket_Medium));
	};
	if(Npc_HasItems(slf,ItSl_GoldPocket_Full) > 0)
	{
		Npc_RemoveInvItems(slf,ItSl_GoldPocket_Full,Npc_HasItems(slf,ItSl_GoldPocket_Full));
	};
	if(slf.guild <= GIL_SEPERATOR_HUM)
	{
		if(Npc_HasItems(slf,ItFoMuttonRaw) > 0)
		{
			Npc_RemoveInvItems(slf,ItFoMuttonRaw,Npc_HasItems(slf,ItFoMuttonRaw));
		};
	};
	if(slf.aivar[AIV_ChapterInv] <= Kapitel)
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Igaraz))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_igaraz(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Holger))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_holger(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Neoras))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_neoras(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Rengaru))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_rengaru(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Assasin))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_Assasin(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_NetBek))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_NetBek(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Fregeal))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_Fregeal(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Thorben))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_Thorben(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Mortis))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_Mortis(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Ramirez))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_Ramirez(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Farim))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_farim(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Lehmar))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_Lehmar(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_gornakosh))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_gornakosh(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_taliasan))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_taliasan(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_raffa))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_raffa(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_valeran))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_valeran(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_nigel))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_nigel(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_talas))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_talas(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_baaltyon))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_baaltyon(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_joru))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_joru(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_xardas))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_xardas(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Cronos_NW))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Addon_Cronos_NW(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Cronos_ADW))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Addon_Cronos_ADW(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Martin))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Addon_Martin(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Garett))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Addon_Garett(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Fisk))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Addon_Fisk(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Huno))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Addon_Huno(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Erol))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Addon_Erol(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Juan))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Addon_Juan(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Lucia))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Addon_Lucia(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Samuel))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Addon_Samuel(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Scatty))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Addon_Scatty(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Miguel))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Addon_Miguel(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Engor))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Engor(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Matteo))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Matteo(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Halvor))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Halvor(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Bosper))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Bosper(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Harad))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Harad(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Brian))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Brian(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Brahim))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Brahim(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Constantino))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Constantino(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Kardif))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Kardif(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Zuris))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Zuris(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Baltram))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Baltram(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Canthar))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Canthar(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Sarah))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Sarah(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Jora))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Jora(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Hakon))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Hakon(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Coragon))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Coragon(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Gorax))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Gorax(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Orlan))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Orlan(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Bennet))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Bennet(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Bennet_DI))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Bennet_DI(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Elena))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Elena(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Sagitta))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Sagitta(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Kjorn))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Kjorn(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Rethon))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Rethon(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Rosi))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Rosi(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Ignaz))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Ignaz(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Milten_DI))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Milten_DI(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Vatras_DI))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Vatras_DI(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Diego_DI))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Diego_DI(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Tandor))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Tandor(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Sengrath))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Sengrath(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Isgaroth))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Isgaroth(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Fenia))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Fenia(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Khaled))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Khaled(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Karras))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Karras(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Salandril))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Salandril(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Gaertner))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Gaertner(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Lutero))
		{
			B_ClearJunkTradeInv(slf);
			B_GiveTradeInv_Lutero(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(gornabar))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_gornabar(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_isidro))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_isidro(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_darrion))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_darrion(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_hasan))
		{
			B_ClearJunkTradeInv(slf);
			b_givetradeinv_hasan(slf);
		};

		slf.aivar[AIV_ChapterInv] = Kapitel + 1;
	};
	if(Npc_IsInState(slf,ZS_Dead) || Npc_IsInState(slf,ZS_Unconscious))
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_GorNaKosh))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Igaraz))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Holger))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Neoras))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Rengaru))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Assasin))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Fregeal))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_NetBek))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Juan))
		{
			B_ClearDeadTrader_Juan(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Thorben))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Mortis))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Ramirez))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Farim))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Lehmar))
		{
			if((Lehmar_ItemsGiven_Chapter_1 == FALSE) || (Npc_HasItems(self,ItMi_ParlanRelic_MIS) >= 1))
			{
				B_ClearDeadTrader(slf);
				CreateInvItems(slf,ItMi_ParlanRelic_MIS,1);
			}
			else
			{
				B_ClearDeadTrader(slf);
			};
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Rupert))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Cipher))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Sengrat))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_taliasan))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_raffa))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_valeran))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_nigel))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_talas))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_baaltyon))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_joru))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_xardas))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Cronos_NW))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Cronos_ADW))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Martin))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Garett))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Fisk))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Huno))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Erol))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Lucia))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Samuel))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Miguel))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Scatty))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Engor))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Matteo))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Halvor))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Bosper))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Harad))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Brian))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Brahim))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Constantino))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Kardif))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Zuris))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Baltram))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Canthar))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Sarah))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Jora))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Hakon))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Coragon))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Gorax))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Orlan))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Bennet))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Bennet_DI))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Elena))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Sagitta))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Kjorn))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Rethon))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Rosi))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Ignaz))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Milten_DI))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Vatras_DI))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Diego_DI))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Tandor))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Sengrath))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Isgaroth))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Fenia))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Khaled))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Karras))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Salandril))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Gaertner))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Lutero))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(gornabar))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_isidro))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_darrion))
		{
			B_ClearDeadTrader(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_hasan))
		{
			B_ClearDeadTrader(slf);
		};
	};
	if(Npc_HasEquippedRangedWeapon(slf))
	{
		weaphear = Npc_GetEquippedRangedWeapon(slf);
		valueweaponranged = Hlp_GetInstanceID(weaphear);

		if((valueweaponranged == Hlp_GetInstanceID(itrw_addon_magiccrossbow_shv)) || (valueweaponranged == Hlp_GetInstanceID(itrw_holybow)) || (valueweaponranged == Hlp_GetInstanceID(itrw_shadowbow)))
		{
			Npc_RemoveInvItems(slf,valueweaponranged,1);
		};
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_raffa)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_valeran)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_joru)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Martin)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Garett)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Fisk)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Huno)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Erol)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Engor)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Bosper)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Canthar)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Sarah)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Jora)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Hakon)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Tandor)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_darrion)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Khaled)))
	{
		if(Npc_HasEquippedWeapon(slf))
		{
			if(Npc_HasEquippedMeleeWeapon(slf))
			{
				weaphear = Npc_GetEquippedMeleeWeapon(slf);
				valueweaponmelee = Hlp_GetInstanceID(weaphear);
				valuehear = TRUE;
			};
			if(Npc_HasEquippedRangedWeapon(slf))
			{
				weaphear = Npc_GetEquippedRangedWeapon(slf);
				valueweaponranged = Hlp_GetInstanceID(weaphear);
				valuedistant = TRUE;
			};
			if(valuehear == TRUE)
			{
				valuesubject = Npc_HasItems(slf,valueweaponmelee);
				if(valuesubject > 1)
				{
					Npc_RemoveInvItems(slf,valueweaponmelee,valuesubject);
					CreateInvItems(slf,valueweaponmelee,valuesubject - 1);
				}
				else
				{
					Npc_RemoveInvItems(slf,valueweaponmelee,valuesubject);
					CreateInvItems(slf,valueweaponmelee,valuesubject);
				};
				valuehear = FALSE;
			};
			if(valuedistant == TRUE)
			{
				valuesubject = Npc_HasItems(slf,valueweaponranged);
				if(valuesubject > 1)
				{
					Npc_RemoveInvItems(slf,valueweaponranged,valuesubject);
					CreateInvItems(slf,valueweaponranged,valuesubject - 1);
				}
				else
				{
					Npc_RemoveInvItems(slf,valueweaponranged,valuesubject);
					CreateInvItems(slf,valueweaponranged,valuesubject);
				};
				valuedistant = FALSE;
			};
		};
	};
	if(MASTERTRADEGUILD == TRUE)
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Matteo))
		{
			b_givetradeinv_matteo_guild(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_nigel))
		{
			b_givetradeinv_nigel_guild(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Erol))
		{
			b_givetradeinv_addon_erol_guild(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Sarah))
		{
			b_givetradeinv_sarah_guild(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Jora))
		{
			b_givetradeinv_jora_guild(slf);
		};
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Trd_Salandril))
		{
			b_givetradeinv_salandril_guild(slf);
		};
	};
};