package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.ItemService;
import egovframework.example.sample.service.ItemVO;

@Service("itemService")
public class ItemServiceImpl implements ItemService{
	
	@Resource(name = "itemDAO")
	private ItemDAO itemDAO;
	
	//등록
	@Override
	public String insertItem(ItemVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return itemDAO.insertItem(vo);
	}
	
	//목록
	@Override
	public List<?> content_view(ItemVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return itemDAO.content_view(vo);
	}
	
	
}