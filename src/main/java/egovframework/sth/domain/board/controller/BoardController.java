package egovframework.sth.domain.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egovframework.sth.domain.board.domain.AnimalDTO;
import egovframework.sth.domain.board.domain.BoardDTO;
import egovframework.sth.domain.board.domain.BoardVO;
import egovframework.sth.domain.board.domain.BoardViewVO;
import egovframework.sth.domain.board.service.BoardService;
import egovframework.sth.domain.main.controller.MainController;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	
	@GetMapping("/board/boardList")
	public void boardList(Model model, BoardVO vo) {
		System.out.println(vo.getB_loc_sido());
		System.out.println(vo.getB_loc_gugun());
		System.out.println(vo.getAn_type2());
		System.out.println(vo.getAn_gender());
		System.out.println(vo.getB_tt());
		
		BoardVO vo2 = new BoardVO();
		System.out.println(vo.getAn_type1());
		String an_type1 = null;
		if(vo.getAn_type1() != null) {
			 an_type1 = vo.getAn_type1();
		}
		System.out.println(an_type1);
		vo2 = service.countBoard(vo);
		int nowPage = vo.getNowPage();
    	int cntPerPage = vo.getCntPerPage();
    	int total = vo2.getCountBoard();
    	
    	System.out.println(nowPage);
    	System.out.println(cntPerPage);
    	if (nowPage == 0 && cntPerPage == 0) {
    		nowPage = 1;
    		cntPerPage = 12;
    	} else if (nowPage == 0) {
    		nowPage = 1;
    	} else if (cntPerPage == 0) { 
    		cntPerPage = 12;
    	}
    	
    	System.out.println("total2:"+total);
    	System.out.println("2:"+nowPage);
    	System.out.println("2:"+cntPerPage);
    	
    	
		
    	vo = new BoardVO(total, nowPage,an_type1, cntPerPage,vo.getB_loc_sido(),vo.getB_loc_gugun(),vo.getB_tt(),vo.getAn_gender(),vo.getB_price(),vo.getAn_type2());
		model.addAttribute("list", service.boardList(vo));
		model.addAttribute("paging", vo);
		

	}
	
	

	@GetMapping("/board/catList")
	public void catboard(Model model) {

	}

	@GetMapping("/board/boardreg")
	public void regBoard() {

	}
	
	@GetMapping("/board/boardmod")
	public void modBoard(Model model,int b_no) {
		System.out.println("................................");
		System.out.println(service.selImgList(b_no).get(0).isEmpty());
		model.addAttribute("img_list",service.selImgList(b_no));
		
	}
	
	@ResponseBody
	@GetMapping("/board/boardmodImg")
	public void modBoardImg(int b_no) {
		System.out.println("b_no:"+b_no);
		service.selImgList(b_no);
		
	}

	@GetMapping("/board/view")
	public Map<String, BoardViewVO> view(BoardDTO param) {
		Map<String, BoardViewVO> map = new HashMap<>();
		map.put("data", service.selBoardView(param));
		return map;
	}

	@ResponseBody
	@PostMapping("/board/test")
	public String test(@RequestBody BoardDTO dto) {
		System.out.println("제목:" + dto.getB_title());

		return "success";
	}

	@ResponseBody
	@PostMapping("/board/insboard")
	public Map<String, Object> insboard(@RequestBody BoardDTO dto) {
		Map<String, Object> val = new HashMap<>();
		val.put("data", service.insBoard(dto));
		System.out.println("b_no:" + dto.getB_no()); 
		val.put("b_no",dto.getB_no());
		return val;
	}
	
	
	
	@ResponseBody
	@PostMapping("/board/insAnimal")
	public Map<String, Object> insAnimal(@RequestBody AnimalDTO dto) {
		Map<String, Object> val = new HashMap<>();
		val.put("data", service.insAnimal(dto));
		System.out.println(dto.getB_no());
		System.out.println(dto.getAn_no());
		
		val.put("an_no", dto.getAn_no());

		return val;
	}

	@ResponseBody
	@PostMapping("/updpatImg")
	public int patimgUpload(@RequestBody MultipartFile[] imgs, int an_no) {
		System.out.println(an_no);
		System.out.println(imgs.length);

		return service.patimgUpload(imgs, an_no);
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
