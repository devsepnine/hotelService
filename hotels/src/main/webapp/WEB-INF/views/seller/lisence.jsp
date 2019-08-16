<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <div class="lisence_box">
        <div class="lisence_content">
            <form action="lisence" method="post">
                <input type="text" name="seller_lisence" placeholder="사업자 등록번호를 입력하세요" required  pattern="^[0-9]{10}$"><br>
                <input type="text" name="seller_name" placeholder="이름을 입력하세요"><br>
                <input type="submit" value="확인">
            </form>
        </div>
    </div>
</body>
</html>