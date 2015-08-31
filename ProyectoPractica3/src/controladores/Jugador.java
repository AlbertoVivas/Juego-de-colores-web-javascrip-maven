/**
 * 
 */
package controladores;

/**
 * @author Alberto Vivas
 *
 * 
 */
public class Jugador {
	private String nombre;
	private String tiempo;
	private String fecha;
	public Jugador(String nombre, String tiempo, String fecha) {
		super();
		this.nombre = nombre;
		this.tiempo = tiempo;
		this.fecha = fecha;
	}
	public Jugador() {
		super();
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getTiempo() {
		return tiempo;
	}
	public void setTiempo(String tiempo) {
		this.tiempo = tiempo;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	
}
