package vo;

public class MemberVO {
	
	private int idx, coldhot;
	private String id, pwd, nickname, email, birth_year, birth_month, birth_day, sido, gugun, gender, ip, regdate;
	private String nx, ny;
	// => 원래 nx, ny를 나중에 가져오려고 했는데 강사님께 어쭈어보니 MemberVO에 저장해서 사용하는 것이 낮다고 하심
	// => 그래서 회원가입하고 MembeDB가서 저장하기 전에 gugun을 먼저 LocationDB에 parameter로 보내서 경도 위도를 받아올 예정
	// => 그리고 가져온 경도 위도를 MemberDB에 같이 저장하고 나중에 scoping 했을때 편하게 사용할 예정
	public String getNx() {
		return nx;
	}
	public void setNx(String nx) {
		this.nx = nx;
	}
	public String getNy() {
		return ny;
	}
	public void setNy(String ny) {
		this.ny = ny;
	}
	public String getBirth_year() {
		return birth_year;
	}
	public void setBirth_year(String birth_year) {
		this.birth_year = birth_year;
	}
	public String getBirth_month() {
		return birth_month;
	}
	public void setBirth_month(String birth_month) {
		this.birth_month = birth_month;
	}
	public String getBirth_day() {
		return birth_day;
	}
	public void setBirth_day(String birth_day) {
		this.birth_day = birth_day;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getColdhot() {
		return coldhot;
	}
	public void setColdhot(int coldhot) {
		this.coldhot = coldhot;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
		
}
