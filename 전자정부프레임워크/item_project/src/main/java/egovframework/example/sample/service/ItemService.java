package egovframework.example.sample.service;

import java.util.List;

public interface ItemService {
	/**등록*/
	public String insertItem(ItemVO vo) throws Exception;
	/**목록*/
	public List<?> content_view(ItemVO vo) throws Exception;
	
}