package controladores;
/**
 * 
 */

/**
 * @author Alberto Vivas
 *
 * 
 */
public class Player {

	
	private String name;
	private Long time;
	public Player(String name, Long time) {
		super();
		this.name = name;
		this.time = time;
	}
	public Player() {
		super();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getTime() {
		return time;
	}
	public void setTime(Long time) {
		this.time = time;
	}
	
}
