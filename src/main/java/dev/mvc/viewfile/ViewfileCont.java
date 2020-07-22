package dev.mvc.viewfile;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class ViewfileCont {
  @Autowired
  @Qualifier("dev.mvc.viewfile.ViewfileProc")
  private ViewfileProcInter viewfileProc;

  // http://localhost:9090/team1/viewfile/create.do
  /**
   * 등록 폼
   * @return
   */  
  @RequestMapping(value="/viewfile/create.do", method=RequestMethod.GET )
  public ModelAndView create(int p_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/viewfile/create");
    
    return mav;
  }
  /**
   * 파일 등록
   * @param request
   * @param viewfileVO
   * @param goryno 게시판 카테고리 번호
   * @return
   */  
  @RequestMapping(value = "/viewfile/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request,
                                           ViewfileVO viewfileVO,
                                           int goryno) {
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    int p_no = viewfileVO.getP_no(); // 부모글 번호
    String vname = ""; // 원본 파일명
    String vupname = ""; // 업로드된 파일명
    long vsize = 0;  // 파일 사이즈
    String thumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/viewfile/storage"); // 절대 경로
    // 전송 파일이 없어도 fnamesMF 객체가 생성됨.
    List<MultipartFile> vnamesMF = viewfileVO.getVnamesMF();  // 파일 목록
    int count = vnamesMF.size(); // 전송 파일 갯수
    if (count > 0) { // 전송할 파일이 있다면
      for (MultipartFile multipartFile:vnamesMF) { // 파일 추출
        vsize = multipartFile.getSize(); // 파일 크기
        if (vsize > 0) { // 파일 크기 체크
          vname = multipartFile.getOriginalFilename(); // 원본 파일명, spring.jpg
          // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
          vupname = Upload.saveFileSpring(multipartFile, upDir); 
          
          if (Tool.isImage(vname)) { // 이미지인지 검사
            // thumb 이미지 생성후 파일명 리턴됨, width: 120, height: 80
            thumb = Tool.preview(upDir, vupname, 120, 80); 
          }
        }
        ViewfileVO vo = new ViewfileVO();
        vo.setP_no(p_no);
        vo.setVname(vname);
        vo.setVupname(vupname);
        vo.setThumb(thumb);
        vo.setVsize(vsize);
        
        upload_count = upload_count + viewfileProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------    
    mav.addObject("upload_count", upload_count);

    mav.addObject("p_no", viewfileVO.getP_no());

    System.out.println(viewfileVO.getP_no());
    
    mav.setViewName("redirect:/viewfile/create_msg.jsp");
    return mav;
  }  
  
  /**
   * 목록
   * http://localhost:9090/viewfile/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/viewfile/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<ViewfileVO> list = viewfileProc.list();
    mav.addObject("list", list);

    mav.setViewName("/viewfile/list");

    return mav;
  }  
  
  /**
   * 첨부 파일 1건 삭제 처리
   * 
   * @return
   */
  @RequestMapping(value = "/viewfile/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete_proc(HttpServletRequest request,
                                                int viewfileno) {
    ModelAndView mav = new ModelAndView();

    // 삭제할 파일 정보를 읽어옴.
    ViewfileVO viewfileVO = viewfileProc.read(viewfileno);
    
    String upDir = Tool.getRealPath(request, "/viewfile/storage"); // 절대 경로
    Tool.deleteFile(upDir, viewfileVO.getVupname()); // Folder에서 1건의 파일 삭제
    Tool.deleteFile(upDir, viewfileVO.getThumb()); // 1건의 Thumb 파일 삭제
    
    // DBMS에서 1건의 파일 삭제
    viewfileProc.delete(viewfileno);
        
    List<ViewfileVO> list = viewfileProc.list();        
    mav.addObject("list", list);
    
    mav.setViewName("redirect:/viewfile/list.do"); 

    return mav;
  }  
  
  
}
