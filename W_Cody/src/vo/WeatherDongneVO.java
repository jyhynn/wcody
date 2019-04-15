package vo;

public class WeatherDongneVO {
	// 동네 예보 코드 값 정보
	//response - category(fcstValue): 응답메시지의 자료구분 문자(각 자료들의 예보값) (총 14개)
	Object pop; // 강수확률(%)
	Object pty; // 강수형태(code)
	Object r06; // 6시간 강수량(mm)
	Object reh; // 습도(%)
	Object s06; // 6시간 신적설(mm)
	Object sky; // 하늘 상태(code)
	Object t3h; // 3시간 기온(C) -> 이걸로 옷추천해야 할듯
	Object tmn; // 아침 최고 기온 (C)
	Object tmx; // 낮 최고 기온(C)
	Object uuu; // (동서)풍속(m/s)
	Object vvv; // (남북)풍속(m/s)
	Object vec; // 풍향(m/s)
	Object wsd; // 풍속(1)
	public Object getPop() {
		return pop;
	}
	public void setPop(Object pop) {
		this.pop = pop;
	}
	public Object getPty() {
		return pty;
	}
	public void setPty(Object pty) {
		this.pty = pty;
	}
	public Object getR06() {
		return r06;
	}
	public void setR06(Object r06) {
		this.r06 = r06;
	}
	public Object getReh() {
		return reh;
	}
	public void setReh(Object reh) {
		this.reh = reh;
	}
	public Object getS06() {
		return s06;
	}
	public void setS06(Object s06) {
		this.s06 = s06;
	}
	public Object getSky() {
		return sky;
	}
	public void setSky(Object sky) {
		this.sky = sky;
	}
	public Object getT3h() {
		return t3h;
	}
	public void setT3h(Object t3h) {
		this.t3h = t3h;
	}
	public Object getTmn() {
		return tmn;
	}
	public void setTmn(Object tmn) {
		this.tmn = tmn;
	}
	public Object getTmx() {
		return tmx;
	}
	public void setTmx(Object tmx) {
		this.tmx = tmx;
	}
	public Object getUuu() {
		return uuu;
	}
	public void setUuu(Object uuu) {
		this.uuu = uuu;
	}
	public Object getVvv() {
		return vvv;
	}
	public void setVvv(Object vvv) {
		this.vvv = vvv;
	}
	public Object getVec() {
		return vec;
	}
	public void setVec(Object vec) {
		this.vec = vec;
	}
	public Object getWsd() {
		return wsd;
	}
	public void setWsd(Object wsd) {
		this.wsd = wsd;
	}
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static WeatherDongneVO single = null;

	public static WeatherDongneVO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new WeatherDongneVO();
		//생성된 객체정보를 반환
		return single;
	}
}
