package dev.mvc.delivery;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.delivery.DeliveryProc")
public class DeliveryProc implements DeliveryProcInter {
  @Autowired 
  private DeliveryDAOInter deliveryDAO;

  @Override
  public int create(DeliveryVO deliveryVO) {
    int cnt = 0;
    cnt = this.deliveryDAO.create(deliveryVO);
    return  cnt;
  }

  @Override
  public List<DeliveryVO> list() {
    List<DeliveryVO> list = this.deliveryDAO.list();
    return list;
  }

  @Override
  public DeliveryVO read(int deliveryno) {
    DeliveryVO deliveryVO = this.deliveryDAO.read(deliveryno);
    return deliveryVO;
  }
  
  @Override
  public int update(DeliveryVO deliveryVO) {
    int cnt = 0;
    cnt = this.deliveryDAO.update(deliveryVO);
    return  cnt;
  }

  @Override
  public int delete(int deliveryno) {
    int cnt = 0;
    cnt = this.deliveryDAO.delete(deliveryno);
    return  cnt;
  }

}
