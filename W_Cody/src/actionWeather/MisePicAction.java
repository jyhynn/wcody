package actionWeather;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import vo.PM10_1VO;
import vo.PM10_2VO;
import vo.PM25_1VO;
import vo.PM25_2VO;

/**
 * Servlet implementation class MisePicAction
 */
@WebServlet("/weather/mise_pic.do")
public class MisePicAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMinuDustFrcstDspth?
		// searchDate=2017-04-19
		// &ServiceKey=서비스키
		PM10_1VO pm101 = new PM10_1VO();
		PM10_2VO pm102 = new PM10_2VO();
		PM25_1VO pm251 = new PM25_1VO();
		PM25_2VO pm252 = new PM25_2VO();
		
		String serviceKey = "fVYuYifzsbfwfcqiR0XO9y34Dte6WG6gpWnGYT56FR6%2F8QjD%2FDufBgIhnraBBZN1xbf9xZzmfbfavC24DrtUjg%3D%3D";
		LocalDateTime date = LocalDateTime.now();
		int dd = date.getDayOfMonth();
		int mm = date.getMonthValue();
		int yyyy = date.getYear();
		int hours = date.getHour();
		System.out.println(yyyy + "-" + mm + "-" + dd);
		/*
		 * 요청정보입력 아래와 같은 정보들은 사용자 가이드를 확인하여 찾아주시면 됩니다. 위도 경도는 엑셀파일 안에 있습니다.
		 */
		// 정보를 모아서 URL정보를 만들면됩니다. 맨 마지막 "&_type=json"에 따라 반환 데이터의 형태가 정해집니다.
		String urlStr = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMinuDustFrcstDspth?"
				+ "searchDate=" 
				+ yyyy + "-" + mm + "-" + dd 
				+ "&ServiceKey=" + serviceKey
				+ "&ver=1.1"
				+ "&pageNo=" + "1"
				+ "&numOfRows=100";
		URL url = new URL(urlStr); // 위 urlStr을 이용해서 URL 객체를 만들어줍니다.
		BufferedReader bf = null;
		// DocumentBuilderFactory 생성
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setNamespaceAware(true);
		DocumentBuilder builder;
		Document doc = null;
		String time = null;
		switch (hours) {
		case 5:
		case 6:
		case 7:
		case 8:
		case 9:
		case 10:
		case 17:
		case 18:
		case 19:
		case 20:
		case 21:
		case 22:							
			time = yyyy+"-"+ mm+"-"+dd+ " 05시 발표";
			break;
		case 11:
		case 12:
		case 13:
		case 14:
		case 15:
		case 16:
		case 23:
		case 0:
			time = yyyy+"-"+ mm+"-"+dd+ " 11시 발표";
			break;
		default:
			break;
		}
		System.out.println(hours + "  "+time);
		try {
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));
			String result = "";
			String line;
			while ((line = bf.readLine()) != null) {
				result = result + line.trim();// result = URL로 XML을 읽은 값
			}
			InputSource is = new InputSource(new StringReader(result));
			builder = factory.newDocumentBuilder();
			doc = builder.parse(is);
			XPathFactory xpathFactory = XPathFactory.newInstance();
			XPath xpath = xpathFactory.newXPath();
			// XPathExpression expr = xpath.compile("/response/body/items/item");
			XPathExpression expr = xpath.compile("//items/item");
			NodeList items = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
			for (int i = 0; i < items.getLength(); i++) {
				NodeList item = items.item(i).getChildNodes();
					if(item.item(0).getNodeName().equals("dataTime")) {
						if(item.item(0).getTextContent().equals(time)) {
							if(item.item(1).getTextContent().equals("PM10")) {
								if(item.item(6).getTextContent().isEmpty()) {
									System.out.println("pm102 : "+ item.item(1).getTextContent());
									pm102.setDateTime(item.item(0).getTextContent().toString());
									pm102.setInformCode(item.item(1).getTextContent().toString());
									pm102.setInformOverall(item.item(2).getTextContent().substring(9, item.item(2).getTextContent().toString().length()));
									pm102.setInformCause(item.item(3).getTextContent().substring(9, item.item(3).getTextContent().toString().length()));
									pm102.setInformGrade(item.item(4).getTextContent().toString());
									pm102.setInformData(item.item(15).getTextContent().toString());
									continue;
								}
								System.out.println("pm101 : "+item.item(0).getTextContent());
								pm101.setDateTime(item.item(0).getTextContent().toString());
								pm101.setInformCode(item.item(1).getTextContent().toString());
								pm101.setInformOverall(item.item(2).getTextContent().substring(9, item.item(2).getTextContent().toString().length()));
								pm101.setInformCause(item.item(3).getTextContent().substring(9, item.item(3).getTextContent().toString().length()));
								pm101.setInformGrade(item.item(4).getTextContent().toString());
								pm101.setImageUrl1(item.item(6).getTextContent().toString());
								System.out.println(" pm101.getImageUrl1 : " + pm101.getImageUrl1());
								pm101.setImageUrl2(item.item(7).getTextContent().toString());
								pm101.setImageUrl3(item.item(8).getTextContent().toString());
								pm101.setImageUrl4(item.item(9).getTextContent().toString());
								pm101.setImageUrl5(item.item(10).getTextContent().toString());
								pm101.setImageUrl6(item.item(11).getTextContent().toString());
								pm101.setImageUrl7(item.item(12).getTextContent().toString());
								pm101.setImageUrl8(item.item(13).getTextContent().toString());
								pm101.setImageUrl9(item.item(14).getTextContent().toString());
								System.out.println(" pm101.getImageUrl7 : " + pm101.getImageUrl7());
								pm101.setInformData(item.item(15).getTextContent().toString());
							}else if(item.item(1).getTextContent().equals("PM25")) {
								if(item.item(6).getTextContent().isEmpty()) {
									System.out.println("pm252 : "+item.item(1).getTextContent());
									pm252.setDateTime(item.item(0).getTextContent().toString());
									pm252.setInformCode(item.item(1).getTextContent().toString());
									System.out.println(item.item(2).getTextContent().toString());
									pm252.setInformOverall(item.item(2).getTextContent().substring(9, item.item(2).getTextContent().toString().length()));
									pm252.setInformCause(item.item(3).getTextContent().substring(9, item.item(3).getTextContent().toString().length()));
									pm252.setInformGrade(item.item(4).getTextContent().toString());
									pm252.setInformData(item.item(15).getTextContent().toString());
									continue;
								}
								System.out.println("pm251 : "+item.item(1).getTextContent());
								pm251.setDateTime(item.item(0).getTextContent().toString());
								pm251.setInformCode(item.item(1).getTextContent().toString());
								pm251.setInformOverall(item.item(2).getTextContent().substring(9, item.item(2).getTextContent().toString().length()));		
								pm251.setInformCause(item.item(3).getTextContent().substring(9, item.item(3).getTextContent().toString().length()));
								pm251.setInformGrade(item.item(4).getTextContent().toString());
								pm251.setImageUrl1(item.item(6).getTextContent().toString());
								pm251.setImageUrl2(item.item(7).getTextContent().toString());
								pm251.setImageUrl3(item.item(8).getTextContent().toString());
								pm251.setImageUrl4(item.item(9).getTextContent().toString());
								pm251.setImageUrl5(item.item(10).getTextContent().toString());
								pm251.setImageUrl6(item.item(11).getTextContent().toString());
								pm251.setImageUrl7(item.item(12).getTextContent().toString());
								pm251.setImageUrl8(item.item(13).getTextContent().toString());
								pm251.setImageUrl9(item.item(14).getTextContent().toString());
								pm251.setInformData(item.item(15).getTextContent().toString());
							}
						}
					}
					
					//=> dateTime, informCode, informOverall, informCause, informGrade, actionKnack, imageURL1~9, informData
			}
			
		} catch (Exception e) {
			System.out.println("MisePicAction쪽 에러났음 : " + e.getMessage());
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("pm101", pm101);
		session.setAttribute("pm102", pm102);
		session.setAttribute("pm251", pm251);
		session.setAttribute("pm252", pm252);
		session.setMaxInactiveInterval(3600); 
		
		RequestDispatcher disp = request.getRequestDispatcher("weather_all.jsp");
		disp.forward(request, response);
		
	}
}
