
function controls_setup()
{
	bufferTimer = 4;
	
	jumpKeyBuff = 0;
	jumpKeyBuffTimer = 0;
}

function get_controls() 
{
	//Imput de direção
	rightKey  = input_check("right");
	leftKey   = input_check("left");
	
	//Inputs de Ação
	jumpPress = input_check_pressed("jump")
	jumpKey   = input_check("jump")
	
	//Buffering
	if jumpPress
	{
		jumpKeyBuffTimer = bufferTimer
	}
	if jumpKeyBuffTimer > 0 
	{
		jumpKeyBuff = 1;
		jumpKeyBuffTimer--;
	} 
	
	else 
	{ 
		jumpKeyBuff = 0;
	}

}

