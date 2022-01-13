package egovframework.sth.domain.board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egovframework.sth.domain.board.domain.BoardDTO;
import egovframework.sth.domain.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/board/dogList")
	public void bard(Model model,BoardDTO dto) {
		
		//model.addAttribute("list", service.boardList(dto));
		
	}
	
	@GetMapping("/board/catList")
	public void catboard(Model model) {
		
	}
	@GetMapping("/board/boardreg")
	public void regBoard() {
	}

	@GetMapping("/board/view")
	public Map<String, BoardViewVO> view(BoardDTO param) {
		Map<String, BoardViewVO> map = new HashMap<>();
		map.put("data", service.selBoardView(param));
		return map;
	}
	
	
	@ResponseBody
	@PostMapping("/board/test")
	public String test(@RequestBody BoardDTO dto){
		System.out.println("나이: "+dto.getB_age());
		System.out.println("제목:"+dto.getB_title());
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/board/insboard")
	public Map<String,Object> insboard(@RequestBody BoardDTO dto){
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.insBoard(dto));
		System.out.println("b_no:"+dto.getB_no()); //0일수 밖에 없는데
		val.put("b_no", dto.getB_no());
		
		return val;
	}
	
	@ResponseBody
	@PostMapping("/updpatImg")
	public int patimgUpload(@RequestBody MultipartFile[] imgs, int b_no) {
		System.out.println(b_no);
		System.out.println(imgs.length);
		
		return service.patimgUpload(imgs, b_no);
	}
	//임시 이미지
	@ResponseBody
    @PostMapping("/imgTempUpload")
    public Map<String, Object> imgTempUpload(@RequestBody MultipartFile[] imgs) {
        System.out.println("imgs.length:"+imgs.length);
		Map<String, Object> val = new HashMap<>();
        val.put("imgs", service.tempimgUpload(imgs));
        return val;
    }
	
	//이미지 삭제
		@ResponseBody
	    @GetMapping("/tempImgDelete")
	    public Map<String, Object> tmpImgDelete(Integer b_no,String imgNm) {
	        Map<String, Object> val = new HashMap<>();
	        String path = "/img/board_temp/b_" + 0 + "/" + imgNm;
	        val.put("result", service.delSaleModImg(path));
	        return val;
	    }
	
	//이미지 삭제
	@ResponseBody
    @GetMapping("/imgModDelete")
    public Map<String, Object> imgModDelete(Integer b_no, String imgNm) {
        Map<String, Object> val = new HashMap<>();
        String path = "/img/sale/b_" + b_no + "/" + imgNm;
        val.put("result", service.delSaleModImg(path));
        return val;
    }

	
	
}
