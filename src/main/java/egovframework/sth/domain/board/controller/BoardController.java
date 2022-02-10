package egovframework.sth.domain.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egovframework.sth.domain.board.domain.AnimalDTO;
import egovframework.sth.domain.board.domain.AuctionDTO;
import egovframework.sth.domain.board.domain.BoardDTO;
import egovframework.sth.domain.board.domain.BoardVO;
import egovframework.sth.domain.board.domain.BoardViewVO;
import egovframework.sth.domain.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	
	@GetMapping("/board/boardList")
	public void boardList(Model model,BoardVO vo, HttpServletRequest req) {
		PaginationInfo pagination = new PaginationInfo();
		pagination.setCurrentPageNo(Integer.parseInt(req.getParameter("page")));
		pagination.setPageSize(8);
		pagination.setRecordCountPerPage(10);
		pagination.setTotalRecordCount(service.countBoard(vo));
		vo.setRecordCountPerPage(pagination.getRecordCountPerPage());
		vo.setFirstIndex(pagination.getFirstRecordIndex());
		System.out.println(vo.getAn_gender());
		System.out.println(vo.getAn_type2());
		System.out.println(vo.getB_loc_sido());
		System.out.println(vo.getB_loc_gugun());
		System.out.println(vo.getB_price());
		System.out.println(vo.getB_tt());
		
		
		model.addAttribute("paginationInfo", pagination);
		model.addAttribute("list", service.boardList(vo));
		

	}
	
	

	@GetMapping("/board/catList")
	public void catboard(Model model) {

	}

	@GetMapping("/board/boardreg")
	public void regBoard() {

	}
	
	@GetMapping("/board/boardmod")
	public void modBoard(Model model,BoardVO vo) {
		model.addAttribute("data",service.modselboard(vo));
		
	}
	@ResponseBody
	@PostMapping("/board/updboard")
	public Map<String,Object> updBoard(@RequestBody BoardVO vo){
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.updBoard(vo));
		val.put("b_no", vo.getB_no());
		return val;
		
	}
	@ResponseBody
	@PostMapping("/board/updanimal")
	public Map<String,Object> updAnimal(@RequestBody BoardVO vo){
		Map<String,Object> val = new HashMap<>();
		val.put("result", service.updAnimal(vo));
		
		return val;
		
	}
	
	@ResponseBody
	@GetMapping("/board/boardmodImg")
	public List<String> modBoardImg(int b_no) {
		return service.selImgList(b_no);
		
	}
	
	@ResponseBody
	@PostMapping("/delete/img")
	public Map<String,Object> delimg(@RequestBody AnimalDTO dto){
		Map<String,Object> val = new HashMap<>();
		val.put("data", service.selinfo(dto));
		return val;
		
	}

	@GetMapping("/board/view")
	public Map<String, Object> view(BoardDTO param) {
		Map<String, Object> map = new HashMap<>();
		service.boardHit(param.getB_no());
		map.put("data", service.selBoardView(param));
		map.put("img", service.selImgList(param.getB_no()));
		return map;
	}

	@ResponseBody
	@PostMapping("/board/test")
	public String test(@RequestBody BoardDTO dto) {

		return "success";
	}

	@ResponseBody
	@PostMapping("/board/insboard")
	public Map<String, Object> insboard(@RequestBody BoardDTO dto) {
		Map<String, Object> val = new HashMap<>();
		val.put("data", service.insBoard(dto));
		val.put("b_no",dto.getB_no());
		val.put("b_enddt", dto.getB_enddt());
		return val;
	}
	
	
	
	@ResponseBody
	@PostMapping("/board/insAnimal")
	public Map<String, Object> insAnimal(@RequestBody AnimalDTO dto) {
		Map<String, Object> val = new HashMap<>();
		val.put("data", service.insAnimal(dto));
		
		val.put("an_no", dto.getAn_no());

		return val;
	}

	@ResponseBody
	@PostMapping("/updpatImg")
	public int patimgUpload(@RequestBody MultipartFile[] imgs, int an_no) {

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
	
	@ResponseBody
	@PostMapping("/board/insAuction")
	public Map<String,Object> insAuction(@RequestBody AuctionDTO dto){
		Map<String,Object> val = new HashMap<>(); 
		val.put("data", service.insAuction(dto));
		return val;
	}

	
	
}
