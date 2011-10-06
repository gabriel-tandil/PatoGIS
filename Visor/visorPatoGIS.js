/** Initializacion 
 */

if (window.addEventListener)
	/** DOMMouseScroll is for mozilla. */
	window.addEventListener('DOMMouseScroll', wheel, false);
/** IE/Opera. */
window.onmousewheel = document.onmousewheel = wheel;

function procesarCambioCapa(){
	document.elForm.imgxy.value = "300 200"; //seteo valores para que no se mueva el mapa
	document.elForm.zoomdir.value = 0;
	document.elForm.submit();
}

function procesarClick(event){
	pos_x = event.offsetX?(event.offsetX):event.pageX-document.getElementById("pointer_div").offsetLeft;
	pos_y = event.offsetY?(event.offsetY):event.pageY-document.getElementById("pointer_div").offsetTop;
	document.elForm.imgxy.value = pos_x+" "+pos_y;
	document.elForm.zoomdir.value = 0;
	document.elForm.submit();
}

/** Aqui manejo la rueda del mouse en mas alto nivel
 * recibe un delta mayor o menor que cero dependiendo del sentido
 */
function handle(delta) {
	if (delta < 0){
	  document.elForm.zoomdir.value = -1;
	  document.elForm.submit();
	}
	else{
	  document.elForm.zoomdir.value = +1;
	  document.elForm.submit();
	}
}

/** Event handler for mouse wheel event.
 * Este llama a handle con un valor positivo o negativo dependiendo del sentido de giro
 * y me independiza del navedagor
 */
function wheel(event){
	var delta = 0;
	if (!event) /* For IE. */
		event = window.event;
	if (event.wheelDelta) { /* IE/Opera. */
		delta = event.wheelDelta/120;
		/** In Opera 9, delta differs in sign as compared to IE.
		 */
		if (window.opera)
			delta = -delta;
	} else if (event.detail) { /** Mozilla case. */
		/** In Mozilla, sign of delta is different than in IE.
		 * Also, delta is multiple of 3.
		 */
		delta = -event.detail/3;
	}
	pos_x = event.offsetX?(event.offsetX):event.pageX-document.getElementById("pointer_div").offsetLeft;
	pos_y = event.offsetY?(event.offsetY):event.pageY-document.getElementById("pointer_div").offsetTop;
	if (pos_x>600 || pos_y>400 || pos_x<0 || pos_y<0)
	  return; // si estoy fuera de la imagen me voy sin hacer nada
	document.elForm.imgxy.value = pos_x+" "+pos_y;
	/** If delta is nonzero, handle it.
	 * Basically, delta is now positive if wheel was scrolled up,
	 * and negative, if wheel was scrolled down.
	 */
	if (delta)
		handle(delta);
	/** Prevent default actions caused by mouse wheel.
	 * That might be ugly, but we handle scrolls somehow
	 * anyway, so don't bother here..
	 */
	if (event.preventDefault)
		event.preventDefault();
	event.returnValue = false;
}


