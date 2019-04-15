package vo;

public class WeatherDangiVO {
	// 초단기 실황 코드 정보 (총 10개)
	//response - category(fcstValue): 응답메시지의 자료구분 문자(각 자료들의 예보값) (총 14개)
	Object t1h; // 기온(C) : -50C
	Object rn1; // 1시간 강수량(mm) : -1mm
	Object sky; // 하늘상태(코드값) : -1
	Object uuu; // 동서바람성분(m/s) : -100m/s
	Object vvv; // 남북바람성분(m/s) : -100m/s
	Object reh; // 습도(%) : -1%
	Object pty; // 강수형태(코드값) : -1
	Object lgt; // 낙뢰(코드값) : -1
	Object vec; // 풍향(0) : -1
	Object wsd; // 풍속(1) : -1
	
	public Object getT1h() {
		return t1h;
	}

	public void setT1h(Object t1h) {
		this.t1h = t1h;
	}

	public Object getRn1() {
		return rn1;
	}

	public void setRn1(Object rn1) {
		this.rn1 = rn1;
	}

	public Object getSky() {
		return sky;
	}

	public void setSky(Object sky) {
		this.sky = sky;
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

	public Object getReh() {
		return reh;
	}

	public void setReh(Object reh) {
		this.reh = reh;
	}

	public Object getPty() {
		return pty;
	}

	public void setPty(Object pty) {
		this.pty = pty;
	}

	public Object getLgt() {
		return lgt;
	}

	public void setLgt(Object lgt) {
		this.lgt = lgt;
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

	public static WeatherDangiVO getSingle() {
		return single;
	}

	public static void setSingle(WeatherDangiVO single) {
		WeatherDangiVO.single = single;
	}

	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static WeatherDangiVO single = null;

	public static WeatherDangiVO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new WeatherDangiVO();
		//생성된 객체정보를 반환
		return single;
	}
}
