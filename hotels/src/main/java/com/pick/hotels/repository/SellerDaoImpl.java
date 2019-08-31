package com.pick.hotels.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.SellerDto;

@Repository
public class SellerDaoImpl implements SellerDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean regist(SellerDto sellerDto) {
		try {
			sqlSession.insert("seller.regist", sellerDto);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public SellerDto getId(String seller_id) {
		return sqlSession.selectOne("seller.id_ckeck", seller_id);
	}


	@Override
	public void delete(String seller_id) {
		sqlSession.delete("seller.delete", seller_id);
		
	}

	@Override
	public void change(SellerDto sellerDto) {
		sqlSession.update("seller.change", sellerDto);
		
	}

	@Override
	public SellerDto login(SellerDto sellerDto) {
		SellerDto result = sqlSession.selectOne("seller,login", sellerDto);
		return result;
	}

	@Override
	public SellerDto getLisence(String seller_lisence) {
		return sqlSession.selectOne("seller.lisence_ckeck", seller_lisence);
	}

	@Override
	public SellerDto findPassword(SellerDto sellerDto) {
		return sqlSession.selectOne("seller.find_pw", sellerDto);
	}


	@Override
	public void changePw(SellerDto sellerDto) {
		sqlSession.update("seller.changePw", sellerDto);
	}

	@Override
	public SellerDto findId(SellerDto sellerDto) {
		return sqlSession.selectOne("seller.find_id", sellerDto);
	}

	@Override
	public SellerDto get(int seller_no) {
		return sqlSession.selectOne("seller.get",seller_no);
	}

//------------------------------------------------------------------------------------
//	관리자
//------------------------------------------------------------------------------------    

//	판매자 목록
	@Override
	public List<SellerDto> list(String type, String keyword, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		
//		검색일 떄 검색어를 mybatis에 전달
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);			
		}
		
//		검색이든 목록이든 페이징 구간 전달
		param.put("start", start);
		param.put("end", end);
		
		return sqlSession.selectList("seller.list", param);
	}

//	판매자리스트 구하기
	@Override
	public int count(String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		
		return sqlSession.selectOne("seller.count", param);
	}

}
