package camp.web.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;

@WebServlet("*.api")
public class APIController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		System.out.println("사용자가 요청한 주소 : " + uri);

		String ctxPath = request.getContextPath();
		System.out.println("프로젝트명 : " + ctxPath);

		String cmd = uri.substring(ctxPath.length());
		System.out.println("사용자가 요청한 기능 : " + cmd);

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		if (cmd.equals("/getJson.api")) {
			// 인증키 (개인이 받아와야함)
//			String key = "";

			// 파싱한 데이터를 저장할 변수
			String result = "";

			try {
				URL url = new URL("http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?ServiceKey=6tyTSMNSNVWydCEqSdLgKCZOwAaVULvXG%2FwiR1ou%2BIaliHgkSPkX%2Br1X1rVAArPMfaMQWttJKrraESeKuCA2%2BQ%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=TestApp&_type=json");

				JSONArray dummyResult = null;
				BufferedReader bf;
				String line = "";
				bf = new BufferedReader(new InputStreamReader(url.openStream())); // 버퍼에 있는 정보를 하나의 문자열로 변환.
				
				while ((line = bf.readLine()) != null) {
					result = result.concat(line); //
					System.out.println(result); // 받아온 데이터를 확인해봅니다. } // Json parser를 만들어 만들어진 문자열 데이터를 객체화 합니다.
					JSONParser parser = new JSONParser();
					JSONObject obj = (JSONObject) parser.parse(result); // Top레벨 단계인 response 키를 가지고 데이터를 파싱합니다.
					JSONObject parse_response = (JSONObject) obj.get("response"); // response 로 부터 body 찾아옵니다.
					JSONObject parse_body = (JSONObject) parse_response.get("body"); // body 로 부터 items 받아옵니다.
					JSONObject parse_items = (JSONObject) parse_body.get("items"); // items로 부터 itemlist 를 받아오기 itemlist
																					// : 뒤에 [ 로 시작하므로 jsonarray이다
					JSONArray parse_item = (JSONArray) parse_items.get("item");
					System.out.println(parse_item);
					dummyResult = parse_item;
				}

				Gson g = new Gson();
				String resultToJson = g.toJson(dummyResult);
				response.getWriter().append(resultToJson);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}