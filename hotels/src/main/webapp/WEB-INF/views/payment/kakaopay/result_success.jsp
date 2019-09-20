<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery_number/jquery_number_min.js"></script>
    <style>
        .kakao-title-wrap{
            margin: auto;
            padding: 70px;
            text-align: center;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
        }
        .kakao-info-wrap{
            width: 1050px;
            margin: auto;
        }
        .kakao-info-wrap:after{
            clear: both;
            display: block;
            content: "";
        }
        .left-wrap{
            float: left;
            width: 580px;
            padding: 10px;
        }
        .right-wrap{
            float:right;
            width: 400px;
            padding: 10px;
        }
        .inner-con{
            margin-bottom: 20px;
        }
        .inner-title{
            font-size: 18px;
        }
        .inner-desc{
            font-size: 20px;
            color: black;
        }
       	.vat-desc{
		font-size: 18px;
		color: black
		}
		.vat-price-wrap{
			font-size: 30px;
			color: red;
			font-weight: bold
		}
        </style>
        <div style="height: 50px;"></div>
        <div class="kakao-title-wrap">
            <h1>결제가 정상적으로 완료되었습니다.</h1>
        </div>
        <div class="kakao-info-wrap">
            <div class="left-wrap">
                <div class="inner-con">
                    <div class="inner-title">주문 번호</div>
                    <div class="inner-desc">${v_r.reserve_no}</div>
                </div>
                <div class="inner-con">
                    <div class="inner-title">호텔 이름</div>
                    <div class="inner-desc">${v_r.hotel_name }</div>
                </div>
                <div class="inner-con">
                    <div class="inner-title">호텔 주소</div>
                    <div class="inner-desc">${v_r.hotel_basic_addr} ${hdto.hotel_detail_addr}</div>
                </div>
                <div class="inner-con">
                    <div class="inner-title">호텔 번호</div>
                    <div class="inner-desc">${v_r.hotel_tel}</div>
                </div>
                <div class="inner-con">
                    <div class="inner-title">객실 유형</div>
                    <div class="inner-desc">${v_r.room_name }</div>
                </div>
                <div class="inner-con">
                    <div class="inner-title">체크 인</div>
                    <div class="inner-desc">${v_r.reserve_in} 15:00</div>
                </div>
                <div class="inner-con">
                    <div class="inner-title">체크 아웃</div>
                    <div class="inner-desc">${v_r.reserve_out} 11:00</div>
                </div>
                <div class="inner-con">
                    <div class="inner-title">취소 마감일</div>
                    <div class="inner-desc">체크 인 하루 전 18:00까지</div>
                </div>
                <div class="inner-con">
                    <div class="inner-title">유의사항</div>
                    <div class="inner-desc" style="color: red">※취소 마감일 이후 전일정 취소/변경/환불 불가 조건입니다.</div>
                </div>
            </div>

            <div class="right-wrap">
                <div class="inner-con">
                    <div class="inner-title">투숙객 이름</div>
                    <div class="inner-desc">${v_r.reserve_name }</div>
                </div>
                <div class="inner-con">
                    <div class="inner-title">투숙객 연락처</div>
                    <div class="inner-desc">${v_r.reserve_phone }</div>
                </div>
                <div class="inner-con">
                    <div class="inner-title">투숙 인원</div>
                    <div class="inner-desc">${v_r.reserve_people }</div>
                </div>
                <div class="inner-con">
                    <div class="inner-title">결제 방식</div>
                    <div class="inner-desc">${v_r.reserve_pay_type}</div>
                </div>
                <div class="inner-con">
                    <div class="inner-title">쿠폰</div>
                    <div class="inner-desc">${v_r.reserve_coupon_use}</div>
                </div>
                <hr>
                <div class="inner-con">
                    <div class="vat-desc">총 결제 금액(VAT포함)</div>
                    <div class="vat-price-wrap"><span class="vat-price"><fmt:formatNumber value="${v_r.reserve_price}" pattern="#,###"></fmt:formatNumber></span>원</div>
                </div>
                <a href="${pageContext.request.contextPath}/reserve/list" class="btn btn-reserve btn-block" >예약 내역 보러 가기</a>
            </div>
        </div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>