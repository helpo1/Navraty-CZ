
func void B_SetNpcVisual(var C_Npc slf,var int gender,var string headMesh,var int faceTex,var int bodyTex,var int armorInstance)
{
	slf.aivar[AIV_Gender] = gender;

	Mdl_SetVisual(slf,"HUMANS.MDS");

	if(gender == MALE)
	{
		Mdl_SetVisualBody(slf,"hum_body_Naked0",bodyTex,0,headMesh,faceTex,0,armorInstance);
	}
	else
	{
		if((bodyTex >= 0) && (bodyTex <= 3))
		{
			bodyTex = bodyTex + 4;
		};

		Mdl_SetVisualBody(slf,"Hum_Body_Babe0",bodyTex,0,headMesh,faceTex,0,armorInstance);
		Mdl_SetModelFatness(slf,0);
	};
};

func void B_SetNpcVisualAml(var C_Npc slf,var int gender,var string headMesh,var int faceTex,var int NomberTex,var int bodyTex,var int armorInstance)
{
	Mdl_SetVisual(slf,"AML.MDS");
	Mdl_SetVisualBody(slf,"AML_Body_Naked0",bodyTex,0,headMesh,faceTex,NomberTex,armorInstance);
};
