package egovframework.sth.domain.board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import egovframework.sth.domain.board.domain.AnimalDTO;
import egovframework.sth.domain.board.domain.AuctionDTO;
import egovframework.sth.domain.board.domain.BoardDTO;
import egovframework.sth.domain.board.domain.BoardVO;
import egovframework.sth.domain.board.domain.BoardViewVO;
import egovframework.sth.domain.board.mapper.BoardMapper;
import egovframework.sth.global.common.FileUtils;
@Service
public class BoardService {
	
	@Autowired
	private BoardMapper mapper;
	@Autowired
	FileUtils futils;
	
	public BoardViewVO selBoardView(BoardDTO param) {
		return mapper.selBoardView(param);
	}
	
	
	public List<BoardVO> boardList(BoardVO vo){
		if(vo.getB_price() == 0) {
			vo.setB_price(1);
		}
		
		return mapper.boardList(vo);
	}
	
	public BoardVO countBoard(BoardVO vo) {
		if(vo.getB_price() == 0) {
			vo.setB_price(1);
		}
		return mapper.countBoard(vo);
	}
	
	public List<String> selImgList(int an_no){
		String folder = "/img/board/an_"+an_no;
		String path = futils.getBasePath(folder);
		
		return futils.getFileNameList(path);
	}
	
	public BoardVO modselboard(BoardVO vo) {
		return mapper.modselboard(vo);
	};
	@Transactional
	public int updBoard(BoardVO vo) {
		mapper.updateAnimal(vo);
		return mapper.updateBoard(vo);
	}
	
	public int updAnimal(BoardVO vo) {
		return mapper.updateAnimal(vo);
	}
	
	public AnimalDTO selinfo(AnimalDTO dto) {
		AnimalDTO vo = mapper.selinfo(dto);
		String path = "/img/board/an_"+dto.getB_no()+"/"+dto.getChkImg();
		if(futils.delFile(path)) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		
		if(vo.getAn_img() == dto.getChkImg()) {
			dto.setAn_img("");
			dto.setAn_no(dto.getB_no());
			mapper.updpatImg(dto);
		}

		return vo;
	}
	
	
	public int insBoard(BoardDTO dto) {
		
		return mapper.insBoard(dto);
	}
	
	public int insAnimal(AnimalDTO dto) {
		System.out.println("service:"+dto.getAn_age()+","+dto.getAn_gender());
		
		return mapper.insAnimal(dto);
	}
	
	
	
	public int patimgUpload(MultipartFile[] imgs, int an_no) {
		if(imgs.length>5 || imgs.length ==0) {
			return 0;
		}
		String folder= "/img/board/an_"+an_no;
		try {
			for(int i=0; i<imgs.length; i++) {
				MultipartFile file = imgs[i];
				String fileNm = futils.saveFile(file, folder);
				if(file == null) {
					return 0;
				}
				if(i==0) {
					AnimalDTO dto = new AnimalDTO();
					dto.setAn_img(fileNm);
					dto.setAn_no(an_no);
					mapper.updpatImg(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return 1;
	}
	
	public List<String> tempimgUpload(MultipartFile[] imgs) {
		List<String> list = new ArrayList<>();
		if(imgs.length>5 || imgs.length ==0) {
			return null;
		}
		String folder= "/img/board_temp/b_"+0;
		try {
			for(int i=0; i<imgs.length; i++) {
				MultipartFile file = imgs[i];
				String fileNm = futils.saveFile(file, folder);
				if(file == null) {
					return null;
				}
				
				list.add(fileNm);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return list;
	}
	
	public int delSaleModImg(String path) {
        if(futils.delFile(path)) {
            return 1;
        }
        return 0;
    }
	public int insAuction(AuctionDTO dto) {
		return mapper.insAuction(dto);
	}
	
}
