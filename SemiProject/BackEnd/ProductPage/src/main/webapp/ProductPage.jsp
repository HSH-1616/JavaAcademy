<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
 <section>
      <div class="product">
        <div id="carouselExampleIndicators" class="carousel slide">
          <div class="carousel-indicators">
            <button
              type="button"
              data-bs-target="#carouselExampleIndicators"
              data-bs-slide-to="0"
              class="active"
              aria-current="true"
              aria-label="Slide 1"
            ></button>
            <button
              type="button"
              data-bs-target="#carouselExampleIndicators"
              data-bs-slide-to="1"
              aria-label="Slide 2"
            ></button>
            <button
              type="button"
              data-bs-target="#carouselExampleIndicators"
              data-bs-slide-to="2"
              aria-label="Slide 3"
            ></button>
            <button
              type="button"
              data-bs-target="#carouselExampleIndicators"
              data-bs-slide-to="3"
              aria-label="Slide 4"
            ></button>
          </div>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img
                src="./img/productPage/아이폰.png"
                class="d-block w-100"
                alt="..."
              />
            </div>
            <div class="carousel-item">
              <img
                src="./img/productPage/아이폰2.jpg"
                class="d-block w-100"
                alt="..."
              />
            </div>
            <div class="carousel-item">
              <img
                src="./img/productPage/아이폰3.png"
                class="d-block w-100"
                alt="..."
              />
            </div>
            <div class="carousel-item">
              <img
                src="./img/productPage/아이폰4.png"
                class="d-block w-100"
                alt="..."
              />
            </div>
          </div>
          <button
            class="carousel-control-prev"
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button
            class="carousel-control-next"
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>

        <div class="productInfo">
          <div id="productCategory">
            <a href="">홈</a>
            <ion-icon name="chevron-forward-sharp"></ion-icon>
            <a href="">디지털/가전</a>
            <ion-icon name="chevron-forward-sharp"></ion-icon>
            <a href="">스마트폰</a>
          </div>
          <h2 id="productName">
            아이폰 12프로 맥스 256기가 단순개봉 풀세트
            <span id="productStatus"><p>판매중</p></span>
          </h2>
          <h2 id="productPrice">800,000원</h2>

          <hr width="695px" color="#eeeeee" noshade />
          <div class="productIcon">
            <ion-icon name="heart"></ion-icon>
            <b> 11</b>
            <ion-icon name="eye"></ion-icon>
            <b> 54</b>
            <ion-icon name="time"></ion-icon>
            <b> 2일전</b>
            <a href=""
              ><ion-icon name="ban"></ion-icon>
              <b> 신고하기</b>
            </a>
          </div>
          <div class="productDetail">
            <table>
              <tr>
                <td>
                  <ul class="productClass">
                    <li>상품상태</li>
                    <li>바로결제</li>
                    <li>거래방식</li>
                    <li>거래지역</li>
                  </ul>
                </td>
                <td>
                  <ul class="productId">
                    <li>중고</li>
                    <li>가능</li>
                    <li style="color: #20c997">직거래</li>
                    <li>서울시 마포구 합정동</li>
                  </ul>
                </td>
              </tr>
            </table>
          </div>
          <div class="productBtn">
            <div id="heartBtn">
              <button><ion-icon name="heart"></ion-icon><b> 찜하기</b></button>
            </div>
            <div id="talkBtn">
              <button>
                <ion-icon name="chatbubbles"></ion-icon><b> 바로결제</b>
              </button>
            </div>
            <div id="fraudBtn">
              <button><ion-icon name="call"></ion-icon><b> 사기조회</b></button>
            </div>
          </div>
        </div>
      </div>
      <hr style="margin-top: 40px" color="#afafaf" noshade />
      <div class="productIntro">
        <div class="introContainer">
          <h3>상품정보</h3>
          <pre>
아이폰12프로맥스 256기가 그래파이트 판매합니다 

구성- 
-아이폰12프로맥스 256기가 그래파이트 
-아이폰박스 
-멕세이프 정품 어뎁터+충전기(미개봉) 
-신지모루 멕세이프 초슬림 케이스 
-신지모루 2.5 강화유리 -투명케이스2개 
-카메라 보호필름 

배터리효율-82% 

외관 상태 기스흡집 조차 없습니다 
병적으로 관리해서 상태 매우좋아요 
이구성에 이가격 어디가도 없습니다 

택배거래 직거래 안전결제 다 환영 
택배-4000 
안전결제-10000

            </pre
          >
          <div id="introTag">
            <div class="introBox">
              <ion-icon name="map-sharp"></ion-icon> <span>거래지역</span>
              <p>서울시 마포구 합정동</p>
            </div>
            <div class="introBox">
              <ion-icon name="apps-sharp"></ion-icon> <span>카테고리</span>
              <p><a href="">스마트폰</a></p>
            </div>
            <div class="introBox">
              <ion-icon name="pricetag-sharp"></ion-icon> <span>상품태그</span>
              <p>
                <a href=""> #아이폰 </a> <a href=""> #아이폰12 </a>
                <br />
                <a href=""> #아이폰 프로 맥스</a>
              </p>
            </div>
          </div>
        </div>
        <div class="shopInfo">
          <h3>상점정보</h3>
          <div class="shopProfile">
            <div id="profile">
              <a href=""><img src="./img/productPage/프로필.jpg" alt="" /></a>
            </div>
            <div id="userInfo">
              <a id="userName" href=""><p>user00</p></a>
              <a id="userProduct" href=""><p>상품 6</p></a>
            </div>
            <div id="userManner">
              <ion-icon name="thermometer-outline"></ion-icon>
              <b>43℃</b>
            </div>
          </div>
          <div id="otherProduct">
            <div id="opContent">
              <p>
                user00님의 판매 상품 <strong style="color: #20c997">6</strong>
              </p>
              <a href=""
                >더보기 <ion-icon name="chevron-forward-sharp"></ion-icon>
              </a>
            </div>
            <div id="opContainer">
              <div class="opProduct">
                <a href="">
                  <img src="./img/productPage/추가상품1.jpg" alt="" />
                  <p class="opPrice">40,000원</p>
                  <p class="opName">(새제품)지방...</p>
                </a>
              </div>
              <div class="opProduct">
                <a href="">
                  <img src="./img/productPage/추가상품2.jpg" alt="" />
                  <p class="opPrice">12,345원</p>
                  <p class="opName">[개인]양식,...</p>
                </a>
              </div>
              <div class="opProduct">
                <a href="">
                  <img src="./img/productPage/추가상품3.jpg" alt="" />
                  <p class="opPrice">12,345원</p>
                  <p class="opName">[가격내림]그...</p>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div id="comment">
        <h4>댓글</h4>

        <hr />
        <div class="cmtContainer">
          <div class="cmtProfile">
            <a href="">
              <img src="img/productPage/댓글1.jpg" alt="" />
            </a>
            <a href="" class="cmtUser"><p>user02</p></a>
          </div>
          <p class="cmt">거래원합니다~</p>
          <span class="time">2023.05.15 15:25</span>
          <!-- <a href="" class="writeCmt">답글쓰기</a> -->
          <button class="writeCmt">답글쓰기</button>
          <hr color="#eeeeee" noshade />
        </div>
        <div id="arrow"></div>
        <div class="reComment">
          <div class="cmtProfile">
            <a href="">
              <img src="img/productPage/프로필.jpg" alt="" />
            </a>
            <a href="" class="cmtUser"
              >user01 <span id="rcmtWriter">작성자</span>
            </a>
          </div>
          <p class="cmt">연락주세요</p>
          <span class="time">2023.05.15 15:30</span>
          <a href="" class="writeCmt">답글쓰기</a>
          <hr color="#eeeeee" noshade />
        </div>

        <div class="cmtContainer">
          <div class="cmtProfile">
            <a href="">
              <img src="img/productPage/댓글2.jpg" alt="" />
            </a>
            <a href="" class="cmtUser"><p>user03</p></a>
          </div>
          <p class="cmt">팔렸나요?</p>
          <span class="time">2023.05.16 17:24</span>
          <a href="" class="writeCmt">답글쓰기</a>
          <hr color="#eeeeee" noshade />
        </div>
        <div class="reComment">
          <div class="cmtProfile">
            <a href="">
              <img src="img/productPage/프로필.jpg" alt="" />
            </a>
            <a href="" class="cmtUser"
              >user01 <span id="rcmtWriter">작성자</span>
            </a>
          </div>
          <p id="a"><span>user03님</span>에게 달린 답글</p>
          <p class="cmt">연락주세요</p>
          <span class="time">2023.05.15 15:30</span>
          <a href="" class="writeCmt">답글쓰기</a>
          <hr color="#eeeeee" noshade />
        </div>
        <div id="textContainer">
          <textarea id="cmtText" placeholder="댓글을 입력하세요"></textarea>
          <span>0/100</span><br />
          <button id="cmtBtn">등록</button>
        </div>
      </div>
      <div id="relateProduct">
        <h2>연관상품</h2>
        <div id="rpContainer">
          <div class="rProduct">
            <a href=""
              ><img src="./img/productPage/연관1.jpg" alt="" />
              <p>갤럭시23</p></a
            >
          </div>
          <div class="rProduct">
            <a href=""
              ><img src="./img/productPage/연관2.jpg" alt="" />
              <p>중고폰매입 파손폰매입...</p></a
            >
          </div>
          <div class="rProduct">
            <a href=""
              ><img src="./img/productPage/연관3.jpg" alt="" />
              <p>아이폰 12프로맥스 128기...</p></a
            >
          </div>
          <div class="rProduct">
            <a href=""
              ><img src="./img/productPage/연관4.jpg" alt="" />
              <p>파손폰매입 중고폰매입...</p></a
            >
          </div>
          <div class="rProduct">
            <a href=""
              ><img src="./img/productPage/연관5.jpg" alt="" />
              <p>아이폰14pro 128기가</p></a
            >
          </div>
          <!-- <div class="rProduct">
            <a href=""
              ><img src="./img/연관6.jpg" alt="" />
              <p>중고폰매입 파손폰매입...</p></a
            >
          </div> -->
        </div>
      </div>
    </section>
    <%@ include file="/views/common/footer.jsp" %>