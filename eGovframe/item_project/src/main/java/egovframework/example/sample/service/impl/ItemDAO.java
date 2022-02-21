package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.ItemVO;
import egovframework.example.sample.service.SampleVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("itemDAO")
public class ItemDAO  extends EgovAbstractDAO{
	/**등록*/
	public String insertItem(ItemVO vo) throws Exception {
		return (String) insert("itemDAO.insertItem", vo);
	}
	/**목록*/
	public List<?> content_view(ItemVO vo) throws Exception{
		// TODO Auto-generated method stub
		return list("itemDAO.content_view", vo);
	}
	
}