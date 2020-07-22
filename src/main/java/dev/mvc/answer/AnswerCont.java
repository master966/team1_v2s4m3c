package dev.mvc.answer;

import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.mvc.question.QuestionProcInter;

@Controller
public class AnswerCont {
  @Autowired
  @Qualifier("dev.mvc.answer.AnswerProc")
  private AnswerProcInter answerProc;
  
  @Autowired
  @Qualifier("dev.mvc.question.QuestionProc")
  private QuestionProcInter questionProc;
  
  /**
   * 답변 등록
   * @return
   */
  // http://localhost:9090/team1/blacklist/create.do
  @ResponseBody
  @RequestMapping(value="/answer/create.do", method=RequestMethod.POST,
                           produces="text/plain;charset=UTF-8")
  public String create(int questionno, int adminno, String antitle, String ancontent) {
    
    System.out.println("하위 " + questionno + ", " + adminno + ", " + antitle + ", " + ancontent);
    AnswerVO answerVO = new AnswerVO(questionno, adminno, antitle, ancontent);
    int cnt = this.answerProc.create(answerVO);
    System.out.println("등록결과:" + cnt);
    String state="Y";
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("questionno", questionno);
    map.put("state", state);
    JSONObject json = new JSONObject();
    this.questionProc.answer_regist(map);
    json.put("cnt", cnt);
    return json.toString();
  }
}
