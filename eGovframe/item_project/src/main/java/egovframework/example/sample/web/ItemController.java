package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.ItemService;
import egovframework.example.sample.service.ItemVO;

@Controller
public class ItemController {
	@Resource(name = "itemService")
	private ItemService itemService;
	
	@RequestMapping(value = "itemWrite.do")
	public String additem() {
		return "item/itemWrite";
	}
	//Chrome >> http://localhost:9080/item_project/itemWrite.do
	
	@RequestMapping(value = "/itemWriteSave.do")
	public String itemWriteSave(ItemVO vo) throws Exception {

		itemService.insertItem(vo);
		return "item/writeResult";
	}
	@RequestMapping(value = "content_view.do")
	public String content_view(ItemVO vo, ModelMap model) throws Exception {
		List<?> itemList = itemService.content_view(vo);
		model.addAttribute("resultList", itemList);
		return "item/content_view";
	}
	//Chrome >> http://localhost:9080/item_project/itemList.do

}
// http://localhost:9080/item_project/itemWrite.do
// http://localhost:9080/item_project/content_view.do
