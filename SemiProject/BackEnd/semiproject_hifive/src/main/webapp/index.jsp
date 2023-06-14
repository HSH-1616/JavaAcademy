<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css" />
<section>
        <div>
            <div class="slideContainer">
                <h2 class="slideTitle">Event!</h2>
                <div class="btnContainer">
                    <ul class="slide">
                        <li>
                            <img src="https://pbs.twimg.com/media/E8BgJy6VUAYJIOd.jpg:large" alt="" />
                        </li>
                        <li>
                            <img src="https://pbs.twimg.com/media/FPbY95lVUAkpe7A.jpg:large" alt="" />
                        </li>
                        <li>
                            <img src="https://pbs.twimg.com/media/Ev4VrhDVEAUmdSR.jpg:large" alt="" />
                        </li>
                    </ul>
                    <button class="prevBtn btn"><</button>
                    <button class="nextBtn btn">></button>
                </div>
            </div>
            <div class="popularCategory">
                <div class="categoryIcon">
                    <ion-icon name="flame-outline"></ion-icon>
                    <p>인기 상품</p>
                </div>
                <div class="categoryIcon">
                    <ion-icon name="desktop-outline"></ion-icon>
                    <p>전자제품</p>
                </div>
                <div class="categoryIcon">
                    <ion-icon name="flame-outline"></ion-icon>
                    <p>가방</p>
                </div>
                <div class="categoryIcon">
                    <ion-icon name="shirt-outline"></ion-icon>
                    <p>의류</p>
                </div>
                <div class="categoryIcon">
                    <ion-icon name="desktop-outline"></ion-icon>
                    <p>전자제품</p>
                </div>
                <div class="categoryIcon">
                    <ion-icon name="flame-outline"></ion-icon>
                    <p>이벤트</p>
                </div>
            </div>
        </div>
    </section>
<script src="<%=request.getContextPath()%>/js/common/main.js"></script>
<%@ include file="/views/common/footer.jsp" %>