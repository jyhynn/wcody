package actionWeather;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import vo.WeatherDongneVO;


/**
 * Servlet implementation class WeatherApiAction
 */
@WebServlet("/wcody/take_weatherDongne.do")
public class WeatherDongneApiAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 //자신이 조회를 원하는 지역의 경도와 위도를 입력해주세요
		 //경도(nx)
		 //위도(ny)
		 // 자신이 조회하고싶은 날짜를 입력해주세요 -> 이거 금일 날짜 아니면 넘어오질 않음 (baseDate) 
		 // => 앱 들어오는 버튼 클릭하면 클릭했을 때의 hasDate를 가져와서 위의 baseDate의 값으로 입력
		 //자신이 조회하고싶은 시간대를 입력해주세요(baseTime)
		 // 서비스 인증키입니다. 공공데이터포털에서 제공해준 인증키를 넣어주시면 됩니다.
		String nx = request.getParameter("nx");
		String ny = request.getParameter("ny");
		String baseDate = request.getParameter("baseDate");
		String baseTime = request.getParameter("baseTime");
		// 파라미터:NaN NaN 20181213 null null 1300
		 String serviceKey = "fVYuYifzsbfwfcqiR0XO9y34Dte6WG6gpWnGYT56FR6%2F8QjD%2FDufBgIhnraBBZN1xbf9xZzmfbfavC24DrtUjg%3D%3D";
		 WeatherDongneVO wvo = new WeatherDongneVO();
		 try{
		
         /*요청정보입력
          * 아래와 같은 정보들은 사용자 가이드를 확인하여 찾아주시면 됩니다.
          * 위도 경도는 엑셀파일 안에 있습니다.
          * */
           // 정보를 모아서 URL정보를 만들면됩니다. 맨 마지막 "&_type=json"에 따라 반환 데이터의 형태가 정해집니다.
           String urlStr = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData?"
               + "serviceKey=" + serviceKey + "&base_date=" + baseDate + "&base_time=" + baseTime
               + "&nx="+ nx + "&ny=" + ny + "&_type=json";
           
           URL url = new URL(urlStr); // 위 urlStr을 이용해서 URL 객체를 만들어줍니다.
           BufferedReader bf;
           String line = "";
           String result="";

           //날씨 정보를 받아옵니다.
           bf = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));
           System.out.println("동네예보 날씨정보 받아옴");
           //버퍼에 있는 정보를 하나의 문자열로 변환.
           
           
           while((line=bf.readLine())!=null){
               result=result.concat(line);
               System.out.println(result);  // 받아온 데이터를 확인해봅니다.
           }
           
            // Json parser를 만들어 만들어진 문자열 데이터를 객체화 합니다.
	       JSONParser parser = new JSONParser();
	       JSONObject obj = (JSONObject) parser.parse(result);
	        
	       // Top레벨 단계인 response 키를 가지고 데이터를 파싱합니다.
	       
	       JSONObject parse_response = (JSONObject) obj.get("response");
	       
	       // response 로 부터 body 찾아옵니다.
	       JSONObject parse_body = (JSONObject) parse_response.get("body");
	       // body 로 부터 items 받아옵니다.
	       JSONObject parse_items = (JSONObject) parse_body.get("items"); // ==> 이 line 에러 났음
	        
	       // items로 부터 itemlist 를 받아오기 itemlist : 뒤에 [ 로 시작하므로 jsonarray이다
	       JSONArray parse_item = (JSONArray) parse_items.get("item");
	        
	       String category;
	       JSONObject weather; // parse_item은 배열형태이기 때문에 하나씩 데이터를 하나씩 가져올때 사용합니다.
	       // 필요한 데이터만 가져오려고합니다.
	       for(int i = 0 ; i < parse_item.size(); i++)
	       {
	         weather = (JSONObject) parse_item.get(i);
	         //String base_Date = (String)weather.get("baseDate");
	         //String fcst_Time = (String)weather.get("fcstDate");
	        
	         String fcst_Value = weather.get("fcstValue").toString();
	         //값 문자열 화(.toString)
	         // 여기서 missing 다 처리해서 Weatherwvo로 넘김
	               
	         //String nX = (String)weather.get("nx");
	         //String nY = (String)weather.get("ny");
	         category = (String)weather.get("category");
	         //String base_Time = (String)weather.get("baseTime");
	         //String fcscDate = (String)weather.get("fcscDate");
	         switch (category) {
	         	case "POP":
	         		if(!fcst_Value.equals("-1")){
	         			wvo.setPop(fcst_Value);
	         		}
	         		break;
	         	case "PTY":
	         		if(!fcst_Value.equals("-1")){
	         			wvo.setPty(fcst_Value);
	         		}
	         		break;
	         	case "R06":
	         		if(!fcst_Value.equals("-1")){
	         			wvo.setR06(fcst_Value);
	         		}
	         		break;
	         	case "REH":
	         		if(!fcst_Value.equals("-1")){
	         			wvo.setReh(fcst_Value);
	         		}
	         		break;
	         	case "S06":
	         		if(!fcst_Value.equals("-1")){
	         			wvo.setS06(fcst_Value);
	         		}
	         		break;
	         	case "SKY":
	         		if(!fcst_Value.equals("-1")){
	         			wvo.setSky(fcst_Value);
	         			
	         		}
	         		break;
	         	case "T3H":
	         		if(!fcst_Value.equals("-50")){
	         			wvo.setT3h(fcst_Value);
	         		}
	         		break;
	         	case "TMN":
	         		if(!fcst_Value.equals("-50")){
	         			wvo.setTmn(fcst_Value);
	         		}
	         		break;
	         	case "TMX":
	         		if(!fcst_Value.equals("-50")){
	         			wvo.setTmx(fcst_Value);
	         		}
	         		break;
	         	case "UUU":
	         		if(!fcst_Value.equals("-100")){
	         			wvo.setUuu(fcst_Value);
	         		}
	         		break;
	         	case "VEC":
	         		if(!fcst_Value.equals("-1")){
	         			wvo.setVec(fcst_Value);
	         		}
	         		break;
	         	case "VVV":
	         		if(!fcst_Value.equals("-100")){
	         			wvo.setVvv(fcst_Value);
	         		}
	         		break;
	         	case "WSD":
	         		if(!fcst_Value.equals("-1")){
	         			wvo.setWsd(fcst_Value);
	         		}
	         		break;
	         	default:
	         		System.out.println("fcst_Value-Switch-Default : " + "category :"+ category +"fcst_Value"+ fcst_Value);
	         		break;
			} 
	
	       }
       // 마지막에보면 에러가 발생하였는데 casting문제입니다.
       // 이는 반환되는 데이터타입이 달라서인데 이번 글에서는 여기까지만하고
       // 데이터베이스에 입력할때는 수정해서 하겠습니다.
        
	           bf.close();
	       }catch(Exception e){
	       	System.out.println("동네예보쪽 에러났음");
	           System.out.println(e.getMessage());
	       }
		
			HttpSession session = request.getSession();
			session.setAttribute("wvo", wvo);
			session.setMaxInactiveInterval(3600);//한시간동안 로그인정보 유지 
			
			
   }
}

