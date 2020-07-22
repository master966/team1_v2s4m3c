package dev.mvc.deliverystate;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.deliverystate.DeliverystateProc")
public class DeliverystateProc implements DeliverystateProcInter {
  
  @Autowired
  private DeliverystateDAOInter deliverystateDAO;

  @Override
  public int create(DeliverystateVO deliverystateVO) {
    int cnt = this.deliverystateDAO.create(deliverystateVO);
    return cnt;
  }

  @Override
  public List<DeliverystateVO> list() {
    List<DeliverystateVO> list = this.deliverystateDAO.list();
    return list;
  }

  @Override
  public DeliverystateVO read(int stateno) {
    DeliverystateVO deliverystateVO = this.deliverystateDAO.read(stateno);
    return deliverystateVO;
  }

  @Override
  public int update(DeliverystateVO deliverystateVO) {
    int cnt = this.deliverystateDAO.update(deliverystateVO);
    return cnt;
  }

  @Override
  public int delete(int stateno) {
    int cnt = this.deliverystateDAO.delete(stateno);
    return cnt;
  }
  
}
