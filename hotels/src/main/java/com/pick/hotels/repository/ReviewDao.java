package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.ReviewDto;
import com.pick.hotels.entity.ReviewVO;
import com.pick.hotels.entity.Review_list_vo;

public interface ReviewDao {

	boolean write(ReviewDto reviewDto);

	boolean check(int reserve_no);

	List<ReviewVO> list(int member_no);

	boolean change(ReviewDto reviewDto);

	int count(String type, String keyword);

	Float get_avg_star(int hotel_no);

	List<Review_list_vo> get_list(int hotel_no);

	//관리자 리뷰 리스트
	List<ReviewVO> admin_review_list(String type, String keyword, int start, int end);
	int count_review_list(String type, String keyword);
	List<ReviewVO> admin_review_blacklist(String type, String keyword, int start, int end);
	int count_review_blacklist(String type, String keyword);
	void edit(ReviewDto reviewDto);
	ReviewDto get(int no);
	
}
