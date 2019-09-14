package com.pick.hotels.controller;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.pick.hotels.entity.CouponDto;
import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.Payment_VO;
import com.pick.hotels.entity.ReserveDto;
import com.pick.hotels.entity.RoomDto;
import com.pick.hotels.entity.kakaopay.KakaoPayReturnVo;
import com.pick.hotels.entity.kakaopay.KakaoPaySuccessVO;
import com.pick.hotels.repository.CouponDao;
import com.pick.hotels.repository.HotelDao;
import com.pick.hotels.repository.ReserveDao;
import com.pick.hotels.repository.RoomDao;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	private @Autowired ReserveDao reserveDao;
	private @Autowired HotelDao hotelDao;
	private @Autowired RoomDao roomDao;
	private @Autowired CouponDao couponDao;

	
	@PostMapping("/order")
	public String payment(@ModelAttribute Payment_VO payment_VO,
							@RequestParam(value = "check_agree", required = true) List<String> check_agree,
							HttpSession session) throws URISyntaxException {
		System.out.println(payment_VO);
//		예약 가능한지 먼저 검증
		int roomcheck = roomDao.room_check(payment_VO);
		System.out.println(roomcheck);
		if(roomcheck==0) {
			return "err/room_already_reserve";
		}
		if(payment_VO.getCoupon_history()!=0) {
			CouponDto cdto = couponDao.get(payment_VO.getCoupon_no());
			int c_price = payment_VO.getReserve_price()-cdto.getCoupon_price();
			if(c_price < 0) {
				c_price = 1000;
			}
			payment_VO.setReserve_price(c_price);			
		}
		if(check_agree.size()==4) {
			if(payment_VO.getReserve_pay_type()==10) {
				int member_no = (int) session.getAttribute("no");
				int order_id = reserveDao.getseq_no();
				HotelDto hdto = hotelDao.get(payment_VO.getReserve_hotel_no());
				RoomDto rdto = roomDao.get(payment_VO.getReserve_room_no());
				if(payment_VO.getReserve_price()>=1000000) {
					return "err/card_refuse";
				}
				
//				서버에서 다른 서버를 호출하려면 RestTemplate이 필요
				RestTemplate template = new RestTemplate();
//				template에 headears와 params를 추가하여 전송->응답발생
				HttpHeaders headers = new HttpHeaders();
				headers.add("Authorization", "KakaoAK 1124d036778859d79c95a9a804ee78bd");
				headers.add("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8");
				headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
				
				MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
				params.add("cid", "TC0ONETIME"); //가맹점 코드 10자
				params.add("partner_order_id", String.valueOf(order_id));// 주문번호 최대 100자
				params.add("partner_user_id", (String) session.getAttribute("ok")); // 사용자 아이디최대100자
				params.add("item_name", hdto.getHotel_name()+"["+rdto.getRoom_name()+"]"); //호텔이름 상품명 최대 100자
				params.add("quantity", String.valueOf("1")); //상품 수량 integer
				params.add("total_amount", String.valueOf(payment_VO.getReserve_price())); //상품총액 integer
				params.add("tax_free_amount", "0"); //비과세 금액 integer 
				params.add("approval_url", "http://n0chatt3r.mynetgear.com/hotels/payment/kakao/success");
				params.add("cancel_url", "http://n0chatt3r.mynetgear.com/hotels/payment/kakao/fail");
				params.add("fail_url", "http://n0chatt3r.mynetgear.com/hotels/payment/kakao/cancel");
				
//				headers와 params를 합쳐서 전송할 객체를 생성
				HttpEntity<MultiValueMap<String, String>> send = new HttpEntity<MultiValueMap<String, String>>(params, headers);

				URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");
				
//				전송:반환값을 저장할수 있는 객체가 필요
				KakaoPayReturnVo kakaopay = template.postForObject(uri, send, KakaoPayReturnVo.class);
				
				//결제정보 최종승인때 사용하기 위해 저장
				session.setAttribute("payment_VO", payment_VO); // 주문 정보
				session.setAttribute("order_id", order_id); // 주문 번호
				session.setAttribute("return_info", kakaopay); // 반환 받은 값
				
//				결제 페이지로 연동시킴
				return "redirect:" + kakaopay.getNext_redirect_pc_url();
			}else {
				return null;
			}
		}else {
			return null;
		}
	}	
	
	@RequestMapping("/kakao/success")
	public String kakao_success(@RequestParam String pg_token,
								HttpSession session,
								Model model) throws URISyntaxException {
		
//		서버에서 다른 서버를 호출하려면 RestTemplate이 필요
		RestTemplate template = new RestTemplate();
//		template에 headears와 params를 추가하여 전송->응답발생
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK 1124d036778859d79c95a9a804ee78bd");
		headers.add("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		
		KakaoPayReturnVo return_info = (KakaoPayReturnVo) session.getAttribute("return_info");
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("tid", return_info.getTid());
		params.add("partner_order_id", String.valueOf((int) session.getAttribute("order_id")));
		params.add("partner_user_id", (String) session.getAttribute("ok"));
		params.add("pg_token", pg_token);
		
		HttpEntity<MultiValueMap<String, String>> send = new HttpEntity<MultiValueMap<String, String>>(params, headers);

		URI uri = new URI("https://kapi.kakao.com/v1/payment/approve");
		
		//최종 승인 요청
		KakaoPaySuccessVO success = template.postForObject(uri, send, KakaoPaySuccessVO.class);
		Payment_VO pv = (Payment_VO) session.getAttribute("payment_VO");
		System.out.println(pv);
//		쿠폰 사용여부 확인후 사용완료처리
		if(pv.getCoupon_history()!=0) {
			couponDao.used_coupon(pv.getCoupon_history());
		}
		//결제 완료로 DB에 저장하고 사용자에게 결과 알림
		ReserveDto rdto = ReserveDto.builder()
											.reserve_no((int) session.getAttribute("order_id"))
											.reserve_member_no((int)session.getAttribute("no"))
											.reserve_hotel_no(pv.getReserve_hotel_no())
											.reserve_room_no(pv.getReserve_room_no())
											.reserve_people(pv.getReserve_people())
											.reserve_name(pv.getReserve_name())
											.reserve_phone(pv.getReserve_phone())
											.reserve_in(pv.getReserve_in())
											.reserve_out(pv.getReserve_out())
											.reserve_price(pv.getReserve_price())
											.reserve_pay_type("카카오페이")
											.build();
		if(pv.getCoupon_history()==0) {
			rdto.setReserve_coupon_use("사용안함");
		}else {
			CouponDto cdto = couponDao.get(pv.getCoupon_no());
			rdto.setReserve_coupon_use(cdto.getCoupon_name());
		}
		reserveDao.regist(rdto);
		HotelDto hdto = hotelDao.get(pv.getReserve_hotel_no());
		RoomDto room = roomDao.get(pv.getReserve_room_no());
		model.addAttribute("success", success);
		model.addAttribute("rdto", rdto);
		model.addAttribute("hdto", hdto);
		model.addAttribute("room", room);
		//세션 정리
		session.removeAttribute("payment_VO"); // 주문 정보
		session.removeAttribute("order_id"); // 주문 번호
		session.removeAttribute("return_info"); // 반환 받은 값
		
		return "payment/kakaopay/success";
	}
	@RequestMapping("/kakao/fail")
	public String kakao_fail() {
		return "payment/kakaopay/fail";
	}
	@RequestMapping("/kakao/cancel")
	public String kakao_cancel() {
		return "payment/kakaopay/cancel";
	}
}
