package controladores;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
 
@Controller
public class MiController {
 
	@RequestMapping("/welcome")
	public String bienvenido() {
		System.out.println("pase por el controlador");
		return "html/juego";
	}
	@RequestMapping("/resultados")
	public String resul(@RequestParam(value="nombre", required=false, defaultValue="Player") String nombre, Model model) {
        model.addAttribute("nombre", nombre);
        return "html/resultado";
    }
	@RequestMapping("/final")
	public String fin(@RequestParam(value="tiempo", required=false, defaultValue="9999") String tiempo, Model model){
		model.addAttribute("tiempo", tiempo);
		return "html/final";
	}
	@RequestMapping(path="/registro", produces="application/json")
	@ResponseBody
	public ResponseEntity<Tiempo> regTiempo(@RequestParam (value="tiempo", required=false,defaultValue="9999") String tiempo ){
		System.out.println("Ha terminado el juego, tiempo: "+tiempo);
		Tiempo t = null;
		t = new Tiempo(tiempo);
		return new ResponseEntity<Tiempo>(t,HttpStatus.OK);
	}
	
	@RequestMapping(path="/registroj", produces="application/json")
	@ResponseBody
	public ResponseEntity<Jugador> regJugador(@RequestParam (value="tiempo", required=false,defaultValue="9999") String tiempo, @RequestParam (value="nombre", required=false,defaultValue="player") String nombre, @RequestParam(value="fecha", required=false,defaultValue="9999") String fecha ){
		System.out.println("Ha terminado el juego, tiempo: "+tiempo+" nombre: "+nombre+" fecha: "+fecha);
		Jugador j = null;
		j = new Jugador(nombre, tiempo, fecha);
		return new ResponseEntity<Jugador>(j,HttpStatus.OK);
	}
	@RequestMapping("/finalj")
	public String finj(@RequestParam(value="tiempo", required=false, defaultValue="9999") String tiempo, @RequestParam(value="nombre", required=false,defaultValue="player") String nombre, @RequestParam(value="fecha", required=false,defaultValue="9999") String fecha, Model model){
		model.addAttribute("tiempo", tiempo);
		model.addAttribute("nombre",nombre);
		model.addAttribute("fecha",fecha);
		return "html/final";
	}
}