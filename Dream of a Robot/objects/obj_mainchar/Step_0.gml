get_controls();

#region Mov. Horizontal (X Mov)
moveDir = rightKey - leftKey;

xspd = moveDir * moveSpd;

#region Colisão
var _subPixel = .5;
if place_meeting(x + xspd, y, obj_wall)
{
	//Slope
	if !place_meeting(x + xspd, y - abs(xspd)-1, obj_wall)
	{
		while place_meeting(x + xspd, y, obj_wall) 
			{ y -= _subPixel };
	}
	else 
	{
		//slope de teto
		if !place_meeting(x + xspd, y+abs(xspd)+1, obj_wall)
		{
			while place_meeting(x + xspd, y, obj_wall)
				{y += _subPixel}
		}
		else
		{
			var _pixelCheck = _subPixel * sign(xspd);
			while !place_meeting(x + _pixelCheck, y, obj_wall) { x += _pixelCheck; }
		}
	
	xspd = 0;
	}
}
#endregion 

if yspd >= 0 && !place_meeting(x + xspd, y+1, obj_wall) && place_meeting(x + xspd, y+abs(xspd)+1, obj_wall)
{
	while !place_meeting(x + xspd, y + _subPixel, obj_wall) 
		{y += _subPixel };
}

x += xspd;

#endregion

#region Mov. Vertical (Y Mov)
#region Coyote Time
if coyoteHangTimer > 0
{
	coyoteHangTimer--;
} else {
	yspd += grav;
	set_on_ground(false);
}


if yspd > termVel {yspd = termVel};

if onGround 
{
	jumpCount = 0;
	jumpHoldTimer = 0;
	
	coyoteJumpTimer = coyoteJumpFrames
} else {
	coyoteJumpTimer--;
	if jumpCount == 0 && coyoteJumpTimer <= 0 {jumpCount = 1};
}
#endregion

#region Jump buffering
if jumpKeyBuff && jumpCount < jumpMax
{
	jumpKeyBuff  = false;
	jumpKeyBuffTimer = 0;
	
	jumpCount++;
	
	jumpHoldTimer = jumpHoldFrames[jumpCount-1];
	set_on_ground(false);
	coyoteJumpTimer = 0;
}
if !jumpKey
{
	jumpHoldTimer = 0;  
}

if jumpHoldTimer > 0
{
	yspd = jspd[jumpCount-1];
	jumpHoldTimer--;
}
#endregion

#region Colisões
if place_meeting(x, y + yspd, obj_wall)
{
	var _pixelCheck = _subPixel * sign(yspd);
	while !place_meeting(x, y + _pixelCheck, obj_wall)
	{
		y += _pixelCheck;
	}
	
	//bonk
	if yspd < 0 { jumpHoldTimer = 0;}
	
	yspd = 0;
}

if yspd >= 0  && place_meeting(x, y+1, obj_wall)
{
	set_on_ground(true);
} 

y += yspd;
#endregion

#endregion