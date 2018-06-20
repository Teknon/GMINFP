vsp = vsp + grv;


//Kollisionscheck horizontal
if (place_meeting(x+hsp,y,obj_Wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_Wall))	//sign gibt 1 oder -1 aus; Check für wenn man sich Wand nähert
	{
		x = x + sign (hsp);
	}
	hsp = -hsp;
}

x = x + hsp;

//Kollisionscheck vertikal
if (place_meeting(x,y+vsp,obj_Wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_Wall))
	{
		y = y + sign (vsp);
	}
	vsp = 0;
}

y = y + vsp;

