package camp.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import camp.web.dto.CampDTO;
import camp.web.dto.ReviewDTO;



public class ReviewDAO {
	private static ReviewDAO instance = null;

	public static ReviewDAO getInstance() {
		if (instance == null) {
			instance = new ReviewDAO();
		}
		return instance;
	}

	private ReviewDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int insertReview(ReviewDTO dto) throws Exception {
		String sql = "INSERT INTO REVIEW VALUES(REVIEW_NO_SEQ.NEXTVAL,?,?,?,SYSDATE,0)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {

			pstat.setString(1, dto.getContentId());
			pstat.setString(2, dto.getUser_id());
			pstat.setString(3, dto.getContents());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public List<ReviewDTO> selectByContentId(String contentId) throws Exception {
		String sql = "SELECT * FROM REVIEW WHERE CONTENTID = ? ORDER BY WRITE_DATE DESC";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, contentId);

			try (ResultSet rs = pstat.executeQuery();) {

				List<ReviewDTO> list = new ArrayList<ReviewDTO>();

				while (rs.next()) {
					ReviewDTO dto = new ReviewDTO();

					dto.setReview_no(rs.getInt("review_no"));
					dto.setContentId(rs.getString("contentId"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setContents(rs.getString("contents"));
					dto.setWrite_date(rs.getDate("write_date"));
					dto.setLiked(rs.getInt("liked"));

					list.add(dto);
				}
				return list;
			}
		}
	}
	public List<ReviewDTO> selectByUserId(String id)throws Exception{
		String sql  = "select * from review where user_id =? order by write_date desc";
		try (Connection con = this.getConnection(); 
				PreparedStatement pstat = con.prepareStatement(sql);) {
			
			pstat.setString(1, id);

			try (ResultSet rs = pstat.executeQuery();) {

				List<ReviewDTO> list = new ArrayList<ReviewDTO>();

				while (rs.next()) {
					ReviewDTO dto = new ReviewDTO();

					dto.setReview_no(rs.getInt("review_no"));
					dto.setContentId(rs.getString("contentId"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setContents(rs.getString("contents"));
					dto.setWrite_date(rs.getDate("write_date"));
					dto.setLiked(rs.getInt("liked"));

					list.add(dto);
				}
				return list;
			}
		}
	}
	
	public List<CampDTO> selectAll() throws Exception {
		String sql = "SELECT * FROM CAMP";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {

					List<CampDTO> list = new ArrayList<CampDTO>();

					while (rs.next()) {
						CampDTO dto = new CampDTO();

						dto.setContentId(rs.getString("contentId"));
						dto.setInduty(rs.getString("induty"));
						dto.setFacltDivNm(rs.getString("facltDivNm"));
						dto.setDoNm(rs.getString("doNm"));
						dto.setSiteBottomCl1(rs.getString("siteBottomCl1"));
						dto.setSiteBottomCl2(rs.getString("siteBottomCl2"));
						dto.setSiteBottomCl3(rs.getString("siteBottomCl3"));
						dto.setSiteBottomCl4(rs.getString("siteBottomCl4"));
						dto.setSiteBottomCl5(rs.getString("siteBottomCl5"));
						dto.setSbrsCl(rs.getString("sbrsCl"));
						dto.setEqpmnLendCl(rs.getString("eqpmnLendCl"));
						dto.setAnimalCmgCl(rs.getString("animalCmgCl"));
						dto.setBrazierCl(rs.getString("brazierCl"));
						dto.setPosblFcltyCl(rs.getString("posblFcltyCl"));
						dto.setFacltNm(rs.getString("facltNm"));
						dto.setAddr1(rs.getString("addr1"));
						dto.setLctCl(rs.getString("lctCl"));
						dto.setBizrno(rs.getString("bizrno"));
						dto.setFeatureNm(rs.getString("featureNm"));
						dto.setLineIntro(rs.getString("lineIntro"));
						dto.setFirstImageUrl(rs.getString("firstImageUrl"));
						dto.setHomepage(rs.getString("homepage"));
						dto.setMapX(rs.getString("mapX"));
						dto.setMapY(rs.getString("mapY"));
						dto.setOperDeCl(rs.getString("operDeCl"));
						dto.setSigunguNm(rs.getString("sigunguNm"));
						dto.setTel(rs.getString("tel"));
						dto.setLike_cnt(rs.getInt("like_cnt"));

						list.add(dto);
				}
					return list;
	
			
			
		}
	}
	
	public int deleteReview(String reviewNo) throws Exception {
		
		String sql = "delete from review where review_no =?";
		
		try (Connection con = this.getConnection(); 
				PreparedStatement pstat = con.prepareStatement(sql);) {
			
			pstat.setString(1, reviewNo);
			
			int result = pstat.executeUpdate();
			return result;
		}
		
		
	}

	
	
}