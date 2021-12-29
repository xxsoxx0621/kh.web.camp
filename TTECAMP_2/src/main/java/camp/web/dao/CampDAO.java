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



public class CampDAO {
	private static CampDAO instance = null;

	public static CampDAO getInstance() {
		if (instance == null) {
			instance = new CampDAO();
		}
		return instance;
	}

	private CampDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public List<CampDTO> selectAll() throws Exception {
		String sql = "SELECT * FROM CAMP WHERE firstImageUrl IS NOT NULL  ORDER BY LIKE_CNT DESC";
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
				dto.setTotal_camp_Nm(rs.getInt("total_camp_Nm"));

				list.add(dto);

			}
			return list;
		}
	}

//	public List<CampDTO> selectByDonm(String doNm) throws Exception {
//		String sql = "SELECT * FROM CAMP WHERE DONM = ? ORDER BY LIKE_CNT DESC";
//		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
//			pstat.setString(1, doNm);
//
//			try (ResultSet rs = pstat.executeQuery();) {
//
//				List<CampDTO> list = new ArrayList<CampDTO>();
//
//				while (rs.next()) {
//					CampDTO dto = new CampDTO();
//
//					dto.setContentId(rs.getString("contentId"));
//					dto.setInduty(rs.getString("induty"));
//					dto.setFacltDivNm(rs.getString("facltDivNm"));
//					dto.setDoNm(rs.getString("doNm"));
//					dto.setSiteBottomCl1(rs.getString("siteBottomCl1"));
//					dto.setSiteBottomCl2(rs.getString("siteBottomCl2"));
//					dto.setSiteBottomCl3(rs.getString("siteBottomCl3"));
//					dto.setSiteBottomCl4(rs.getString("siteBottomCl4"));
//					dto.setSiteBottomCl5(rs.getString("siteBottomCl5"));
//					dto.setSbrsCl(rs.getString("sbrsCl"));
//					dto.setEqpmnLendCl(rs.getString("eqpmnLendCl"));
//					dto.setAnimalCmgCl(rs.getString("animalCmgCl"));
//					dto.setBrazierCl(rs.getString("brazierCl"));
//					dto.setPosblFcltyCl(rs.getString("posblFcltyCl"));
//					dto.setFacltNm(rs.getString("facltNm"));
//					dto.setAddr1(rs.getString("addr1"));
//					dto.setLctCl(rs.getString("lctCl"));
//					dto.setBizrno(rs.getString("bizrno"));
//					dto.setFeatureNm(rs.getString("featureNm"));
//					dto.setLineIntro(rs.getString("lineIntro"));
//					dto.setFirstImageUrl(rs.getString("firstImageUrl"));
//					dto.setHomepage(rs.getString("homepage"));
//					dto.setMapX(rs.getString("mapX"));
//					dto.setMapY(rs.getString("mapY"));
//					dto.setOperDeCl(rs.getString("operDeCl"));
//					dto.setSigunguNm(rs.getString("sigunguNm"));
//					dto.setTel(rs.getString("tel"));
//					dto.setLike_cnt(rs.getInt("like_cnt"));
//
//					list.add(dto);
//
//				}
//				return list;
//			}
//		}
//	}

//	public List<CampDTO> selectByInduty(String induty) throws Exception {
//		String sql = "SELECT * FROM CAMP WHERE INDUTY = ? ORDER BY LIKE_CNT DESC";
//		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
//			pstat.setString(1, induty);
//
//			try (ResultSet rs = pstat.executeQuery();) {
//
//				List<CampDTO> list = new ArrayList<CampDTO>();
//
//				while (rs.next()) {
//					CampDTO dto = new CampDTO();
//
//					dto.setContentId(rs.getString("contentId"));
//					dto.setInduty(rs.getString("induty"));
//					dto.setFacltDivNm(rs.getString("facltDivNm"));
//					dto.setDoNm(rs.getString("doNm"));
//					dto.setSiteBottomCl1(rs.getString("siteBottomCl1"));
//					dto.setSiteBottomCl2(rs.getString("siteBottomCl2"));
//					dto.setSiteBottomCl3(rs.getString("siteBottomCl3"));
//					dto.setSiteBottomCl4(rs.getString("siteBottomCl4"));
//					dto.setSiteBottomCl5(rs.getString("siteBottomCl5"));
//					dto.setSbrsCl(rs.getString("sbrsCl"));
//					dto.setEqpmnLendCl(rs.getString("eqpmnLendCl"));
//					dto.setAnimalCmgCl(rs.getString("animalCmgCl"));
//					dto.setBrazierCl(rs.getString("brazierCl"));
//					dto.setPosblFcltyCl(rs.getString("posblFcltyCl"));
//					dto.setFacltNm(rs.getString("facltNm"));
//					dto.setAddr1(rs.getString("addr1"));
//					dto.setLctCl(rs.getString("lctCl"));
//					dto.setBizrno(rs.getString("bizrno"));
//					dto.setFeatureNm(rs.getString("featureNm"));
//					dto.setLineIntro(rs.getString("lineIntro"));
//					dto.setFirstImageUrl(rs.getString("firstImageUrl"));
//					dto.setHomepage(rs.getString("homepage"));
//					dto.setMapX(rs.getString("mapX"));
//					dto.setMapY(rs.getString("mapY"));
//					dto.setOperDeCl(rs.getString("operDeCl"));
//					dto.setSigunguNm(rs.getString("sigunguNm"));
//					dto.setTel(rs.getString("tel"));
//					dto.setLike_cnt(rs.getInt("like_cnt"));
//
//					list.add(dto);
//
//				}
//				return list;
//			}
//		}
//	}

	public CampDTO selectByFacltnm(String facltNm) throws Exception {
		String sql = "SELECT * FROM CAMP WHERE TRIM(FACLTNM) = TRIM(?) ORDER BY LIKE_CNT DESC";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, facltNm);

			try (ResultSet rs = pstat.executeQuery();) {
				if (rs.next()) {
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
					dto.setTotal_camp_Nm(rs.getInt("total_camp_Nm"));
					
					return dto;
				}
			}
			return null;
		}
	}
	public CampDTO selectByContentId(String contentId) throws Exception {
		String sql = "SELECT * FROM CAMP WHERE CONTENTID = ? ORDER BY LIKE_CNT DESC";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, contentId);

			try (ResultSet rs = pstat.executeQuery();) {
				if (rs.next()) {
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
					dto.setTotal_camp_Nm(rs.getInt("total_camp_Nm"));
					
					return dto;
				}
			}
			return null;
		}
	}
}
