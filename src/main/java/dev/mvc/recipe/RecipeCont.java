package dev.mvc.recipe;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.members.MembersProcInter;
import dev.mvc.members.MembersVO;
import dev.mvc.recipecate.RecipecateProcInter;
import dev.mvc.recipecate.RecipecateVO;
import dev.mvc.recipecategrp.RecipecategrpProcInter;
import dev.mvc.recipecategrp.RecipecategrpVO;
import dev.mvc.recipeseq.RecipeseqProcInter;
import dev.mvc.recipeseq.RecipeseqVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;



@Controller
public class RecipeCont {


  @Autowired
  @Qualifier("dev.mvc.recipecategrp.RecipecategrpProc")
  private RecipecategrpProcInter recipecategrpProc;

  @Autowired
  @Qualifier("dev.mvc.recipecate.RecipecateProc")
  private RecipecateProcInter recipecateProc;

  @Autowired
  @Qualifier("dev.mvc.recipe.RecipeProc")
  private RecipeProcInter recipeProc;
  
  @Autowired
  @Qualifier("dev.mvc.recipeseq.RecipeseqProc")
  private RecipeseqProcInter recipeseqProc;

  @Autowired
  @Qualifier("dev.mvc.members.MembersProc")
  private MembersProcInter membersProc;

  public RecipeCont() {
    System.out.println("--> RecipeCont created.");
  }

  // http://localhost:9090/team1/recipe/create.do
  /**
   * 등록 폼
   * 
   * @return
   */
  @RequestMapping(value = "/recipe/create.do", method = RequestMethod.GET)
  public ModelAndView create(RecipeVO recipeVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recipe/create"); // webapp/contents/create.jsp
    
    //
    // RecipecateVO recipecateVO =
    // this.recipecateProc.read(recipeVO.getRecipecateno());
    // mav.addObject("recipecateVO", recipecateVO);
    //
    // RecipecategrpVO recipecategrpVO =
    // this.recipecategrpProc.read(recipecateVO.getRecipecategrpno());
    // mav.addObject("recipecategrpVO", recipecategrpVO);
    //

    return mav;
  }

  // http://localhost:9090/team1/recipe/create.do
  /**
   * 등록 처리
   * 
   * @param
   * @return
   */
  @RequestMapping(value = "/recipe/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, RecipeVO recipeVO, 
                                        @RequestParam("file2MF") MultipartFile[] file2MF) {
    // HttpServletRequest request --> Spring 이 request 객체 만들어 자동 할당 --> setIp , IP
    // 추출
    ModelAndView mav = new ModelAndView();

    // -------------------------------------------------------------------
    // 메인 이미지용 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String file1 = ""; // main image
    String thumb1 = ""; // preview image

    String upDir = Tool.getRealPath(request, "/recipe/storage/main_images"); // 절대 경로
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    MultipartFile mf = recipeVO.getFile1MF();
    System.out.println("mf:" + mf);
    long size1 = mf.getSize(); // 파일 크기
    if (size1 > 0) { // 파일 크기 체크
      // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      file1 = Upload.saveFileSpring(mf, upDir);

      if (Tool.isImage(file1)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
        thumb1 = Tool.preview(upDir, file1, 120, 80);
      }

    }
    // -------------------------------------------------------------------
    // 메인 이미지용 파일 전송 코드 종료
    // -------------------------------------------------------------------

    
  
    
    
    
    recipeVO.setIp(request.getRemoteAddr()); // 접속자 IP 자동

    /*
     * <insert id="create" parameterType="ContentsVO"> <!-- 등록 후 contentsno return.
     * --> <selectKey keyProperty="contentsno" resultType="int" order="BEFORE">
     * select contents_seq.nextval FROM dual </selectKey> INSERT INTO
     * contents(contentsno, memberno, cateno, title, content, web, ip, passwd, word,
     * rdate) VALUES(#{contentsno}, #{memberno}, #{cateno}, #{title}, #{content},
     * #{web}, #{ip}, #{passwd}, #{word}, sysdate) </insert>
     */

    // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    // cnt, contentsno return
    // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

    recipeVO.setFile1(file1);
    recipeVO.setThumb1(thumb1);
    recipeVO.setSize1(size1);


    
    // PK return 됨
    
    //카테고리
    String category = "";
    category = request.getParameter("type") + "/" + request.getParameter("case") + "/" + request.getParameter("how")
              + "/" + request.getParameter("ingred");
    System.out.println(category);
    recipeVO.setCategory(category);
    
    //요리정보
    String infofood = "";
    infofood = request.getParameter("num_person") + "/" + request.getParameter("time") + "/" + request.getParameter("difficulty"); 
    recipeVO.setInfofood(infofood);
    
    //요리재료
    int cnt_ingred;
    int cnt_ingred_max;
    String[] cnt_ingred_arr;
    String[] ingredfood_arr;
    
    if(request.getParameter("cnt_ingred") == null) {
      cnt_ingred = 0;
      ingredfood_arr = new String[1];
    }else {
      cnt_ingred_arr = request.getParameterValues("cnt_ingred"); // 1 2
      cnt_ingred_max = Integer.parseInt(cnt_ingred_arr[cnt_ingred_arr.length-1]); // 2
      cnt_ingred = cnt_ingred_max; // 2
      ingredfood_arr = new String[cnt_ingred+1]; // 0 1 2 가 필요하므로.
      
    }
    
    
    String result = "";
    for(int i=0; i<cnt_ingred+1; i++) { // 3
      String result2 = "";
      ingredfood_arr = request.getParameterValues("ingredfood"+i); // 1 a a a a a a  // 2 b b b b b b // 3 c c c c c c
      for(int j=0; j<ingredfood_arr.length; j++) {
        if(j==0) {
          result2 = result2 + "["+ ingredfood_arr[j] +"]" + "<br>";
        }else {
          result2 = result2 + ingredfood_arr[j] + " ";
        }
      }
      result2 = result2 + "<br>";
      result += result2;
    }
    
    System.out.println(result);
    recipeVO.setIngredfood(result);
    
    
    int cnt = this.recipeProc.create(recipeVO); // Call By Reference로 전송
    // Spring <----> contentsVO <----> MyBATIS
    // Spring과 MyBATIS가 contentsVO를 공유하고있음.
    // MyBATIS는 insert 후 PK를 저장. PK컬럼인 contentsno변수에 새로 생성된 PK를 할당.
    int recipeno = recipeVO.getRecipeno(); // MyBATIS 리턴된 PK
    //recipeseqVO.setRecipeno(recipeVO.getRecipeno());
    
    /* 요리순서 */
    RecipeseqVO recipeseqVO = new RecipeseqVO();
    
    String[] ingredseq_cnt_arr;
    int ingredseq_cnt = 0;
    String contents = "";
    
    if(request.getParameterValues("ingredseq_cnt") == null) {
      ingredseq_cnt = 0;
    }else {
      ingredseq_cnt_arr = request.getParameterValues("ingredseq_cnt"); // 1 2
      ingredseq_cnt = Integer.parseInt(ingredseq_cnt_arr[ingredseq_cnt_arr.length-1]); // 2
      
    }
    
    for(int i = 0; i <= ingredseq_cnt; i++) {
      contents = request.getParameter("contents"+i); // 내용0, 내용1, 내용2
      
      
      // -------------------------------------------------------------------
      // 요리순서 이미지용 파일 전송 코드 시작
      // -------------------------------------------------------------------
      String file_seq = ""; // main image
      String thumb_seq = ""; // preview image

      String upDir_seq = Tool.getRealPath(request, "/recipe/storage/seq_images"); // 절대 경로
      
      //RecipeseqVO recipeseqVO = this.recipeseqProc.read(recipeVO.getRecipeno());
     
      // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
      MultipartFile mf2 = file2MF[i];
      long size_seq = mf2.getSize(); // 파일 크기
      System.out.println("size_seq: " + size_seq);
      if (size_seq > 0) { // 파일 크기 체크
        // mp3 = mf.getOriginalFilename(); // 원본 파일명, spring.jpg
        // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
        file_seq = Upload.saveFileSpring(mf2, upDir_seq);

        if (Tool.isImage(file_seq)) { // 이미지인지 검사
          // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
          thumb_seq = Tool.preview(upDir_seq, file_seq, 120, 80);
        }

      }
      // -------------------------------------------------------------------
      // 요리순서 이미지용 파일 전송 코드 종료
      // -------------------------------------------------------------------
      
      
      
      
      
      recipeseqVO.setFile_seq(file_seq);
      recipeseqVO.setThumb_seq(thumb_seq);
      recipeseqVO.setSize_seq(size_seq);
      recipeseqVO.setContents(contents);
      recipeseqVO.setRecipeno(recipeVO.getRecipeno());
      recipeseqVO.setMemberno(1);
      recipeseqVO.setStep((i+1));
      this.recipeseqProc.create(recipeseqVO);
      
    }
    
    
    mav.addObject("cnt", cnt);
    mav.addObject("recipeno", recipeno); // request에 저장
    // request.setAttribute("cnt", cnt); // request에 저장
    mav.addObject("recipecateno", recipeVO.getRecipecateno());

    if (cnt == 1) { // 정상적으로 글이 등록된 경우만 글 수 증가
      // this.cateProc.increaseCnt(contentsVO.getCateno()); // 글수 증가

    }
    mav.setViewName("redirect:/recipe/create_msg.jsp");

    return mav;
  }
  
  
  
  
  
  
  
  
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9090/resort/contents/list.do
   * http://localhost:9090/resort/contents/list.do?cateno=1&word=스위스&nowPage=1
   * @param cateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/recipe/list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_recipecateno_search_paging(
      @RequestParam(value="recipecateno", defaultValue="1") int recipecateno,
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("recipecateno", recipecateno); // #{cateno}
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     
    


    
    // 검색 목록
    List<Member_Recipe_join> list = recipeProc.list_by_recipecateno_search_paging(map);
    mav.addObject("list", list);
    

    
    // 검색된 레코드 갯수
    int search_count = recipeProc.search_count(map);
    mav.addObject("search_count", search_count);
  
    RecipecateVO recipecateVO = recipecateProc.read(recipecateno);
    mav.addObject("recipecateVO", recipecateVO);
    
    RecipecategrpVO recipecategrpVO = recipecategrpProc.read(recipecateVO.getRecipecategrpno());
    mav.addObject("recipecategrpVO", recipecategrpVO);

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
     * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
     * 
     * @param listFile 목록 파일명 
     * @param cateno 카테고리번호 
     * @param search_count 검색(전체) 레코드수 
     * @param nowPage     현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
     */ 
    String paging = recipeProc.pagingBox("list.do", recipecateno, search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);


    
    // 갤러리형
    mav.setViewName("/recipe/list_by_recipecateno_search_paging_img_grid1");
    
    
    return mav;
  }    
  
  
  
  /**
   * 평점 순 리스트
   * 목록 + 검색 + 페이징 지원
   * @param recipecateno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/recipe/list_by_rating.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_rating_search_paging(
      @RequestParam(value="recipecateno", defaultValue="1") int recipecateno,
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("recipecateno", recipecateno); // #{cateno}
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);  // 페이지에 출력할 레코드의 범위를 산출하기위해 사용     
    


    
    // 검색 목록
    List<Member_Recipe_join> list = recipeProc.list_by_rating_search_paging(map);
    mav.addObject("list", list);
    

    
    // 검색된 레코드 갯수
    int search_count = recipeProc.search_count(map);
    mav.addObject("search_count", search_count);
  
    RecipecateVO recipecateVO = recipecateProc.read(recipecateno);
    mav.addObject("recipecateVO", recipecateVO);
    
    RecipecategrpVO recipecategrpVO = recipecategrpProc.read(recipecateVO.getRecipecategrpno());
    mav.addObject("recipecategrpVO", recipecategrpVO);

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
     * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
     * 
     * @param listFile 목록 파일명 
     * @param cateno 카테고리번호 
     * @param search_count 검색(전체) 레코드수 
     * @param nowPage     현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
     */ 
    String paging = recipeProc.pagingBox("list.do", recipecateno, search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);


    
    // 갤러리형
    mav.setViewName("/recipe/list_by_recipecateno_search_paging_img_grid1");
    
    
    return mav;
  }    
  
  
  
  
  
  
  // http://localhost:9090/team1/recipe/read.do
  /**
   * 조회
   * @return
   */
  @RequestMapping(value="/recipe/read.do", method=RequestMethod.GET )
  public ModelAndView read(int recipeno, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    recipeProc.hits(recipeno); // 조회수 증가
    
    RecipeVO recipeVO = this.recipeProc.read(recipeno);
    //infofood 쪼개기  ㅇㅇ/ㅇㅇ/ㅇㅇ
    String infofood_all = recipeVO.getInfofood(); // ㅇㅇ/ㅇㅇ/ㅇㅇ
    String[] infofood_arr = infofood_all.split("/"); // 아무것도 없으면 infofood_arr[0] 생성 안됨
    
    for(int i = 0; i < infofood_arr.length; i++) {
      mav.addObject("infofood_arr"+i, infofood_arr[i]);
      if(infofood_arr[i].equals("")) {
        System.out.println("NULL입니당~");
      }
    }



    int rating_int = (int)recipeVO.getRating(); // 3.8 --> 3
    double rating_sosu = recipeVO.getRating() - rating_int;
    System.out.println("rating_int: " + rating_int);
    System.out.println("rating_sosu: " + rating_sosu);
    
    mav.addObject("rating_int", rating_int);
    mav.addObject("rating_sosu", rating_sosu);
    
    
    
    
    
    mav.addObject("recipeVO", recipeVO); // request.setAttribute("recipeVO", recipeVO);
    
    RecipecateVO recipecateVO = this.recipecateProc.read(recipeVO.getRecipecateno());
    mav.addObject("recipecateVO", recipecateVO); 

    RecipecategrpVO recipecategrpVO = this.recipecategrpProc.read(recipecateVO.getRecipecategrpno());
    mav.addObject("recipecategrpVO", recipecategrpVO);
    
    List<RecipeseqVO> list_seq = recipeseqProc.list(recipeno);
    mav.addObject("list_seq", list_seq);
    
    MembersVO membersVO = membersProc.read(recipeVO.getMemberno()); 
    mav.addObject("membersVO", membersVO);
    
    
    
    mav.setViewName("/recipe/read"); 
    return mav;
  }
  

  /**
   * 평점
   * @param recipeno
   * @param request
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/recipe/read_rating.do", method=RequestMethod.POST, 
                                                  produces = "text/plain;charset=UTF-8" )
  public String read_rating(RecipeVO recipeVO, int index) {
    int recipeno = recipeVO.getRecipeno();
    
    // 0 -> 0.5점 / 1 -> 1점 / 2 -> 1.5점 / 3 -> 2점 / ... ==> 나누기2 + 0.5

    System.out.println("index: " + index);
    double real_index_num = (double)index / 2 + 0.5; // 평점 0.5~ 5로 표준화
    System.out.println("real_index_num: " + real_index_num);
    double rating_sum = 0.0;
    rating_sum = rating_sum + real_index_num;
    
    int count = recipeProc.increaseRatingCnt(recipeno); // rating_cnt 1 증가
    
    System.out.println("rating_sum: " + rating_sum);
    recipeVO.setRating_sum(rating_sum); // rating 총합
    recipeProc.addRating(recipeVO);
    
    
    recipeVO = recipeProc.read(recipeno);
    double rating = (double)recipeVO.getRating_sum() / recipeVO.getRating_cnt();
    
    recipeVO.setRating(rating);
    recipeProc.ratingUpdate(recipeVO);
    
    System.out.println("count: " + count);
    
    int rating_int = (int)recipeVO.getRating(); // 3.8 --> 3
    double rating_sosu = recipeVO.getRating() - rating_int;
    
    System.out.println("rating_int: " + rating_int);
    System.out.println("rating_sosu: " + rating_sosu);
    System.out.println("4가 나와야 되는데: " + (int)3.5);
    
    JSONObject obj = new JSONObject();
    obj.put("count",count);
    obj.put("rating_int", rating_int);
    obj.put("rating_sosu", rating_sosu);
    obj.put("rating_cnt", recipeVO.getRating_cnt());
    obj.put("real_index_num", real_index_num);
    
    System.out.println(obj.toString());
    
    return obj.toString();     
  }
  
  
}
