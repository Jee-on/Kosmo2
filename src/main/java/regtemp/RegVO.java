package regtemp;

public class RegVO {


	private String id;
	private String password;
	private String name;
	private int tel;
	private String addr;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public RegVO() {}
	public RegVO(String id, String password, String name, int tel, String addr) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.tel = tel;
		this.addr = addr;
	}

}
