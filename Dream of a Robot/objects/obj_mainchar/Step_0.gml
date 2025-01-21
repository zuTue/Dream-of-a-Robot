get_controls();

#region Mov. Horizontal (X Mov)
moveDir = rightKey - leftKey;

xspd = moveDir * moveSpd;

var _subPixel = .5;
if place_meeting(x + xspd, y, obj_wall)
{
	var _pixelCheck = _subPixel * sign(xspd);
	while !place_meeting(x + _pixelCheck, y, obj_wall)
	{
		x += _pixelCheck;
	}
	
	xspd = 0;
}

x += xspd;

#endregion

#region Mov. Vertical (Y Mov)
yspd += grav;

if yspd > termVel {yspd = termVel};

if onGround 
{
	jumpCount = 0;
	jumpHoldTimer = 0;
} else {
	if jumpCount == 0
	{
		jumpCount = 1
	}
}

if jumpKeyBuff && jumpCount < jumpMax
{
	jumpKeyBuff  = false;
	jumpKeyBuffTimer = 0;
	
	jumpCount++;
	
	jumpHoldTimer = jumpHoldFrames[jumpCount-1];
}
if !jumpKey
{
	jumpHoldTimer = 0;  
}

if jumpHoldTimer > 0
{
	yspd = jspd;
	jumpHoldTimer--;
}

if place_meeting(x, y + yspd, obj_wall)
{
	var _pixelCheck = _subPixel * sign(yspd);
	while !place_meeting(x, y + _pixelCheck, obj_wall)
	{
		y += _pixelCheck;
	}
	
	if yspd < 0 
	{
		jumpHoldTimer = 0;
	}
	
	yspd = 0;
}

if yspd >= 0  && place_meeting(x, y+1, obj_wall)
{
	onGround = true;
} else 
{
	onGround = false;
	
}

y += yspd;

#endregion