controls_setup()

//Movimento
moveDir  = 0; 
moveSpd = 2;
xspd = 0;
yspd = 0;

//Pular
grav = 0.25;
termVel = 4.25;
onGround = true;

jumpMax = 1;
jumpCount = 0;
jumpHoldTimer = 0;

jumpHoldFrames[0] = 16;
jspd[0] = -3.15;
jumpHoldFrames[1] = 10;
jspd[0] = -2;

	//Coyote Time
	/*Hang time 
	(Hang no caso é tipo o desenho msm, ficar andando no ar sem gravidade tomar efeito por uns frames)*/
	coyoteHangFrames = 2;
	coyoteHangTimer = 0;
	
	//Buffer pro pulo
	coyoteJumpFrames = 5;
	coyoteJumpTimer = 0;