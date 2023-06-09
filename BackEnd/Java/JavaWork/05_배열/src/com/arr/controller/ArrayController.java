package com.arr.controller;
import java.util.Scanner;
import java.nio.file.spi.FileSystemProvider;
import java.util.Arrays;
import java.util.Random;


public class ArrayController {
	Scanner sc=new Scanner(System.in);
	public void basicArray() {
		//기본배열 활용하기
		//배열은 기본으로 제공되는 저장공간으로 생성(new)해서 사용을 한다.
		//배열의 저장구조는 선형구조이다.
		//저장순서가 있고, 저장소를 지칭하는 번호(인덱스)를 가진다.
		//배열 선언하기
		//배열자료형-> 기본자료형[]
		int[] intArr;//배열을 저장할수있는 변수를 선언
		//intArr=10; 안됨
		//원하는 크기만큼의 배열을 생성해서 할당을 해야한다.
		//배열생성하기 -> new연산자를 이용해서 생성
		//new 자료형[원하는갯수(길이) ]
		intArr=new int[3];
		
		//기본으로 생성했을때 각 저장소는 자료형의 기본값으로 초기화된다.
		//정수형(byte,short,int,long) : 0
		//실수형(float,double) : 0.0
		//문자형(String) : null
		//문자(char) : ' '
		
		//배열생성후 각 저장공간 활용하려면
		//인덱스 번호로 각 저장공간을 불러올수 있다.
		//인덱스 번호는 선언한 길이에 -1번 번호 까지 있다.
		System.out.println(intArr[0]);
		System.out.println(intArr[1]);
		System.out.println(intArr[2]);
		//초과한 인덱스번호를 호출하면???
		//System.out.println(intArr[3]); 에러
		
		//배열에 값 저장하기
		intArr[0]=1;
		intArr[1]=200;
		intArr[2]=-5;
		
		System.out.println(intArr[0]);
		System.out.println(intArr[1]);
		System.out.println(intArr[2]);

		//친구이름 저장하기
		//친구 3명의 이름을 저장하는 배열을 만들고
		//자신의 스티디원을 저장후 출력하기
		String[] friend;
		friend=new String[3];
		friend[0]="김찬은";
		friend[1]="나빈";
		friend[2]="이성진";
		System.out.println(friend[0]);
		System.out.println(friend[1]);
		System.out.println(friend[2]);
		friend[0].length();
		friend[0].charAt(0);
		
		//for문과 같이 배열 이용하기
		for(int i=0;i<3;i++) {
			System.out.println(intArr[i]);
		}
		//for문 이용해서 이름출력하기
		for(int i=0;i<3;i++) {
			System.out.println(friend[i]);
		}
		
		//배열에서 저장소의 길이를 제공하는 변수가 있음.
		//배열변수명.length;
		System.out.println(intArr.length);
		System.out.println(friend.length);
		
		//반복문을 이용해서 배열을 초기화
		//int형 배열 10개를 할당하고 각 저장공간에 1~10까지 수를 대입하기
//		int[] num=new int [10];
//		for(int i=0;i<num.length;i++) {
//			num[i]=i+1;
//		}
//		for(int i=0;i<num.length;i++) {
//			System.out.println(num[i]);
//		}
//		
//		//학생 5명의 키를 입력받아 저장하는 기능 구현하기
//		//저장 후 출력하기
//		double[] height=new double[5];
//		Scanner sc=new Scanner(System.in);
//		
//			
//		for(int i=0;i<height.length;i++) {
//			System.out.print("키 : ");
//			height[i]=sc.nextDouble();
//		}
//		for(int i=0;i<height.length;i++) {
//			System.out.println((i+1)+"번 학생키"+height[i]+"cm");
//		}
		//배열 선언시에 대입할 값이 정해져있다면
		//배열선언과 동시에 값을 초기화할수 있다.
		char[] alpha= {'a','b','c','d','e'};
		for(int i=0;i<alpha.length;i++) {
			System.out.println(alpha[i]);
		}
		char[] alpha2=new char[] {'A','B','C','D'};
			for(int i=0;i<alpha2.length;i++) {
				System.out.println(i+" "+alpha2[i]);
		}
		alpha=new char[] {'가','나','다','라'};
		alpha2=new char[10];	
		
		//배열은 한번선언된 길이는 변경되지 않는다.
		String[] names2=new String[3];
		names2[0]="홍길동";
		names2[1]="김길동";
		names2[2]="이길동";
		//names2[3]="박길동";//자동으로 길이가 증가하지 앟는다.
		names2=new String[4];//길이가 4로늘어나지만 이전 데이터는 사라진다.
		
		//배열은 저장된 데이터를 전체 순회해서 원하는 데이터를 찾을수 있다.
		int count=0;
		int[] numbers2= {10,20,30,40,50,60};
		//30이상인 값의 갯수를 구하는 기능
		for(int i=0;i<numbers2.length;i++) {
			if(numbers2[i]>=30) {
				count++;				
			}			
		}
		System.out.println("30이상인 값 : "+count+"개");
						
		//저장된 학생이름 중 김씨 학생의 수를 구하는 기능
		//버전업 사용자가 요청한 성씨를 학생수를 구하는 기능
		Scanner sc=new Scanner(System.in);
		String[] studentName= {"김현영","김찬은","김중근","김재훈","김예린","강민기","윤준호","윤나라"
				,"나빈","이성진","이동제","이다영","조윤진","정상준","이은지"};
		
		System.out.print("성씨을 입력하세요 : ");
		char sung=sc.next().charAt(0);
		int count2=0;
		for(int i=0;i<studentName.length;i++) {	
			if(studentName[i].charAt(0)==sung) {
				count2++;
			}						
		}
		System.out.println(sung+"씨 : "+count2+"명");
		
		//정수 10개를 랜덤으로 저장하는 기능 만들기.
		int[] rNum= new int[10];
		Random r=new Random();		
		
		for(int i=0;i<rNum.length;i++) {
			int rand=r.nextInt(100);
			rNum[i]+=rand;
			System.out.print(rNum[i]+" ");
		}
		System.out.println();
		//최대값, 최소값을 찾아내기!!
		int maxNum=rNum[0];
		int minNum=rNum[0];
		
	    for (int i=0;i<rNum.length;i++) {
	    	if(rNum[i]>maxNum) {
	    		maxNum=rNum[i];
	    	}
	    	if(rNum[i]<minNum) {
	    		minNum=rNum[i];
	    	}	 
	    }
	    System.out.println("최대값 : "+maxNum+" 최소값 : "+minNum);
	    
	    //배열은 선형구조로 순서가 있다.
	    //순서는 인덱스번호를 기준으로 순서를 정함.
	    //값을 정렬할 수 있다.
	    //배열의 저장값 위치변경 하기-> swrap
	    int[] testArr= {4,3,6,2,7,5,1};
	    for(int i=0;i<testArr.length;i++) {
	    	System.out.print(testArr[i]+" ");
	    }
	    int temp=testArr[0];
	    testArr[0]=testArr[1];
	    testArr[1]=temp;
	    System.out.println();
	    for(int i=0;i<testArr.length;i++) {
	    	System.out.print(testArr[i]+" ");
	    }	
	    
	    for(int i=0;i<testArr.length;i++) {
	    	for(int j=0;j<i;j++) {
//	    		int pre=testArr[j];
//	    		int next=testArr[i];
	    		//if(testArr[i]<testAr[j]
	    		if(testArr[i]<testArr[j]) {
	    			int t=testArr[i];
	    			testArr[i]=testArr[j];
	    			testArr[j]=t;
	    		}
	    	}
	    }
	    System.out.println();
	    for(int i=0;i<testArr.length;i++) {
	    	System.out.print(testArr[i]+" ");
	    }
	    
	    //배열 길이를 정하면 고정
	    String[] oriName= {"유병승","홍길동","김유신"};
	    oriName=new String[6];
	    for(int i=0;i<oriName.length;i++) {
	    	System.out.println(oriName[i]);
	    }
	    
	}
	
	public void arraysCopyTest() {
		//배열의 복사를 알아보자.
		//배열을 복사
		//1. 얕은복사 : 원본값을 공유하는 방식
		//2. 깊은복사 : 별도의 저장공간을 생성해서 데이터를 따로 관리하는 방식
		int[] num= {1,2,3,4,5,};
		//얕은 복사 -> 주소를 복사해줌.
		int[] copynum=num;//똑같은 주소라 똑같이 출력
		System.out.println(num);
		System.out.println("num "+Arrays.toString(num));
		System.out.println("copynum "+Arrays.toString(copynum));
		System.out.println("num[0] : "+num[0]);
		System.out.println("num[0] : "+copynum[0]);
		//주소값을 공유하기때문에 저장소가 한개!
		num[0]=100;
		System.out.println("num[0] : "+num[0]);
		System.out.println("copynum[0] : "+copynum[0]);
		
		//깊은복사 -> 값자체를 복사해서 새로운 저장소에 저장
		int[] deepcopy=new int[num.length];
		for(int i=0;i<num.length;i++) {
			deepcopy[i]=num[i];
		}
		System.out.println("num : "+Arrays.toString(num));
		System.out.println("deepcopy : "+Arrays.toString(deepcopy));
		num[1]=200;
		System.out.println("num : "+Arrays.toString(num));
		System.out.println("deepcopy : "+Arrays.toString(deepcopy));
		
		//java에서 제공하는 기능을 이용해서 깊은복사하기
		//Arrays클래스에서 제공하는 copy of()기능 이용하기
		int[] copy2=Arrays.copyOf(num,num.length);
		System.out.println("copy2"+Arrays.toString(copy2));
//		copy2[3]=-100;
//		System.out.println("num"+Arrays.toString(num));
//		System.out.println("copy2"+Arrays.toString(copy2));
		
		//배열전체를 깊은복사할때는 clone()을 이용해도된다.
		copy2=num.clone();
		System.out.println("copy2"+Arrays.toString(copy2));
		
		//System.arraycopy()이용하기
		//첫번째 : 원본배열
		//두번째 : 원본배열의 시작인덱스
		//세번쨰 : 복사될 배열
		//네번째 : 복사될배열의 시작인덱스
		//다섯번쨰 : 복사될 데이터 수 (길이)
		String[] names={"유병승","홍길동","김유신"};
		String[] extend=new String[names.length+5];
		System.arraycopy(names, 0, extend, 3, names.length);
		for(int i=0;i<extend.length;i++) {
			System.out.print(extend[i]+" ");
		}
		System.out.println();			
	}
	
	public void doubleArray() {
		//2차원 배열에 대해 알아보자
		//배열저장소 두개가 연결되어있는 구조
		//저장소는 바둑판처럼 저장구조를 가지고 있음
		int[][] intArr;
		intArr=new int[3][3];
		System.out.println(intArr);
		System.out.println(intArr[0]);
		System.out.println(intArr[1]);
		System.out.println(intArr[0][0]);
		System.out.println(intArr[0][1]);
		System.out.println(intArr[0][2]);
		System.out.println(intArr[1][0]);
		System.out.println(intArr[1][1]);
		System.out.println(intArr[1][2]);
		
		for(int i=0;i<intArr.length;i++) {
			for(int j=0;j<intArr.length;j++) {
				System.out.print(intArr[i][j]);
			}
			System.out.println();
		}
		intArr[0][0]=1;
		intArr[0][1]=2;
		intArr[0][2]=3;
		intArr[1][0]=4;
		intArr[1][1]=5;
		intArr[1][2]=6;
		intArr[2][0]=7;
		intArr[2][1]=8;
		intArr[2][2]=9;
		
		for(int i=0;i<intArr.length;i++) {
			for(int j=0;j<intArr[i].length;j++) {
				System.out.print(intArr[i][j]);
			}
			System.out.println();	
		}
		int[] arr=new int[10];
//		arr.length;
		String [][] names=new String[5][];
		names[0]=new String[3];
		names[1]=new String[5];
		names[2]=new String[10];
//		for(int i=0;i<names.length;i++) {
//			for(int j=0;j<names[i].length;j++) {
//				System.out.print(names[i][j]);
//			}
//			System.out.println();
//		}
		//3*3 2차원 배열을 생성하고
		//123
		//123
		//123을 각 인덱스에 저장하고 출력하기
		
		System.out.println();
		
		int[][] array=new int[3][3];

		for(int i=0;i<array.length;i++) {
			for(int j=0;j<array[i].length;j++) {
				array[i][j]=j+1;
			}
		}
		
		for(int i=0;i<array.length;i++) {
			for(int j=0;j<array[i].length;j++) {				
				System.out.print(array[i][j]);
			}System.out.println();
		}
		
		System.out.println();
		
		int[][] array1=new int[3][4];	
		int count=1;
		for(int i=0;i<array1.length;i++) {
			for(int j=0;j<array1[i].length;j++) {					
				array1[i][j]=count;
				count++;
			}
		}
		
		for(int i=0;i<array1.length;i++) {
			for(int j=0;j<array1[i].length;j++) {
				System.out.printf("%2d",array1[i][j]);
			}System.out.println();
		}
		
		//2차원 배열의 선언과 동시에 초기화
		String[][] study= {{"김중근","홍승우","윤준호","김현영"},{"김찬은","허성현","나빈","이성진"},{"김재훈","이다영","조장흠"},{"1","2","3",},{"4","5","6",}};
		for(int i=0;i<study.length;i++) {
			for(int j=0;j<study[i].length;j++) {
				System.out.print(study[i][j]+" ");
			}System.out.println();
		}
		//조 찾기
		Scanner sc=new Scanner(System.in);
		System.out.print("이름 : ");
		String name=sc.next();
		String msg="없는 조원 입니다.";
		for(int i=0;i<study.length;i++) {
			for(int j=0;j<study[i].length;j++) {
				if(study[i][j].equals(name)&&study[i].length==4) {
					msg=(i+1)+"조 "+study[i].length+"명";
					msg+=" "+Arrays.toString(study[i]);
					break;
				}
			}
		}System.out.println(msg);		
		
	}
	public void extraTest() {
	//배열에 대한 배열 데이터에 순회할때 편리하게 해보자.	
		int[] intArr= {1,2,3,4,5,6};
		//기본 for문 이용해서 각 인덱스에 접근함.
		for(int i=0;i<intArr.length;i++) {
			System.out.println(intArr[i]);
		}
		//forEach문을 이용해서 데이터 순회하기
		//for(자료형 변수명 : 배열명||CollectionFramework{ }
		System.out.println("forEach문을 이용해서 출력하기");
		for(int d : intArr) {
			if(d%2==0)
			System.out.println(d);
		}
		//forEach문은 배열에 있는 값을 수정할때는 사용할 수 없다.
		String[] hobby= {"농구","자전거","게임","코딩"};
		for(String h : hobby) {
			if(h.equals("코딩")) h="운동";//수정안됨
			//System.out.println(h);
		}
		
		//배열에 중복값 없이 저장하기
		//임의의 정수 10개 저장하기
		//1~50
		int[] random=new int[10];				
		for(int i=0;i<random.length;i++) {
			random[i]=(int)(Math.random()*10)+1;
			for(int j=0;j<i;j++) {
				if(random[i]==random[j]) {
					i--;
					break;
				}
			}
		}
		for(int i:random) {
			System.out.print(i+" ");
		}
		System.out.println();
		
		//로또만들기
		//1~45번호를 중복값없이 6자리 저장
		int[] lotto=new int[6];
		for (int i=0;i<lotto.length;i++) {
			lotto[i]=(int)(Math.random()*45+1);
			for(int j=0;j<i;j++) {
				if(lotto[i]==lotto[j]) {
					i--;
					break;
				}
			}
			
		}
		System.out.println("=== 로또 번호 ====");
		for(int i:lotto) {
			System.out.print(i+" ");
			
		}
		System.out.println();
		
		// up&down게임만들기
		// 랜덤으로 1~50까지의 수중 한개를 저장
		// 사용자에게 값을 입력받아 랜덤값과 비교하고 랜덤값이 크면 up출력
		// 작으면 Down출력 맞추면 정답입니다!! 짝짝짝! 출력 정답을 맞출때까지 진행!
		String ok="";
		

		int[] ud=new int[1];
		ud[0]=(int)(Math.random()*50+1);
		
		while(!ok.equals("정답")) {			
			System.out.println("==== Up&Down게임 만들기 ====\n입력 : ");
			int num=sc.nextInt();
			System.out.println(ud[0]);
			if(num>ud[0]) {
				System.out.println("Down\n정답입니다");
				ok="정답";	
			}
			else if(num<ud[0]) {
				System.out.println("Up");
			}
			
		}
		
		
		
	}
}
	


