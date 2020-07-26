package dev.mvc.recipe;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUploadException;
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
import dev.mvc.rating.RatingProcInter;
import dev.mvc.rating.RatingVO;
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
  
  @Autowired
  @Qualifier("dev.mvc.rating.RatingProc")
  private RatingProcInter ratingProc;

  public RecipeCont() {
    System.out.println("--> RecipeCont created.");
  }

  // http://localhost:9090/team1/recipe/create.do
  /**
  * ��� ��
  * @param recipeVO
  * @return
  */
  @RequestMapping(value = "/recipe/create.do", method = RequestMethod.GET)
  public ModelAndView create(RecipeVO recipeVO) {
    ModelAndView mav = new ModelAndView();
    

    
    mav.setViewName("/recipe/create"); 

    return mav;
  }

  // http://localhost:9090/team1/recipe/create.do
  /**
   * ��� ó��
   * @param
   * @return
   */
  @RequestMapping(value = "/recipe/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, RecipeVO recipeVO, MultipartFile[] file2MF, HttpSession session) {
    // HttpServletRequest request --> Spring �� request ��ü ����� �ڵ� �Ҵ� --> setIp , IP
    ModelAndView mav = new ModelAndView();

    // -------------------------------------------------------------------
    // ���� �̹����� ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String file1 = ""; // main image
    String thumb1 = ""; // preview image

    String upDir = Tool.getRealPath(request, "/recipe/storage/main_images"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    MultipartFile mf = recipeVO.getFile1MF();
    System.out.println("mf:" + mf);
    long size1 = mf.getSize(); // ���� ũ��
    if (size1 > 0) { // ���� ũ�� üũ
      // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      file1 = Upload.saveFileSpring(mf, upDir);

      if (Tool.isImage(file1)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
        thumb1 = Tool.preview(upDir, file1, 120, 80);
      }

    }
    // -------------------------------------------------------------------
    // ���� �̹����� ���� ���� �ڵ� ����
    // -------------------------------------------------------------------

    recipeVO.setIp(request.getRemoteAddr()); // ������ IP �ڵ�
    recipeVO.setFile1(file1);
    recipeVO.setThumb1(thumb1);
    recipeVO.setSize1(size1);

    
    //ī�װ�
    String category = "";
    category = request.getParameter("type") + "/" + request.getParameter("case") + "/" + request.getParameter("how")
              + "/" + request.getParameter("ingred");
    System.out.println(category);
    recipeVO.setCategory(category);
    
    //�丮����
    String infofood = "";
    infofood = request.getParameter("num_person") + "/" + request.getParameter("time") + "/" + request.getParameter("difficulty"); 
    recipeVO.setInfofood(infofood);
    
    //�丮���
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
      ingredfood_arr = new String[cnt_ingred+1]; // 0 1 2 �� �ʿ��ϹǷ�.
      
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
    
   
    
    
    
    int cnt = this.recipeProc.create(recipeVO); // Call By Reference�� ����
    // Spring <----> contentsVO <----> MyBATIS
    // Spring�� MyBATIS�� contentsVO�� �����ϰ�����.
    // MyBATIS�� insert �� PK�� ����. PK�÷��� contentsno������ ���� ������ PK�� �Ҵ�.
    int recipeno = recipeVO.getRecipeno(); // MyBATIS ���ϵ� PK
    
    
    /* �丮���� */
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
      contents = request.getParameter("contents"+i); // ����0, ����1, ����2
      
      
      // -------------------------------------------------------------------
      // �丮���� �̹����� ���� ���� �ڵ� ����
      // -------------------------------------------------------------------
      String file_seq = ""; // main image
      String thumb_seq = ""; // preview image

      String upDir_seq = Tool.getRealPath(request, "/recipe/storage/seq_images"); // ���� ���
     
      // ���� ������ ����� fnamesMF ��ü�� ������.
      MultipartFile mf2 = file2MF[i];
      long size_seq = mf2.getSize(); // ���� ũ��
      System.out.println("size_seq: " + size_seq);
      if (size_seq > 0) { // ���� ũ�� üũ
        // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
        // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
        file_seq = Upload.saveFileSpring(mf2, upDir_seq);

        if (Tool.isImage(file_seq)) { // �̹������� �˻�
          // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
          thumb_seq = Tool.preview(upDir_seq, file_seq, 120, 80);
        }

      }
      // -------------------------------------------------------------------
      // �丮���� �̹����� ���� ���� �ڵ� ����
      // -------------------------------------------------------------------
      
      recipeseqVO.setFile_seq(file_seq);
      recipeseqVO.setThumb_seq(thumb_seq);
      recipeseqVO.setSize_seq(size_seq);
      recipeseqVO.setContents(contents);
      recipeseqVO.setRecipeno(recipeVO.getRecipeno());
      recipeseqVO.setMemberno((Integer)session.getAttribute("memberno"));
      recipeseqVO.setStep((i+1));
      this.recipeseqProc.create(recipeseqVO);
    }
    
    mav.addObject("cnt", cnt);
    mav.addObject("recipeno", recipeno); // request�� ����
    

    
    mav.setViewName("redirect:/recipe/list.do");

    return mav;
  }
  
  
  
  /**
   * ��� + �˻� + ����¡ ���� + ��� ����
   * http://localhost:9090/team1/recipe/list.do?recipecateno=1&word=ġŲ&nowPage=1
   * @param recipecateno
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
    
    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("recipecateno", recipecateno); // #{cateno}
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);  // �������� ����� ���ڵ��� ������ �����ϱ����� ���     
    
    // �˻� ���
    List<Member_Recipe_join> list = recipeProc.list_by_recipecateno_search_paging(map);
    mav.addObject("list", list);
    
    // �˻��� ���ڵ� ����
    int search_count = recipeProc.search_count(map);
    mav.addObject("search_count", search_count);
  
    RecipecateVO recipecateVO = recipecateProc.read(recipecateno);
    mav.addObject("recipecateVO", recipecateVO);
    
    RecipecategrpVO recipecategrpVO = recipecategrpProc.read(recipecateVO.getRecipecategrpno());
    mav.addObject("recipecategrpVO", recipecategrpVO);

    mav.addObject("list_cate", recipecateProc.list_seqno_asc());
    /*
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
     * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
     * 
     * @param listFile ��� ���ϸ� 
     * @param cateno ī�װ���ȣ 
     * @param search_count �˻�(��ü) ���ڵ�� 
     * @param nowPage     ���� ������
     * @param word �˻���
     * @return ����¡ ���� ���ڿ�
     */ 
    String paging = recipeProc.pagingBox("list.do", recipecateno, search_count, nowPage, word);
    mav.addObject("paging", paging);
    mav.addObject("nowPage", nowPage);

    // ��������
    mav.setViewName("/recipe/list_by_recipecateno_search_paging_img_grid1");
    
    return mav;
  }    
  
  
  
  /**
   * ���� �� ����Ʈ
   * ��� + �˻� + ����¡ ���� + �������
   * http://localhost:9090/team1/recipe/list_by_rating.do
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
    
    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("recipecateno", recipecateno); // #{cateno}
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);  // �������� ����� ���ڵ��� ������ �����ϱ����� ���     
    
    // �˻� ���
    List<Member_Recipe_join> list = recipeProc.list_by_rating_search_paging(map);
    mav.addObject("list", list);
    
    // �˻��� ���ڵ� ����
    int search_count = recipeProc.search_count(map);
    mav.addObject("search_count", search_count);
  
    RecipecateVO recipecateVO = recipecateProc.read(recipecateno);
    mav.addObject("recipecateVO", recipecateVO);
    
    RecipecategrpVO recipecategrpVO = recipecategrpProc.read(recipecateVO.getRecipecategrpno());
    mav.addObject("recipecategrpVO", recipecategrpVO);

    /*
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
     * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
     * 
     * @param listFile ��� ���ϸ� 
     * @param cateno ī�װ���ȣ 
     * @param search_count �˻�(��ü) ���ڵ�� 
     * @param nowPage     ���� ������
     * @param word �˻���
     * @return ����¡ ���� ���ڿ�
     */ 
    String paging = recipeProc.pagingBox("list.do", recipecateno, search_count, nowPage, word);
    mav.addObject("paging", paging);
    mav.addObject("nowPage", nowPage);

    // ��������
    mav.setViewName("/recipe/list_by_recipecateno_search_paging_img_grid1");
    
    return mav;
  }    
  

  // http://localhost:9090/team1/recipe/read.do
  /**
   * ��ȸ
   * @param recipeno
   * @param request
   * @param session
   * @return
   */
  @RequestMapping(value="/recipe/read.do", method=RequestMethod.GET )
  public ModelAndView read(int recipeno, HttpServletRequest request, HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    recipeProc.hits(recipeno); // ��ȸ�� ����
    
    RecipeVO recipeVO = this.recipeProc.read(recipeno);
    //infofood �ɰ���  ����/����/����
    String infofood_all = recipeVO.getInfofood(); // ����/����/����
    String[] infofood_arr = infofood_all.split("/"); // �ƹ��͵� ������ infofood_arr[0] ���� �ȵ�
    
    for(int i = 0; i < infofood_arr.length; i++) {
      mav.addObject("infofood_arr"+i, infofood_arr[i]);
      if(infofood_arr[i].equals("")) {
        System.out.println("NULL�Դϴ�~");
      }
    }

    int rating_int = (int)recipeVO.getRating(); // 3.8 --> 3
    double rating_sosu = recipeVO.getRating() - rating_int;
    System.out.println("rating_int: " + rating_int);
    System.out.println("rating_sosu: " + rating_sosu);
    
    mav.addObject("rating_int", rating_int);
    mav.addObject("rating_sosu", rating_sosu);
    
    //rating 
    if(session.getAttribute("memberno") != null) { // �α��� �� ȸ��
      int memberno = (Integer)session.getAttribute("memberno");
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("recipeno", recipeno);
      map.put("memberno", memberno);
      int check_rating = ratingProc.check_rating(map);
      mav.addObject("check_rating", check_rating);
      
      HashMap<String, Object> map2 = new HashMap<String, Object>();
      map2.put("recipeno", recipeno);
      map2.put("memberno", recipeVO.getMemberno());
      RatingVO ratingVO = ratingProc.read(map2);
      mav.addObject("ratingVO", ratingVO);
      
    }
    
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
   * ����
   * @param recipeno
   * @param request
   * @return
   */
  @ResponseBody
  @RequestMapping(value="/recipe/read_rating.do", method=RequestMethod.POST, 
                                                  produces = "text/plain;charset=UTF-8" )
  public String read_rating(RecipeVO recipeVO, int index, HttpSession session) {
    int recipeno = recipeVO.getRecipeno();
    
    // 0 -> 0.5�� / 1 -> 1�� / 2 -> 1.5�� / 3 -> 2�� / ... ==> ������2 + 0.5
    System.out.println("index: " + index);
    double real_index_num = (double)index / 2 + 0.5; // ���� 0.5~ 5�� ǥ��ȭ
    
    // rating ����
    RatingVO ratingVO = new RatingVO();
    int memberno = (Integer)session.getAttribute("memberno");
    ratingVO.setMemberno(memberno);
    ratingVO.setRecipeno(recipeno);
    ratingVO.setRating(real_index_num);
    ratingProc.create_rating(ratingVO);

    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("recipeno", recipeno);
    map.put("memberno", memberno);
    
    ratingVO = ratingProc.read(map);
    double real_rating = ratingVO.getRating();
    
    // rating �ߴ��� Ȯ��
    int check_rating = ratingProc.check_rating(map);
    
    System.out.println("real_index_num: " + real_index_num);
    double rating_sum = 0.0;
    rating_sum = rating_sum + real_index_num;
    
    int count = recipeProc.increaseRatingCnt(recipeno); // rating_cnt 1 ����
    
    System.out.println("rating_sum: " + rating_sum);
    recipeVO.setRating_sum(rating_sum); // rating ����
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
    System.out.println("4�� ���;� �Ǵµ�: " + (int)3.5);
    
    JSONObject obj = new JSONObject();
    obj.put("count",count);
    obj.put("rating_int", rating_int);
    obj.put("rating_sosu", rating_sosu);
    obj.put("rating_cnt", recipeVO.getRating_cnt());
    obj.put("real_index_num", real_index_num);
    obj.put("check_rating", check_rating);
    obj.put("real_rating", real_rating);
    
    System.out.println(obj.toString());
    
    return obj.toString();     
  }
  
  
//http://localhost:9090/team1/recipe/delete.do
   /**
  * ���� ó��
  * 
  * @param recipeno
  * @return
  */
  @RequestMapping(value = "/recipe/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int recipeno, HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    RecipeVO recipeVO = recipeProc.read(recipeno);
    
    // -------------------------------------------------------------------
    // ���� �̹��� ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    Upload upload;
    try {
      upload = new Upload(request);
      
      String file1_old = ""; // main image
      String thumb1_old = "";

      String delDir = Tool.getRealPath(request, "/recipe/storage/main_images"); // ���� ���
      // ���� ������ ����� fnamesMF ��ü�� ������.
      
      file1_old = recipeVO.getFile1();
      thumb1_old = recipeVO.getThumb1();
      upload.deleteFile(delDir, file1_old);  
      upload.deleteFile(delDir, thumb1_old);

    } catch (FileUploadException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    // -------------------------------------------------------------------
    // ���� �̹��� ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    
    // -------------------------------------------------------------------
    // �丮���� �̹��� ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    
    try {
      upload = new Upload(request);
      
      String file1_seq_old = ""; // main image
      String thumb1_seq_old = "";

      String delDir = Tool.getRealPath(request, "/recipe/storage/seq_images"); // ���� ���
      // ���� ������ ����� fnamesMF ��ü�� ������.
      
      int num = recipeseqProc.count_by_recipeno(recipeno);
      System.out.println("num? : " + num);
      HashMap<String, Object> map = null;
      RecipeseqVO recipeseqVO = new RecipeseqVO();
      for(int i = 0; i < num; i++) {
        map = new HashMap<String, Object>();
        map.put("recipeno", recipeno);
        map.put("step", i+1);
        recipeseqVO = recipeseqProc.read_by_recipeno_step(map);
        
        file1_seq_old = recipeseqVO.getFile_seq();
        thumb1_seq_old = recipeseqVO.getThumb_seq();
        
        System.out.println("file1_seq_old: " + file1_seq_old);
        System.out.println("thumb1_seq_old: " + thumb1_seq_old);
        
        upload.deleteFile(delDir, file1_seq_old);  
        upload.deleteFile(delDir, thumb1_seq_old);
      }
      
      
    } catch (FileUploadException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    // -------------------------------------------------------------------
    // �丮���� �̹��� ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    
    
    
    int cnt_delete = this.recipeProc.delete(recipeno);
    mav.addObject("cnt_delete", cnt_delete); // request�� ����
  
    if (cnt_delete == 1) {
      mav.setViewName("redirect:/recipe/list.do"); // spring ��ȣ��
    } 
    
    return mav;
  }
  
  
  // http://localhost:9090/team1/recipe/update.do
  /**
   * ������
   * 
   * @param recipeno
   * @return
   */
  @RequestMapping(value = "/recipe/update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int recipeno) {

    ModelAndView mav = new ModelAndView();

    RecipeVO recipeVO = this.recipeProc.read(recipeno);
    mav.addObject("recipeVO", recipeVO); // request ��ü�� ����
    
    int num = recipeseqProc.count_by_recipeno(recipeVO.getRecipeno());
    HashMap<String, Object> map = null;
    RecipeseqVO recipeseqVO = new RecipeseqVO();
    for(int i = 0; i < num; i++) {
      map = new HashMap<String, Object>();
      map.put("recipeno", recipeno);
      map.put("step", i+1);
      recipeseqVO = recipeseqProc.read_by_recipeno_step(map);
      mav.addObject("contents"+i, recipeseqVO.getContents());
      mav.addObject("file_seq"+i, recipeseqVO.getFile_seq());
    }
    

    mav.setViewName("/recipe/update"); 
    return mav; // forward
  }
  
  
  // http://localhost:9090/team1/recipe/update.do
  /**
   * ���� ó��
   * @param recipeVO
   * @param request
   * @param file2MF
   * @param session
   * @return
   */
  @RequestMapping(value = "/recipe/update.do", method = RequestMethod.POST)
  public ModelAndView update(RecipeVO recipeVO, HttpServletRequest request, 
                             MultipartFile[] file2MF, HttpSession session) {
    ModelAndView mav = new ModelAndView();

    //System.out.println(recipeVO.getRecipeno());
    //System.out.println(recipeVO.getTitle());
    
    // ���� ����
    RecipeVO recipeVO_prev = recipeProc.read(recipeVO.getRecipeno());
    
    String file1_old = recipeVO_prev.getFile1();  // main image
    String thumb1_old = recipeVO_prev.getThumb1(); // thumb image
    String file1_seq_old = ""; // seq image
    String thumb1_seq_old = ""; // seq image
    

    // new ���� 
    String file1_new = recipeVO.getFile1();
    String thumb1_new = recipeVO.getThumb1();
    String file1_seq_new = "";
    String thumb1_seq_new = "";
    

    // -------------------------------------------------------------------
    // ���� ���� �̹��� ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    Upload upload;
    try {
      upload = new Upload(request);
      
      String delDir = Tool.getRealPath(request, "/recipe/storage/main_images"); // ���� ���
      // ���� ������ ����� fnamesMF ��ü�� ������.
      
      upload.deleteFile(delDir, file1_old);  
      upload.deleteFile(delDir, thumb1_old);
      
    } catch (FileUploadException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    // -------------------------------------------------------------------
    // ���� ���� �̹��� ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    
    
    
    // -------------------------------------------------------------------
    // ���� �丮���� �̹��� ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    
    try {
      upload = new Upload(request);
      
      String delDir = Tool.getRealPath(request, "/recipe/storage/seq_images"); // ���� ���
      // ���� ������ ����� fnamesMF ��ü�� ������.
      
      int num = recipeseqProc.count_by_recipeno(recipeVO.getRecipeno());
      System.out.println("num? : " + num);
      HashMap<String, Object> map = null;
      RecipeseqVO recipeseqVO = new RecipeseqVO();
      for(int i = 0; i < num; i++) {
        map = new HashMap<String, Object>();
        map.put("recipeno", recipeVO.getRecipeno());
        map.put("step", i+1);
        recipeseqVO = recipeseqProc.read_by_recipeno_step(map);
        
        file1_seq_old = recipeseqVO.getFile_seq();
        thumb1_seq_old = recipeseqVO.getThumb_seq();
        
        System.out.println("file1_seq_old: " + file1_seq_old);
        System.out.println("thumb1_seq_old: " + thumb1_seq_old);
        
        upload.deleteFile(delDir, file1_seq_old);  
        upload.deleteFile(delDir, thumb1_seq_old);
      }
      
      
      
      
    } catch (FileUploadException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

    // -------------------------------------------------------------------
    // ���� �丮���� �̹��� ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    
    
    
    
    // -------------------------------------------------------------------
    // new ���� �̹����� ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String file1 = ""; // main image
    String thumb1 = ""; // preview image

    String upDir = Tool.getRealPath(request, "/recipe/storage/main_images"); // ���� ���
    // ���� ������ ����� fnamesMF ��ü�� ������.
    MultipartFile mf = recipeVO.getFile1MF();
    System.out.println("mf:" + mf);
    long size1 = mf.getSize(); // ���� ũ��
    if (size1 > 0) { // ���� ũ�� üũ
      // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
      // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
      file1 = Upload.saveFileSpring(mf, upDir);

      if (Tool.isImage(file1)) { // �̹������� �˻�
        // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
        thumb1 = Tool.preview(upDir, file1, 120, 80);
      }

    }
    // -------------------------------------------------------------------
    // new ���� �̹����� ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    recipeVO.setFile1(file1);
    recipeVO.setThumb1(thumb1);
    recipeVO.setSize1(size1);
    
    
    
    // -------------------------------------------------------------------
    // new �丮���� �̹����� ���� ���� �ڵ� ����
    // -------------------------------------------------------------------
    String[] ingredseq_cnt_arr;
    int ingredseq_cnt = 0;
    
    if(request.getParameterValues("ingredseq_cnt") == null) {
      ingredseq_cnt = 0;
    }else {
      ingredseq_cnt_arr = request.getParameterValues("ingredseq_cnt"); // 1 2
      ingredseq_cnt = Integer.parseInt(ingredseq_cnt_arr[ingredseq_cnt_arr.length-1]); // 2
      
    }
    
    System.out.println("�ױ׷��������_�ÿ�Ƽ: " + ingredseq_cnt);
    
    HashMap<String, Object> map = null;
    for(int i = 0; i <= ingredseq_cnt; i++) {
      String contents = request.getParameter("contents"+i); // ����0, ����1, ����2
      
      
      map = new HashMap<String, Object>();
      map.put("recipeno", recipeVO.getRecipeno());
      map.put("step", i+1);
      RecipeseqVO recipeseqVO = recipeseqProc.read_by_recipeno_step(map);
      
      String upDir_seq = Tool.getRealPath(request, "/recipe/storage/seq_images"); // ���� ���
      
      //RecipeseqVO recipeseqVO = this.recipeseqProc.read(recipeVO.getRecipeno());
     
      // ���� ������ ����� fnamesMF ��ü�� ������.
      MultipartFile mf2 = file2MF[i];
      long size_seq = mf2.getSize(); // ���� ũ��
      System.out.println("size_seq: " + size_seq);
      if (size_seq > 0) { // ���� ũ�� üũ
        // mp3 = mf.getOriginalFilename(); // ���� ���ϸ�, spring.jpg
        // ���� ���� �� ���ε�� ���ϸ��� ���ϵ�, spring.jsp, spring_1.jpg...
        file1_seq_new = Upload.saveFileSpring(mf2, upDir_seq);

        if (Tool.isImage(file1_seq_new)) { // �̹������� �˻�
          // thumb �̹��� ������ ���ϸ� ���ϵ�, width: 120, height: 80
          thumb1_seq_new = Tool.preview(upDir_seq, file1_seq_new, 120, 80);
        }

      }
      // -------------------------------------------------------------------
      // �丮���� �̹����� ���� ���� �ڵ� ����
      // -------------------------------------------------------------------
      
//      System.out.println("1. " + file1_seq_new);
//      System.out.println("2. " + thumb1_seq_new);
//      System.out.println("3. " + size_seq);
//      System.out.println("4. " + contents);
//      System.out.println("5. " + recipeVO.getRecipeno());
//      System.out.println("6. " + (Integer)session.getAttribute("memberno"));
//      System.out.println("7. " + (i+1));
      
      
      recipeseqVO.setFile_seq(file1_seq_new);
      recipeseqVO.setThumb_seq(thumb1_seq_new);
      recipeseqVO.setSize_seq(size_seq);
      recipeseqVO.setContents(contents);
      recipeseqVO.setRecipeno(recipeVO.getRecipeno());
      recipeseqVO.setMemberno((Integer)session.getAttribute("memberno"));
      recipeseqVO.setStep((i+1));
      recipeseqProc.update_by_recipeno_step(recipeseqVO);
    }
    
    
    // ������Ʈ
    
    int cnt = this.recipeProc.update(recipeVO);
    mav.addObject("cnt", cnt); // request�� ����
    
    if (cnt == 1) {
      mav.setViewName("redirect:/recipe/list.do"); // spring ��ȣ��
    } 

    return mav;
  }
  
  
  
}
