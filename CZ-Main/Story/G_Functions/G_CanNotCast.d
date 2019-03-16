
func void G_CanNotCast(var int bIsPlayer,var int nCircleNeeded,var int nCirclePossessed)
{
	var string strMessage;
	var int nDifference;
	var string strDifference;

	strDifference = IntToString(nCircleNeeded);
	strMessage = ConcatStrings("Potřebuješ ",strDifference);
	strMessage = ConcatStrings(strMessage,PRINT_MAGCIRCLES_MISSING);

	if(bIsPlayer)
	{
		AI_Print(strMessage);
		//B_Say(self,self,"$IMPOSSIBLEFORME");
	};
};


func void MY_G_STRAFE()
{
	B_Say(self,self,"$IMPOSSIBLEFORME");
};




