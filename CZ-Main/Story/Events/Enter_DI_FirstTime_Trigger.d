
var int EnterDI_Kapitel6;

func void enter_di_firsttime_trigger()
{
	if(Npc_HasItems(hero,ItKe_Ship_Levelchange_MIS))
	{
		Npc_RemoveInvItems(hero,ItKe_Ship_Levelchange_MIS,1);
	};
	if(hero.attribute[ATR_DEXTERITY] < 95)
	{
		Wld_InsertItem(ItPo_Perm_DEX,"FP_ITEM_DI_ENTER_05");
	};
	if(EnterDI_Kapitel6 == FALSE)
	{
		if(hero.guild == GIL_PAL)
		{
			CreateInvItems(Archol,ItRu_PalDestroyEvil,1);
		};

		Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_12");
		Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_06");
		Log_CreateTopic(TOPIC_MyCrew,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MyCrew,LOG_Running);

		if(JorgenIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Kapitán Jorgen zůstane na lodi, dokud se nevrátím.");
		};
		if(TorlofIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Kapitán Torlof zůstane na lodi a bude ji hlídat po celou dobu, co budu na ostrově. Mohu za ním zajít, pokud si budu chtít zvýšit obratnost či sílu.");
		};
		if(JackIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew,"Kapitán Jack zůstane tady na lodi, dokud se nevrátím. Je sice trochu vyděšený, ale doufám, že se časem uklidní. Potřebuji ho.");
		};
		if(Lee_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Lee po dobu mé nepřítomnosti dohlédne na loď. Také se u něj mohu zastavit, budu-li si chtít vylepšit dovednosti boje s jedno- a obouručními zbraněmi.");
		};
		if(MiltenNW_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"S Miltenovou pomocí si mohu zvýšit své zásoby many.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"Kromě toho mě Milten může také naučit, jak vytvářet runy.");
			};
		};
		if(Lester_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Mám pocit, že na tomhle podivném ostrově se Lesterův stav ještě zhoršil.");
		};
		if(Mario_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Mario se chová velmi podivně. Po celou dobu plavby jen sedí na zádi a od vyplutí nepromluvil jediné slovo.");
		};
		if(Wolf_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Wolf mě může naučit střílet z luku či kuše.");
		};
		if(Vatras_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Vatras se uchýlil do kajuty pro mágy. Může mě vyléčit a prozradit mi spoustu věcí ohledně přípravy lektvarů.");
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew,"Vatras mi také může pomoci s postupem do dalšího kruhu magie.");
			};
		};
		if(Bennet_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Bennet mě naučí kovařině, když ho o to požádám.");
		};
		if(Diego_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Když nebudu vědět, kudy kam, mohu se obrátit na Diega, který mě navíc zásobí střelivem. Také mě naučí páčit zámky a střílet z luku či kuše.");
		};
		if(Gorn_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Gorn během našeho výletu nezahálel a teď na loď dohlédne. Myslím, že když mu ji svěřím, bude v dobrých rukou.");
			Log_AddEntry(TOPIC_MyCrew,"Gorn mě může zasvětit do tajů boje s obouručními zbraněmi.");
		};
		if(Lares_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Lares slíbil, že mě naučí plížení a jednoručnímu boji. Kromě toho může zvýšit moji obratnost.");
		};
		if(Biff_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Biff je tak hamižný, až to bolí. Nebude snadné na něj dohlížet.");
		};
		if(Angar_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Angar vypadá velmi neklidně. Mám pocit, že brzy bude bojovat sám s sebou.");
		};
		if(Girion_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew,"Girion se, jako vždy, drží stranou a zůstává klidný, jeho trpělivost je opravdu obdivuhodná. A přitom je to bojový cvičitel. To se mi může hodit.");
		};

		EnterDI_Kapitel6 = TRUE;
		IntroduceCH_06 = TRUE;
	};
};

