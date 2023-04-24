package info.bean;

public class infoBean {
	private String name;
	private String id;

	public String getGender() {
		String gender = "";
		char sexNum = id.charAt(7);
		if(sexNum == '1' | sexNum == '3') gender = "남자";
		else gender = "여자";
		return gender;
	}
	
	//setter getter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	
	//constructor
	public infoBean() {}
	public infoBean(String name, String id) {
		super();
		this.name = name;
		this.id = id;
	}
	
	
}
