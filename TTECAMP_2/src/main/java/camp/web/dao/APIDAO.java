package camp.web.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class APIDAO {

	private static APIDAO instance = null;

	public static APIDAO getInstance() {
		if (instance == null) {
			instance = new APIDAO();
		}
		return instance;
	}

	public APIDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public static List<JSONObject> getAPIData() {
		String result = "";

		try {
			URL url = new URL(
					"http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?serviceKey=6tyTSMNSNVWydCEqSdLgKCZOwAaVULvXG%2FwiR1ou%2BIaliHgkSPkX%2Br1X1rVAArPMfaMQWttJKrraESeKuCA2%2BQ%3D%3D&pageNo=1&numOfRows=100&MobileOS=ETC&MobileApp=AppTest&_type=json");

			JSONArray dummyResult = null;
			BufferedReader bf;
			String line = "";
			bf = new BufferedReader(new InputStreamReader(url.openStream())); // 버퍼에 있는 정보를 하나의 문자열로 변환.

			while ((line = bf.readLine()) != null) {
				result = result.concat(line); //
//				System.out.println(result); // 받아온 데이터를 확인해봅니다. } // Json parser를 만들어 만들어진 문자열 데이터를 객체화 합니다.
				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(result); // Top레벨 단계인 response 키를 가지고 데이터를 파싱합니다.
				JSONObject parse_response = (JSONObject) obj.get("response"); // response 로 부터 body 찾아옵니다.
				JSONObject parse_body = (JSONObject) parse_response.get("body"); // body 로 부터 items 받아옵니다.
				JSONObject parse_items = (JSONObject) parse_body.get("items"); // items로 부터 itemlist 를 받아오기 itemlist
				// : 뒤에 [ 로 시작하므로 jsonarray이다
				JSONArray parse_item = (JSONArray) parse_items.get("item");
//				System.out.println(parse_item);
				dummyResult = parse_item;
			}

			List<JSONObject> campArray = new ArrayList<JSONObject>();
			for (int i = 0; i < dummyResult.size(); i++) {
				campArray.add((JSONObject) dummyResult.get(i));
			}

			return campArray;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int insertAPIData(JSONObject list) throws Exception {
		String sql = "insert into camp values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0,default)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, String.valueOf(list.get("contentId")));
			pstat.setString(2, (String) list.get("induty"));
			pstat.setString(3, (String) list.get("facltDivNm"));
			pstat.setString(4, (String) list.get("doNm"));
			pstat.setString(5, String.valueOf(list.get("siteBottomCl1")));
			pstat.setString(6, String.valueOf(list.get("siteBottomCl2")));
			pstat.setString(7, String.valueOf(list.get("siteBottomCl3")));
			pstat.setString(8, String.valueOf(list.get("siteBottomCl4")));
			pstat.setString(9, String.valueOf(list.get("siteBottomCl5")));
			pstat.setString(10, (String) list.get("sbrsCl"));
			pstat.setString(11, (String) list.get("eqpmnLendCl"));
			pstat.setString(12, (String) list.get("animalCmgCl"));
			pstat.setString(13, String.valueOf(list.get("brazierCl")));
			pstat.setString(14, (String) list.get("posblFcltyCl"));
			pstat.setString(15, (String) list.get("facltNm"));
			pstat.setString(16, (String) list.get("addr1"));
			pstat.setString(17, (String) list.get("lctCl"));
			pstat.setString(18, (String) list.get("bizrno"));
			pstat.setString(19, (String) list.get("featureNm"));
			pstat.setString(20, (String) list.get("lineIntro"));
			pstat.setString(21, (String) list.get("firstImageUrl"));
			pstat.setString(22, (String) list.get("homepage"));
			pstat.setString(23, String.valueOf(list.get("mapX")));
			pstat.setString(24, String.valueOf(list.get("mapY")));
			pstat.setString(25, (String) list.get("operDeCl"));
			pstat.setString(26, (String) list.get("sigunguNm"));
			pstat.setString(27, (String) list.get("tel"));

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

}